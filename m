From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 22 Nov 2014 13:00:44 +0100
Subject: [Buildroot] [PATCH 2/2] package/weston: Fix wrong condition to
	display the comment
In-Reply-To: <1416657644-27867-1-git-send-email-bernd.kuhls@t-online.de>
References: <1416657644-27867-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1416657644-27867-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/weston/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index fafdf95..cf242d1 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -2,7 +2,7 @@ comment "weston needs udev and a toolchain w/ threads, dynamic library, headers
 	depends on !BR2_avr32
 	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || !BR2_PREFER_STATIC_LIB
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || BR2_PREFER_STATIC_LIB
 
 config BR2_PACKAGE_WESTON
 	bool "weston"
-- 
1.7.10.4
