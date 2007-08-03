From: Christopher Reder <creder@digitalcpt.com>
Date: Fri, 3 Aug 2007 10:12:07 -0500
Subject: [Buildroot] arm920t, build tinyx failed with latest snapshot
Message-ID: <08be01c7d5e0$a87d4100$2600a8c0@engineering5>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Has anyone else built tiny-x using the latest for arm (920t) ?  this used to
build just fine.  Now it fails trying to run imake.

 

make[2]: Entering directory
`/home/christopher/sb/buildroot/build_arm/xc-011010'

cd ./config/imake && /usr/bin/make -w -f Makefile.ini BOOTSTRAPCFLAGS=""
CC="/home/christopher/sb/buildroot/build_arm/staging_dir/usr/bin/arm-linux-u
clibc-gcc -Os -pipe
-I/home/christopher/sb/buildroot/build_arm/staging_dir/usr/include
-I/home/christopher/sb/buildroot/build_arm/staging_dir/include
-mtune=arm920t"

make[3]: Entering directory
`/home/christopher/sb/buildroot/build_arm/xc-011010/config/imake'

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
URL: http://busybox.net/lists/buildroot/attachments/20070803/4331fd79/attachment.htm 
