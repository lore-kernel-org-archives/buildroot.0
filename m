From: Martin Banky <martin.banky@gmail.com>
Date: Mon,  4 Oct 2010 17:47:00 -0700
Subject: [Buildroot] [PATCH 1/2] libpng: bump to 1.4.4
In-Reply-To: <1286239621-31904-1-git-send-email-Martin.Banky@gmail.com>
References: <1286239621-31904-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286239621-31904-2-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/libpng/libpng.mk |   13 ++++++-------
 1 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 5608f4f..cbcedf0 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -3,26 +3,25 @@
 # libpng (Portable Network Graphic library)
 #
 #############################################################
-LIBPNG_VERSION:=1.2.44
+LIBPNG_VERSION = 1.4.4
+LIBPNG_SERIES = 14
 LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
 LIBPNG_LIBTOOL_PATCH = NO
 LIBPNG_INSTALL_STAGING = YES
-LIBPNG_CONF_OPT = --without-libpng-compat
 LIBPNG_DEPENDENCIES = host-pkg-config zlib
 
-HOST_LIBPNG_CONF_OPT = --without-libpng-compat
 HOST_LIBPNG_DEPENDENCIES = host-pkg-config host-zlib
 
-define LIBPNG_STAGING_LIBPNG12_CONFIG_FIXUP
+define LIBPNG_STAGING_LIBPNG_CONFIG_FIXUP
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
 		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include/libpng12\',g" \
+		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include/libpng$(LIBPNG_SERIES)\',g" \
 		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
-		$(STAGING_DIR)/usr/bin/libpng12-config
+		$(STAGING_DIR)/usr/bin/libpng$(LIBPNG_SERIES)-config
 endef
 
-LIBPNG_POST_INSTALL_STAGING_HOOKS += LIBPNG_STAGING_LIBPNG12_CONFIG_FIXUP
+LIBPNG_POST_INSTALL_STAGING_HOOKS += LIBPNG_STAGING_LIBPNG_CONFIG_FIXUP
 
 $(eval $(call AUTOTARGETS,package,libpng))
 $(eval $(call AUTOTARGETS,package,libpng,host))
-- 
1.7.3.1
