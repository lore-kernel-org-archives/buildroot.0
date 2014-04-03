From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:37:19 +0200
Subject: [Buildroot] [git commit] Revert "xtensa: sqlite requires special
	compiler option"
Message-ID: <20140403193845.502D79A856@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1acc9826d0605ba93aa04751931a2739520e0bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 6a30cd3fb30b8057ddde2c72a88c0bb6ad7d1761.
Now that -mtext-section-literals is specified in the xtensa ABI this fix
is no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlite/sqlite.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index af59479..b5104c9 100644
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
