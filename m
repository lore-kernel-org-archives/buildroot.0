From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:36 -0800
Subject: [Buildroot] [buildroot 0000803]: Buildroot stops
Message-ID: <7e1f618444662f8576acce025342f96e@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=803 
====================================================================== 
Reported By:                Zhukov
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   803
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-28-2006 02:51 PST
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    Buildroot stops
Description: 
Buildroot (version ~ march 20-24), configured for arm920t stops: the reason
is some little-big endian incompatibility. 
Notes:
1. Make 3.80 used. 
2. I don't change anything about endians (little endian set by default).

...

  LD libuClibc-0.9.28.so
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld:
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.2/libgcc.a(_udivsi3.o):
compiled for a little endian system and target is big endian
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld:
failed to merge target specific data of file
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.2/libgcc.a(_udivsi3.o)
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld:
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.2/libgcc.a(_divsi3.o):
compiled for a little endian system and target is big endian
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld:
failed to merge target specific data of file
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.2/libgcc.a(_divsi3.o)
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld:
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.2/libgcc.a(_umodsi3.o):
compiled for a little endian system and target is big endian
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld:
failed to merge target specific data of file
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.2/libgcc.a(_umodsi3.o)
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld:
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.2/libgcc.a(_modsi3.o):
compiled for a little endian system and target is big endian
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld:
failed to merge target specific data of file
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.2/libgcc.a(_modsi3.o)
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld:
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.2/libgcc.a(_dvmd_lnx.o):
compiled for a little endian system and target is big endian
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld:
failed to merge target specific data of file
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.2/libgcc.a(_dvmd_lnx.o)
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld:
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.2/libgcc.a(_divdi3.o):
compiled for a little endian system and target is big endian
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld:
failed to merge target specific data of file
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.2/libgcc.a(_divdi3.o)
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld:
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.2/libgcc.a(_moddi3.o):
compiled for a little endian system and target is big endian
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld:
failed to merge target specific data of file
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.2/libgcc.a(_moddi3.o)
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld:
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.2/libgcc.a(_clz.o):
compiled for a little endian system and target is big endian
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld:
failed to merge target specific data of file
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.2/libgcc.a(_clz.o)
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld:
BFD 2.16.1 assertion fail
/home/andrew/BusyBox_uClibc/buildroot/toolchain_build_arm/binutils-2.16.1/bfd/elf32-arm.c:2890
/home/andrew/BusyBox_uClibc/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld:
BFD 2.16.1 assertion fail
/home/andrew/BusyBox_uClibc/buildroot/toolchain_build_arm/binutils-2.16.1/bfd/elf32-arm.c:2890
make[2]: *** [lib/libc.so] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory
`/home/andrew/BusyBox_uClibc/buildroot/toolchain_build_arm/uClibc'
make: ***
[/home/andrew/BusyBox_uClibc/buildroot/toolchain_build_arm/uClibc/lib/libc.a]
Error 2

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 12-01-06 09:59  
---------------------------------------------------------------------- 
I think that this is fixed with current buildroot and current
uClibc-snapshot.
I shall close this report unless i hear that there are any current
failures in this respect withing two weeks.

thanks, 

---------------------------------------------------------------------- 
 bernhardf - 02-04-07 09:13  
---------------------------------------------------------------------- 
Fixed. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-28-06 02:51  Zhukov         New Issue                                    
03-28-06 02:51  Zhukov         Status                   new => assigned     
03-28-06 02:51  Zhukov         Assigned To               => uClibc          
03-28-06 02:51  Zhukov         File Added: .config                          
06-01-06 20:51  KsenZ          Issue Monitored: KsenZ                       
12-01-06 09:59  bernhardf      Note Added: 0001848                          
12-01-06 10:07  bernhardf      Status                   assigned => feedback
02-04-07 09:13  bernhardf      Status                   feedback => closed  
02-04-07 09:13  bernhardf      Note Added: 0002108                          
02-04-07 09:13  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
