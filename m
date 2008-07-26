From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 26 Jul 2008 08:53:43 +0200
Subject: [Buildroot] Makefile.autotools.in does not work
	wellwith	projects
References: <1216910589.29392.18.camel@localhost>
	<20080725001242.GB25141@cloud.net.au>
Message-ID: <80DE307AE1CF4656A7072295EA2408F8@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Subject: Re: [Buildroot] Makefile.autotools.in does not work wellwith 
projects


> On Thu, Jul 24, 2008 at 04:43:09PM +0200, Hans-Christian Egtvedt wrote:
>> The Makefile.autotools.in uses a rule which touches a
>> stamp_target_installed file, this does not work well with projects.
>>
>> The Makefile should depend on a file on the target root file system,
>> file not there => install to target again.
>
> Indeed - install stamps are pure evil. They don't work with multiple
> projects and they mean you can't "rm -rf
> project_build_$(ARCH)/$(PROJECT)/root".
>
>

I do not think that you want to have install stamps in the root file system
because they will end up in the target (unless they are ignored when
the rootfs is created).

You could have install stamps in a 
"project_build_$(ARCH)/$(PROJECT)/.stamps"
directory. Of course you would have to remember to delete this directory
when you delete  "project_build_$(ARCH)/$(PROJECT)/root"

Best Regards
Ulf Samuelsson
