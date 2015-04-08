From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Apr 2015 13:52:49 -0300
Subject: [Buildroot] [PATCH v2 5/5] libgail: mark as deprecated
In-Reply-To: <1428511969-28430-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428511969-28430-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428511969-28430-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mark libgail as deprecated now that midori has been updated to use
webkitgtk24 and the only package that uses it (webkit) has been
deprecated.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgail/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libgail/Config.in b/package/libgail/Config.in
index 3967083..a92a8eb 100644
--- a/package/libgail/Config.in
+++ b/package/libgail/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBGAIL
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
 	depends on BR2_ARCH_HAS_ATOMICS # pango -> cairo
 	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_DEPRECATED_SINCE_2015_05
 	select BR2_PACKAGE_PANGO
 	help
 	  GAIL provides accessibility support for gtk+ and
@@ -27,3 +28,4 @@ comment "libgail needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_DEPRECATED_SINCE_2015_05
-- 
2.0.5
