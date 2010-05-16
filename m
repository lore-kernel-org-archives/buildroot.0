From: Marcel <korgull@home.nl>
Date: Sun, 16 May 2010 17:55:55 +0200
Subject: [Buildroot] uClibc errors
In-Reply-To: <201005161551.55321.korgull@home.nl>
References: <201005161551.55321.korgull@home.nl>
Message-ID: <201005161755.55994.korgull@home.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Probably all errors I get come from this :

/bin/sh: /home/marcel/arm/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc: 
No such file or directory
make[1]: /home/marcel/arm/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc: 
Command not found
make[1]: Entering directory `/home/marcel/arm/toolchain_build_arm/uClibc'
make[1]: /home/marcel/arm/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc: 
Command not found
  GEN include/bits/sysnum.h
extra/scripts/gen_bits_syscall_h.sh: line 31: 
/home/marcel/arm/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc: No such 
file or directory
extra/scripts/gen_bits_syscall_h.sh: line 27: 
/home/marcel/arm/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc: No such 
file or directory
ERROR: Could not generate syscalls.
Make sure that you have proper kernel headers.
Your .config in KERNEL_HEADERS="" was set to:
/home/marcel/arm/toolchain_build_arm/linux/include/
make[1]: *** [include/bits/sysnum.h] Error 1

I wonder why things didn't get build in build_arm/staging_dir/usr/bin
My initial system does have this correctly and I build the current machine 
using the same config files (at least it seems that way).

Any ideas why it doesn't build the staging_dir correctly ? 
Can I force it to build this first before continuing ?

regards,
Marcel


> Hi,
> 
> I have one system set up with a fully working buildroot and try to build
> the same on another but run into some issues with uClibc.
> 
> I have tried the daily snapshot of uClibc and versions 0.9.29 and 0.9.30
> but none of them compiles.
> 
> Since I don't want the daily snapshot I would like to fix my setup to
> version 0.9.30 but I get an error while compiling :
> 
> make[1]: Entering directory
> `/home/marcel/arm/toolchain_build_arm/uClibc-0.9.30'
>   AS lib/crt1.o
> cc1: error: bad value (ap) for -march= switch
> 
> Any ideas on this ?
> 
> Best regards,
> Marcel
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
