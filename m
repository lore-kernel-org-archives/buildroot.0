From: Zhaozhou Meng <mengzhaozhou@gmail.com>
Date: Wed, 10 Aug 2016 13:23:59 +0200
Subject: [Buildroot] issue with the QT5, buildroot 2016-05
Message-ID: <CAMWiJUuY5YGP10m6P-aHcdyuiewq+AdRU8MByGN5Kb4NLvNi3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I use the buildroot 2016.05 version, the board nitrogen6x with cpu imx6 and
the u-boot 2016.03 version.
I built the QT5.6 with eglfs, opengl es2 without X11, when I run the
examples on the board, I found that some example works perfectly, but some
example doesn't work, like opengl/cube with the error :
"audit: type=1701 audit(1455208187.550:2): auid=4294967295 uid=0 gid=0
ses=429491
Segmentation fault (core dumped)"
The same error also happened for my own QT project compiled with buidlroot
qmake.
I don't know if you have the same problems,

Another problem is that I tried to compile the QT5.5.1 with the buildroot
toolchain and sysroot.
using the configure like this:
./configure -v -no-opengl -opengl es2 -eglfs -no-xcb -no-pch -make libs
-make tools
 -make examples -opensource -confirm-license -release -xplatform
linux-arm-gnueabi-g++  -sysroot /buildroot-2016.05/output/staging -prefix
/opt/Qt5.5.1-imx6

I have modified the qmake.conf under /qtbase/mkspec/linux-arm-gnueabi-g++
using the compiler under
/buildroot-2016.05/output/host/usr/bin/arm-buildroot-linux-gnueabi-

Then I tested the example on the board, the same error like above for the
/opengl/cube and the example 3D doesn't work with "egl error, could not
create egl surface 0x300b"

if you have the same problems  ?
Do you have any ideas ?

Thanks,
Zhaozhou
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160810/ca7918e8/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buidlroot-config
Type: application/octet-stream
Size: 93358 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160810/ca7918e8/attachment.obj>
