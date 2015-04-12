From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 18:58:58 +0200
Subject: [Buildroot] [git commit] Revert "libsigrok: mark libsigrokcxx as
	broken"
Message-ID: <20150412165905.0E74E807C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9a6cc1dd23692d5d959bcc5c9270480074b8792
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 41e81b7ae149319950814efe3c39acb1200167d2.

Doxygen dependency issue for libsigrokcxx has been fixed.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsigrok/Config.in |    3 ---
 package/pulseview/Config.in |    2 --
 2 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
index bd37319..93bd06f 100644
--- a/package/libsigrok/Config.in
+++ b/package/libsigrok/Config.in
@@ -22,15 +22,12 @@ config BR2_PACKAGE_LIBSIGROKCXX
 	bool "build C++ bindings"
 	select BR2_PACKAGE_GLIBMM
 	depends on BR2_INSTALL_LIBSTDCPP
-	# requires doxygen, which isn't packaged in Buildroot
-	depends on BROKEN
 	help
 	  Build libsigrok C++ bindings as well.
 
 comment "C++ bindings need a toolchain w/ C++"
 	depends on BR2_PACKAGE_LIBSIGROK
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on BROKEN
 
 endif
 
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index e0f1bcf..de899af 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -15,7 +15,6 @@ config BR2_PACKAGE_PULSEVIEW
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BROKEN # libsigrokcxx
 	help
 	  PulseView is a Qt based logic analyzer, oscilloscope
 	  and MSO GUI for sigrok.
@@ -26,4 +25,3 @@ comment "pulseview needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_QT5
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
-	depends on BROKEN # libsigrokcxx
