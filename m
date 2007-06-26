From: michael.miller at prga.com <michael.miller@prga.com>
Date: Mon, 25 Jun 2007 22:04:44 -0500
Subject: [Buildroot] Problem building latest arm
Message-ID: <6B9D9C36F5A26347A593D6945C470AE90F3FF8@delta-two.prga.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to build for an Xscale (ARM), EABI, NPTL with binutils
2.17.50.0.16, software floating point, and target options bash, bzip2
and diffutils.  All other options are default (gcc 4.2.0).  I'm using
the latest snapshot for uclibc, and have tried buildroot snapshots from
6/20, 6/21 and 6/23.

If I use 6/20, 6/21 or 6/23 buildroot snapshots then the build fails in
pthreads because sysdep-cancel.h is not found.  Looking in the
linuxthreads/sysdeps/unix/sysv/linux directory, I see subdirectories for
i386, mips, etc. but not for arm.

Searching recent mailing list archives, Bernhard says things that make
me think this configuration should work.  He hints that helptext will
give me great insight, probably in the GNU_TARGET_SUFFIX area.  I
gleaned this from a reply to an inquiry by Stuart Wood.  Unfortunately,
I don't seem to be able to make use of the hint.  My target suffix is
linux-uclibcgnueabi, which is the default.  If I interpret Bernhard's
statement correctly, I should be using the default?

The build system is a Mandriva 2007 workstation, which uses gcc 4.1.2.

Any ideas how to proceed?  Should I create a sysdep-cancel.h for ARM?

	Regards,
	Mike
