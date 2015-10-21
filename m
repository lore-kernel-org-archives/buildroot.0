From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 22:03:25 +0200
Subject: [Buildroot] [git commit] minicom: wrap text to 72 characters
Message-ID: <20151021200922.16F497FAB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0b7b53a29b976a03cf2b55983d087f8a921d3c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And also add a trailing slash to the URL.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/minicom/Config.in  |    8 ++++----
 package/minicom/minicom.mk |    6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/minicom/Config.in b/package/minicom/Config.in
index 07dbeba..c41c188 100644
--- a/package/minicom/Config.in
+++ b/package/minicom/Config.in
@@ -5,11 +5,11 @@ config BR2_PACKAGE_MINICOM
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_NCURSES
 	help
-	  Minicom is a menu driven communications program.
-	  It emulates ANSI and VT102 terminals. It has a
-	  dialing directory and auto zmodem download.
+	  Minicom is a menu driven communications program. It emulates
+	  ANSI and VT102 terminals. It has a dialing directory and auto
+	  zmodem download.
 
-	  http://alioth.debian.org/projects/minicom
+	  http://alioth.debian.org/projects/minicom/
 
 comment "minicom needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 26e9cef..94a4628 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -10,9 +10,9 @@ MINICOM_LICENSE = GPLv2+
 MINICOM_LICENSE_FILES = COPYING
 
 # pkg-config is only used to check for liblockdev, which we don't have
-# in BR, so instead of adding host-pkgconf as a dependency, simply
-# make sure the host version isn't used so we don't end up with problems
-# if people have liblockdev1-dev installed
+# in BR, so instead of adding host-pkgconf as a dependency, simply make
+# sure the host version isn't used so we don't end up with problems if
+# people have liblockdev1-dev installed
 MINICOM_CONF_ENV = PKG_CONFIG=/bin/false
 
 MINICOM_DEPENDENCIES = ncurses $(if $(BR2_ENABLE_LOCALE),,libiconv)
