From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 10:12:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/thermald: add THERMALD_CPE_ID_VENDOR
Message-ID: <20210516081252.3729550-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:intel:thermald is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aintel%3Athermald

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/thermald/thermald.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
index 98e9c361e5..5619258c44 100644
--- a/package/thermald/thermald.mk
+++ b/package/thermald/thermald.mk
@@ -12,6 +12,7 @@ THERMALD_DEPENDENCIES = dbus dbus-glib libxml2 $(TARGET_NLS_DEPENDENCIES)
 # tools are GPL-3.0+ but are not added to the target
 THERMALD_LICENSE = GPL-2.0+
 THERMALD_LICENSE_FILES = COPYING
+THERMALD_CPE_ID_VENDOR = intel
 THERMALD_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-- 
2.30.2
