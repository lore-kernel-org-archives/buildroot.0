From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2021 09:59:03 +0100
Subject: [Buildroot] [PATCH/next 44/54] package/kodi-vfs-libarchive: new
 package
In-Reply-To: <20210220085913.888324-1-bernd.kuhls@t-online.de>
References: <20210220085913.888324-1-bernd.kuhls@t-online.de>
Message-ID: <20210220085913.888324-45-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-vfs-libarchive/Config.in         | 13 ++++++++++++
 .../kodi-vfs-libarchive.hash                  |  3 +++
 .../kodi-vfs-libarchive.mk                    | 21 +++++++++++++++++++
 package/kodi/Config.in                        |  1 +
 4 files changed, 38 insertions(+)
 create mode 100644 package/kodi-vfs-libarchive/Config.in
 create mode 100644 package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
 create mode 100644 package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk

diff --git a/package/kodi-vfs-libarchive/Config.in b/package/kodi-vfs-libarchive/Config.in
new file mode 100644
index 0000000000..6720e5206e
--- /dev/null
+++ b/package/kodi-vfs-libarchive/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_KODI_VFS_LIBARCHIVE
+	bool "kodi-vfs-libarchive"
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_LIBARCHIVE
+	select BR2_PACKAGE_LZ4
+	select BR2_PACKAGE_LZO
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_XZ
+	select BR2_PACKAGE_ZLIB
+	help
+	  Libarchive VFS add-on for Kodi
+
+	  https://github.com/xbmc/vfs.libarchive
diff --git a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
new file mode 100644
index 0000000000..59b3bc1078
--- /dev/null
+++ b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  6fd70f0e2775e9c4eef2e8b529396f1e739fe3e43e0d4202d7f08ab4a30fa760  kodi-vfs-libarchive-2.0.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
new file mode 100644
index 0000000000..5278f50136
--- /dev/null
+++ b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# kodi-vfs-libarchive
+#
+################################################################################
+
+KODI_VFS_LIBARCHIVE_VERSION = 2.0.0-Matrix
+KODI_VFS_LIBARCHIVE_SITE = $(call github,xbmc,vfs.libarchive,$(KODI_VFS_LIBARCHIVE_VERSION))
+KODI_VFS_LIBARCHIVE_LICENSE = GPL-2.0+
+KODI_VFS_LIBARCHIVE_LICENSE_FILES = LICENSE.md
+KODI_VFS_LIBARCHIVE_DEPENDENCIES = \
+	bzip2 \
+	kodi \
+	libarchive \
+	lz4 \
+	lzo \
+	openssl \
+	xz \
+	zlib
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index eefdd54990..a104ba53c3 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -347,6 +347,7 @@ menu "Skins"
 endmenu
 
 menu "Virtual file systems"
+	source "package/kodi-vfs-libarchive/Config.in"
 	source "package/kodi-vfs-rar/Config.in"
 	source "package/kodi-vfs-sftp/Config.in"
 endmenu
-- 
2.29.2
