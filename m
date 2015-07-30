From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 23:19:18 +0200
Subject: [Buildroot] [git commit] webkit: mark as deprecated
Message-ID: <20150730211931.70EC17FA17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f117c3db2e712a06467029ddf748ff2d77543b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mark webkit as deprecated now that midori has been updated to use
webkitgtk24.
It has multiple CVEs under it's belt and is no longer maintained
upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkit/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 2f0b90d..7f0d1e4 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -5,11 +5,13 @@ config BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	default y if BR2_i386 || BR2_mips || BR2_mipsel || \
 		BR2_sparc || BR2_x86_64
 	depends on BR2_USE_MMU # libgail -> pango -> libglib2
+	depends on BR2_DEPRECATED_SINCE_2015_08
 
 # disabled on powerpc due to bug https://bugs.webkit.org/show_bug.cgi?id=113638
 
 config BR2_PACKAGE_WEBKIT
 	bool "webkit"
+	depends on BR2_DEPRECATED_SINCE_2015_08
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # enchant -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # enchant -> libglib2; icu
@@ -43,6 +45,7 @@ config BR2_PACKAGE_WEBKIT
 	  http://webkit.org/
 
 comment "webkit needs libgtk2 and a toolchain w/ C++, wchar, threads"
+	depends on BR2_DEPRECATED_SINCE_2015_08
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	depends on !BR2_PACKAGE_LIBGTK2 || !BR2_INSTALL_LIBSTDCPP || \
