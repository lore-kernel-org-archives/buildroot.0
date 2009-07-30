From: Will Newton <will.newton@gmail.com>
Date: Thu, 30 Jul 2009 17:14:38 +0200
Subject: [Buildroot] [git commit] libxml2: Bump version to 2.7.3.
Message-ID: <20090730151457.688CA77804@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5079d7a0b953d5fe49ced0c4cdf2382e5a357bcf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #491

- Deletion of reject files no longer required as they have gone from
   the upstream release.

Signed-off-by: Will Newton <will.newton@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    1 +
 package/libxml2/libxml2.mk |    7 +------
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0a3f0a0..bda651f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -46,6 +46,7 @@
 	#451: Upgrade from unmaintained dosfstools-2.11 to dosfstools-3.0.3
 	#467: DirectFB 1.4.1
 	#473: memstat_0.5.tar.gz has install with -D and that fails "make"
+	#491: libxml2: Bump version to 0.7.3
 	#495: Bump bind package to 9.5.1-P3 (security)
 	#497: OpenSSL RSA key generation hangs on x86_64
 
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index eca96ea..e9c8752 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -3,7 +3,7 @@
 # libxml2
 #
 #############################################################
-LIBXML2_VERSION = 2.6.32
+LIBXML2_VERSION = 2.7.3
 LIBXML2_SOURCE = libxml2-sources-$(LIBXML2_VERSION).tar.gz
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
@@ -22,11 +22,6 @@ LIBXML2_DEPENDENCIES = uclibc
 
 $(eval $(call AUTOTARGETS,package,libxml2))
 
-$(LIBXML2_HOOK_POST_EXTRACT):
-	rm -f $(LIBXML2_DIR)/win32/Makefile.msvc.rej
-	rm -f $(LIBXML2_DIR)/macos/src/XMLTestPrefix.h.rej
-	touch $@
-
 $(LIBXML2_HOOK_POST_INSTALL):
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
 	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
-- 
1.6.3.3
