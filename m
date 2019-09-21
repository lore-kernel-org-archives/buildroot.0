From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 22:59:07 +0200
Subject: [Buildroot] [git commit] package/kodi-vfs-sftp: new package
Message-ID: <20190921205424.6F1FD8F0A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17beb0716618684ed630102b42d005a5103df4c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Internal sftp support was removed in Kodi 18.0, see upstream PR 12005.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Arnout: add license file hash]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kodi-vfs-sftp/Config.in          |  9 +++++++++
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash |  3 +++
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk   | 13 +++++++++++++
 package/kodi/Config.in                   |  1 +
 4 files changed, 26 insertions(+)

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
index 0000000000..f90bc6d105
--- /dev/null
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 6cfc59f322d1bce2dfc14daad0ae84fbc105f7543216413b9c208af821d92308  kodi-vfs-sftp-4e385ae0f82c062add44bce4a2d6a9058a3e0f48.tar.gz
+sha256 2b1cdc44ec0b52abc2e4b61f827d407388dad49e4fdc25370824b5c21aadeb17  src/SFTPFile.cpp
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
new file mode 100644
index 0000000000..a5ba1acf18
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
+KODI_VFS_SFTP_LICENSE = GPL-2.0+
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
