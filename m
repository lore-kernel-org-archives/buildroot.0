From: Chien-Yu Chen <torus0@gmail.com>
Date: Tue, 1 Jul 2008 22:04:19 -0500
Subject: [Buildroot] build rootfs image keep on growing
Message-ID: <dbc6d8cc0807012004i72f3f7e6m1edecddc6fc1710f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

  I am using the current build of buildroot.  everything is okey after the
first time I build a root fs.  then I start to modify
project_build_i686/MySling/root/ to make it fit my need. then re-run make.
at this point, I see the resulting image grows a few meg.
if I keep on running make, the image keep on growing.  so I captured what's
going on

----------------------------------------------------------------------
make[1]: Entering directory
`/home/torus/src/temp/buildroot/project_build_i686/MySling/linux-2.6.25'
  CHK     include/linux/version.h
  CHK     include/linux/utsrelease.h
  CALL    scripts/checksyscalls.sh
  CHK     include/linux/compile.h
  GEN     usr/initramfs_data.cpio.gz
  AS      usr/initramfs_data.o
  LD      usr/built-in.o
  LD      vmlinux.o
  MODPOST vmlinux.o
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
  LD      vmlinux
  SYSMAP  System.map
  SYSMAP  .tmp_System.map
  CC      arch/x86/boot/version.o
  LD      arch/x86/boot/setup.elf
  OBJCOPY arch/x86/boot/setup.bin
  OBJCOPY arch/x86/boot/compressed/vmlinux.bin
  GZIP    arch/x86/boot/compressed/vmlinux.bin.gz
  LD      arch/x86/boot/compressed/piggy.o
  LD      arch/x86/boot/compressed/vmlinux
  OBJCOPY arch/x86/boot/vmlinux.bin
  BUILD   arch/x86/boot/bzImage
Root device is (3, 1)
Setup is 10476 bytes (padded to 10752 bytes).
System is 10052 kB
Kernel: arch/x86/boot/bzImage is ready  (#8)
-------------------------------------------------

kernel size keep on growing......and the resulting /boot will contain a big
and corrupted kernel..
please advise...thanks

chen

-- 
Any MicroSoft extension file will directly go to trash without any warning
and regret.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080701/b9c2bc4c/attachment-0001.htm 
