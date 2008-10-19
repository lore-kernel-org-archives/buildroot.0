From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 18 Oct 2008 17:19:41 -0700
Subject: [Buildroot] [buildroot 0005534]: Xinerama libraries depends on
	xproto_xineramaproto
Message-ID: <17b56f084ff34c0b89b4507111f10614@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5534 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5534
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-18-2008 17:19 PDT
Last Modified:              10-18-2008 17:19 PDT
====================================================================== 
Summary:                    Xinerama libraries depends on xproto_xineramaproto
Description: 
roberto at rafbook:~/gles/buildroot$ make clean

[...]

roberto at rafbook:~/gles/buildroot$ make

[...]

>>> xlib_libXinerama 1.0.2 Installing to target
/usr/bin/make -j1
DESTDIR=/home/roberto/gles/buildroot/project_build_i586/ugles/root 
install-exec -C
/home/roberto/gles/buildroot/build_i586/xlib_libXinerama-1.0.2/
make[1]: Entering directory
`/home/roberto/gles/buildroot/build_i586/xlib_libXinerama-1.0.2'
Making install-exec in src
make[2]: Entering directory
`/home/roberto/gles/buildroot/build_i586/xlib_libXinerama-1.0.2/src'
if /bin/bash ../libtool --tag=CC --mode=compile
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I. -I..      -g -O2 -MT
Xinerama.lo -MD -MP -MF ".deps/Xinerama.Tpo" -c -o Xinerama.lo Xinerama.c;
\
	then mv -f ".deps/Xinerama.Tpo" ".deps/Xinerama.Plo"; else rm -f
".deps/Xinerama.Tpo"; exit 1; fi

