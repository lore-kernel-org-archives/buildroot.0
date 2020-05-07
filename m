From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  7 May 2020 19:12:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/suricata: fix build with lua
Message-ID: <20200507171242.141886-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/11bc7f4e1c54f074dd10a995233bee45c293e488

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...re.ac-fix-cross-compilation-with-lua.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/suricata/0002-configure.ac-fix-cross-compilation-with-lua.patch

diff --git a/package/suricata/0002-configure.ac-fix-cross-compilation-with-lua.patch b/package/suricata/0002-configure.ac-fix-cross-compilation-with-lua.patch
new file mode 100644
index 0000000000..5c13ac7bec
--- /dev/null
+++ b/package/suricata/0002-configure.ac-fix-cross-compilation-with-lua.patch
@@ -0,0 +1,33 @@
+From 8db38c21b525327305778fcaa232b2a797ffcb82 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 7 May 2020 19:05:23 +0200
+Subject: [PATCH] configure.ac: fix cross-compilation with lua
+
+lua integer size is detected through AC_RUN_IFELSE since
+https://github.com/OISF/suricata/commit/2abcd5d27f29ca37ae31108cc0ea0143fa25d0a1
+
+This breaks cross-compilation and is needed only for rust so disable it
+if rust is not wanted
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not submitted yet]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 127848234..f5f33d42d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2225,7 +2225,7 @@ return 0;
+     AM_CONDITIONAL([HAVE_LUA], [test "x$enable_lua" != "xno"])
+ 
+     # If Lua is enabled, test the integer size.
+-    if test "x$enable_lua" = "xyes"; then
++    if test "x$enable_lua" = "xyes" && test "x$enable_rust" = "xyes"; then
+         TMPLIBS="$LIBS"
+         LIBS=""
+ 
+-- 
+2.26.2
+
-- 
2.26.2
