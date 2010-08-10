From: Nataraj S Narayan <natarajsn@gmail.com>
Date: Tue, 10 Aug 2010 12:43:55 +0530
Subject: [Buildroot] BR:Keyboard input problem in Qt
Message-ID: <AANLkTinBS7_VMscY6tYXXjuUoSsrjw1TVE_PhcSNVBut@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I am on at91sam9263 SBC, filesystem from BR ,uClibc-0.9.31 and Qt-4.6.2.

I run the Qt app on framebuffer device , using -qws server.

Many a times the Qt Gui application 'looses' the keyboard and whatever one
types goes to the background shell ,rather than the input text boxes or
dialog boxes. The typed characters are visible on the black screen after
quitting from the Qt App.

I have been able to duplicate this problem by doing a hardware reset of USB
hub.

A Usb reset re-enumerates a /dev/input/event1 which is the Usb keyboard
device,
but a Qt app does'nt recongnise the keyboard after the reset and whatever is
typed goes to the background shell, always. Once I restart the App, input
returns to normal.

I   export QWS_KEYBOARD="USB:/dev/input/event1".

How come the qws server loose the keyboard even though it simply uses:-

qkbdlinuxinput_qws.cpp:103:    QString dev =
QLatin1String("/dev/input/event1");

Does this have anything to do with uclibc ? Any functions that differ very
much from libc, which QT calls ?

My .config:-

BR2_PACKAGE_QT=y
BR2_PACKAGE_QT_SHARED=y
BR2_PACKAGE_QT_LICENSE_APPROVED=y
BR2_PACKAGE_QT_GUI_MODULE=y
BR2_PACKAGE_QT_PIXEL_DEPTH_1=y
BR2_PACKAGE_QT_PIXEL_DEPTH_4=y
BR2_PACKAGE_QT_PIXEL_DEPTH_8=y
BR2_PACKAGE_QT_PIXEL_DEPTH_12=y
BR2_PACKAGE_QT_PIXEL_DEPTH_15=y
BR2_PACKAGE_QT_PIXEL_DEPTH_16=y
BR2_PACKAGE_QT_PIXEL_DEPTH_18=y
BR2_PACKAGE_QT_PIXEL_DEPTH_24=y
BR2_PACKAGE_QT_PIXEL_DEPTH_32=y
BR2_PACKAGE_QT_FONT_MICRO=y
BR2_PACKAGE_QT_FONT_FIXED=y
BR2_PACKAGE_QT_FONT_HELVETICA=y
BR2_PACKAGE_QT_FONT_UNIFONT=y
BR2_PACKAGE_QT_QTFREETYPE=y
BR2_PACKAGE_QT_GIF=y
BR2_PACKAGE_QT_LIBMNG=y
BR2_PACKAGE_QT_QTJPEG=y
BR2_PACKAGE_QT_QTPNG=y
BR2_PACKAGE_QT_QTTIFF=y
BR2_PACKAGE_QT_QTZLIB=y
BR2_PACKAGE_QT_SQL_MODULE=y
BR2_PACKAGE_QT_MYSQL=y
BR2_PACKAGE_QT_SQLITE=y
BR2_PACKAGE_QT_GFX_LINUXFB=y
BR2_PACKAGE_QT_MOUSE_LINUXINPUT=y
BR2_PACKAGE_QT_MOUSE_TSLIB=y
BR2_PACKAGE_QT_KEYBOARD_LINUXINPUT=y
BR2_PACKAGE_QT_DBUS=y
BR2_PACKAGE_QT_XML=y
BR2_PACKAGE_QT_NETWORK=y
BR2_PACKAGE_QT_JAVASCRIPTCORE=y
BR2_PACKAGE_QT_OPENSSL=y
BR2_PACKAGE_QT_SCRIPT=y

Plz note that I keyboard driver is LINUXINPUT and not TTY.


regards

Nataraj
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100810/5373fa27/attachment-0001.html>
