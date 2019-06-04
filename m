From: Yang Zhonghua <happy2discover@gmail.com>
Date: Tue, 4 Jun 2019 09:46:24 +0800
Subject: [Buildroot] Got errors when I tried to build rootfs with wayland,
 qt5 on an i.MX 6dl board
Message-ID: <CA+bU9VcvgR241rkG7utoG2LzwaJd__Ja8BesweeWpAb_VZz6hQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey guys,

Here are what I hope,
1. on an i.MX 6dl/6q board
2. wayland backend, weston
3. a low kernel version, 4.1.15
4. qt5, at least 5.9
5. run a qt application via wayland


Here are my steps,
Thanks for y_morin first, who helped me in freenode #buildroot!
1. chosen 2019.02.2 for selecting BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
2. chosen configs/imx6-sabresd_qt5_defconfig to make
3. changed toolchain -> C library from uClibc-ng to glibc
4. selected Target packages -> Hardware handling -> Freescale i.MX
libraries -> imx-gpu-viv -> Output option(wayland)
5. make

Then I got errors as follows,
qeglfsvivintegration.cpp: In member function ?virtual void
QEglFSVivIntegration::platformInit()?:
qeglfsvivintegration.cpp:68:41: error: invalid conversion from ?void*? to
?EGLNativeDisplayType {aka wl_display*}? [-fpermissive]
     mNativeDisplay = fbGetDisplayByIndex(framebufferIndex());
                      ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
qeglfsvivintegration.cpp: In member function ?virtual wl_egl_window*
QEglFSVivIntegration::createNativeWindow(QPlatformWindow*, const QSize&,
const QSurfaceFormat&)?:
qeglfsvivintegration.cpp:91:51: error: invalid conversion from ?void*? to
?EGLNativeWindowType {aka wl_egl_window*}? [-fpermissive]
     EGLNativeWindowType eglWindow = fbCreateWindow(mNativeDisplay, 0, 0,
size.width(), size.height());

 ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Makefile:1273: recipe for target '.obj/qeglfsvivintegration.o' failed

Could someone tell me how to solve the above errors?
Do I need change some qt code?
Should I change some configs?
My .config file link is https://pastebin.com/rJceBU0L

looking forward to your reply!

happy2discover at gmail.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190604/405d74f9/attachment.html>
