From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Jun 2019 16:04:59 +0200
Subject: [Buildroot] [PATCH 05/31] package/kodi-vfs-rar: new package
In-Reply-To: <20190630140525.6537-1-bernd.kuhls@t-online.de>
References: <20190630140525.6537-1-bernd.kuhls@t-online.de>
Message-ID: <20190630140525.6537-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Internal rar support in Kodi was moved to this addon with the Kodi
release 18.0-Leia, see upstream PR 11912.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-vfs-rar/Config.in         |  7 +++++++
 package/kodi-vfs-rar/kodi-vfs-rar.hash |  3 +++
 package/kodi-vfs-rar/kodi-vfs-rar.mk   | 13 +++++++++++++
 package/kodi/Config.in                 |  4 ++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/kodi-vfs-rar/Config.in
 create mode 100644 package/kodi-vfs-rar/kodi-vfs-rar.hash
 create mode 100644 package/kodi-vfs-rar/kodi-vfs-rar.mk

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
index 0000000000..13a38c43a7
--- /dev/null
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 7ae074f9966233faa67402bcd07e2a1d11923e8ec3a4d33224d1151a191272e3  kodi-vfs-rar-401b05cf47a105809d6b65963a3ceee53764fb6a.tar.gz
+sha256 e0c2f13c3a78c8d2b91cb846b8a13fb650fcc88c0630e38ce9c0b7c34631d1cc  lib/UnrarXLib/license.txt
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.mk b/package/kodi-vfs-rar/kodi-vfs-rar.mk
new file mode 100644
index 0000000000..401f730fdd
--- /dev/null
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-vfs-rar
+#
+################################################################################
+
+KODI_VFS_RAR_VERSION = 401b05cf47a105809d6b65963a3ceee53764fb6a
+KODI_VFS_RAR_SITE = $(call github,xbmc,vfs.rar,$(KODI_VFS_RAR_VERSION))
+KODI_VFS_RAR_LICENSE = unrar
+KODI_VFS_RAR_LICENSE_FILES = lib/UnrarXLib/license.txt
+KODI_VFS_RAR_DEPENDENCIES = libplatform kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 279b4ead0d..ec163f34ad 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -365,6 +365,10 @@ menu "Skins"
 	source "package/kodi-skin-confluence/Config.in"
 endmenu
 
+menu "Virtual file systems"
+	source "package/kodi-vfs-rar/Config.in"
+endmenu
+
 menu "Visualisations"
 	source "package/kodi-visualisation-fishbmc/Config.in"
 	source "package/kodi-visualisation-goom/Config.in"
-- 
2.20.1
