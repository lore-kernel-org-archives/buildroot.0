From: Shai Lifshitz <ShaiL@visonic.com>
Date: Tue, 31 Jul 2007 21:59:13 +0400
Subject: [Buildroot] "undefined reference to 'raise'"
In-Reply-To: <20070731183534.8dcd01b7.philippe.ney@tizoo.com>
Message-ID: <OF25D64CFB.9E7891E3-ONC2257329.00622DB0-C3257329.005CEFFF@visonic.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 I try to build u-boot with buildroot with the following configuration 
flags:

BR2_arm=y
BR2_arm926t=y
BR2_ARM_EABI=y


I did look in google, but found only two solutions:

1) add a patch (which does not exist any more on the net)
2) write an empty 'raise' function (which quite worries me not to treat 
the division by zero)

following is the u-boot compilation error:

make[1]: Leaving directory 
`/misc/BBA_Bootloader/boot/u-boot-1.1.5-atmel_1.1/common'

UNDEF_SYM=`arm-linux-objdump -x lib_generic/libgeneric.a 
board/visonic_bba/libvisonic_bba.a cpu/arm926ej-s/libarm926ej-s.a
cpu/arm926ej-s/at91sam926x/libat91sam926x.a lib_arm/libarm.a 
fs/cramfs/libcramfs.a fs/fat/libfat.a fs/fdos/libfdos.a 
fs/jffs2/libjffs2.a
fs/reiserfs/libreiserfs.a fs/ext2/libext2fs.a net/libnet.a disk/libdisk.a 
rtc/librtc.a dtt/libdtt.a drivers/libdrivers.a drivers/nand/libnand.a
drivers/nand_legacy/libnand_legacy.a drivers/sk98lin/libsk98lin.a 
post/libpost.a post/cpu/libcpu.a common/libcommon.a |sed  -n -e
's/.*\(__u_boot_cmd_.*\)/-u\1/p'|sort|uniq`;\

        cd /misc/BBA_Bootloader/boot/u-boot-1.1.5-atmel_1.1 && 
arm-linux-ld -Bstatic -T 
/misc/BBA_Bootloader/boot/u-boot-1.1.5-atmel_1.1/board/visonic_bba/u-boot.lds
           -Ttext 0x23f00000  -no-warn-mismatch  $UNDEF_SYM 
cpu/arm926ej-s/start.o \ --start-group lib_generic/libgeneric.a 
board/visonic_bba/libvisonic_bba.a
           cpu/arm926ej-s/libarm926ej-s.a 
cpu/arm926ej-s/at91sam926x/libat91sam926x.a lib_arm/libarm.a 
fs/cramfs/libcramfs.a fs/fat/libfat.a fs/fdos/libfdos.a 
           fs/jffs2/libjffs2.a fs/reiserfs/libreiserfs.a 
fs/ext2/libext2fs.a net/libnet.a disk/libdisk.a rtc/librtc.a dtt/libdtt.a 
drivers/libdrivers.a drivers/nand/libnand.a
           drivers/nand_legacy/libnand_legacy.a 
drivers/sk98lin/libsk98lin.a post/libpost.a post/cpu/libcpu.a 
common/libcommon.a --end-group 
           -L 
/misc/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.2.0 
-lgcc \ -Map u-boot.map -o u-boot

/misc/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.2.0/libgcc.a(_dvmd_lnx.o): 
In function `__div0':
/misc/arm/buildroot/toolchain_build_arm/gcc-4.2.0/gcc/config/arm/lib1funcs.asm:1000: 
undefined reference to `raise'
/misc/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.2.0/libgcc.a(_udivdi3.o):(.ARM.exidx+0x0): 
undefined reference to `__aeabi_unwind_cpp_pr0'
make: *** [u-boot] Error 1

if someone can help me with this one, I'll be very grateful

Shai Lifshitz
email: shail at visonic.com





Philippe Ney <philippe.ney@tizoo.com>
Sent by: buildroot-bounces at uclibc.org
07/31/2007 08:35 PM
 
        To:     buildroot at uclibc.org
        cc: 
        Subject:        Re: [Buildroot] "undefined reference to 'raise'"


> I am using the buildroot to compile the u-boot.
> 
> the flags I used:
> BR2_arm=y
> BR2_arm926t=y
> BR2_ARM_EABI=y
> 
> and I get the "undefined reference to raise" error.
> 
> can someone help me with this issue?

Mmmm... google with "undefined reference to 'raise'" ?

Philippe
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot


-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070731/f6ea3e8c/attachment.htm 
