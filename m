From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun,  5 Jul 2020 00:18:26 +0200
Subject: [Buildroot] [PATCH] package/libnss: enable parallel building
Message-ID: <20200704221826.206342-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable parallel building by substituting $(MAKE1) with $(MAKE) in
libnss.mk. Parallel Makefile building has been added after version 3.53
so now it's time to enable it in Buildroot to save building time.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 8b31892353..3e4529baaa 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -69,12 +69,12 @@ endif
 endif
 
 define LIBNSS_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/nss coreconf \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss coreconf \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
 		$(LIBNSS_BUILD_VARS)
-	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/nss lib/dbm all \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss lib/dbm all \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
@@ -127,12 +127,12 @@ HOST_LIBNSS_BUILD_VARS += USE_64=1
 endif
 
 define HOST_LIBNSS_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/nss coreconf \
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss coreconf \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
 		$(HOST_LIBNSS_BUILD_VARS)
-	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/nss lib/dbm all \
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss lib/dbm all \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
-- 
2.25.1
