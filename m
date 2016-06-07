From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 21:31:30 +0200
Subject: [Buildroot] [git commit] lua: bump to version 5.3.3
Message-ID: <20160607193136.06E43817A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f50e2b9fba33db11dca9d016907a62cfa9b2c2a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua/{5.3.2 => 5.3.3}/0001-root-path.patch           | 0
 package/lua/{5.3.2 => 5.3.3}/0002-shared-libs-for-lua.patch | 0
 package/lua/{5.3.2 => 5.3.3}/0004-lua-pc.patch              | 4 ++--
 package/lua/{5.3.2 => 5.3.3}/0011-linenoise.patch           | 0
 package/lua/lua.hash                                        | 4 ++--
 package/lua/lua.mk                                          | 2 +-
 6 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lua/5.3.2/0001-root-path.patch b/package/lua/5.3.3/0001-root-path.patch
similarity index 100%
rename from package/lua/5.3.2/0001-root-path.patch
rename to package/lua/5.3.3/0001-root-path.patch
diff --git a/package/lua/5.3.2/0002-shared-libs-for-lua.patch b/package/lua/5.3.3/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.3.2/0002-shared-libs-for-lua.patch
rename to package/lua/5.3.3/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.3.2/0004-lua-pc.patch b/package/lua/5.3.3/0004-lua-pc.patch
similarity index 97%
rename from package/lua/5.3.2/0004-lua-pc.patch
rename to package/lua/5.3.3/0004-lua-pc.patch
index 811d931..edf7ec3 100644
--- a/package/lua/5.3.2/0004-lua-pc.patch
+++ b/package/lua/5.3.3/0004-lua-pc.patch
@@ -14,7 +14,7 @@ Index: b/etc/lua.pc
 +# grep '^V=' ../Makefile
 +V= 5.3
 +# grep '^R=' ../Makefile
-+R= 5.3.2
++R= 5.3.3
 +
 +# grep '^INSTALL_.*=' ../Makefile | sed 's/INSTALL_TOP/prefix/'
 +prefix= /usr
@@ -33,7 +33,7 @@ Index: b/etc/lua.pc
 +Name: Lua
 +Description: An Extensible Extension Language
 +Version: ${R}
-+Requires: 
++Requires:
 +Libs: -L${libdir} -llua -lm
 +Cflags: -I${includedir}
 +
diff --git a/package/lua/5.3.2/0011-linenoise.patch b/package/lua/5.3.3/0011-linenoise.patch
similarity index 100%
rename from package/lua/5.3.2/0011-linenoise.patch
rename to package/lua/5.3.3/0011-linenoise.patch
diff --git a/package/lua/lua.hash b/package/lua/lua.hash
index 8f0242e..04459e9 100644
--- a/package/lua/lua.hash
+++ b/package/lua/lua.hash
@@ -1,6 +1,6 @@
 # Hashes from: http://www.lua.org/ftp/
-md5 33278c2ab5ee3c1a875be8d55c1ca2a1           lua-5.3.2.tar.gz
-sha1 7a47adef554fdca7d0c5536148de34579134a973  lua-5.3.2.tar.gz
+md5 703f75caa4fdf4a911c1a72e67a27498           lua-5.3.3.tar.gz
+sha1 a0341bc3d1415b814cc738b2ec01ae56045d64ef  lua-5.3.3.tar.gz
 
 md5 913fdb32207046b273fdb17aad70be13           lua-5.2.4.tar.gz
 sha1 ef15259421197e3d85b7d6e4871b8c26fd82c1cf  lua-5.2.4.tar.gz
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 37992f2..b2dab39 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
-LUA_VERSION = 5.3.2
+LUA_VERSION = 5.3.3
 else
 ifeq ($(BR2_PACKAGE_LUA_5_2),y)
 LUA_VERSION = 5.2.4
