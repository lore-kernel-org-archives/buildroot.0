From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 14:40:29 +0200
Subject: [Buildroot] [git commit] pango: add host variant
Message-ID: <20150419124107.829567FD0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d24891ca367f5416eabd51d8db98cdb334e86889
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Required by librsvg which in turn is required by midori.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/pango.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

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
