From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2020 10:17:33 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/lua: bump to
 version 5.3.6
Message-ID: <20201002082507.16F9E81429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1bb6247d539d1f1cc7bc167bf7f2d678fc5c76f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Bugfix release.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 86a6eb872c2f97310e6389905620312cd6675b5b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/5.3.5/0003-fix-revision-number.patch   | 31 ----------------------
 package/lua/{5.3.5 => 5.3.6}/0001-root-path.patch  |  0
 .../0002-shared-libs-for-lua.patch                 |  0
 .../0003-linenoise.patch}                          |  0
 package/lua/lua.hash                               |  5 ++--
 package/lua/lua.mk                                 |  2 +-
 6 files changed, 4 insertions(+), 34 deletions(-)

diff --git a/package/lua/5.3.5/0003-fix-revision-number.patch b/package/lua/5.3.5/0003-fix-revision-number.patch
deleted file mode 100644
index ed2e0460eb..0000000000
--- a/package/lua/5.3.5/0003-fix-revision-number.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Fix revision number
-
-In 0002-shared-libs-for-lua.patch, revision number is used to set 
-library name:
-TO_SOLIB = liblua.so.$(R)
-
-However, library is built using PKG_VERSION which is passed only during
-build step:
-$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $?
-
-As a result, dynamic library is not installed in staging or target paths
-since bump to lua 5.3.5
-
-So, instead of replacing R by PKG_VERSION and passing this variable in
-all steps, simply update R to 5
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -47,6 +47,6 @@
-
- # Lua version and release.
- V= 5.3
--R= $V.4
-+R= $V.5
-
- # Targets start here.
- all:    $(PLAT)
diff --git a/package/lua/5.3.5/0001-root-path.patch b/package/lua/5.3.6/0001-root-path.patch
similarity index 100%
rename from package/lua/5.3.5/0001-root-path.patch
rename to package/lua/5.3.6/0001-root-path.patch
diff --git a/package/lua/5.3.5/0002-shared-libs-for-lua.patch b/package/lua/5.3.6/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.3.5/0002-shared-libs-for-lua.patch
rename to package/lua/5.3.6/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.3.5/0011-linenoise.patch b/package/lua/5.3.6/0003-linenoise.patch
similarity index 100%
rename from package/lua/5.3.5/0011-linenoise.patch
rename to package/lua/5.3.6/0003-linenoise.patch
diff --git a/package/lua/lua.hash b/package/lua/lua.hash
index 3e7812b7dc..319d305692 100644
--- a/package/lua/lua.hash
+++ b/package/lua/lua.hash
@@ -1,8 +1,9 @@
 # Hashes from: http://www.lua.org/ftp/
-md5 4f4b4f323fd3514a68e0ab3da8ce3455           lua-5.3.5.tar.gz
-sha1 112eb10ff04d1b4c9898e121d6bdf54a81482447  lua-5.3.5.tar.gz
+md5 83f23dbd5230140a3770d5f54076948d           lua-5.3.6.tar.gz
+sha1 f27d20d6c81292149bc4308525a9d6733c224fa5  lua-5.3.6.tar.gz
 
 md5 2e115fe26e435e33b0d5c022e4490567           lua-5.1.5.tar.gz
 sha1 b3882111ad02ecc6b972f8c1241647905cb2e3fc  lua-5.1.5.tar.gz
+
 # Locally computed
 sha256  ee5e3e82af1e1b543c4f216e399d7c8cfee797711913f349e385101c4ae60a79  COPYRIGHT
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index ce75af6b02..ce57fd591a 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
-LUA_VERSION = 5.3.5
+LUA_VERSION = 5.3.6
 else
 LUA_VERSION = 5.1.5
 endif
