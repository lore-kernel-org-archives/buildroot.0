From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 14 Nov 2008 23:31:33 -0800
Subject: [Buildroot] [buildroot 0005514]: Xorg VESA driver compilation crash
Message-ID: <d8d1d8ac764100e04f209199e447d611@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5514 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5514
Category:                   Standards Compliance
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-18-2008 12:37 PDT
Last Modified:              11-14-2008 23:31 PST
====================================================================== 
Summary:                    Xorg VESA driver compilation crash
Description: 
roberto at rafbook:~/gles/buildroot$ make

[...]

Making all in src
make[3]: Entering directory
`/home/roberto/gles/buildroot/build_i586/xdriver_xf86-video-vesa-1.3.0/src'
if /bin/bash ../libtool --tag=CC --mode=compile
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I. -I.. -I/usr/include/xorg
-I../src -I/usr/include    -g -O2
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg
-I/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/pixman-1
   -I../src -MT vesa.lo -MD -MP -MF ".deps/vesa.Tpo" -c -o vesa.lo vesa.c;
\
	then mv -f ".deps/vesa.Tpo" ".deps/vesa.Plo"; else rm -f
".deps/vesa.Tpo"; exit 1; fi

/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I. -I.. -I/usr/include/xorg
-I../src -I/usr/include -g -O2
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg
-I/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/pixman-1
-I../src -MT vesa.lo -MD -MP -MF .deps/vesa.Tpo -c vesa.c  -fPIC -DPIC -o
.libs/vesa.o
In file included from
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/regionstr.h:53,
                 from
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/region.h:51,
                 from
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/window.h:52,
                 from
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/input.h:55,
                 from
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/xf86str.h:38,
                 from
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/xf86.h:45,
                 from vesa.h:36,
                 from vesa.c:40:
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/miscstruct.h:54:20:
error: pixman.h: No such file or directory
In file included from
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/xf4bpp.h:6,
                 from vesa.h:73,
                 from vesa.c:40:
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/windowstr.h:131:
error: field 'clipList' has incomplete type
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/windowstr.h:132:
error: field 'borderClip' has incomplete type
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/windowstr.h:134:
error: field 'winSize' has incomplete type
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/windowstr.h:135:
error: field 'borderSize' has incomplete type
In file included from
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/glyphstr.h:29,
                 from
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/picturestr.h:28,
                 from
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/fb.h:44,
                 from vesa.h:74,
                 from vesa.c:40:
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/picture.h:68:
error: 'PIXMAN_a8r8g8b8' undeclared here (not in a function)

[...]

/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/picture.h:186:
error: expected '=', ',', ';', 'asm' or '__attribute__' before 'xFixed'
In file included from
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/fb.h:44,
                 from vesa.h:74,
                 from vesa.c:40:
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/picturestr.h:75:
error: expected specifier-qualifier-list before 'xFixed'

[...]

/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/picturestr.h:696:
error: expected declaration specifiers or '...' before 'xFixed'
In file included from vesa.h:74,
                 from vesa.c:40:
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/fb.h:2118:
error: expected '=', ',', ';', 'asm' or '__attribute__' before '*' token
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg/fb.h:2120:
error: expected declaration specifiers or '...' before 'pixman_image_t'
In file included from vesa.c:40:
vesa.h:124: error: expected specifier-qualifier-list before
'ShadowUpdateProc'
vesa.c: In function 'vesaCreateScreenResources':
vesa.c:760: error: 'struct _VESARec' has no member named 'update'
vesa.c:761: error: 'struct _VESARec' has no member named 'window'
vesa.c: In function 'VESAScreenInit':
vesa.c:933: error: 'struct _VESARec' has no member named 'update'
vesa.c:935: error: 'struct _VESARec' has no member named 'update'
vesa.c:936: error: 'struct _VESARec' has no member named 'window'
vesa.c:939: error: 'struct _VESARec' has no member named 'update'
vesa.c:940: error: 'struct _VESARec' has no member named 'window'
vesa.c:943: error: 'struct _VESARec' has no member named 'update'
vesa.c:944: error: 'struct _VESARec' has no member named 'window'
make[3]: *** [vesa.lo] Error 1
make[3]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/xdriver_xf86-video-vesa-1.3.0/src'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/xdriver_xf86-video-vesa-1.3.0'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/xdriver_xf86-video-vesa-1.3.0'
make: ***
[/home/roberto/gles/buildroot/build_i586/xdriver_xf86-video-vesa-1.3.0/.stamp_built]
Error 2

the missing file is there:

roberto at rafbook:~/gles/buildroot$ find . -name pixman.h
./build_i586/pixman-0.10.0/pixman/pixman.h
./build_i586/staging_dir/usr/include/pixman-1/pixman.h
./project_build_i586/ugles/buildroot-config/br2/package/pixman.h
./package/config/buildroot-config/br2/package/pixman.h

possible solution set up these soft links:

cd ./build_i586/staging_dir/usr/include
ln -sf pixman-1/* .
cd -

it still does not work because this crash:

Making all in src
make[3]: Entering directory
`/home/roberto/gles/buildroot/build_i586/xdriver_xf86-video-vesa-1.3.0/src'
if /bin/bash ../libtool --tag=CC --mode=compile
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I. -I.. -I/usr/include/xorg
-I../src -I/usr/include    -g -O2
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg
-I/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/pixman-1
   -I../src -MT vesa.lo -MD -MP -MF ".deps/vesa.Tpo" -c -o vesa.lo vesa.c;
