From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 16 Nov 2007 05:08:57 -0800
Subject: [Buildroot] [buildroot 0001595]: DirectFB detects host installed
	/usr/bin/libvncserver-config instead checking only in staging dir
Message-ID: <fbfc54a467bf14cd1f834b83b4f4f538@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1595 
====================================================================== 
Reported By:                vanokuten
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1595
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-16-2007 05:08 PST
Last Modified:              11-16-2007 05:08 PST
====================================================================== 
Summary:                    DirectFB detects host installed
/usr/bin/libvncserver-config instead checking only in staging dir
Description: 
DirectFB incorrectly detects libvncserver support from host PC instead
checking only in staging dir

./configure 
...
checking for libvncserver-config... /usr/bin/libvncserver-config
...
Building Core Systems:
  Linux FBDev support       yes
  X11 support               no
  OSX support               no
  SDL support               no
  VNC support               yes
...

make

...

/opt/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc -Os
-pipe  -I/opt/buildroot/build_avr32/staging_dir/usr/include
-I/opt/buildroot/build_avr32/staging_dir/include -msoft-float -shared 
.libs/vncinput.o  -Wl,--rpath
-Wl,/opt/buildroot/build_avr32/DirectFB-1.0.1/src/.libs -L/usr/lib
-lvncserver -lvncclient -lnsl -lz -ljpeg ../../src/.libs/libdirectfb.so
-L/opt/buildroot/build_avr32/DirectFB-1.0.1/lib/fusion/.libs
-L/opt/buildroot/build_avr32/DirectFB-1.0.1/lib/direct/.libs -ldl
-lpthread  -msoft-float -Wl,-soname -Wl,libdirectfb_vncinput.so -o
.libs/libdirectfb_vncinput.so
/opt/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ld:
cannot find -lvncserver
collect2: ld returned 1 exit status


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-16-07 05:08  vanokuten      New Issue                                    
11-16-07 05:08  vanokuten      Status                   new => assigned     
11-16-07 05:08  vanokuten      Assigned To               => buildroot       
======================================================================
