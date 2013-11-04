From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon,  4 Nov 2013 17:49:44 +0800
Subject: [Buildroot] [PATCH] sqlite: Disable dynamic extention if static
	library is seleted.
Message-ID: <1383558584-17816-1-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 package/sqlite/sqlite.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 5fc1e9e..c20e782 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -42,6 +42,10 @@ SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(SQLITE_CFLAGS)"
 SQLITE_CONF_OPT = \
 	--localstatedir=/var
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+SQLITE_CONF_OPT += --enable-dynamic-extensions=no
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 SQLITE_CONF_OPT += --enable-threadsafe
 else
-- 
1.7.9.5
