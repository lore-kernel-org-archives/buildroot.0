From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Aug 2014 10:20:25 -0300
Subject: [Buildroot] [PATCH 02/17] bluez5_utils: add comment mmu depends
In-Reply-To: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1407158440-26783-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bluez5_utils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 9152093..10588db 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -64,6 +64,7 @@ endif
 comment "bluez5-utils needs a toolchain w/ wchar, threads, IPv6, headers >= 3.4"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INET_IPV6 || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	depends on BR2_USE_MMU
 
 comment "bluez5-utils conflicts with older bluez-utils version"
 	depends on BR2_PACKAGE_BLUEZ_UTILS
-- 
1.8.5.5
