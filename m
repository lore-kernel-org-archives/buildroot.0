From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Feb 2013 20:18:41 +0100
Subject: [Buildroot] [git commit] f2fs-tools: new package
Message-ID: <20130301101144.E52229AACA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98de049686e67b0866f7024c61eb51bdbd1091f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                |    1 +
 package/f2fs-tools/Config.in     |   12 ++++++++++++
 package/f2fs-tools/f2fs-tools.mk |   17 +++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3df85f4..882d3c0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -191,6 +191,7 @@ source "package/dosfstools/Config.in"
 source "package/e2fsprogs/Config.in"
 source "package/exfat/Config.in"
 source "package/exfat-utils/Config.in"
+source "package/f2fs-tools/Config.in"
 source "package/flashbench/Config.in"
 source "package/genext2fs/Config.in"
 source "package/genromfs/Config.in"
diff --git a/package/f2fs-tools/Config.in b/package/f2fs-tools/Config.in
new file mode 100644
index 0000000..20db928
--- /dev/null
+++ b/package/f2fs-tools/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_F2FS_TOOLS
+	bool "f2fs-tools"
+	select BR2_PACKAGE_UTIL_LINUX
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR # util-linux
+	help
+	  Tools for Flash-Friendly File System (F2FS)
+
+	  http://sourceforge.net/projects/f2fs-tools/
+
+comment "f2fs-tools requires a toolchain with LARGEFILE and WCHAR support"
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
new file mode 100644
index 0000000..f217bf4
--- /dev/null
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# f2fs-tools
+#
+#############################################################
+
+F2FS_TOOLS_VERSION = e3eadd686ed1da1828f32977a36b694bc0090f4e
+F2FS_TOOLS_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
+F2FS_TOOLS_SITE_METHOD = git
+F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
+F2FS_TOOLS_DEPENDENCIES = host-pkgconf util-linux
+# GIT version, shipped without configure
+F2FS_TOOLS_AUTORECONF = YES
+F2FS_LICENSE = GPLv2
+F2FS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
