From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:28 +0200
Subject: [Buildroot] [git commit] libnss: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121836.073A181F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c1ba21a747ef3ccc76d6e44bcd1520f8d98d62c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnss/libnss.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index b4f9cce..931256c 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -45,12 +45,12 @@ endif
 endif
 
 define LIBNSS_BUILD_CMDS
-	$(MAKE1) -C $(@D)/nss coreconf \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/nss coreconf \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
 		$(LIBNSS_BUILD_VARS)
-	$(MAKE1) -C $(@D)/nss lib/dbm all \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/nss lib/dbm all \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
