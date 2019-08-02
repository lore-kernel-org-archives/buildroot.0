From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  2 Aug 2019 09:24:54 +0200
Subject: [Buildroot] [PATCH 1/2] package/gssdp: add optional libgtk3
 dependency
Message-ID: <20190802072455.22212-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gssdp's sniffer depends on libgtk3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gssdp/gssdp.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index 2ce1f9b0bf..e7f3ad9330 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -13,4 +13,11 @@ GSSDP_LICENSE_FILES = COPYING
 GSSDP_INSTALL_STAGING = YES
 GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
 
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+GSSDP_DEPENDENCIES += libgtk3
+GSSDP_CONF_OPTS += --with-gtk
+else
+GSSDP_CONF_OPTS += --without-gtk
+endif
+
 $(eval $(autotools-package))
-- 
2.20.1
