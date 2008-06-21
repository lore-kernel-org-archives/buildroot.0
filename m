From: Mike Sander <msander@ripnet.com>
Date: Fri, 20 Jun 2008 21:50:33 -0400
Subject: [Buildroot] relocate working buildroot
In-Reply-To: <021a01c8d1cd$d26c8f90$010514ac@atmel.com>
References: <4859C935.9030800@ripnet.com>
	<007c01c8d1bd$cb502330$010514ac@atmel.com>
	<4859E1CF.8070400@ripnet.com>
	<021a01c8d1cd$d26c8f90$010514ac@atmel.com>
Message-ID: <485C5E69.5030601@ripnet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson wrote:
> Mike Sander wrote:
>   
>> Ulf Samuelsson wrote:
>>     
>>> mike sander wrote:
>>>
>>>       
>>>> Hi All,
>>>>
>>>> Is anyone able to comment on how best to relocate and/or copy a
>>>> working buildroot?
>>>>
>>>> I have tried it (relocate to new location on same box) and did a
>>>> "make clean" followed by "make".   Very soon I got failures due to
>>>> not being able to delete some files at the original location.
>>>>
>>>> With a bit of grepping I discovered that the original configuration
>>>> full path is in numerous (i.e. too many to fix manually) locations
>>>> throughout buildroot related files.
>>>>
>>>> Are there some specific (maybe hidden) buildroot files that could be
>>>> deleted to force the configuration stage to pick up the new path?
>>>>
>>>>
>>>>         
>>> I don't think you can.
>>> I think you need to delete it all and rebuild
>>>
>>> build_<arch>
>>> project_build_<arch>
>>> toolchain_build_<arch>
>>>
>>> needs to go.
>>>
>>> If you want to move to another machine, then you
>>> could try symlinking.
>>>
>>>
>>>       
>
>   
>> Thank You Ulf,
>>
>> "make clean" followed by deleting the 3 directories you indicated
>> worked for relocating the buildroot on the same machine.  The only
>> casualty was the kernel which is under project_build_<arch>, but that
>> was easy enough to  back up prior deleting.
>>
>> I'll try moving to another machine and report the results later.
>>
>>     
>
> Create a "local" directory outside the buildroot tree
> Have to set the BR2_LOCAL (or whatever the name was)
> environement variable in your shell.
>
> Do
>
> $ make saveconfig
>
> Then your linux config file (and other config files) will be saved
> in the "local" directory.
>
> The rest, assuming identical host installation is a finite statemachine
> which should generate the same result as the first build.
>
>   
Yes, this appears to work.

Thanks again.  much appreciated

Mike
>> Regards,
>> Mike
>>     
>
> Best Regards
> Ulf Samuelsson
>
>
>
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> Scanned with Copfilter Version 0.84beta3a (P3Scan 2.2.1)
> AntiSpam:  SpamAssassin 3.2.3
> by Markus Madlener @ http://www.copfilter.org
>
>   
