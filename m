From: Christopher Reder <creder@digitalcpt.com>
Date: Mon, 20 Aug 2007 14:23:41 -0500
Subject: [Buildroot] building tiny-x or x11R7 with latest snapshot
Message-ID: <022b01c7e35f$9df9f1b0$2600a8c0@engineering5>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I receive errors if I want to build either tiny-x or the full X11R7.  has
anyone else had these?  Is this something in the environment?

 

I have a snapshot from a couple of months ago and I can build tiny-x without
a problem on it.

 

X11R7:

/home/christopher/sb/buildroot/build_arm/freetype-2.2.1/include/freetype/ttn
ameid.h
/home/christopher/sb/buildroot/build_arm/freetype-2.2.1/include/freetype/ttt
ables.h
/home/christopher/sb/buildroot/build_arm/freetype-2.2.1/include/freetype/ttt
ags.h
/home/christopher/sb/buildroot/build_arm/freetype-2.2.1/include/freetype/ttu
npat.h

/home/christopher/sb/buildroot/build_arm/freetype-2.2.1/objs/apinames:
/home/christopher/sb/buildroot/build_arm/freetype-2.2.1/objs/apinames:
cannot execute binary file

make[1]: ***
[/home/christopher/sb/buildroot/build_arm/freetype-2.2.1/objs/ftexport.sym]
Error 126

make[1]: Leaving directory
`/home/christopher/sb/buildroot/build_arm/freetype-2.2.1'

make: ***
[/home/christopher/sb/buildroot/build_arm/staging_dir/lib/libfreetype.so]
Error 2

linuxbox:/home/christopher/sb/buildroot#

 

tiny-x: 

 

 

making imake with BOOTSTRAPCFLAGS= in config/imake

/home/christopher/sb/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclib
c-gcc -Os -pipe
-I/home/christopher/sb/buildroot/build_arm/staging_dir/usr/include
-I/home/christopher/sb/buildroot/build_arm/staging_dir/include
-mtune=arm920t -o ccimake  -O -I../../include
-I../../imports/x11/include/X11 ccimake.c

/home/christopher/sb/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclib
c-gcc -Os -pipe
-I/home/christopher/sb/buildroot/build_arm/staging_dir/usr/include
-I/home/christopher/sb/buildroot/build_arm/staging_dir/include
-mtune=arm920t -c  -O -I../../include -I../../imports/x11/include/X11
`./ccimake` imake.c

/bin/sh: ./ccimake: cannot execute binary file

/home/christopher/sb/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclib
c-gcc -Os -pipe
-I/home/christopher/sb/buildroot/build_arm/staging_dir/usr/include
-I/home/christopher/sb/buildroot/build_arm/staging_dir/include
-mtune=arm920t -o imake  -O -I../../include -I../../imports/x11/include/X11
imake.o

make[3]: Leaving directory
`/home/christopher/sb/buildroot/build_arm/xc-011010/config/imake'

rm -f ./config/makedepend/Makefile.proto

./config/imake/imake -I./config/cf  -s ./config/makedepend/Makefile.proto -f
./config/makedepend/Imakefile -DTOPDIR=../.. -DCURDIR=./config/makedepend

./config/imake/imake: ./config/imake/imake: cannot execute binary file

make[2]: *** [config/makedepend/Makefile.proto] Error 126

make[2]: Leaving directory
`/home/christopher/sb/buildroot/build_arm/xc-011010'

make[1]: *** [World] Error 2

make[1]: Leaving directory
`/home/christopher/sb/buildroot/build_arm/xc-011010'

make: ***
[/home/christopher/sb/buildroot/build_arm/xc-011010/programs/Xserver/Xfbdev]
Error 2

linuxbox:/home/christopher/sb/buildroot#

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070820/f3df51ee/attachment.htm 
