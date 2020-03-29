From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Mar 2020 14:22:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-vfs-rar: bump version to
 2.2.3-Leia
Message-ID: <20200329122259.442023-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated hash of lib/UnrarXLib/license.txt due to upstream changes:
https://github.com/xbmc/vfs.rar/commits/Leia/lib/UnrarXLib/license.txt

Changed addon license file to LICENSE.md.

Updated dependencies due to upstream commit:
https://github.com/xbmc/vfs.rar/commit/6c7a62439eac2b2afeb2bf8c241836cd2ab2b93e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-vfs-rar/Config.in         | 2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.hash | 6 +++---
 package/kodi-vfs-rar/kodi-vfs-rar.mk   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/kodi-vfs-rar/Config.in b/package/kodi-vfs-rar/Config.in
index f855fb6c9f..2d8b680572 100644
--- a/package/kodi-vfs-rar/Config.in
+++ b/package/kodi-vfs-rar/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_VFS_RAR
 	bool "kodi-vfs-rar"
-	select BR2_PACKAGE_LIBPLATFORM
+	select BR2_PACKAGE_TINYXML
 	help
 	  RAR VFS addon for Kodi
 
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.hash b/package/kodi-vfs-rar/kodi-vfs-rar.hash
index 7c9053810a..80d04ebaca 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.hash
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 09a16bf0be13c7d9ed43c6608f662374cb3b8b35c05492ce1117f58270d8d005  kodi-vfs-rar-60f92ff28ee6c94211b628990696c60518bffcf6.tar.gz
+sha256 17105acd5d2d83747a402b0782e4d7fe0f3e3f3a208ea9614af56c10186a757d  kodi-vfs-rar-2.2.3-Leia.tar.gz
 # License files
-sha256 e0c2f13c3a78c8d2b91cb846b8a13fb650fcc88c0630e38ce9c0b7c34631d1cc  lib/UnrarXLib/license.txt
-sha256 649854722a936822ab52e0801c7d7274c9a1933c9f9566a83003c96ca2c9c657  debian/copyright
+sha256 6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  lib/UnrarXLib/license.txt
+sha256 310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.mk b/package/kodi-vfs-rar/kodi-vfs-rar.mk
index f7dcbbd111..be766080ed 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.mk
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_VFS_RAR_VERSION = 60f92ff28ee6c94211b628990696c60518bffcf6
+KODI_VFS_RAR_VERSION = 2.2.3-Leia
 KODI_VFS_RAR_SITE = $(call github,xbmc,vfs.rar,$(KODI_VFS_RAR_VERSION))
 KODI_VFS_RAR_LICENSE = unrar, GPL-2.0+
-KODI_VFS_RAR_LICENSE_FILES = lib/UnrarXLib/license.txt debian/copyright
-KODI_VFS_RAR_DEPENDENCIES = libplatform kodi
+KODI_VFS_RAR_LICENSE_FILES = lib/UnrarXLib/license.txt LICENSE.md
+KODI_VFS_RAR_DEPENDENCIES = kodi tinyxml
 
 $(eval $(cmake-package))
-- 
2.25.0
