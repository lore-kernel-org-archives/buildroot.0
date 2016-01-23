From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 11:23:42 +0100
Subject: [Buildroot] [PATCH 1/4] package/sqlite: Disable autoreconf
Message-ID: <1453544625-30597-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently we have no patches for this package, compilation works without
autoreconf.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sqlite/sqlite.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index bf31292..27dad12 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -11,9 +11,6 @@ SQLITE_LICENSE = Public domain
 SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_INSTALL_STAGING = YES
 
-# Patching Makefile.am:
-SQLITE_AUTORECONF = YES
-
 ifeq ($(BR2_PACKAGE_SQLITE_STAT3),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT3
 endif
-- 
2.7.0.rc3
