From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 30 Mar 2014 21:57:53 +0400
Subject: [Buildroot] [PATCH v3 09/10] Revert "sqlcipher: fix build for
	xtensa"
In-Reply-To: <1396202274-5109-1-git-send-email-jcmvbkbc@gmail.com>
References: <1396202274-5109-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1396202274-5109-10-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 43d8dc3a392dcb769075cf1b076376a280c15c99.
Now that -mtext-section-literals is specified in the xtensa ABI this fix
is no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v2 -> v3:
- new patch

 package/sqlcipher/sqlcipher.mk | 4 ----
 1 file changed, 4 deletions(-)

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
-- 
1.8.1.4
