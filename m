From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 14 Aug 2014 19:02:12 -0300
Subject: [Buildroot] [PATCH] synergy: needs mmu
Message-ID: <1408053732-945-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/8d4/8d435c1605204f154c8a0a94ebc06d9c29a1768a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/synergy/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/synergy/Config.in b/package/synergy/Config.in
index 20a3a9a..6b64b79 100644
--- a/package/synergy/Config.in
+++ b/package/synergy/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SYNERGY
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBXTST
 	help
 	  Synergy lets you easily share a single mouse and
@@ -14,4 +15,5 @@ config BR2_PACKAGE_SYNERGY
 
 comment "synergy needs a toolchain w/ C++, wchar"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
-- 
1.8.5.5
