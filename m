From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:26 -0800
Subject: [Buildroot] [buildroot 0001205]: mtd: order of -I paths is wrong
	for atleast arm
Message-ID: <0bc573ef86095addb79bc328dac73d35@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1205 
====================================================================== 
Reported By:                xride
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1205
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-09-2007 05:51 PST
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    mtd: order of -I paths is wrong for atleast arm
Description: 
make -j1       
CC=~/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc
CFLAGS="-I~/buildroot/toolchain_build_arm/linux/include
-I~/buildroot/build_arm/mtd_orig/include -Os -pipe " LDFLAGS="" LINUXDIR=
-C ~/buildroot/build_arm/mtd_orig/util

Shold be:

make -j1       
CC=~/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc
CFLAGS="-I~/buildroot/build_arm/mtd_orig/include
-I~/buildroot/toolchain_build_arm/linux/include -Os -pipe " LDFLAGS=""
LINUXDIR= -C ~/buildroot/build_arm/mtd_orig/util

Patch attached
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 02-09-07 06:19  
---------------------------------------------------------------------- 
Fixed in r17839. Thanks for the report. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-09-07 05:51  xride          New Issue                                    
02-09-07 05:51  xride          Status                   new => assigned     
02-09-07 05:51  xride          Assigned To               => uClibc          
02-09-07 05:51  xride          File Added: mtd.mk.patch                     
02-09-07 06:19  bernhardf      Status                   assigned => closed  
02-09-07 06:19  bernhardf      Note Added: 0002143                          
02-09-07 06:19  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
