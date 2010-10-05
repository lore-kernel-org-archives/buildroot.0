From: Martin Banky <martin.banky@gmail.com>
Date: Tue, 5 Oct 2010 23:14:35 +0200
Subject: [Buildroot] [git commit master 1/1] libpng: bump to 1.4.4
Message-ID: <20101005215019.108E98B801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=968ebae9dee10907e9bbc20ad5982e1de914efc5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libpng/libpng.mk |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 5608f4f..82b88da 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -3,23 +3,22 @@
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
 
 define LIBPNG_STAGING_LIBPNG12_CONFIG_FIXUP
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
 		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include/libpng12\',g" \
+		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include/libpng$(LIBPNG_SERIES)\',g" \
 		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
-		$(STAGING_DIR)/usr/bin/libpng12-config
+		$(STAGING_DIR)/usr/bin/libpng$(LIBPNG_SERIES)-config
 endef
 
 LIBPNG_POST_INSTALL_STAGING_HOOKS += LIBPNG_STAGING_LIBPNG12_CONFIG_FIXUP
-- 
1.7.1
