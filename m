From: harshal shete <harshalshete@gmail.com>
Date: Thu, 28 Jun 2007 10:41:50 +0400
Subject: [Buildroot] Compilation of buildroot on cygwin gives problem
Message-ID: <b85b23590706272341n15bc030bjccfe446f4049215@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi group,

This is my first mail so please forgive me if i am unknowingly broke some
rules.
actually i am trying to compile buildroot on windows with the help of
cygwin.

i have deselected rootfs and busybox options from make menuconfig.
and selected appropriate processor (arm) and variant (arm920t).
gcc and gdb (host) version is also selected.

uclibc option is selected as daily snapshot but while compilation i get the
error
+ make -C /cygdrive/e/buildroot/buildroot/toolchain_build_arm/uClibc
PREFIX=/cygdrive/e/buildroot/buildroot/toolchain_build_arm/uClibc_dev/
DEVEL_PREFIX=/usr/
RUNTIME_PREFIX=/cygdrive/e/buildroot/buildroot/toolchain_build_arm/uClibc_dev/
HOSTCC=gcc pregen install_dev
/bin/sh:
/cygdrive/e/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc:
No such file or directory
make[1]:
/cygdrive/e/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc:
Command not found
make[1]: Entering directory
`/cygdrive/e/buildroot/buildroot/toolchain_build_arm/uClibc'
make[1]:
/cygdrive/e/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc:
Command not found
make[1]: Entering directory
`/cygdrive/e/buildroot/buildroot/toolchain_build_arm/uClibc'
/bin/sh:
/cygdrive/e/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc:
No such file or directory
make[2]:
/cygdrive/e/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc:
Command not found
make[2]:
/cygdrive/e/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc:
Command not found
/bin/sh:
/cygdrive/e/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc:
No such file or directory
make[2]:
/cygdrive/e/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc:
Command not found
make[2]:
/cygdrive/e/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc:
Command not found
conf.o:conf.c:(.text+0xb2): undefined reference to `_libintl_gettext'
conf.o:conf.c:(.text+0xc6): undefined reference to `_libintl_gettext'
conf.o:conf.c:(.text+0xda): undefined reference to `_libintl_gettext'
conf.o:conf.c:(.text+0xf2c): undefined reference to `_libintl_gettext'
conf.o:conf.c:(.text+0x10c5): undefined reference to `_libintl_gettext'
conf.o:conf.c:(.text+0x116f): more undefined references to
`_libintl_gettext' follow
collect2: ld returned 1 exit status
make[2]: *** [conf] Error 1
make[1]: *** [extra/config/conf] Error 2
make: ***
[/cygdrive/e/buildroot/buildroot/toolchain_build_arm/uClibc/.configured]
Error 2

So if anyone has faced the same situation then please tell me the
workaround..
do i need to change some Makefiles?
because i tink it is demanding for arm-linux-uclibc-gcc before creating it.
Please help me out of this.

Thanks and regards
Harshal shete
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070628/590b50b7/attachment.htm 
