From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Jul 2020 15:12:23 +0200
Subject: [Buildroot] [git commit] package/libnss: enable parallel building
Message-ID: <20200705130924.83402846F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31602d8aaabaa9f55048c3db7a1b1b2fb2d27ef2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable parallel building by substituting $(MAKE1) with $(MAKE) in
libnss.mk. Parallel Makefile building has been added after version 3.53
so now it's time to enable it in Buildroot to save building time.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
