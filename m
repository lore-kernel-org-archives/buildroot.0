From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Feb 2018 17:05:35 +0100
Subject: [Buildroot] [git commit branch/next] udftools: new package
Message-ID: <20180206160742.499EC884FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa33514beee68b919682f447bd07e89815083868
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Steve Kenton <skenton@ou.edu>
[Thomas: add hash for the license file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/udftools/Config.in     | 12 ++++++++++++
 package/udftools/udftools.hash |  3 +++
 package/udftools/udftools.mk   | 12 ++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 665fb653c7..d0605af387 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1693,6 +1693,7 @@ F:	package/dvdrw-tools/
 F:	package/memtest86/
 F:	package/mjpegtools/
 F:	package/tovid/
+F:	package/udftools/
 F:	package/xorriso/
 
 N:	Steve Thomas <scjthm@live.com>
diff --git a/package/Config.in b/package/Config.in
index 9cd5d9c087..5929cfea2d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -196,6 +196,7 @@ menu "Filesystem and flash utilities"
 	source "package/squashfs/Config.in"
 	source "package/sshfs/Config.in"
 	source "package/sunxi-tools/Config.in"
+	source "package/udftools/Config.in"
 	source "package/unionfs/Config.in"
 	source "package/xfsprogs/Config.in"
 endmenu
diff --git a/package/udftools/Config.in b/package/udftools/Config.in
new file mode 100644
index 0000000000..bbccd60186
--- /dev/null
+++ b/package/udftools/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_UDFTOOLS
+	bool "udftools"
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_READLINE
+	help
+	  Tools for creating UDF filesystems
+	  Maintained fork of the 2004 Sourcforge package
+
+	  https://github.com/pali/udftools
+
+comment "udftools needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/udftools/udftools.hash b/package/udftools/udftools.hash
new file mode 100644
index 0000000000..837a515726
--- /dev/null
+++ b/package/udftools/udftools.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256	67fe428d452901215cfad8049d250540c97114b1a20dd63277b91c2c4fae8292	udftools-2.0.tar.gz
+sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa	COPYING
diff --git a/package/udftools/udftools.mk b/package/udftools/udftools.mk
new file mode 100644
index 0000000000..708fef9ab7
--- /dev/null
+++ b/package/udftools/udftools.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# udftools
+#
+################################################################################
+
+UDFTOOLS_VERSION = 2.0
+UDFTOOLS_SITE = https://github.com/pali/udftools/releases/download/$(UDFTOOLS_VERSION)
+UDFTOOLS_LICENSE = GPL-2.0+
+UDFTOOLS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
