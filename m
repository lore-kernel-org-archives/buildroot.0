From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  8 Mar 2015 11:56:16 +0100
Subject: [Buildroot] [PATCH] lua: bump to version 5.2.4
Message-ID: <1425812176-2184-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/5.2.3/0012-fix-ephemeron-table.patch      | 19 -------------------
 package/lua/{5.2.3 => 5.2.4}/0001-root-path.patch     |  0
 .../{5.2.3 => 5.2.4}/0002-shared-libs-for-lua.patch   |  0
 package/lua/{5.2.3 => 5.2.4}/0004-lua-pc.patch        |  0
 package/lua/{5.2.3 => 5.2.4}/0011-linenoise.patch     |  0
 package/lua/lua.hash                                  |  4 ++--
 package/lua/lua.mk                                    |  2 +-
 7 files changed, 3 insertions(+), 22 deletions(-)
 delete mode 100644 package/lua/5.2.3/0012-fix-ephemeron-table.patch
 rename package/lua/{5.2.3 => 5.2.4}/0001-root-path.patch (100%)
 rename package/lua/{5.2.3 => 5.2.4}/0002-shared-libs-for-lua.patch (100%)
 rename package/lua/{5.2.3 => 5.2.4}/0004-lua-pc.patch (100%)
 rename package/lua/{5.2.3 => 5.2.4}/0011-linenoise.patch (100%)

diff --git a/package/lua/5.2.3/0012-fix-ephemeron-table.patch b/package/lua/5.2.3/0012-fix-ephemeron-table.patch
deleted file mode 100644
index f231016..0000000
--- a/package/lua/5.2.3/0012-fix-ephemeron-table.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Ephemeron table can wrongly collect entry with strong key.
-
-Fetch from: http://www.lua.org/bugs.html#5.2.3-2
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-Index: b/src/lgc.c
-===================================================================
---- a/src/lgc.c
-+++ b/src/lgc.c
-@@ -403,7 +403,7 @@
-       reallymarkobject(g, gcvalue(gval(n)));  /* mark it now */
-     }
-   }
--  if (prop)
-+  if (g->gcstate != GCSatomic || prop)
-     linktable(h, &g->ephemeron);  /* have to propagate again */
-   else if (hasclears)  /* does table have white keys? */
-     linktable(h, &g->allweak);  /* may have to clean white keys */
diff --git a/package/lua/5.2.3/0001-root-path.patch b/package/lua/5.2.4/0001-root-path.patch
similarity index 100%
rename from package/lua/5.2.3/0001-root-path.patch
rename to package/lua/5.2.4/0001-root-path.patch
diff --git a/package/lua/5.2.3/0002-shared-libs-for-lua.patch b/package/lua/5.2.4/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.2.3/0002-shared-libs-for-lua.patch
rename to package/lua/5.2.4/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.2.3/0004-lua-pc.patch b/package/lua/5.2.4/0004-lua-pc.patch
similarity index 100%
rename from package/lua/5.2.3/0004-lua-pc.patch
rename to package/lua/5.2.4/0004-lua-pc.patch
diff --git a/package/lua/5.2.3/0011-linenoise.patch b/package/lua/5.2.4/0011-linenoise.patch
similarity index 100%
rename from package/lua/5.2.3/0011-linenoise.patch
rename to package/lua/5.2.4/0011-linenoise.patch
diff --git a/package/lua/lua.hash b/package/lua/lua.hash
index b6ac026..fe36dcd 100644
--- a/package/lua/lua.hash
+++ b/package/lua/lua.hash
@@ -2,8 +2,8 @@
 md5 a1b0a7e92d0c85bbff7a8d27bf29f8af           lua-5.3.0.tar.gz
 sha1 1c46d1c78c44039939e820126b86a6ae12dadfba  lua-5.3.0.tar.gz
 
-md5 dc7f94ec6ff15c985d2d6ad0f1b35654           lua-5.2.3.tar.gz
-sha1 926b7907bc8d274e063d42804666b40a3f3c124c  lua-5.2.3.tar.gz
+md5 913fdb32207046b273fdb17aad70be13           lua-5.2.4.tar.gz
+sha1 ef15259421197e3d85b7d6e4871b8c26fd82c1cf  lua-5.2.4.tar.gz
 
 md5 2e115fe26e435e33b0d5c022e4490567           lua-5.1.5.tar.gz
 sha1 b3882111ad02ecc6b972f8c1241647905cb2e3fc  lua-5.1.5.tar.gz
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index f008d34..bb5741d 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -8,7 +8,7 @@ ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_VERSION = 5.3.0
 else
 ifeq ($(BR2_PACKAGE_LUA_5_2),y)
-LUA_VERSION = 5.2.3
+LUA_VERSION = 5.2.4
 else
 LUA_VERSION = 5.1.5
 endif
-- 
2.1.0
