From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 1 Jul 2013 11:40:59 +0200
Subject: [Buildroot] [git commit] legacy: print removal date in menuconfig
Message-ID: <20130701094855.040988A369@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67eaf7057d2b4ab90885ee013a29eaa40682f93a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Show the user how old the legacy options are, as a
subtle suggestion for him to update mopre often. ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in.legacy |   27 +++++++++++----------------
 1 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index cd23492..1252d16 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -40,9 +40,8 @@ comment "As long as these options stay selected, the build   "
 comment "will fail.                                          "
 endif
 
-#
-# Legacy options since 2013.08
-#
+###############################################################################
+comment "Legacy options removed in 2013.08"
 
 config BR2_PACKAGE_DOSFSTOOLS_DOSFSCK
 	bool "dosfstools dosfsck renamed to fsck.fat"
@@ -65,9 +64,8 @@ config BR2_PACKAGE_DOSFSTOOLS_MKDOSFS
 	help
 	  mkdosfs was renamed upstream to mkfs.fat for consistency.
 
-#
-# Legacy options since 2013.05
-#
+###############################################################################
+comment "Legacy options removed in 2013.05"
 
 config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8192
 	bool "Realtek 8192 replaced by Realtek 81xx"
@@ -83,9 +81,8 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8712
 	help
 	  Now covers the whole Realtek 87xx familly: 8712/8723.
 
-#
-# Legacy options since 2013.02
-#
+###############################################################################
+comment "Legacy options removed in 2013.02"
 
 config BR2_sa110
 	bool "sa110 ARM target switched to strongarm"
@@ -151,9 +148,9 @@ config BR2_PACKAGE_DIRECTB_TESTS
 	  The option has been renamed
 	  BR2_PACKAGE_DIRECTFB_TESTS.
 
-#
-# Legacy options since 2012.11
-#
+###############################################################################
+comment "Legacy options removed in 2012.11"
+
 config BR2_PACKAGE_CUSTOMIZE
 	bool "customize package has been removed"
 	select BR2_LEGACY
@@ -188,10 +185,8 @@ config BR2_PACKAGE_PTHREAD_STUBS
 	  For consistency reason, the pthread-stubs package has been
 	  renamed to xlib_libpthread-stubs.
 
-
-#
-# Legacy options since 2012.08
-#
+###############################################################################
+comment "Legacy options removed in 2012.08"
 
 config BR2_PACKAGE_GETTEXT_STATIC
 	bool "libgettext.a is now selected by BR2_PREFER_STATIC_LIB"
