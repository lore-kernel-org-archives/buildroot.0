From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Jul 2021 10:34:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtd: update lib{mtd,ubi}.h path
Message-ID: <20210718083412.1904311-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Update lib{mtd,ubi}.h path to fix the following build failure raised
since bump of swupdate to version 2021.04 in commit
2c6b0359c3b819fadb4437b2d780e95c32fdab21:

In file included from corelib/mtd-interface.c:21:
include/flash.h:13:10: fatal error: libmtd.h: No such file or directory
   13 | #include <libmtd.h>
      |          ^~~~~~~~~~

This build failure is raised because of
https://github.com/sbabic/swupdate/commit/0c672866d4a9fe8f0808b5d8a0afb95c13c4c138

Fixes:
 - http://autobuild.buildroot.org/results/d475bdb341d2afecf12e404dfa093e58221b9882

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mtd/mtd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 121dfa554b..189736b877 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -124,8 +124,8 @@ endef
 # Those libraries are not installed by "make install", but are needed
 # by other packages, such as swupdate.
 define MTD_INSTALL_LIBS
-	$(INSTALL) -D -m 0755 $(@D)/include/libmtd.h $(STAGING_DIR)/usr/include/mtd/libmtd.h
-	$(INSTALL) -D -m 0755 $(@D)/include/libubi.h $(STAGING_DIR)/usr/include/mtd/libubi.h
+	$(INSTALL) -D -m 0755 $(@D)/include/libmtd.h $(STAGING_DIR)/usr/include/libmtd.h
+	$(INSTALL) -D -m 0755 $(@D)/include/libubi.h $(STAGING_DIR)/usr/include/libubi.h
 	$(INSTALL) -D -m 0755 $(@D)/include/mtd/ubi-media.h $(STAGING_DIR)/usr/include/mtd/ubi-media.h
 	$(INSTALL) -D -m 0755 $(@D)/libmtd.a $(STAGING_DIR)/usr/lib/libmtd.a
 	$(INSTALL) -D -m 0755 $(@D)/libubi.a $(STAGING_DIR)/usr/lib/libubi.a
-- 
2.30.2
