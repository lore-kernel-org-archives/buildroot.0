From: Glenn Coombs <glenn.coombs@gmail.com>
Date: Wed, 19 Jul 2017 17:17:43 +0800
Subject: [Buildroot] How to build the qt plugin in gst1-plugins-bad ?
Message-ID: <CADujc4q8d1AMFmvoD_62qnOkNSntuCCGCe4+Pkatp4P382srfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I would like to use the gstreamer sink called qmlglsink, which is part of
the qt plugin in the gst1-plugins-bad package.  My target system is an
imx6q using EGLFS (so no X11 or Wayland).  When looking at the config.log
file in the build/gst1-plugins-bad-1.10.4/ directory I can see that the qt
plugin is not selected for building due to --disable-qt being passed to the
configure script.

I modified the Config.in and gst1-plugins-bad.mk files in the
buildroot/package/gstreamer1/gst1-plugins-bad/ directory to add the option
to pass --enable-qt to the configure script and that got me a bit further.
The configure script now checks to build the qt plugin but decides against
it because it can't work out the Qt Windowing system:

configure:50115: checking for QT
configure:50123: $PKG_CONFIG --exists --print-errors "Qt5Core Qt5Gui Qt5Qml
Qt5Quick >= 5.4.0"
configure:50126: $? = 0
configure:50141: $PKG_CONFIG --exists --print-errors "Qt5Core Qt5Gui Qt5Qml
Qt5Quick >= 5.4.0"
configure:50144: $? = 0
configure:50184: result: yes
configure:50193: checking for moc-qt5
configure:50226: result: no
configure:50193: checking for moc
configure:50211: found
/opt/porky/dev-new-kernel/imx6qdtibrd0208/host/usr/bin/moc
configure:50223: result:
/opt/porky/dev-new-kernel/imx6qdtibrd0208/host/usr/bin/moc
configure:50239: checking for rcc-qt5
configure:50272: result: no
configure:50239: checking for rcc
configure:50257: found
/opt/porky/dev-new-kernel/imx6qdtibrd0208/host/usr/bin/rcc
configure:50269: result:
/opt/porky/dev-new-kernel/imx6qdtibrd0208/host/usr/bin/rcc
configure:50285: checking for uic-qt5
configure:50318: result: no
configure:50285: checking for uic
configure:50303: found
/opt/porky/dev-new-kernel/imx6qdtibrd0208/host/usr/bin/uic
configure:50315: result:
/opt/porky/dev-new-kernel/imx6qdtibrd0208/host/usr/bin/uic
configure:50774: WARNING: Could not find any Qt Windowing integration

I'm not sure why the qt plugin is explicitly disabled - is there a known
issue with building this plugin ?  Can anybody help with what further
options I might need to set to get it to build ?

Thanks,

--
Glenn
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170719/b422d472/attachment.html>
