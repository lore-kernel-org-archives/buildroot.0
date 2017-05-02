From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 22:35:51 +0200
Subject: [Buildroot] [git commit] libcsv: new package
Message-ID: <20170502203847.B9E57827F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf9a5c729f40762ae8126143ddfd8604d438e658
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcsv is a small, simple and fast CSV library written in pure
ANSI C89 that can read and write CSV data.

Signed-off-by: David Graziano <david.graziano@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                 |  4 ++++
 package/Config.in          |  1 +
 package/libcsv/Config.in   | 10 ++++++++++
 package/libcsv/libcsv.hash |  2 ++
 package/libcsv/libcsv.mk   | 13 +++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8db6dc8..019e100 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -413,6 +413,9 @@ F:	package/openldap/
 N:	David du Colombier <0intro@gmail.com>
 F:	package/x264/
 
+N:	David Graziano <david.graziano@rockwellcollins.com>
+F:	package/libcsv/
+
 N:	David Lechner <david@lechnology.com>
 F:	board/lego/ev3/
 F:	configs/lego_ev3_defconfig
@@ -1067,6 +1070,7 @@ F:	package/fmc/
 F:	package/fmlib/
 F:	package/igmpproxy/
 F:	package/iputils/
+F:	package/libcsv/
 F:	package/omniorb/
 F:	package/python-ipy/
 F:	package/python-posix-ipc/
diff --git a/package/Config.in b/package/Config.in
index bfcfb73..e3b6682 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1367,6 +1367,7 @@ menu "Other"
 	source "package/libcofi/Config.in"
 	source "package/libcroco/Config.in"
 	source "package/libcrossguid/Config.in"
+	source "package/libcsv/Config.in"
 	source "package/libdaemon/Config.in"
 	source "package/libee/Config.in"
 	source "package/libev/Config.in"
diff --git a/package/libcsv/Config.in b/package/libcsv/Config.in
new file mode 100644
index 0000000..797c735
--- /dev/null
+++ b/package/libcsv/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBCSV
+	bool "libcsv"
+	help
+	  libcsv is a small, simple and fast CSV library written in
+	  pure ANSI C89 that can read and write CSV data. It provides
+	  a straight-forward interface using callback functions to
+	  handle parsed fields and rows and can parse improperly
+	  formatted CSV files.
+
+	  https://sourceforge.net/projects/libcsv/
diff --git a/package/libcsv/libcsv.hash b/package/libcsv/libcsv.hash
new file mode 100644
index 0000000..e35c44f
--- /dev/null
+++ b/package/libcsv/libcsv.hash
@@ -0,0 +1,2 @@
+#locally computed
+sha256 d9c0431cb803ceb9896ce74f683e6e5a0954e96ae1d9e4028d6e0f967bebd7e4  libcsv-3.0.3.tar.gz
diff --git a/package/libcsv/libcsv.mk b/package/libcsv/libcsv.mk
new file mode 100644
index 0000000..d0ce643
--- /dev/null
+++ b/package/libcsv/libcsv.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libcsv
+#
+################################################################################
+
+LIBCSV_VERSION = 3.0.3
+LIBCSV_SITE = http://sourceforge.net/projects/libcsv/files
+LIBCSV_LICENSE = LGPL-2.1+
+LIBCSV_LICENSE_FILES = COPYING.LESSER
+LIBCSV_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
