From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Apr 2015 06:48:20 -0300
Subject: [Buildroot] [PATCH v3 05/11] pango: add host variant
In-Reply-To: <1429436906-15222-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429436906-15222-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1429436906-15222-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Required by librsvg which in turn is required by midori.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pango/pango.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index e37e75f..75e2d1b 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -67,6 +67,7 @@ PANGO_CONF_ENV = \
 	ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 
 PANGO_CONF_OPTS = --enable-explicit-deps=no
+HOST_PANGO_CONF_OPTS = --enable-explicit-deps=no
 
 PANGO_DEPENDENCIES = \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
@@ -76,6 +77,13 @@ PANGO_DEPENDENCIES = \
 	harfbuzz \
 	fontconfig \
 	freetype
+HOST_PANGO_DEPENDENCIES = \
+	host-pkgconf \
+	host-libglib2 \
+	host-cairo \
+	host-harfbuzz \
+	host-fontconfig \
+	host-freetype
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 PANGO_CONF_OPTS += \
@@ -95,3 +103,4 @@ define PANGO_INSTALL_INIT_SYSV
 endef
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.0.5
