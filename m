From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 12 Nov 2008 06:53:31 -0800
Subject: [Buildroot] [buildroot 0006134]: New Package: bluez-libs and
	bluez-utils 3.36
Message-ID: <c78e9438388dae9a9dc8507a9f00cdc8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=6134 
====================================================================== 
Reported By:                ratbert
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   6134
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-11-2008 06:29 PST
Last Modified:              11-12-2008 06:53 PST
====================================================================== 
Summary:                    New Package: bluez-libs and bluez-utils 3.36
Description: 
Add packages for BlueZ bluetooth user space code building. You will also
need bluetooth kernel space drivers (kernel config) to make use of these
tools.
====================================================================== 

---------------------------------------------------------------------- 
 smatuschka - 11-12-08 06:53  
---------------------------------------------------------------------- 
I tried the patch in atmel buildroot avr32-v2.2.0.
1.Question: Is only dbus needed or dbus-glib?
2.Question: Where should these Bnumbers be defined? See this error:
/buildroot-avr32-v2.2.0/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc
-O2 -I/buildroot-avr32-v2.2.0/build_avr32/staging_dir/usr/include
-I/buildroot-avr32-v2.2.0/build_avr32/staging_dir/include
--sysroot=/buildroot-avr32-v2.2.0/build_avr32/staging_dir/ -isysroot
/buildroot-avr32-v2.2.0/build_avr32/staging_dir -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-D_FORTIFY_SOURCE=2 -fPIE
--sysroot=/buildroot-avr32-v2.2.0/build_avr32/staging_dir/ -o avinfo
avinfo.o  -L/buildroot-avr32-v2.2.0/build_avr32/staging_dir/lib
-L/buildroot-avr32-v2.2.0/build_avr32/staging_dir/usr/lib
/buildroot-avr32-v2.2.0/build_avr32/staging_dir/usr/lib/libbluetooth.so  
-Wl,--rpath -Wl,/buildroot-avr32-v2.2.0/build_avr32/staging_dir/usr/lib
-Wl,--rpath -Wl,/buildroot-avr32-v2.2.0/build_avr32/staging_dir/usr/lib
/buildroot-avr32-v2.2.0/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc
-DHAVE_CONFIG_H -I. -I.. -I../common    -O2 
-I/buildroot-avr32-v2.2.0/build_avr32/staging_dir/usr/include
-I/buildroot-avr32-v2.2.0/build_avr32/staging_dir/include
--sysroot=/buildroot-avr32-v2.2.0/build_avr32/staging_dir/ -isysroot
/buildroot-avr32-v2.2.0/build_avr32/staging_dir -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-D_FORTIFY_SOURCE=2 -fPIE -MT hciattach.o -MD -MP -MF .deps/hciattach.Tpo
-c -o hciattach.o hciattach.c
hciattach.c: In function 'uart_speed':
hciattach.c:111: error: 'B230400' undeclared (first use in this function)
hciattach.c:111: error: (Each undeclared identifier is reported only once
hciattach.c:111: error: for each function it appears in.)
hciattach.c:113: error: 'B460800' undeclared (first use in this function)
hciattach.c:115: error: 'B500000' undeclared (first use in this function)
hciattach.c:117: error: 'B576000' undeclared (first use in this function)
hciattach.c:119: error: 'B921600' undeclared (first use in this function)
hciattach.c:121: error: 'B1000000' undeclared (first use in this
function)
hciattach.c:123: error: 'B1152000' undeclared (first use in this
function)
make[3]: *** [hciattach.o] Error 1 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-11-08 06:29  ratbert        New Issue                                    
11-11-08 06:29  ratbert        Status                   new => assigned     
11-11-08 06:29  ratbert        Assigned To               => buildroot       
11-11-08 06:29  ratbert        File Added: bluez.diff                       
11-12-08 06:53  smatuschka     Note Added: 0015554                          
======================================================================
