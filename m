From: Pink Boy <dasfoo@yahoo.com>
Date: Sat, 19 Apr 2008 19:10:18 -0700 (PDT)
Subject: [Buildroot] Buildroot for AT91RM9200EK?
In-Reply-To: <20080419145815.GB12780@cloud.net.au>
Message-ID: <118206.91133.qm@web31803.mail.mud.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Hopefully this isn't 

I've been trying to figure out how to build a tool chain and linux
kernel for the Atmel AT91RM9200EK dev kit using build root.  

I tried setting the options under menuconfig for the board and after
installing a few missing utilities (Ubuntu natch) I get the following
error below.

make[1]: Leaving directory `/home/tu/workspace/arm920_tool/buildroot/project_build_arm/uclibc/linux-2.6.22.1'
cp -pf /home/tu/workspace/arm920_tool/buildroot/project_build_arm/uclibc/linux-2.6.22.1/arch/arm/boot/uImage /home/tu/workspace/arm920_tool/buildroot/binaries/uclibc/at91rm9200ek-linux-2.6.22.1-20080420.gz
cp: cannot stat `/home/tu/workspace/arm920_tool/buildroot/project_build_arm/uclibc/linux-2.6.22.1/arch/arm/boot/uImage': No such file or directory
make: *** [/home/tu/workspace/arm920_tool/buildroot/binaries/uclibc/at91rm9200ek-linux-2.6.22.1-20080420.gz] Error 1
tu at Matt-LinuxDev:~/workspace/arm920_tool/buildroot$ 

It looks like something is eithe rmissing or didn't get built.

I'm not sure what I'm doing wrong at this point.  I'm wondering
is there is either an option I'm not setting, the current source
is broken and I need to use an older one, or there is some patch 
I need.

PS: Total Noob.

Mr Foo


----
  MODPOST vmlinux
WARNING: arch/arm/mach-at91/built-in.o(.data+0x75c): Section mismatch: reference to .init.text:at91rm9200_timer_init (between 'at91rm9200_timer' and 'at91rm9200_timer_irq')
  OBJCOPY arch/arm/boot/Image
  Kernel: arch/arm/boot/Image is ready
  AS      arch/arm/boot/compressed/head.o
  GZIP    arch/arm/boot/compressed/piggy.gz
  AS      arch/arm/boot/compressed/piggy.o
  CC      arch/arm/boot/compressed/misc.o
In file included from arch/arm/boot/compressed/misc.c:30:
include/asm/arch/uncompress.h:35: warning: conflicting types for built-in function 'putc'
  AS      arch/arm/boot/compressed/head-at91rm9200.o
  LD      arch/arm/boot/compressed/vmlinux
  OBJCOPY arch/arm/boot/zImage
  Kernel: arch/arm/boot/zImage is ready
  UIMAGE  arch/arm/boot/uImage
/usr/bin/mkimage [OPTIONS]

 Options:
 -f <MD5 name>       Specify an input MD5 file. MD5s must be in jigdo's
                     pseudo-base64 format
 -j <jigdo name>     Specify the input jigdo file
 -t <template name>  Specify the input template file
 -m <item=path>      Map <item> to <path> to find the files in the mirror
 -M <missing name>   Rather than try to build the image, just check that
                     all the needed files are available. If any are missing,
                     list them in this file.
 -v                  Make the output logging more verbose
 -l <logfile>        Specify a logfile to append to.
                     If not specified, will log to stderr
 -o <outfile>        Specify a file to write the ISO image to.
                     If not specified, will write to stdout
 -q                  Quick mode. Don't check MD5sums. Dangerous!
 -s <bytenum>        Start byte number; will start at 0 if not specified
 -e <bytenum>        End byte number; will end at EOF if not specified
 -z                  Don't attempt to rebuild the image; simply print its
                     size in bytes
  Image arch/arm/boot/uImage is ready
make[1]: Leaving directory `/home/tu/workspace/arm920_tool/buildroot/project_build_arm/uclibc/linux-2.6.22.1'
cp -pf /home/tu/workspace/arm920_tool/buildroot/project_build_arm/uclibc/linux-2.6.22.1/arch/arm/boot/uImage /home/tu/workspace/arm920_tool/buildroot/binaries/uclibc/at91rm9200ek-linux-2.6.22.1-20080420.gz
cp: cannot stat `/home/tu/workspace/arm920_tool/buildroot/project_build_arm/uclibc/linux-2.6.22.1/arch/arm/boot/uImage': No such file or directory
make: *** [/home/tu/workspace/arm920_tool/buildroot/binaries/uclibc/at91rm9200ek-linux-2.6.22.1-20080420.gz] Error 1
tu at Matt-LinuxDev:~/workspace/arm920_tool/buildroot$ 
