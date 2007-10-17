From: sathesh babu <sathesh_edara2003@yahoo.co.in>
Date: Wed, 17 Oct 2007 07:55:50 +0100 (BST)
Subject: [Buildroot] How to build gcc with -m24k option
In-Reply-To: <26795.192.168.2.100.1192553562.squirrel@home.the-hug.net>
Message-ID: <760119.69994.qm@web7914.mail.in.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Beth,
    Thanks for your valueable suggestion. After using  binuilt-1.17, i get the dsp and 24k options.
   
   if i try to compile linux-2.6.18.8 kernel with this toolchain i am seeing compilation errors.
=============================
   mips-linux-gcc -Wp,-MD,drivers/mtd/.mtd_blkdevs.o.d  -nostdinc -isystem /home/
sedara/BETA_REL/buildroot/build_mips_nofpu/staging_dir/lib/gcc/mips-linux-uclibc
/4.2.1/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -DNEW_C
ONFIG -I/home/sedara/BETA_REL/linux-2.6.18/include -I/home/sedara/BETA_REL/linux
-2.6.18/../fusiv_src/kernel/ap_code -I/home/sedara/BETA_REL/linux-2.6.18/../fusi
v_src/kernel/ap_code/inc -I/home/sedara/BETA_REL/linux-2.6.18/../fusiv_src/kerne
l/drivers/inc -I/home/sedara/BETA_REL/linux-2.6.18/../fusiv_src/kernel/drivers/a
dsl -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O
2  -mabi=32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -ffreestanding  -marc
h=mips32r2 -Wa,-mips32r2 -Wa,--trap -Iinclude/asm-mips/mach-ikan_mips -Iinclude/
asm-mips/mach-generic -fomit-frame-pointer  -fno-stack-protector -Wdeclaration-a
fter-statement -Wno-pointer-sign    -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUI
LD_STR(mtd_blkdevs)"  -D"KBUILD_MODNAME=KBUILD_STR(mtd_blkdevs)" -c -o drivers/m
td/.tmp_mtd_blkdevs.o drivers/mtd/mtd_blkdevs.c
mips-linux-ld: final link failed: Bad value
make[2]: *** [drivers/mtd/mtd_blkdevs.o] Error 1
make[1]: *** [drivers/mtd] Error 2
make: *** [drivers] Error 2
  ===========================================
  Can you pls tell what could be the reason.
   
  Thanks you.
   
  Regards,
  Sathesh 
   
  
Elizabeth Oldham <beth@the-hug.org> wrote:
  
> I am trying to build cross toolchain for MIPS24K.
> I would like to know the suggested GCC ,binutils and uclibc versions to
> be used to get -mdsp and -m24k flag options.
>
> I used GCC-4.2.1,binutils-2.15 and uClibc-0.9.27 but i couldn't succeed.
> Could you please help me.

You probably want bintuils-2.17, -m24k may have been taken out as it's
been marked deprecated. The equivilent is -march=mips32r2 and -mtune=24k.

Beth



       
---------------------------------
 5, 50, 500, 5000 - Store N number of mails in your inbox. Click here.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071017/fab5c9dc/attachment.htm 
