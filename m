From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jul 2011 15:35:55 +0200
Subject: [Buildroot] [git commit] e2fsprogs: add options for
	debugfs/e2image/resize2fs utilities
Message-ID: <20110728133942.F252A8B532@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5d7cac5eb28742cc6156aa902349918879add8a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/Config.in    |    9 +++++++++
 package/e2fsprogs/e2fsprogs.mk |    6 +++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 3060719..2410fef 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -26,6 +26,9 @@ config BR2_PACKAGE_E2FSPROGS_CHATTR
 	bool "chattr"
 	default y
 
+config BR2_PACKAGE_E2FSPROGS_DEBUGFS
+	bool "debugfs"
+
 config BR2_PACKAGE_E2FSPROGS_DUMPE2FS
 	bool "dumpe2fs"
 	default y
@@ -40,6 +43,9 @@ config BR2_PACKAGE_E2FSPROGS_E2FSCK
 	default y
 	select BR2_PACKAGE_E2FSPROGS_LIBBLKID
 
+config BR2_PACKAGE_E2FSPROGS_E2IMAGE
+	bool "e2image"
+
 config BR2_PACKAGE_E2FSPROGS_E2LABEL
 	bool "e2label"
 	default y
@@ -81,6 +87,9 @@ config BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND
 	default y
 	depends on BR2_PACKAGE_E2FSPROGS
 
+config BR2_PACKAGE_E2FSPROGS_RESIZE2FS
+	bool "resize2fs"
+
 config BR2_PACKAGE_E2FSPROGS_TUNE2FS
 	bool "tune2fs"
 	default y
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 8a7edb4..6381d05 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -11,9 +11,9 @@ E2FSPROGS_INSTALL_STAGING = YES
 E2FSPROGS_CONF_OPT = \
 	--disable-tls \
 	--enable-elf-shlibs \
-	--disable-debugfs \
-	--disable-imager \
-	--disable-resizer \
+	$(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),,--disable-debugfs) \
+	$(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),,--disable-imager) \
+	$(if $(BR2_PACKAGE_E2FSPROGS_RESIZE2FS),,--disable-resizer) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_UUIDD),,--disable-uuidd) \
 	--enable-fsck \
 	--disable-e2initrd-helper \
-- 
1.7.3.4
