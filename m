From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Dec 2020 00:54:16 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/lua: bump to
 version 5.4.2
Message-ID: <20201212233844.C17DA82B83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82fd92abaae6579ddc1886f7602f69bf4c90e210
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 79d7d5840eebe4da6689222f9a002c959a3b5ba1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/5.4.1/lua.hash                                  | 6 ------
 package/lua/{5.4.1 => 5.4.2}/0001-root-path.patch           | 2 +-
 package/lua/{5.4.1 => 5.4.2}/0002-shared-libs-for-lua.patch | 0
 package/lua/{5.4.1 => 5.4.2}/0011-linenoise.patch           | 0
 package/lua/5.4.2/lua.hash                                  | 6 ++++++
 package/lua/lua.mk                                          | 4 ++--
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/lua/5.4.1/lua.hash b/package/lua/5.4.1/lua.hash
deleted file mode 100644
index 82347ef99e..0000000000
--- a/package/lua/5.4.1/lua.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# Hashes from: http://www.lua.org/ftp/
-md5  1d575faef1c907292edd79e7a2784d30  lua-5.4.1.tar.gz
-sha1  88961e7d4fda58ca2c6163938fd48db8880e803d  lua-5.4.1.tar.gz
-
-# Locally computed
-sha256  c202c5ff3b0c7a0ff2b215fff534c4b4018554843d23ac6eca3d97533b3ad97f  doc/readme.html
diff --git a/package/lua/5.4.1/0001-root-path.patch b/package/lua/5.4.2/0001-root-path.patch
similarity index 95%
rename from package/lua/5.4.1/0001-root-path.patch
rename to package/lua/5.4.2/0001-root-path.patch
index 588fecb12d..8e82c1ce59 100644
--- a/package/lua/5.4.1/0001-root-path.patch
+++ b/package/lua/5.4.2/0001-root-path.patch
@@ -6,7 +6,7 @@ Index: b/src/luaconf.h
 ===================================================================
 --- a/src/luaconf.h
 +++ b/src/luaconf.h
-@@ -227,7 +227,7 @@
+@@ -212,7 +212,7 @@
  
  #else			/* }{ */
  
diff --git a/package/lua/5.4.1/0002-shared-libs-for-lua.patch b/package/lua/5.4.2/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.4.1/0002-shared-libs-for-lua.patch
rename to package/lua/5.4.2/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.4.1/0011-linenoise.patch b/package/lua/5.4.2/0011-linenoise.patch
similarity index 100%
rename from package/lua/5.4.1/0011-linenoise.patch
rename to package/lua/5.4.2/0011-linenoise.patch
diff --git a/package/lua/5.4.2/lua.hash b/package/lua/5.4.2/lua.hash
new file mode 100644
index 0000000000..f916c8e4ef
--- /dev/null
+++ b/package/lua/5.4.2/lua.hash
@@ -0,0 +1,6 @@
+# Hashes from: https://www.lua.org/ftp/
+md5  49c92d6a49faba342c35c52e1ac3f81e  lua-5.4.2.tar.gz
+sha1  96d4a21393c94bed286b8dc0568f4bdde8730b22  lua-5.4.2.tar.gz
+
+# Locally computed
+sha256  17bd5781d5dfa8c946fea639984fcbcb499d8bb3056a3c2cb5c15c3da5d1c207  doc/readme.html
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 287c3b2adc..387df61692 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,13 +5,13 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_4),y)
-LUA_VERSION = 5.4.1
+LUA_VERSION = 5.4.2
 else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_VERSION = 5.3.6
 else
 LUA_VERSION = 5.1.5
 endif
-LUA_SITE = http://www.lua.org/ftp
+LUA_SITE = https://www.lua.org/ftp
 LUA_INSTALL_STAGING = YES
 LUA_LICENSE = MIT
 ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
