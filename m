From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 26 Feb 2008 00:15:23 -0800
Subject: [Buildroot] [buildroot 0002324]: Problems building DirectFB (cannot
	find -lvncserver)
Message-ID: <63c0d36ca037209c223b4e09b656db53@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2324 
====================================================================== 
Reported By:                aitormorillo
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2324
Category:                   Other
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-25-2008 00:41 PST
Last Modified:              02-26-2008 00:15 PST
====================================================================== 
Summary:                    Problems building DirectFB (cannot find -lvncserver)
Description: 
Hi

When trying to build DirectFB in a buildroot for a Atmel avr32 atstk1002 I
get the next error:

/root/avr32/build_avr32_nofpu/staging_dir/usr/bin/avr32-linux-uclibc-gcc
-Os -pipe  -I/root/avr32/build_avr32_nofpu/staging_dir/usr/include
-msoft-float -shared  .libs/vncinput.o  -Wl,--rpath
-Wl,/root/avr32/build_avr32_nofpu/DirectFB-0.9.25.1/src/.libs -L/usr/lib
-lvncserver -lvncclient -lnsl -lz -ljpeg ../../src/.libs/libdirectfb.so
-ldl -lpthread  -msoft-float -Wl,-soname -Wl,libdirectfb_vncinput.so -o
.libs/libdirectfb_vncinput.so
/root/avr32/build_avr32_nofpu/staging_dir/lib/gcc/avr32-linux-uclibc/4.2.1/../../../../avr32-linux-uclibc/bin/ld:
cannot find -lvncserver
collect2: ld returned 1 exit status
make[4]: *** [libdirectfb_vncinput.la] Error 1
make[4]: Leaving directory
`/root/avr32/build_avr32_nofpu/DirectFB-0.9.25.1/systems/vnc'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/root/avr32/build_avr32_nofpu/DirectFB-0.9.25.1/systems'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/root/avr32/build_avr32_nofpu/DirectFB-0.9.25.1'
make[1]: *** [all-recursive-am] Error 2
make[1]: Leaving directory
`/root/avr32/build_avr32_nofpu/DirectFB-0.9.25.1'
make: *** [/root/avr32/build_avr32_nofpu/DirectFB-0.9.25.1/.compiled]
Error 2

Any idea?

====================================================================== 

---------------------------------------------------------------------- 
 aitormorillo - 02-26-08 00:15  
---------------------------------------------------------------------- 
Alredy fixed previous error, new one:

/usr/lib/libvncserver.so: could not read symbols: File in wrong format
collect2: ld returned 1 exit status
make[4]: *** [libdirectfb_vncinput.la] Error 1
make[4]: Leaving directory
`/home/buildroot-avr32-v2.1.0/build_avr32_nofpu/DirectFB-0.9.25.1/systems/vnc'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/buildroot-avr32-v2.1.0/build_avr32_nofpu/DirectFB-0.9.25.1/systems'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/buildroot-avr32-v2.1.0/build_avr32_nofpu/DirectFB-0.9.25.1'
make[1]: *** [all-recursive-am] Error 2
make[1]: Leaving directory
`/home/buildroot-avr32-v2.1.0/build_avr32_nofpu/DirectFB-0.9.25.1'
make: ***
[/home/buildroot-avr32-v2.1.0/build_avr32_nofpu/DirectFB-0.9.25.1/.compiled]
Error 2 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-25-08 00:41  aitormorillo   New Issue                                    
02-25-08 00:41  aitormorillo   Status                   new => assigned     
02-25-08 00:41  aitormorillo   Assigned To               => buildroot       
02-26-08 00:14  aitormorillo   Issue Monitored: aitormorillo                    
02-26-08 00:15  aitormorillo   Note Added: 0005334                          
======================================================================
