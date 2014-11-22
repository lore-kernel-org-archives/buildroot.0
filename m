From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 22 Nov 2014 13:00:43 +0100
Subject: [Buildroot] [PATCH 1/2] package/wayland: Fix wrong condition to
	display the comment
Message-ID: <1416657644-27867-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/wayland/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wayland/Config.in b/package/wayland/Config.in
index cb10fac..f90cda6 100644
--- a/package/wayland/Config.in
+++ b/package/wayland/Config.in
@@ -14,4 +14,4 @@ config BR2_PACKAGE_WAYLAND
 
 comment "wayland needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_avr32
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
-- 
1.7.10.4