\
	then mv -f ".deps/vesa.Tpo" ".deps/vesa.Plo"; else rm -f
".deps/vesa.Tpo"; exit 1; fi

/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I. -I.. -I/usr/include/xorg
-I../src -I/usr/include -g -O2
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/xorg
-I/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/pixman-1
-I../src -MT vesa.lo -MD -MP -MF .deps/vesa.Tpo -c vesa.c  -fPIC -DPIC -o
.libs/vesa.o
In file included from vesa.c:40:
vesa.h:124: error: expected specifier-qualifier-list before
'ShadowUpdateProc'
vesa.c: In function 'vesaCreateScreenResources':
vesa.c:760: error: 'struct _VESARec' has no member named 'update'
vesa.c:761: error: 'struct _VESARec' has no member named 'window'
vesa.c: In function 'VESAScreenInit':
vesa.c:933: error: 'struct _VESARec' has no member named 'update'
vesa.c:935: error: 'struct _VESARec' has no member named 'update'
vesa.c:936: error: 'struct _VESARec' has no member named 'window'
vesa.c:939: error: 'struct _VESARec' has no member named 'update'
vesa.c:940: error: 'struct _VESARec' has no member named 'window'
vesa.c:943: error: 'struct _VESARec' has no member named 'update'
vesa.c:944: error: 'struct _VESARec' has no member named 'window'
make[3]: *** [vesa.lo] Error 1
make[3]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/xdriver_xf86-video-vesa-1.3.0/src'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/xdriver_xf86-video-vesa-1.3.0'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/xdriver_xf86-video-vesa-1.3.0'
make: ***
[/home/roberto/gles/buildroot/build_i586/xdriver_xf86-video-vesa-1.3.0/.stamp_built]
Error 2
====================================================================== 

---------------------------------------------------------------------- 
 robang74 - 10-18-08 12:40  
---------------------------------------------------------------------- 
This report is not about "Standard's compliance" but "Shared Library
Support", sorry it was my mistake. 

---------------------------------------------------------------------- 
 robang74 - 11-14-08 23:31  
---------------------------------------------------------------------- 
roberto at rafbook:~/gles/buildroot/build_i586/staging_dir/usr/include$ grep
-rn ShadowUpdateProc *
xorg/shadow.h:37:typedef void (*ShadowUpdateProc) (ScreenPtr pScreen,
xorg/shadow.h:54:    ShadowUpdateProc	update;
xorg/shadow.h:89:	   ShadowUpdateProc update,
xorg/shadow.h:101:shadowInit (ScreenPtr pScreen, ShadowUpdateProc update,
ShadowWindowProc window);

Please fix this bug applying the attached patch and close this report. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-18-08 12:37  robang74       New Issue                                    
10-18-08 12:37  robang74       Status                   new => assigned     
10-18-08 12:37  robang74       Assigned To               => buildroot       
10-18-08 12:38  robang74       Issue Monitored: robang74                    
10-18-08 12:39  robang74       File Added: .config                          
10-18-08 12:40  robang74       Note Added: 0013814                          
11-14-08 23:31  robang74       Note Added: 0015884                          
======================================================================
