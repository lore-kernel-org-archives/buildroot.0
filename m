From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Oct 2017 10:18:52 +0200
Subject: [Buildroot] [next v2 4/7] testing/tests/download: add infra for
	git tests
In-Reply-To: <59ed557b40483_5e463fc3aca583041894@ultri3.mail>
References: <76b115b4-dd02-0443-ba92-0d331cc1f0d1@mind.be>
 <59ed557b40483_5e463fc3aca583041894@ultri3.mail>
Message-ID: <d79b01d2-f170-7d5a-3f11-fcb5ed136bb5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-10-17 04:35, Ricardo Martincoski wrote:
> Hello,
> 
> On Fri, Oct 06, 2017 at 06:30 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 27-08-17 00:20, Ricardo Martincoski wrote:
> [snip]
>>> ---
>>>  support/testing/tests/download/__init__.py  |  0
>>
>>  These empty __init__.py files were removed at some point.
> 
> Sorry. I did not understand what you meant.

 My mistake, I was confusing with another project where we used to have empty
__init__.py files everywhere but we removed them again because they turned out
not to be needed. But in that project we use dynamic loading with
importlib.import_module, that's why they could be removed.

[snip]
>>> +
>>> +        self.gitremote = GitRemote(self.builddir, self.serveddir,
>>> +                                   self.logtofile)
>>> +        # send output from the test to the logfile created by GitRemote
>>> +        self.logfile = self.gitremote.logfile
>>> +        self.gitremote.start()
>>
>>  Emulator starts directly from its __init__, perhaps the same should be done here?
> 
> Er... I don't see such code on Emulator.

 Er, I don't know what I was thinking... I must have been tired when writing
this mail :-)

> But anyway... I will move to __init__. Few lines of code can removed this way.

 Maybe that is not such a good idea after all... I think __init__ is still
called when you do run-tests -l, but we don't want the git server to be started
in that case.


 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
