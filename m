From: Christof Klaiber <christof.klaiber@merath-maschinen.de>
Date: Fri, 14 Mar 2008 08:45:22 +0100
Subject: [Buildroot] Problems compiling Kernel
Message-ID: <1205480722.6071.8.camel@luder>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to compile buildroot from svn for an i486 processor.

The compile aborts when compiling the kernel using a simple "make" in
the buildroot directory with an error of:

arch/x86/lib/lib.a(usercopy_32.o): In function `__copy_to_user_ll':
usercopy_32.c:(.text+0x27b): undefined reference to `__copy_user_intel'
arch/x86/lib/lib.a(usercopy_32.o): In function `__copy_from_user_ll':
usercopy_32.c:(.text+0x307): undefined reference to
`__copy_user_zeroing_intel'
arch/x86/lib/lib.a(usercopy_32.o): In function
`__copy_from_user_ll_nozero':
usercopy_32.c:(.text+0x393): undefined reference to `__copy_user_intel'

If I'm running the make command by hand in the kernel directory
(buildroot/project_build_i486/uclibc/linux-2.6.24) everything runs
smoothly, if I'm disabling the optimisation flag in the CFLAGS_KERNEL of
the make command:


/usr/bin/make -j2 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=i386
CFLAGS_KERNEL="-O0
-I/home/cklaiber/buildroot/build_i486/staging_dir/usr/include
-I/home/cklaiber/buildroot/build_i486/staging_dir/include
--sysroot=/home/cklaiber/buildroot/build_i486/staging_dir/
-isysroot /home/cklaiber/buildroot/build_i486/staging_dir -mtune=i486
-march=i486"
INSTALL_MOD_PATH=/home/cklaiber/buildroot/project_build_i486/uclibc/root
CROSS_COMPILE=/home/cklaiber/buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc- LDFLAGS="-L/home/cklaiber/buildroot/build_i486/staging_dir/lib -L/home/cklaiber/buildroot/build_i486/staging_dir/usr/lib --sysroot=/home/cklaiber/buildroot/build_i486/staging_dir/" LZMA="/home/cklaiber/buildroot/toolchain_build_i486/bin/lzma"  \

-C /home/cklaiber/buildroot/project_build_i486/uclibc/linux-2.6.24
bzImage

Where can I disable optimisation in the buildroot config-files?

Regards,
  Christof Klaiber

-- 
Christof Klaiber - Merath GmbH
Peter-Henlein-Stra?e 21 - 78056 Villingen-Schwenningen - Germany
Telefon: +49 7720 956187 - Telefax: +49 7720 956188

Sitz: Villingen-Schwenningen
Registergericht: Freiburg HRB Nr. 601516
Gesch?ftsf?hrer: Bernd Merath, Frank Merath
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: Dies ist ein digital signierter Nachrichtenteil
Url : http://busybox.net/lists/buildroot/attachments/20080314/f5783989/attachment.pgp 
