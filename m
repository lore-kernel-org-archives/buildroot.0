From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 23 Nov 2013 19:46:25 +0100
Subject: [Buildroot] [PATCH 1/1] nut: add libltdl dependency
Message-ID: <1385232385-8527-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libltdl is needed for nut-scanner

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/nut/nut.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 8cb8a01..25b88c4 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -48,6 +48,14 @@ else
 NUT_CONF_OPT += --without-cgi
 endif
 
+# libltdl (libtool) is needed for nut-scanner
+ifeq ($(BR2_PACKAGE_LIBTOOL),y)
+NUT_DEPENDENCIES += libtool
+NUT_CONF_OPT += --with-libltdl
+else
+NUT_CONF_OPT += --without-libltdl
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
 NUT_DEPENDENCIES += libusb-compat
 NUT_CONF_OPT += --with-usb
-- 
1.8.1.4
