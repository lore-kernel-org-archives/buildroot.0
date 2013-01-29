From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 30 Jan 2013 00:19:42 +0100
Subject: [Buildroot] [git commit] xtensa: sqlite requires special compiler
	option
Message-ID: <20130129232027.128F09A880@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a30cd3fb30b8057ddde2c72a88c0bb6ad7d1761
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some of the generated object files are too large for PC-relative addressing,
so use the -mtext-section-literals compiler flag to move symbols closer to
the code.

[Peter: fix commit message]
Signed-off-by: Chris Zankel <chris@zankel.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sqlite/sqlite.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index bf4b921..8eb6b2f 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -33,6 +33,10 @@ ifeq ($(BR2_PACKAGE_SQLITE_SECURE_DELETE),y)
 SQLITE_CFLAGS += -DSQLITE_SECURE_DELETE
 endif
 
+ifeq ($(BR2_xtensa),y)
+SQLITE_CFLAGS += -mtext-section-literals
+endif
+
 SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(SQLITE_CFLAGS)"
 
 SQLITE_CONF_OPT = \
