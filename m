From: Ozgun <ozgun.gunay@gmail.com>
Date: Thu, 12 Jan 2012 10:36:35 +0200
Subject: [Buildroot] mesa gles2 under buildroot
Message-ID: <CAPeX=+soNee6absBROUkCUUkWC_OLXURB1D_kqE5mq6Thray8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to use QT with opengl support.
The opengl comes with mesa, and mesa comes with xorg.
I select them from buildroot configuration.
The buildroot created rootfs successfully without opengl es support.
libGL and libGLU files are exist but the libGLES_CM and the libGLESv2
files (which are the essential files for QT opengl) are absent.
Then I examined the mesa config.log file;

--------
  $ ./configure --target=i686-linux --host=i686-linux
--build=i686-pc-linux-gnu --prefix=/usr --exec-prefix=/usr
--sysconfdir=/etc --disable-gtk-doc --disable-nls --disable-ipv6
--enable-egl --enable-glu --disable-glw --disable-glut --enable-gles1
--enable-gles2 --disable-gallium --with-driver=dri
--with-dri-drivers=swrast --disable-static


configure:9068: WARNING: unrecognized options: --disable-gtk-doc,
--disable-nls, --disable-ipv6, --enable-gles1, --enable-gles2

--------

Why the mesa doesn't recognize --enable-gles2 option?


Also I tried to configure mesa from mesa3d.mk file under buildroot, but
buildroot still uses the above options.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120112/35855967/attachment.html>
