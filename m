From: Dave Tucker <endianx@yahoo.com>
Date: Mon, 19 Jan 2009 17:37:51 -0800 (PST)
Subject: [Buildroot] Make Problem
Message-ID: <947400.85409.qm@web51301.mail.re2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.  I am working on my first embedded linux project (and second ever embedded project).  I have an existing computer that is running Linux 2.6.24 and BusyBox.  It has an arm processor.  I want to add uClibc and cross-compile a c program for that box.  It seems buildroot is exactly what I need.  However, I seem to be having some difficulty getting it up and running.

I unpacked it, did a "make menuconfig" and configured to the best of my ability, though I admit I didn't understand everything there.  Then I did "make".  The operation ended with the following results:
--------------------------------------------------------------------------------
config.status: creating po/Makefile.in
config.status: executing depfiles commands
config.status: executing libtool commands
config.status: executing default-1 commands
config.status: executing bfd_stdint.h commands
config.status: executing default commands
make[4]: Leaving directory `/buildroot-2009.02-rc1/toolchain_build_arm/binutils-2.19-build/bfd/po'
make[4]: Entering directory `/buildroot-2009.02-rc1/toolchain_build_arm/binutils-2.19-build/bfd/po'
make[4]: Nothing to be done for `info'.
make[4]: Leaving directory `/buildroot-2009.02-rc1/toolchain_build_arm/binutils-2.19-build/bfd/po'
make[4]: Entering directory `/buildroot-2009.02-rc1/toolchain_build_arm/binutils-2.19-build/bfd'
make[4]: Nothing to be done for `info-am'.
make[4]: Leaving directory `/buildroot-2009.02-rc1/toolchain_build_arm/binutils-2.19-build/bfd'
make[3]: *** [info-recursive] Error 1
make[3]: Leaving directory `/buildroot-2009.02-rc1/toolchain_build_arm/binutils-2.19-build/bfd'
make[2]: *** [all-bfd] Error 2
make[2]: Leaving directory `/buildroot-2009.02-rc1/toolchain_build_arm/binutils-2.19-build'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/buildroot-2009.02-rc1/toolchain_build_arm/binutils-2.19-build'
make: *** [/buildroot-2009.02-rc1/toolchain_build_arm/binutils-2.19-build/binutils/objdump] Error 2
--------------------------------------------------------------------------------

It would seem to me something is failing, but I don't understand what.  However, I'm not 100% sure what sort of results the make process was supposed to produce, so I am not sure.  Many empty directories were created, which seems strange, and leads me to believe the make process never completed.

Does anybody know what might be going wrong?  I would appreciate any help.

Thank you,

Dave

(By the way, this is my first mailing list, so I am not certain how this works.)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090119/6e6d8b8d/attachment.htm 
