From: Piyush Verma <piyush.pv@gmail.com>
Date: Sun, 12 Aug 2012 20:27:10 +0800
Subject: [Buildroot] buildroot-2012.05 failed to build qt with LInaro
	2012.04
In-Reply-To: <CAATPF_TcOHHAAwHs5zQ+Q8efrYMdzfE3u+0JjGjGJwR-Y4E6SA@mail.gmail.com>
References: <CAATPF_TcOHHAAwHs5zQ+Q8efrYMdzfE3u+0JjGjGJwR-Y4E6SA@mail.gmail.com>
Message-ID: <CAATPF_RY+jju9-bvhgdDUJae+gNgxn1bfYPDmrnLJi6XWPM3_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am sorry don't know what happen just press enter and mail sent.

Before it give some error in script building. I found one patch and apply
then it proceeded here is attached patch.

Another problem is all files it's installing in sysroot/ not in sysroot/usr
which cause other build step to fail.

Here is configure code executed by buildroot.

(cd /home/piyush/devel/a10/buildroot-2012.05/output/build/qt-4.8.1;
PKG_CONFIG_SYSROOT_DIR="/home/piyush/devel/a10/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot"
PKG_CONFIG="/home/piyush/devel/a10/buildroot-2012.05/output/host/usr/bin/pkg-config"
PKG_CONFIG_PATH="/home/piyush/devel/a10/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/pkgconfig:"
MAKEFLAGS=" -j8" ./configure -silent -force-pkg-config -opensource
-confirm-license -largefile -no-qt3support -nomake examples -nomake demos
-no-glib -depths 8,16,32 -qt-gfx-linuxfb -no-gfx-transformed -no-gfx-qvfb
-no-gfx-vnc -no-gfx-multiscreen -no-gfx-directfb -no-mouse-pc
-no-mouse-linuxtp -qt-mouse-linuxinput -no-mouse-tslib -no-mouse-qvfb
-no-kbd-tty -qt-kbd-linuxinput -no-kbd-qvfb -release -shared -little-endian
-embedded arm -no-gif -no-libmng -qt-zlib -no-libjpeg -no-libpng
-no-libtiff -no-freetype -openssl -no-sql-sqlite -no-xmlpatterns
-no-multimedia -no-audio-backend -no-phonon -no-phonon-backend -no-svg
-no-webkit -script -scripttools -no-javascript-jit -no-stl -declarative
-no-xinerama -no-cups -no-nis -no-accessibility -no-separate-debug-info
-prefix /usr -plugindir /usr/lib/qt/plugins -hostprefix
/home/piyush/devel/a10/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot
-fast -no-rpath )


Where clearly it specify --prefix=/usr but qt build disregard it.

Is there any other way to correct it ?








On Sun, Aug 12, 2012 at 8:21 PM, Piyush Verma <piyush.pv@gmail.com> wrote:

> Hello,
>
>
>
>
> --
> Thanks & Regards
>
> Piyush Verma
>
>
>


-- 
Thanks & Regards

Piyush Verma
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120812/4927ba05/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: qt-4.8.1-javascrip.patch
Type: application/octet-stream
Size: 2045 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120812/4927ba05/attachment.obj>
