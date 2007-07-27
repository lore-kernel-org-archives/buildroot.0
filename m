From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 27 Jul 2007 11:49:37 -0700
Subject: [Buildroot] [buildroot 0001447]: Using external toolchain
	(crosstool): build metacity fail
Message-ID: <53d9c54387f6e3cafa510b0ae39d5f4e@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1447 
====================================================================== 
Reported By:                rosemanit
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1447
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-27-2007 11:49 PDT
Last Modified:              07-27-2007 11:49 PDT
====================================================================== 
Summary:                    Using external toolchain (crosstool): build metacity
fail
Description: 
I've used external toolchain (glibc) to build my system. There are some
errors of lacking librarys, but I can fix them. But, when building
metacity, I met an error that I don't know how to fix it:
"libmetacity-private.so.0: No such file: No such file or directory ". If
using uclibc, I build successfully.
Can you show me how can i do ?  

---------------------------------------------------------------------------
/bin/sh ../libtool --tag=CC --mode=link
/home/hhnam/crosstool/build/gcc-4.1.0-glibc-2.3.6/i686-unknown-linux-gnu/bin/i686-unknown-linux-gnu-gcc
 -Os -pipe 
-I/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/include
-I/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/usr/include
-I/home/hhnam/crosstool/build/gcc-4.1.0-glibc-2.3.6/i686-unknown-linux-gnu/i686-unknown-linux-gnu/include
-I/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/include/gtk-2.0
-I/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/include/cairo
-I/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/include/gtk-2.0
-I/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/include/glib-2.0
-I/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/include/pango-1.0
-I/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/include/atk-1.0
-I/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/lib/glib-2.0/include
-I/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/lib/gtk-2.0/include/
-Wall -Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes
-Wnested-externs -Wpointer-arith -Wcast-align -Wsign-compare 
-L/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/lib
-L/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/usr/lib
-lgtk-x11-2.0 -Wl,-rpath
/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/lib -o
libmetacity-private.la -rpath /lib -no-undefined
libmetacity_private_la-boxes.lo libmetacity_private_la-gradient.lo
libmetacity_private_la-preview-widget.lo libmetacity_private_la-theme.lo
libmetacity_private_la-theme-parser.lo libmetacity_private_la-util.lo
-lXext -lXrandr -lXext 
-L/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/usr/X11R6/lib 
-lSM -lICE -lX11 -lXext -lXinerama  
libtool: link: warning: library
`/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/lib/libgtk-x11-2.0.la'
was moved.
/home/hhnam/crosstool/build/gcc-4.1.0-glibc-2.3.6/i686-unknown-linux-gnu/bin/i686-unknown-linux-gnu-gcc
-shared  .libs/libmetacity_private_la-boxes.o
.libs/libmetacity_private_la-gradient.o
.libs/libmetacity_private_la-preview-widget.o
.libs/libmetacity_private_la-theme.o
.libs/libmetacity_private_la-theme-parser.o
.libs/libmetacity_private_la-util.o  -Wl,--rpath
-Wl,/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/lib
-Wl,--rpath
-Wl,/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/lib
-L/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/lib
-L/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/usr/lib
/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/lib/libgtk-x11-2.0.so
-lXrandr
-L/home/hhnam/mini-linux1/buildroot/build_i686/staging_dir/usr/X11R6/lib
-lSM -lICE -lX11 -lXext -lXinerama  -Wl,-rpath -Wl,-soname
-Wl,libmetacity-private.so.0 -o .libs/libmetacity-private.so.0.0.0
/home/hhnam/crosstool/build/gcc-4.1.0-glibc-2.3.6/i686-unknown-linux-gnu/lib/gcc/i686-unknown-linux-gnu/4.1.0/../../../../i686-unknown-linux-gnu/bin/ld:
libmetacity-private.so.0: No such file: No such file or directory
collect2: ld returned 1 exit status
make[5]: *** [libmetacity-private.la] Error 1
make[5]: Leaving directory
`/home/hhnam/mini-linux1/buildroot/build_i686/metacity-2.16.3/src'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/home/hhnam/mini-linux1/buildroot/build_i686/metacity-2.16.3/src'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/home/hhnam/mini-linux1/buildroot/build_i686/metacity-2.16.3/src'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/hhnam/mini-linux1/buildroot/build_i686/metacity-2.16.3'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/hhnam/mini-linux1/buildroot/build_i686/metacity-2.16.3'
make: ***
[/home/hhnam/mini-linux1/buildroot/build_i686/metacity-2.16.3/.compiled]
Error 2
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-27-07 11:49  rosemanit      New Issue                                    
07-27-07 11:49  rosemanit      Status                   new => assigned     
07-27-07 11:49  rosemanit      Assigned To               => buildroot       
======================================================================
