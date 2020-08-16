From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Aug 2020 22:42:03 +0200
Subject: [Buildroot] [git commit] Revert "package/libnss: enable parallel
 building"
Message-ID: <20200816203604.1A90986621@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae9196bbe57eab1fecbc75a613ed412cb924aad7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 31602d8aaabaa9f55048c3db7a1b1b2fb2d27ef2 as it seems
that libnss still have parallel build issues.

Fixes:
 - http://autobuild.buildroot.org/results/521aaf8b41686865ea86688ea6410418b422fd55

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnss/libnss.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index a5e4432f8c..b4bb09364c 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -69,12 +69,12 @@ endif
 endif
 
 define LIBNSS_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss coreconf \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/nss coreconf \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
 		$(LIBNSS_BUILD_VARS)
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss lib/dbm all \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/nss lib/dbm all \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
@@ -127,12 +127,12 @@ HOST_LIBNSS_BUILD_VARS += USE_64=1
 endif
 
 define HOST_LIBNSS_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss coreconf \
+	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/nss coreconf \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
 		$(HOST_LIBNSS_BUILD_VARS)
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss lib/dbm all \
+	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/nss lib/dbm all \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
