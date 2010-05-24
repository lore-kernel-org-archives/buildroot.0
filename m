From: Muhammed ER <er.muhammed@gmail.com>
Date: Mon, 24 May 2010 16:49:51 +0300
Subject: [Buildroot] Buildroot Qt Bug Found
Message-ID: <AANLkTimJDqhNxuMCy9q52HuaNfHe6R38dty6krrcOnyU@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Today is my best because I found a bug in Qt Compiletion that was I need to
much for 3 months.

Compile Qt Phonon needs phonon,
-------------------------------------------------------------
ifeq ($(BR2_PACKAGE_QT_PHONON),y)
QT_CONFIGURE+= -phonon
QT_DEP_LIBS+=gstreamer gst-plugins-base
else
QT_CONFIGURE+= -no-phonon
endif
-----------------------------------------------------------------
and system install just base plugin...


But I need good, bad, ugly and base plugin.

------------------------------------------------------------------------
ifeq ($(BR2_PACKAGE_QT_PHONON),y)
QT_CONFIGURE+= -phonon
QT_DEP_LIBS+=gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad
gst-plugins-ugly
else
QT_CONFIGURE+= -no-phonon
endif
-----------------------------------------------------------------------

Thanks,
Muhammed ER.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100524/320f6323/attachment.html>
