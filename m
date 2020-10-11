From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Oct 2020 19:08:52 +0200
Subject: [Buildroot] [git commit] package/lua: bump to version 5.4.1
Message-ID: <20201011165957.E5FC888734@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c56b7639953c04765955c785ede706393d1f0845
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/5.4.0/lua.hash                                  | 6 ------
 package/lua/{5.4.0 => 5.4.1}/0001-root-path.patch           | 0
 package/lua/{5.4.0 => 5.4.1}/0002-shared-libs-for-lua.patch | 0
 package/lua/{5.4.0 => 5.4.1}/0011-linenoise.patch           | 0
 package/lua/5.4.1/lua.hash                                  | 6 ++++++
 package/lua/lua.mk                                          | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/lua/5.4.0/lua.hash b/package/lua/5.4.0/lua.hash
deleted file mode 100644
index ac8639c4ed..0000000000
--- a/package/lua/5.4.0/lua.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# Hashes from: http://www.lua.org/ftp/
-md5  dbf155764e5d433fc55ae80ea7060b60  lua-5.4.0.tar.gz
-sha1  8cdbffa8a214a23d190d7c45f38c19518ae62e89  lua-5.4.0.tar.gz
-
-# Locally computed
-sha256  1a579d0a1b8c5d19acd034c97c03bacc928fc23a0d7fde88488c2d0e3241094a  doc/readme.html
diff --git a/package/lua/5.4.0/0001-root-path.patch b/package/lua/5.4.1/0001-root-path.patch
similarity index 100%
rename from package/lua/5.4.0/0001-root-path.patch
rename to package/lua/5.4.1/0001-root-path.patch
diff --git a/package/lua/5.4.0/0002-shared-libs-for-lua.patch b/package/lua/5.4.1/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.4.0/0002-shared-libs-for-lua.patch
rename to package/lua/5.4.1/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.4.0/0011-linenoise.patch b/package/lua/5.4.1/0011-linenoise.patch
similarity index 100%
rename from package/lua/5.4.0/0011-linenoise.patch
rename to package/lua/5.4.1/0011-linenoise.patch
diff --git a/package/lua/5.4.1/lua.hash b/package/lua/5.4.1/lua.hash
new file mode 100644
index 0000000000..82347ef99e
--- /dev/null
+++ b/package/lua/5.4.1/lua.hash
@@ -0,0 +1,6 @@
+# Hashes from: http://www.lua.org/ftp/
+md5  1d575faef1c907292edd79e7a2784d30  lua-5.4.1.tar.gz
+sha1  88961e7d4fda58ca2c6163938fd48db8880e803d  lua-5.4.1.tar.gz
+
+# Locally computed
+sha256  c202c5ff3b0c7a0ff2b215fff534c4b4018554843d23ac6eca3d97533b3ad97f  doc/readme.html
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 9ff738656d..287c3b2adc 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_4),y)
-LUA_VERSION = 5.4.0
+LUA_VERSION = 5.4.1
 else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_VERSION = 5.3.6
 else
