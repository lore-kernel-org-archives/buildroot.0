From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Sun, 13 Apr 2008 22:12:58 +0200
Subject: [Buildroot] Image arch/arm/boot/uImage is ready but cp command fail
	to get it, 
Message-ID: <4802694A.40906@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, I try to build the at91sam9261 target using the default 
configuration with this command into a clean SVN HEAD:

( yes "" | make at91sam9261ek_defconfig ) && ( yes "" | make )

At the end of the kernel build I get this error:

   GEN     .version
   CHK     include/linux/compile.h
   UPD     include/linux/compile.h
   CC      init/version.o
   LD      init/built-in.o
   LD      .tmp_vmlinux1
   KSYM    .tmp_kallsyms1.S
   AS      .tmp_kallsyms1.o
   LD      .tmp_vmlinux2
   KSYM    .tmp_kallsyms2.S
   AS      .tmp_kallsyms2.o
   LD      vmlinux.o
   MODPOST vmlinux.o
   LD      vmlinux
   SYSMAP  System.map
   SYSMAP  .tmp_System.map
   OBJCOPY arch/arm/boot/Image
   Kernel: arch/arm/boot/Image is ready
   AS      arch/arm/boot/compressed/head.o
   GZIP    arch/arm/boot/compressed/piggy.gz
   CC      arch/arm/boot/compressed/misc.o
   AS      arch/arm/boot/compressed/piggy.o
   LD      arch/arm/boot/compressed/vmlinux
   OBJCOPY arch/arm/boot/zImage
   Kernel: arch/arm/boot/zImage is ready
   UIMAGE  arch/arm/boot/uImage
Image Name:   Linux-2.6.24.3
Created:      Sun Apr 13 21:27:36 2008
Image Type:   ARM Linux Kernel Image (uncompressed)
Data Size:    1611064 Bytes = 1573.30 kB = 1.54 MB
Load Address: 0x20008000
Entry Point:  0x20008000
   Image arch/arm/boot/uImage is ready
make[1]: Leaving directory 
`/home/jcdr/try/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3'
cp -pf 
/home/jcdr/try/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/uImage 
/home/jcdr/try/buildroot/binaries/at91sam9261ek/at91sam9261ek-linux-2.6.24.3-20080413
cp: cannot stat 
`/home/jcdr/try/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/uImage': 
No such file or directory
make: *** 
[/home/jcdr/try/buildroot/binaries/at91sam9261ek/at91sam9261ek-linux-2.6.24.3-20080413] 
Error 1

Why the "cp" command don't get the arch/arm/boot/uImage file that the 
kernel Makefile have build ?
-- 
Jean-Christian de Rivaz
