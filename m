From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 14 Oct 2018 19:11:32 -0300
Subject: [Buildroot] [PATCH 5/5] support/testing: add python-twisted
 tests
References: <20181013144317.GF31509@scaer>
Message-ID: <5bc3bf147099f_79c83fc5c20adf0860013@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Oct 13, 2018 at 11:43 AM, Yann E. MORIN wrote:

> On 2018-10-11 23:27 +0200, Arnout Vandecappelle spake thusly:
>> On 11/10/18 20:48, Thomas Petazzoni wrote:
>> > On Tue, 25 Sep 2018 23:55:14 -0300, Ricardo Martincoski wrote:
>> > 
>> >> +TEST_SCRIPT = """
>> >> +from twisted.internet import protocol, reactor, endpoints
>> >> +class F(protocol.Factory):
>> >> +    pass
>> >> +endpoints.serverFromString(reactor, "tcp:1234").listen(F())
>> >> +reactor.run()
>> >> +"""
>> > 
>> > At some point, we will have to find a solution to store such
>> > "artefacts" somewhere, instead of having them inline in their test
>> > cases. I don't have a good idea about this.
>> 
>>  I think it would be nice if we could add in the package directory a
>> subdirectory with files to be copied to the target for the runtime test, and a
>> python script for the test itself.
> 
> I'm not sure that would answer the question, but I already worked on
> moving the packages' tests files inside the packages directories:
>     https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/package-tests
> 
> (Note that this branch is not entirely up-to-date, as I haven't updated
> it since we added new package tests.)
> 
> Contrary to Thomas, I don't really mind that we have tests in two
> locations. Per-paclages tests are, in y opinion, better to be
> side-by-side with the package they test.

I agree with Yann.

I think some structure like this (exact naming yet to be defined, of course) is
really nice:

package/
\-- pkg1
    |-- Config.in
    |-- fixtures
    |?? \-- sample_pkg1.py
    |-- pkg1.hash
    |-- pkg1.mk
    |-- S60pkg1
    \-- test_pkg1.py

> 
> As for the test on the infra, they go where they make more sense: in the
> test infra.

Makes sense to me.


Regards,
Ricardo
