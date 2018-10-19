From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 19 Oct 2018 22:13:10 +0200
Subject: [Buildroot] [PATCH 1/6] gvfs: add libusb support
Message-ID: <20181019201315.15922-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gvfs/gvfs.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 19747b4cb0..b62923a500 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -99,6 +99,13 @@ else
 GVFS_CONF_OPTS += --disable-http
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+GVFS_DEPENDENCIES += libusb
+GVFS_CONF_OPTS += --enable-libusb
+else
+GVFS_CONF_OPTS += --disable-libusb
+endif
+
 ifeq ($(BR2_PACKAGE_SAMBA4),y)
 GVFS_DEPENDENCIES += samba4
 GVFS_CONF_OPTS += \
-- 
2.17.1
