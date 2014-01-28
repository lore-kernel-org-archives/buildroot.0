From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jan 2014 19:24:11 -0300
Subject: [Buildroot] [PATCH] libusb: disable udev support for host variant
Message-ID: <1390947851-11705-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's no guarantee that udev with development files is present in the
host, so disable it. Fixes:
http://autobuild.buildroot.net/results/7bb/7bbf6ec25250dea96503253ac468adfef77a9010/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libusb/libusb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index a595a12..ffb39ba 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -8,6 +8,7 @@ LIBUSB_VERSION_MAJOR = 1.0
 LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).18
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = http://downloads.sourceforge.net/project/libusb/libusb-$(LIBUSB_VERSION_MAJOR)/libusb-$(LIBUSB_VERSION)
+HOST_LIBUSB_CONF_OPT = --disable-udev
 LIBUSB_LICENSE = LGPLv2.1+
 LIBUSB_LICENSE_FILES = COPYING
 LIBUSB_DEPENDENCIES = host-pkgconf
-- 
1.8.3.2
