From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  8 Jun 2015 11:07:20 -0300
Subject: [Buildroot] [PATCHv4 4/4] libgail: mark as deprecated
In-Reply-To: <1433772440-18090-1-git-send-email-gustavo@zacarias.com.ar>
References: <1433772440-18090-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1433772440-18090-5-git-send-email-gustavo@zacarias.com.ar>
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
index 3967083..5e4f03b 100644
--- a/package/libgail/Config.in
+++ b/package/libgail/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBGAIL
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
 	depends on BR2_ARCH_HAS_ATOMICS # pango -> cairo
 	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_DEPRECATED_SINCE_2015_08
 	select BR2_PACKAGE_PANGO
 	help
 	  GAIL provides accessibility support for gtk+ and
@@ -27,3 +28,4 @@ comment "libgail needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_DEPRECATED_SINCE_2015_08
-- 
2.3.6
