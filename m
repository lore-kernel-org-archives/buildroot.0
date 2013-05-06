From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 May 2013 14:57:16 -0300
Subject: [Buildroot] [PATCH] blackbox: needs mmu
Message-ID: <1367863036-7775-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/644617ae64b39c57428c3e57115c3e6df5396d16/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/blackbox/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/blackbox/Config.in b/package/blackbox/Config.in
index 70f7eb4..c183133 100644
--- a/package/blackbox/Config.in
+++ b/package/blackbox/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_BLACKBOX
 	bool "blackbox"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-- 
1.8.1.5
