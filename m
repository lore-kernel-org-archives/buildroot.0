From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  4 Apr 2015 10:25:32 -0300
Subject: [Buildroot] [PATCH 3/3] webkit: mark as deprecated
In-Reply-To: <1428153932-15069-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428153932-15069-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428153932-15069-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mark webkit as deprecated now that midori has been updated to use
webkitgtk24.
It has multiple CVEs under it's belt and is no longer maintained
upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/webkit/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 2f0b90d..25b3eef 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -5,11 +5,13 @@ config BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	default y if BR2_i386 || BR2_mips || BR2_mipsel || \
 		BR2_sparc || BR2_x86_64
 	depends on BR2_USE_MMU # libgail -> pango -> libglib2
+	depends on BR2_DEPRECATED_SINCE_2015_05
 
 # disabled on powerpc due to bug https://bugs.webkit.org/show_bug.cgi?id=113638
 
 config BR2_PACKAGE_WEBKIT
 	bool "webkit"
+	depends on BR2_DEPRECATED_SINCE_2015_05
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # enchant -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # enchant -> libglib2; icu
@@ -43,6 +45,7 @@ config BR2_PACKAGE_WEBKIT
 	  http://webkit.org/
 
 comment "webkit needs libgtk2 and a toolchain w/ C++, wchar, threads"
+	depends on BR2_DEPRECATED_SINCE_2015_05
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	depends on !BR2_PACKAGE_LIBGTK2 || !BR2_INSTALL_LIBSTDCPP || \
-- 
2.0.5
