From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:56:51 +0100
Subject: [Buildroot] [git commit branch/next] package/kodi-vfs-sftp: bump
 version to 2.0.0-Matrix
Message-ID: <20210306213556.32CE786DA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d94599a175078e4644bf9a516c77a30707d75e2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Upstream removed usage of libplatform
https://github.com/xbmc/vfs.sftp/commit/a4fb0019a6b20c2e9b44ff80dd084002df6052a9

Added remaining dependencies and removed unused kodi-platform:
https://github.com/xbmc/vfs.sftp/blob/Matrix/CMakeLists.txt#L6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-vfs-sftp/Config.in          | 4 ++--
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash | 2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/kodi-vfs-sftp/Config.in b/package/kodi-vfs-sftp/Config.in
index a939bd927d..b742777ff0 100644
--- a/package/kodi-vfs-sftp/Config.in
+++ b/package/kodi-vfs-sftp/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_KODI_VFS_SFTP
 	bool "kodi-vfs-sftp"
-	select BR2_PACKAGE_KODI_PLATFORM
-	select BR2_PACKAGE_LIBPLATFORM
 	select BR2_PACKAGE_LIBSSH
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
 	help
 	  SFTP VFS addon for Kodi
 
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
index a17c2d32c6..d12a85437b 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dc3db18b6cef90cd518b741e5c9bc7b3f4412774ee60bf70b451a8d2fc88a091  kodi-vfs-sftp-1.0.6-Leia.tar.gz
+sha256  b15c5dde7b3aadb3e82e61cb9b0440812b6c2f65b38c6c25aef726f97e746f68  kodi-vfs-sftp-2.0.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
index 3870ff9b5b..b1b0bef36d 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_VFS_SFTP_VERSION = 1.0.6-Leia
+KODI_VFS_SFTP_VERSION = 2.0.0-Matrix
 KODI_VFS_SFTP_SITE = $(call github,xbmc,vfs.sftp,$(KODI_VFS_SFTP_VERSION))
 KODI_VFS_SFTP_LICENSE = GPL-2.0+
 KODI_VFS_SFTP_LICENSE_FILES = LICENSE.md
-KODI_VFS_SFTP_DEPENDENCIES = kodi-platform libplatform libssh
+KODI_VFS_SFTP_DEPENDENCIES = kodi libssh openssl zlib
 
 $(eval $(cmake-package))
