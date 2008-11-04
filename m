From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 4 Nov 2008 13:04:36 -0800
Subject: [Buildroot] [buildroot 0005964]: Matchbox pannel requires startup
	notification
Message-ID: <514ff5eb94105678b1cbb5928811de12@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5964 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5964
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-04-2008 13:04 PST
Last Modified:              11-04-2008 13:04 PST
====================================================================== 
Summary:                    Matchbox pannel requires startup notification
Description: 
make[4]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/matchbox-panel-0.9.3/applets/small-icons'
make[4]: Entering directory
`/home/roberto/gles/buildroot/build_i586/matchbox-panel-0.9.3/applets'
if
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I. -I..
-DDATADIR=\"/usr/share/matchbox\"
-DPKGDATADIR=\"/usr/share/matchbox/matchbox\"
-DPREFIX=\"/home/roberto/gles/buildroot/build_i586/staging_dir/usr\" -g
-Wall -fno-strict-aliasing
-I/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/libpng12 
 -I/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/startup-notification-1.0
     -g -O2 -MT mb-applet-clock.o -MD -MP -MF ".deps/mb-applet-clock.Tpo"
-c -o mb-applet-clock.o mb-applet-clock.c; \
	then mv -f ".deps/mb-applet-clock.Tpo" ".deps/mb-applet-clock.Po"; else
rm -f ".deps/mb-applet-clock.Tpo"; exit 1; fi
mb-applet-clock.c:55:22: error: libsn/sn.h: No such file or directory
mb-applet-clock.c:74: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?*? token
mb-applet-clock.c: In function ?sn_activate?:
mb-applet-clock.c:79: error: ?SnLauncherContext? undeclared (first use in
this function)
mb-applet-clock.c:79: error: (Each undeclared identifier is reported only
once
mb-applet-clock.c:79: error: for each function it appears in.)
mb-applet-clock.c:79: error: ?context? undeclared (first use in this
function)
mb-applet-clock.c:82: warning: implicit declaration of function
?sn_launcher_context_new?
mb-applet-clock.c:82: error: ?sn_dpy? undeclared (first use in this
function)
mb-applet-clock.c:84: warning: implicit declaration of function
?sn_launcher_context_set_name?
mb-applet-clock.c:85: warning: implicit declaration of function
?sn_launcher_context_set_binary_name?
mb-applet-clock.c:87: warning: implicit declaration of function
?sn_launcher_context_initiate?
mb-applet-clock.c:96: warning: implicit declaration of function
?sn_launcher_context_setup_child_process?
mb-applet-clock.c: In function ?button_callback?:
mb-applet-clock.c:237: warning: pointer targets in passing argument 2 of
?mb_tray_app_tray_send_message? differ in signedness
mb-applet-clock.c: In function ?theme_change_callback?:
mb-applet-clock.c:281: warning: pointer targets in passing argument 2 of
?set_fg_col? differ in signedness
mb-applet-clock.c: In function ?main?:
mb-applet-clock.c:350: warning: pointer targets in passing argument 1 of
?mb_tray_app_new? differ in signedness
mb-applet-clock.c:380: warning: pointer targets in passing argument 2 of
?mb_tray_app_set_context_info? differ in signedness
mb-applet-clock.c:399: error: ?sn_dpy? undeclared (first use in this
function)
mb-applet-clock.c:399: warning: implicit declaration of function
?sn_display_new?
make[4]: *** [mb-applet-clock.o] Error 1
make[4]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/matchbox-panel-0.9.3/applets'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/matchbox-panel-0.9.3/applets'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/matchbox-panel-0.9.3'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/matchbox-panel-0.9.3'
make: ***
[/home/roberto/gles/buildroot/build_i586/matchbox-panel-0.9.3/.compiled]
Error 2

the missing file belong to startup-notification-0.9:

roberto at rafbook:~/gles/buildroot$ find . -name sn.h
./build_i586/staging_dir/usr/include/startup-notification-1.0/libsn/sn.h
./build_i586/startup-notification-0.9/libsn/sn.h



====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-04-08 13:04  robang74       New Issue                                    
11-04-08 13:04  robang74       Status                   new => assigned     
11-04-08 13:04  robang74       Assigned To               => buildroot       
11-04-08 13:04  robang74       File Added: .config                          
======================================================================
