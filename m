From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 28 Nov 2007 04:24:51 -0800
Subject: [Buildroot] [buildroot 0001616]: dbus-glibc does not compile
Message-ID: <139dbd1f971a632f94a4ef837e7c64e0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1616 
====================================================================== 
Reported By:                zeta
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1616
Category:                   Other
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-28-2007 04:24 PST
Last Modified:              11-28-2007 04:24 PST
====================================================================== 
Summary:                    dbus-glibc does not compile
Description: 
enabled dbus and dbus-glib by make menuconfig.
dbus-glibc fails in compiling.

seems that the paths are wrong...

i586-linux-gcc -DHAVE_CONFIG_H -I. -I. -I.. -I.. -I..
-I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -DDBUS_COMPILATION=1
-DDBUS_LOCALEDIR=\"/usr/share/locale\" -DDBUS_API_SUBJECT_TO_CHANGE=1 -g
-O2 -Wall -Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes
-Wnested-externs -Wpointer-arith -Wcast-align -Wfloat-equal -Wsign-compare
-MT dbus-glib.lo -MD -MP -MF .deps/dbus-glib.Tpo -c dbus-glib.c  -fPIC
-DPIC -o .libs/dbus-glib.o

error is:

[snip]
../libtool: line 1281: i586-linux-gcc: command not found
[snip]

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-28-07 04:24  zeta           New Issue                                    
11-28-07 04:24  zeta           Status                   new => assigned     
11-28-07 04:24  zeta           Assigned To               => buildroot       
======================================================================
