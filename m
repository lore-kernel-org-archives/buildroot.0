From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 30 Mar 2014 21:57:54 +0400
Subject: [Buildroot] [PATCH v3 10/10] Revert "xtensa: sqlite requires
	special compiler option"
In-Reply-To: <1396202274-5109-1-git-send-email-jcmvbkbc@gmail.com>
References: <1396202274-5109-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1396202274-5109-11-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 6a30cd3fb30b8057ddde2c72a88c0bb6ad7d1761.
Now that -mtext-section-literals is specified in the xtensa ABI this fix
is no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v2 -> v3:
- new patch

 package/sqlite/sqlite.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index b27eb58..6493a29 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -33,10 +33,6 @@ ifeq ($(BR2_PACKAGE_SQLITE_SECURE_DELETE),y)
 SQLITE_CFLAGS += -DSQLITE_SECURE_DELETE
 endif
 
-ifeq ($(BR2_xtensa),y)
-SQLITE_CFLAGS += -mtext-section-literals
-endif
-
 SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(SQLITE_CFLAGS)"
 
 SQLITE_CONF_OPT = \
-- 
1.8.1.4
