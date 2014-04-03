From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:36:58 +0200
Subject: [Buildroot] [git commit] Revert "sqlcipher: fix build for xtensa"
Message-ID: <20140403193845.49F8B9A856@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b14d069143a3d029ad69ac2b441aa9eaa8e64e7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 43d8dc3a392dcb769075cf1b076376a280c15c99.
Now that -mtext-section-literals is specified in the xtensa ABI this fix
is no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlcipher/sqlcipher.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index ace5ce8..6130870 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -32,10 +32,6 @@ ifeq ($(BR2_PACKAGE_SQLCIPHER_STAT3),y)
 SQLCIPHER_CFLAGS += -DSQLITE_ENABLE_STAT3
 endif
 
-ifeq ($(BR2_xtensa),y)
-SQLCIPHER_CFLAGS += -mtext-section-literals
-endif
-
 ifeq ($(BR2_PACKAGE_SQLCIPHER_READLINE),y)
 SQLCIPHER_DEPENDENCIES += ncurses readline
 SQLCIPHER_CONF_OPT += --with-readline-inc="-I$(STAGING_DIR)/usr/include"
