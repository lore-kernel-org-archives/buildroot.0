From: Zhaozhou Meng <mengzhaozhou@gmail.com>
Date: Tue, 2 Aug 2016 17:21:25 +0200
Subject: [Buildroot] the problem with Xorg, QT5 and imx vivant dirver
Message-ID: <CAMWiJUu_C8sJ+gaQdxQjAUS5wk_HEwzOdtEp4komzqOeB5XCBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'am new to buildroot and I'am working on the buildroot 2016.05 for a
project based on the board nitrogen6x, freescale imx6q.
I want to build the QT5 using eglfs, egl and opengl and the Xorg using the
imx vivant driver.
So I choosed :
X11 as freescale imx-gpu-viv output option ,
xf86-video-imx-viv as X11R7 driver,
QT5 Desktop Opengl as opengl support
and others necessary packages, like gstreamer 1.0 but I didn't choose the
opengl in gst1-plugins-bad.

During the building, I have always the errors with qwidget.so like
[sub-src-mak-first] error 2.

Is there any conflict between the xorg and the QT5 or it is the other
problem ?

Another question is that when I choosed the xf86-video-imx-viv as X11R7
driver, the mesa3D is choosed, it means the imx vivant driver depends on
mesa3D ?

Thanks all of you.

The output of building like this:

ln -s libQt5Widgets.so.5.6.0 libQt5Widgets.so
ln -s libQt5Widgets.so.5.6.0 libQt5Widgets.so.5
ln -s libQt5Widgets.so.5.6.0 libQt5Widgets.so.5.6
rm -f ../../lib/libQt5Widgets.so.5.6.0
mv -f libQt5Widgets.so.5.6.0  ../../lib/
rm -f ../../lib/libQt5Widgets.so
rm -f ../../lib/libQt5Widgets.so.5
rm -f ../../lib/libQt5Widgets.so.5.6
mv -f libQt5Widgets.so ../../lib/
mv -f libQt5Widgets.so.5 ../../lib/
mv -f libQt5Widgets.so.5.6 ../../lib/
Makefile:45 : la recette pour la cible ? sub-src-make_first ? a ?chou?e
make[2]: *** [sub-src-make_first] Erreur 2
package/pkg-generic.mk:195 : la recette pour la cible
? /home/plateau/Zhaozhou/buildroot-2016.05/output/build/qt5base-5.6.0/.stamp_built
?
a ?chou?e
make[1]: ***
[/home/plateau/Zhaozhou/buildroot-2016.05/output/build/qt5base-5.6.0/.stamp_built]
Erreur 2
Makefile:36 : la recette pour la cible ? _all ? a ?chou?e
make: *** [_all] Erreur 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160802/4bb85fce/attachment.html>
