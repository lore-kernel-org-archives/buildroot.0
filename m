From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 15:41:52 +0100
Subject: [Buildroot] [git commit] cosmo: new package
Message-ID: <20140301144221.B80D183625@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08f2dd2bf6d6bac5fa1dca0617733180454451fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: indicate that the lpeg dependency is a run-time dependency,
as suggested by Arnout.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       |    1 +
 package/cosmo/Config.in |    8 ++++++++
 package/cosmo/cosmo.mk  |   10 ++++++++++
 3 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 705ff5a..eb39b94 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -370,6 +370,7 @@ if BR2_PACKAGE_HAS_LUA_INTERPRETER && !BR2_PREFER_STATIC_LIB
 menu "Lua libraries/modules"
 source "package/cgilua/Config.in"
 source "package/copas/Config.in"
+source "package/cosmo/Config.in"
 source "package/coxpcall/Config.in"
 source "package/lbase64/Config.in"
 source "package/ljsyscall/Config.in"
diff --git a/package/cosmo/Config.in b/package/cosmo/Config.in
new file mode 100644
index 0000000..cf5e123
--- /dev/null
+++ b/package/cosmo/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_COSMO
+	bool "cosmo"
+	# run-time dependency
+	select BR2_PACKAGE_LPEG
+	help
+	  Cosmo is a "safe templates" engine for Lua.
+
+	  http://mascarenhas.github.io/cosmo/
diff --git a/package/cosmo/cosmo.mk b/package/cosmo/cosmo.mk
new file mode 100644
index 0000000..2592f62
--- /dev/null
+++ b/package/cosmo/cosmo.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# cosmo
+#
+################################################################################
+
+COSMO_VERSION = 13.01.30-1
+COSMO_LICENSE = MIT
+
+$(eval $(luarocks-package))
