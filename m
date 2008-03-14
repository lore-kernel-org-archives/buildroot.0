From: John Voltz <john.voltz@gmail.com>
Date: Fri, 14 Mar 2008 07:32:20 -0400
Subject: [Buildroot] Problems compiling Kernel
In-Reply-To: <46a136670803140431o6f88d0e7k4926bafeb7e5f525@mail.gmail.com>
References: <1205480722.6071.8.camel@luder>
	<46a136670803140431o6f88d0e7k4926bafeb7e5f525@mail.gmail.com>
Message-ID: <46a136670803140432n55d73642j14ed4d87e03a11fb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is a new set of menuconfig options to change the -O and -g switches to
gcc. Look under build options. There is a menu item named "build packages
with debugging symbols" and another named "gcc optimization level"

 I'm working on a fix to prevent changes here from affecting the kernel
build.

John Voltz


On Fri, Mar 14, 2008 at 3:45 AM, Christof Klaiber <
christof.klaiber@merath-maschinen.de> wrote:

> I'm trying to compile buildroot from svn for an i486 processor.
>
> The compile aborts when compiling the kernel using a simple "make" in
> the buildroot directory with an error of:
>
> arch/x86/lib/lib.a(usercopy_32.o): In function `__copy_to_user_ll':
> usercopy_32.c:(.text+0x27b): undefined reference to `__copy_user_intel'
> arch/x86/lib/lib.a(usercopy_32.o): In function `__copy_from_user_ll':
> usercopy_32.c:(.text+0x307): undefined reference to
> `__copy_user_zeroing_intel'
> arch/x86/lib/lib.a(usercopy_32.o): In function
> `__copy_from_user_ll_nozero':
> usercopy_32.c:(.text+0x393): undefined reference to `__copy_user_intel'
>
> If I'm running the make command by hand in the kernel directory
> (buildroot/project_build_i486/uclibc/linux-2.6.24) everything runs
> smoothly, if I'm disabling the optimisation flag in the CFLAGS_KERNEL of
> the make command:
>
>
> /usr/bin/make -j2 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=i386
> CFLAGS_KERNEL="-O0
> -I/home/cklaiber/buildroot/build_i486/staging_dir/usr/include
> -I/home/cklaiber/buildroot/build_i486/staging_dir/include
> --sysroot=/home/cklaiber/buildroot/build_i486/staging_dir/
> -isysroot /home/cklaiber/buildroot/build_i486/staging_dir -mtune=i486
> -march=i486"
> INSTALL_MOD_PATH=/home/cklaiber/buildroot/project_build_i486/uclibc/root
> CROSS_COMPILE=/home/cklaiber/buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-
> LDFLAGS="-L/home/cklaiber/buildroot/build_i486/staging_dir/lib
> -L/home/cklaiber/buildroot/build_i486/staging_dir/usr/lib
> --sysroot=/home/cklaiber/buildroot/build_i486/staging_dir/"
> LZMA="/home/cklaiber/buildroot/toolchain_build_i486/bin/lzma"  \
>
> -C /home/cklaiber/buildroot/project_build_i486/uclibc/linux-2.6.24
> bzImage
>
> Where can I disable optimisation in the buildroot config-files?
>
> Regards,
>  Christof Klaiber
>
> --
> Christof Klaiber - Merath GmbH
> Peter-Henlein-Stra?e 21 - 78056 Villingen-Schwenningen - Germany
> Telefon: +49 7720 956187 - Telefax: +49 7720 956188
>
> Sitz: Villingen-Schwenningen
> Registergericht: Freiburg HRB Nr. 601516
> Gesch?ftsf?hrer: Bernd Merath, Frank Merath
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080314/89d7fecb/attachment-0001.htm 
