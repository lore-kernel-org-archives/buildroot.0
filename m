From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Sep 2019 21:28:05 +0200
Subject: [Buildroot] [PATCH v6 04/25] package/kodi-vfs-sftp: new package
In-Reply-To: <20190921192826.10143-1-bernd.kuhls@t-online.de>
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
Message-ID: <20190921192826.10143-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Internal sftp support was removed in Kodi 18.0, see upstream PR 12005.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-vfs-sftp/Config.in          |  9 +++++++++
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash |  2 ++
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk   | 13 +++++++++++++
 package/kodi/Config.in                   |  1 +
 4 files changed, 25 insertions(+)
 create mode 100644 package/kodi-vfs-sftp/Config.in
 create mode 100644 package/kodi-vfs-sftp/kodi-vfs-sftp.hash
 create mode 100644 package/kodi-vfs-sftp/kodi-vfs-sftp.mk

diff --git a/package/kodi-vfs-sftp/Config.in b/package/kodi-vfs-sftp/Config.in
new file mode 100644
index 0000000000..a939bd927d
--- /dev/null
+++ b/package/kodi-vfs-sftp/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_KODI_VFS_SFTP
+	bool "kodi-vfs-sftp"
+	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBPLATFORM
+	select BR2_PACKAGE_LIBSSH
+	help
+	  SFTP VFS addon for Kodi
+
+	  https://github.com/xbmc/vfs.sftp
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
new file mode 100644
index 0000000000..0b161ab1c2
--- /dev/null
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 6cfc59f322d1bce2dfc14daad0ae84fbc105f7543216413b9c208af821d92308  kodi-vfs-sftp-4e385ae0f82c062add44bce4a2d6a9058a3e0f48.tar.gz
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
new file mode 100644
index 0000000000..571aac68ba
--- /dev/null
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-vfs-sftp
+#
+################################################################################
+
+KODI_VFS_SFTP_VERSION = 4e385ae0f82c062add44bce4a2d6a9058a3e0f48
+KODI_VFS_SFTP_SITE = $(call github,xbmc,vfs.sftp,$(KODI_VFS_SFTP_VERSION))
+KODI_VFS_SFTP_LICENSE = GPL-2.0
+KODI_VFS_SFTP_LICENSE_FILES = src/SFTPFile.cpp
+KODI_VFS_SFTP_DEPENDENCIES = kodi-platform libplatform libssh
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f62c2f4c9d..5d781dde8d 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -356,6 +356,7 @@ endmenu
 
 menu "Virtual file systems"
 	source "package/kodi-vfs-rar/Config.in"
+	source "package/kodi-vfs-sftp/Config.in"
 endmenu
 
 menu "Visualisations"
-- 
2.20.1