/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I. -I.. -g -O2 -MT Xinerama.lo
-MD -MP -MF .deps/Xinerama.Tpo -c Xinerama.c  -fPIC -DPIC -o
.libs/Xinerama.o
Xinerama.c:34:41: error: X11/extensions/panoramiXext.h: No such file or
directory
Xinerama.c:35:43: error: X11/extensions/panoramiXproto.h: No such file or
directory
Xinerama.c:36:37: error: X11/extensions/Xinerama.h: No such file or
directory
Xinerama.c:41: error: 'PANORAMIX_PROTOCOL_NAME' undeclared here (not in a
function)
Xinerama.c: In function 'XPanoramiXQueryVersion':
Xinerama.c:104: error: 'xPanoramiXQueryVersionReply' undeclared (first use
in this function)
Xinerama.c:104: error: (Each undeclared identifier is reported only once
Xinerama.c:104: error: for each function it appears in.)
Xinerama.c:104: error: expected ';' before 'rep'
Xinerama.c:105: error: expected '=', ',', ';', 'asm' or '__attribute__'
before '*' token
Xinerama.c:105: error: 'req' undeclared (first use in this function)
Xinerama.c:110: error: 'sz_xPanoramiXQueryVersionReq' undeclared (first
use in this function)
Xinerama.c:110: error: 'xPanoramiXQueryVersionReq' undeclared (first use
in this function)
Xinerama.c:110: error: expected expression before ')' token
Xinerama.c:110: error: 'X_PanoramiXQueryVersion' undeclared (first use in
this function)
Xinerama.c:113: error: 'PANORAMIX_MAJOR_VERSION' undeclared (first use in
this function)
Xinerama.c:114: error: 'PANORAMIX_MINOR_VERSION' undeclared (first use in
this function)
Xinerama.c:115: error: 'rep' undeclared (first use in this function)
Xinerama.c: At top level:
Xinerama.c:127: error: expected '=', ',', ';', 'asm' or '__attribute__'
before '*' token
Xinerama.c:135: error: expected declaration specifiers or '...' before
'XPanoramiXInfo'
Xinerama.c: In function 'XPanoramiXGetState':
Xinerama.c:139: error: 'xPanoramiXGetStateReply' undeclared (first use in
this function)
Xinerama.c:139: error: expected ';' before 'rep'
Xinerama.c:140: error: expected '=', ',', ';', 'asm' or '__attribute__'
before '*' token
Xinerama.c:140: error: 'req' undeclared (first use in this function)
Xinerama.c:145: error: 'sz_xPanoramiXGetStateReq' undeclared (first use in
this function)
Xinerama.c:145: error: 'xPanoramiXGetStateReq' undeclared (first use in
this function)
Xinerama.c:145: error: expected expression before ')' token
Xinerama.c:145: error: 'X_PanoramiXGetState' undeclared (first use in this
function)
Xinerama.c:149: error: 'rep' undeclared (first use in this function)
Xinerama.c:156: error: 'panoramiX_info' undeclared (first use in this
function)
Xinerama.c: At top level:
Xinerama.c:164: error: expected declaration specifiers or '...' before
'XPanoramiXInfo'
Xinerama.c: In function 'XPanoramiXGetScreenCount':
Xinerama.c:168: error: 'xPanoramiXGetScreenCountReply' undeclared (first
use in this function)
Xinerama.c:168: error: expected ';' before 'rep'
Xinerama.c:169: error: expected '=', ',', ';', 'asm' or '__attribute__'
before '*' token
Xinerama.c:169: error: 'req' undeclared (first use in this function)
Xinerama.c:174: error: 'sz_xPanoramiXGetScreenCountReq' undeclared (first
use in this function)
Xinerama.c:174: error: 'xPanoramiXGetScreenCountReq' undeclared (first use
in this function)
Xinerama.c:174: error: expected expression before ')' token
Xinerama.c:174: error: 'X_PanoramiXGetScreenCount' undeclared (first use
in this function)
Xinerama.c:178: error: 'rep' undeclared (first use in this function)
Xinerama.c:185: error: 'panoramiX_info' undeclared (first use in this
function)
Xinerama.c: At top level:
Xinerama.c:194: error: expected declaration specifiers or '...' before
'XPanoramiXInfo'
Xinerama.c: In function 'XPanoramiXGetScreenSize':
Xinerama.c:198: error: 'xPanoramiXGetScreenSizeReply' undeclared (first
use in this function)
Xinerama.c:198: error: expected ';' before 'rep'
Xinerama.c:199: error: expected '=', ',', ';', 'asm' or '__attribute__'
before '*' token
Xinerama.c:199: error: 'req' undeclared (first use in this function)
Xinerama.c:204: error: 'sz_xPanoramiXGetScreenSizeReq' undeclared (first
use in this function)
Xinerama.c:204: error: 'xPanoramiXGetScreenSizeReq' undeclared (first use
in this function)
Xinerama.c:204: error: expected expression before ')' token
Xinerama.c:204: error: 'X_PanoramiXGetScreenSize' undeclared (first use in
this function)
Xinerama.c:209: error: 'rep' undeclared (first use in this function)
Xinerama.c:216: error: 'panoramiX_info' undeclared (first use in this
function)
Xinerama.c: In function 'XineramaIsActive':
Xinerama.c:249: error: 'xXineramaIsActiveReply' undeclared (first use in
this function)
Xinerama.c:249: error: expected ';' before 'rep'
Xinerama.c:250: error: 'xXineramaIsActiveReq' undeclared (first use in
this function)
Xinerama.c:250: error: 'req' undeclared (first use in this function)
Xinerama.c:257: error: 'sz_xXineramaIsActiveReq' undeclared (first use in
this function)
Xinerama.c:257: error: expected expression before ')' token
Xinerama.c:257: error: 'X_XineramaIsActive' undeclared (first use in this
function)
Xinerama.c:260: error: 'rep' undeclared (first use in this function)
Xinerama.c: At top level:
Xinerama.c:270: error: expected '=', ',', ';', 'asm' or '__attribute__'
before '*' token
make[2]: *** [Xinerama.lo] Error 1
make[2]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/xlib_libXinerama-1.0.2/src'
make[1]: *** [install-exec-recursive] Error 1
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/xlib_libXinerama-1.0.2'
make: ***
[/home/roberto/gles/buildroot/project_build_i586/ugles/autotools-stamps/xlib_libXinerama_target_installed]
Error 2

the missing files belong to xproto_xineramaproto-1.1.2:

roberto at rafbook:~/gles/buildroot$ find . -name panoramiXext.h
./build_i586/xproto_xineramaproto-1.1.2/panoramiXext.h

Solution: xproto_xineramaproto-1.1.2 need to be installed to compile
xlib_libXinerama-1.0.2

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-18-08 17:19  robang74       New Issue                                    
10-18-08 17:19  robang74       Status                   new => assigned     
10-18-08 17:19  robang74       Assigned To               => buildroot       
======================================================================
