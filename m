From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 29 Oct 2017 02:00:46 -0200
Subject: [Buildroot] [next v2 4/7] testing/tests/download: add infra for
	git tests
References: <d79b01d2-f170-7d5a-3f11-fcb5ed136bb5@mind.be>
Message-ID: <59f5526e668c9_d681674e94347@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Oct 23, 2017 at 06:18 AM, Arnout Vandecappelle wrote:

> On 23-10-17 04:35, Ricardo Martincoski wrote:
>> On Fri, Oct 06, 2017 at 06:30 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>> On 27-08-17 00:20, Ricardo Martincoski wrote:
[snip]
>>>> +        self.gitremote = GitRemote(self.builddir, self.serveddir,
>>>> +                                   self.logtofile)
>>>> +        # send output from the test to the logfile created by GitRemote
>>>> +        self.logfile = self.gitremote.logfile
>>>> +        self.gitremote.start()
>>>
>>>  Emulator starts directly from its __init__, perhaps the same should be done here?
>> 
>> Er... I don't see such code on Emulator.
> 
>  Er, I don't know what I was thinking... I must have been tired when writing
> this mail :-)
> 
>> But anyway... I will move to __init__. Few lines of code can removed this way.
> 
>  Maybe that is not such a good idea after all... I think __init__ is still
> called when you do run-tests -l, but we don't want the git server to be started
> in that case.
> 

Indeed __init__ is called when running run-tests -l for all classes that
inherits from unittest.TestCase, but since in this case GitRemote is
instantiated from GitTestBase.setUp it is safe to start the server in
GitRemote.__init__ so I will do that.

Regards,
Ricardo
