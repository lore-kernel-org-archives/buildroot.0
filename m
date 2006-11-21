From: MikeW <mw_phil@yahoo.co.uk>
Date: Tue, 21 Nov 2006 19:19:05 +0000 (UTC)
Subject: [Buildroot] 'ld' gives "unrecognised emulation mode" - ARM
	toolchain unbuildable ??
References: <loom.20061101T111436-827@post.gmane.org>
	<loom.20061102T152239-949@post.gmane.org>
Message-ID: <loom.20061121T200844-447@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MikeW <mw_phil@...> writes:

> 
> MikeW <mw_phil <at> ...> writes:
> 
> > During building libgcc, I get the message
> > ->>
> > /home/fred/buildroot/build_arm_nofpu/staging_dir/
> >  arm-linux-uclibcgnueabi/b in/ld: unrecognised emulation mode: armelf_linux
> > Supported emulations: armelf_linux_eabi
> > collect2: ld returned 1 exit status
> > make[3]: *** [libgcc/./_udivsi3.oS] Error 1
> > -<<
> 
> Fixed by setting GNU target suffix to 'elf-linux' instead.
> 
> Regards,
> MikeW
> 

Except that objects created by the toolchain have EABI version = 0 !!
I need EABI version = 4 for compatibility :(
So that suggests that I need a target suffix containing '-eabi'.

Any ideas ?

I mean, where is this stuff documented - I've trawled through gcc docs
and not found anything that explains these problems.
I'm presumably not the only person to encounter this issue !

Mike
