From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  7 Feb 2016 13:43:15 -0300
Subject: [Buildroot] [PATCH] bluez5_utils: depends on
	BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <1454863395-15652-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It uses __sync_fetch_and_add_4() and other 32-bit atomics, fixes:
http://autobuild.buildroot.net/results/498/4984850d872448c5702eac79b831891f77ad3cf0/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bluez5_utils/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 57f8c45..18b7bbf 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 	# wordexp support not in our uClibc configuration
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -80,6 +81,7 @@ comment "bluez5-utils needs a glibc or musl toolchain w/ wchar, threads, headers
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || BR2_STATIC_LIBS || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
 
 comment "bluez5-utils conflicts with older bluez-utils version"
-- 
2.4.10
