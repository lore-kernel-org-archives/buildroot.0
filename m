From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Wed, 6 Sep 2017 08:31:01 -0300 (BRT)
Subject: [Buildroot] [RFC] testing: add python-cryptography tests
In-Reply-To: <20170906100656.5f5de18d@windsurf.lan>
References: <20170904071500.3858-1-yegorslists@googlemail.com>
 <59af5dfae6364_331f1091a18551a0@ultri3.mail>
 <20170906100656.5f5de18d@windsurf.lan>
Message-ID: <1216716905.8315000.1504697461058.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Wednesday, September 6, 2017 5:06:56 AM, Thomas Petazzoni wrote:
> On Tue, 05 Sep 2017 23:31:22 -0300, Ricardo Martincoski wrote:
> 
>> 1) I propose to merge this file into the existing test_python.py
>> 
>> The rationale is:
>> For the long term:
>> As I see, the test infra is used to detect regressions. It is important for both
>> the basic features and also for the complex scenarios (like the dependencies of
>> this package). But I don't expect to see tests added to every single package or
>> python package (it would take a very long time to run all those tests), so this
>> file probably will not grow too much and we can keep the tests together.
> 
> Actually, I am not sure I agree with this last part. I even think we
> should probably have a minimal test for each and every Python package,
> because the only way to verify that their dependencies are correct is
> to have a runtime test for them. So it would be nice to have a very
> simple way to write Python related tests, like a list of tuples
> (Buildroot package, Python package to import or Python command to run),
> and have the test infrastructure "generate" tests for all entries in
> this list.

I will cook a patch for this.

> 
> Yes, it's going to be a long test suite, with lots of tests, but the
> test suite is anyway going to be long enough that it won't make sense
> for anyone to run the full test suite. I really see two use cases for
> the test suite:
> 
> - You're doing tests in a specific area, and want to validate that
>   you're not breaking things. For this use case, you'll just run the
>   few test cases you're interested in.
> 
> - We regularly run in a CI environment all the tests. For this
>   situation, we don't really care how long it takes. Even if it takes
>   24 hours to run the full test suite, I don't think it's a big
>   problem.

OK, thank you for the explanation.

Regards,
--
Ricardo Martincoski
DATACOM
Ethernet Switches
Rua Am?rica, 1000 - Eldorado do Sul, RS - 92990-000 - Brasil
+55 51 3933 3000 - Ramal 3307
ricardo.martincoski at datacom.ind.br
www.datacom.ind.br
