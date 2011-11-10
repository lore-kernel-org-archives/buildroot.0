From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Nov 2011 08:25:26 -0300
Subject: [Buildroot] [PATCH 2/3] flex: bump to version 2.5.35-10 and cleanup
	style
In-Reply-To: <1320924327-3019-1-git-send-email-gustavo@zacarias.com.ar>
References: <1320924327-3019-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1320924327-3019-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ....33-prog-ar.patch => flex-2.5.35-prog-ar.patch} |    0
 package/flex/flex.mk                               |   23 ++++++++++---------
 2 files changed, 12 insertions(+), 11 deletions(-)
 rename package/flex/{flex-2.5.33-prog-ar.patch => flex-2.5.35-prog-ar.patch} (100%)

diff --git a/package/flex/flex-2.5.33-prog-ar.patch b/package/flex/flex-2.5.35-prog-ar.patch
similarity index 100%
rename from package/flex/flex-2.5.33-prog-ar.patch
rename to package/flex/flex-2.5.35-prog-ar.patch
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 706b89d..df1b420 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -3,24 +3,25 @@
 # flex
 #
 #############################################################
-FLEX_VERSION:=2.5.35
-FLEX_PATCH_VERSION:=9.1
-FLEX_SOURCE:=flex_$(FLEX_VERSION).orig.tar.gz
-FLEX_PATCH:=flex_$(FLEX_VERSION)-$(FLEX_PATCH_VERSION).diff.gz
-FLEX_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/flex
-FLEX_DIR:=$(BUILD_DIR)/flex-$(FLEX_VERSION)
-FLEX_INSTALL_STAGING=YES
+
+FLEX_VERSION = 2.5.35
+FLEX_PATCH_VERSION = 10
+FLEX_SOURCE = flex_$(FLEX_VERSION).orig.tar.gz
+FLEX_PATCH = flex_$(FLEX_VERSION)-$(FLEX_PATCH_VERSION).diff.gz
+FLEX_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/f/flex
+FLEX_DIR = $(BUILD_DIR)/flex-$(FLEX_VERSION)
+FLEX_INSTALL_STAGING = YES
 FLEX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_GETTEXT),gettext) \
 	$(if $(BR2_PACKAGE_LIBINTL),libintl)
 
 # lex -> flex
 define FLEX_INSTALL_LEX
-cd $(TARGET_DIR)/usr/bin && ln -snf flex lex
+	cd $(TARGET_DIR)/usr/bin && ln -snf flex lex
 endef
 
 define FLEX_UNINSTALL_LEX
--rm $(TARGET_DIR)/usr/bin/lex
+	-rm $(TARGET_DIR)/usr/bin/lex
 endef
 
 FLEX_POST_INSTALL_HOOKS += FLEX_INSTALL_LEX
@@ -29,11 +30,11 @@ FLEX_POST_CLEAN_HOOKS += FLEX_UNINSTALL_LEX
 # libfl installation
 ifeq ($(BR2_PACKAGE_FLEX_LIBFL),y)
 define FLEX_INSTALL_LIBFL
-install -D $(FLEX_DIR)/libfl.a $(STAGING_DIR)/usr/lib/libfl.a
+	install -D $(FLEX_DIR)/libfl.a $(STAGING_DIR)/usr/lib/libfl.a
 endef
 
 define FLEX_UNINSTALL_LIBFL
--rm $(STAGING_DIR)/lib/libfl.a
+	-rm $(STAGING_DIR)/lib/libfl.a
 endef
 
 FLEX_POST_INSTALL_HOOKS += FLEX_INSTALL_LIBFL
-- 
1.7.3.4
