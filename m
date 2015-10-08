From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  8 Oct 2015 04:12:54 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/lzlib: bump to version 0.4.3
Message-ID: <1444270374-11645-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to more recent github repository.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Changes v1 -> v2:
  - fix install paths for lib and lua files
---
 package/lzlib/Config.in  | 2 +-
 package/lzlib/lzlib.hash | 2 --
 package/lzlib/lzlib.mk   | 8 +++++---
 3 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 package/lzlib/lzlib.hash

diff --git a/package/lzlib/Config.in b/package/lzlib/Config.in
index c123019..f7fae15 100644
--- a/package/lzlib/Config.in
+++ b/package/lzlib/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_LZLIB
 	  functions and also to read/write gzip files using an
 	  interface similar to the base io package.
 
-	  http://luaforge.net/projects/lzlib/
+	  https://github.com/LuaDist/lzlib
diff --git a/package/lzlib/lzlib.hash b/package/lzlib/lzlib.hash
deleted file mode 100644
index d823e8b..0000000
--- a/package/lzlib/lzlib.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256	c10055bde2c0a0ed14f22c1ee0701910b0b9885245baf7911201ab4dfd3b828c  lzlib-0.4.work3-1.src.rock
diff --git a/package/lzlib/lzlib.mk b/package/lzlib/lzlib.mk
index ec37842..91f380a 100644
--- a/package/lzlib/lzlib.mk
+++ b/package/lzlib/lzlib.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-LZLIB_VERSION = 0.4.work3-1
-LZLIB_SUBDIR = lzlib-0.4-work3
+LZLIB_VERSION = 0.4.3
+LZLIB_SITE = $(call github,LuaDist,lzlib,$(LZLIB_VERSION))
 LZLIB_DEPENDENCIES = zlib
 LZLIB_LICENSE = MIT
+LZLIB_CONF_OPTS = -DINSTALL_CMOD="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)" \
+	-DINSTALL_LMOD="/usr/share/lua/$(LUAINTERPRETER_ABIVER)"
 
-$(eval $(luarocks-package))
+$(eval $(cmake-package))
-- 
2.6.1
