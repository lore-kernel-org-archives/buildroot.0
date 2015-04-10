From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Fri, 10 Apr 2015 11:49:59 +0200
Subject: [Buildroot] [PATCH v3 3/3] Revert "libsigrok: mark libsigrokcxx as
	broken"
In-Reply-To: <1428659399-28620-1-git-send-email-bgolaszewski@baylibre.com>
References: <1428659399-28620-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1428659399-28620-4-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 41e81b7ae149319950814efe3c39acb1200167d2.

Doxygen dependency issue for libsigrokcxx has been fixed.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/libsigrok/Config.in | 3 ---
 package/pulseview/Config.in | 2 --
 2 files changed, 5 deletions(-)

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
-- 
2.1.4
