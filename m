From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 14 Oct 2018 19:08:02 -0300
Subject: [Buildroot] [PATCH 5/5] support/testing: add python-twisted
 tests
References: <1adacc2a-25dc-eee5-8688-47ce66aa080b@mind.be>
Message-ID: <5bc3be429e67a_79c83fc5c20eb4985989a@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Oct 11, 2018 at 06:27 PM, Arnout Vandecappelle wrote:

> On 11/10/18 20:48, Thomas Petazzoni wrote:
>> On Tue, 25 Sep 2018 23:55:14 -0300, Ricardo Martincoski wrote:
>> 
>>> +TEST_SCRIPT = """
>>> +from twisted.internet import protocol, reactor, endpoints
>>> +class F(protocol.Factory):
>>> +    pass
>>> +endpoints.serverFromString(reactor, "tcp:1234").listen(F())
>>> +reactor.run()
>>> +"""
>> 
>> At some point, we will have to find a solution to store such
>> "artefacts" somewhere, instead of having them inline in their test
>> cases. I don't have a good idea about this.
> 
>  I think it would be nice if we could add in the package directory a
> subdirectory with files to be copied to the target for the runtime test, and a
> python script for the test itself.
> 
>  As an in-between step, we can put the files-to-be-copied inside the
> support/testing directory and explicitly enumerate the files-to-be-copied in the
> test fixture.

Good idea.
I am working on this in-between step.
I will send a small series in the next few days.


Regards,
Ricardo
