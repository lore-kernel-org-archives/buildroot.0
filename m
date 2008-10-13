From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 13 Oct 2008 04:47:58 -0700
Subject: [Buildroot] [buildroot 0005394]: xedit compilation fails
Message-ID: <c4cd567a7f6b7fe77d817539d070ce72@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5394 
====================================================================== 
Reported By:                tpetazzoni
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5394
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-13-2008 04:47 PDT
Last Modified:              10-13-2008 04:47 PDT
====================================================================== 
Summary:                    xedit compilation fails
Description: 
The compilation of xedit fails, because the libraries used by some
libraries that xedit is linked with are not listed in the link command
line, and xedit doesn't seem to use libtool.

Example:
/usr/local/uclibc-0.9.29/arm/usr//bin/arm-linux-gcc -Os 
-I/home/thomas/local/buildroot/build_arm/staging_dir/include
-I/home/thomas/local/buildroot/build_arm/staging_dir/usr/include
-I/usr/local/uclibc-0.9.29/arm/usr//arm-linux/include  -g -O2 
-L/home/thomas/local/buildroot/build_arm/staging_dir/lib
-L/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib -o xedit 
xedit-commands.o xedit-hook.o xedit-ispell.o xedit-lisp.o xedit-options.o
xedit-realpath.o xedit-strcasecmp.o xedit-util.o xedit-xedit.o
xedit-print.o xedit-printdialog.o libre.a liblisp.a libmp.a -lXaw8 -lXmu
-lXt -lX11 -lSM -lICE -lXau   -lXprintUtil -lXt -lX11 -lSM -lICE -lXp
-lXau   -lm 
/usr/local/uclibc-0.9.29/arm/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.2.4/../../../../arm-linux-uclibcgnueabi/bin/ld:
warning: libXext.so.6, needed by
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libXaw8.so, not
found (try using -rpath or -rpath-link)
/usr/local/uclibc-0.9.29/arm/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.2.4/../../../../arm-linux-uclibcgnueabi/bin/ld:
warning: libXpm.so.4, needed by
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libXaw8.so, not
found (try using -rpath or -rpath-link)
/usr/local/uclibc-0.9.29/arm/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.2.4/../../../../arm-linux-uclibcgnueabi/bin/ld:
warning: libxcb-xlib.so.0, needed by
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so, not
found (try using -rpath or -rpath-link)
/usr/local/uclibc-0.9.29/arm/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.2.4/../../../../arm-linux-uclibcgnueabi/bin/ld:
warning: libxcb.so.1, needed by
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so, not
found (try using -rpath or -rpath-link)
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so:
undefined reference to `xcb_connection_has_error'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so:
undefined reference to `xcb_xlib_lock'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so:
undefined reference to `xcb_poll_for_reply'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so:
undefined reference to `xcb_get_maximum_request_length'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so:
undefined reference to `xcb_xlib_unlock'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libXaw8.so:
undefined reference to `XpmReadFileToPixmap'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libXaw8.so:
undefined reference to `XShapeQueryExtension'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libXp.so:
undefined reference to `XMissingExtension'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so:
undefined reference to `xcb_get_file_descriptor'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so:
undefined reference to `xcb_connect'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so:
undefined reference to `xcb_wait_for_reply'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libXp.so:
undefined reference to `XextRemoveDisplay'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so:
undefined reference to `xcb_get_setup'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libXp.so:
undefined reference to `XextCreateExtension'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so:
undefined reference to `xcb_send_request'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so:
undefined reference to `xcb_wait_for_event'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so:
undefined reference to `xcb_flush'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so:
undefined reference to `xcb_poll_for_event'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libXaw8.so:
undefined reference to `XShapeCombineMask'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libXp.so:
undefined reference to `XextFindDisplay'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so:
undefined reference to `xcb_parse_display'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libXp.so:
undefined reference to `XextAddDisplay'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so:
undefined reference to `xcb_generate_id'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so:
undefined reference to `xcb_disconnect'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so:
undefined reference to `xcb_get_request_sent'
/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/libX11.so:
undefined reference to `xcb_connect_to_display_with_auth_info'
collect2: ld returned 1 exit status

A workaround to get it to work: add -lxcb-xlib -lxcb -lXpm -lXext -lXdmcp
to the link command line.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-13-08 04:47  tpetazzoni     New Issue                                    
10-13-08 04:47  tpetazzoni     Status                   new => assigned     
10-13-08 04:47  tpetazzoni     Assigned To               => buildroot       
======================================================================
