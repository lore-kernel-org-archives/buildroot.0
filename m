From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 22:59:07 +0200
Subject: [Buildroot] [git commit] package/kodi-vfs-rar: new package
Message-ID: <20190921205424.660528F0A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5928937578bacc3a205412db6fce1dc4b97876a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Internal rar support in Kodi was moved to this addon with the Kodi
release 18.0-Leia, see upstream PR 11912.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Arnout: fix license, add license file hashes]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kodi-vfs-rar/Config.in         |  7 +++++++
 package/kodi-vfs-rar/kodi-vfs-rar.hash |  5 +++++
 package/kodi-vfs-rar/kodi-vfs-rar.mk   | 13 +++++++++++++
 package/kodi/Config.in                 |  4 ++++
 4 files changed, 29 insertions(+)

diff --git a/package/kodi-vfs-rar/Config.in b/package/kodi-vfs-rar/Config.in
new file mode 100644
index 0000000000..f855fb6c9f
--- /dev/null
+++ b/package/kodi-vfs-rar/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_VFS_RAR
+	bool "kodi-vfs-rar"
+	select BR2_PACKAGE_LIBPLATFORM
+	help
+	  RAR VFS addon for Kodi
+
+	  https://github.com/xbmc/vfs.rar
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.hash b/package/kodi-vfs-rar/kodi-vfs-rar.hash
new file mode 100644
index 0000000000..f0b539852f
--- /dev/null
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256 09a16bf0be13c7d9ed43c6608f662374cb3b8b35c05492ce1117f58270d8d005  kodi-vfs-rar-60f92ff28ee6c94211b628990696c60518bffcf6.tar.gz
+# License files
+sha256 e0c2f13c3a78c8d2b91cb846b8a13fb650fcc88c0630e38ce9c0b7c34631d1cc  lib/UnrarXLib/license.txt
+sha256 2ddada473db917f5d0ed191d8b571aa04af8926807f61398e602b971eaf5ccb7  src/RarManager.h
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.mk b/package/kodi-vfs-rar/kodi-vfs-rar.mk
new file mode 100644
index 0000000000..b113fa5a0b
--- /dev/null
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-vfs-rar
+#
+################################################################################
+
+KODI_VFS_RAR_VERSION = 60f92ff28ee6c94211b628990696c60518bffcf6
+KODI_VFS_RAR_SITE = $(call github,xbmc,vfs.rar,$(KODI_VFS_RAR_VERSION))
+KODI_VFS_RAR_LICENSE = unrar, GPL-2.0+
+KODI_VFS_RAR_LICENSE_FILES = lib/UnrarXLib/license.txt src/RarManager.h
+KODI_VFS_RAR_DEPENDENCIES = libplatform kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 626038e8c8..f62c2f4c9d 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -354,6 +354,10 @@ menu "Skins"
 	source "package/kodi-skin-confluence/Config.in"
 endmenu
 
+menu "Virtual file systems"
+	source "package/kodi-vfs-rar/Config.in"
+endmenu
+
 menu "Visualisations"
 	source "package/kodi-visualisation-fishbmc/Config.in"
 	source "package/kodi-visualisation-goom/Config.in"
