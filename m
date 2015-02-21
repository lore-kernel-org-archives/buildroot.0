From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 14:07:00 +0100
Subject: [Buildroot] [git commit] dialog: bump to version 1.2-20150125
Message-ID: <20150302222721.5F35B807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=631b09645a61641531949e4772bebf20ea1154ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And drop thread requirement, it's really not necessary.
For python-dialog that was already inherent in python itself.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dialog/Config.in        |    5 -----
 package/dialog/dialog.hash      |    2 +-
 package/dialog/dialog.mk        |    2 +-
 package/python-dialog/Config.in |    5 -----
 4 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/package/dialog/Config.in b/package/dialog/Config.in
index 929ab46..fc0e8fd 100644
--- a/package/dialog/Config.in
+++ b/package/dialog/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_DIALOG
 	bool "dialog"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # fork()
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -12,7 +11,3 @@ config BR2_PACKAGE_DIALOG
 	  of a script to interact with the user in a much friendlier manner.
 
 	  http://invisible-island.net/dialog/dialog.html
-
-comment "dialog needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU
diff --git a/package/dialog/dialog.hash b/package/dialog/dialog.hash
index 1ffbafb..75a7918 100644
--- a/package/dialog/dialog.hash
+++ b/package/dialog/dialog.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	d054766fba3dac828851f1c9852e5992eb824fd0a0dd26d87ee517242027bafc	dialog-1.2-20140911.tgz
+sha256	1d98ec7cc81f11f9019fa0b90f1afdaa86579cae1ce8869a6fd61deb9d4b887a	dialog-1.2-20150125.tgz
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 0ecbddb..f207f75 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIALOG_VERSION = 1.2-20140911
+DIALOG_VERSION = 1.2-20150125
 DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE = ftp://invisible-island.net/dialog
 DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
diff --git a/package/python-dialog/Config.in b/package/python-dialog/Config.in
index 8dd3fdf..c1fdb23 100644
--- a/package/python-dialog/Config.in
+++ b/package/python-dialog/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_DIALOG
 	bool "python-dialog"
 	depends on BR2_PACKAGE_PYTHON
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dialog
 	depends on BR2_USE_MMU # dialog
 	select BR2_PACKAGE_DIALOG
 	help
@@ -9,7 +8,3 @@ config BR2_PACKAGE_PYTHON_DIALOG
 	  mostly-compatible programs.
 
 	  http://pythondialog.sourceforge.net/
-
-comment "python-dialog needs a toolchain w/ threads"
-	depends on BR2_USE_MMU && BR2_PACKAGE_PYTHON
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
