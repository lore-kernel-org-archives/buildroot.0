From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jan 2016 12:02:35 +0100
Subject: [Buildroot] [git commit] package/sqlite: Disable autoreconf
Message-ID: <20160123110527.E068D80438@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cef9b645cd00c16ee9b2d41591d5e94e634b004c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently we have no patches for this package, compilation works without
autoreconf.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
