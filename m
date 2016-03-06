From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 23:18:51 +0100
Subject: [Buildroot] [git commit] package/lzlib: bump to version 0.4.3
Message-ID: <20160306221912.864438032C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0682970b3d69c65291ee872db20ca4264720ed48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to more recent github repository.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
[Thomas: add hash file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lzlib/Config.in  | 2 +-
 package/lzlib/lzlib.hash | 2 +-
 package/lzlib/lzlib.mk   | 8 +++++---
 3 files changed, 7 insertions(+), 5 deletions(-)

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
index d823e8b..f983862 100644
--- a/package/lzlib/lzlib.hash
+++ b/package/lzlib/lzlib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	c10055bde2c0a0ed14f22c1ee0701910b0b9885245baf7911201ab4dfd3b828c  lzlib-0.4.work3-1.src.rock
+sha256 cbb0cac5825e940b4ea2f31a336d2aaf6db39847d456920afd8e443804420dbb lzlib-0.4.3.tar.gz
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
