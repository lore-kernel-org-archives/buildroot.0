From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Oct 2014 19:45:53 +0200
Subject: [Buildroot] [PATCH v2 3/7] package/tvheadend: Needs iconv()
In-Reply-To: <1413222357-8299-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413222357-8299-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413222357-8299-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
CC              src/intlconv.o
src/intlconv.c:1:19: fatal error: iconv.h: No such file or directory
 #include <iconv.h>

with this defconfig

BR2_arm=y
BR2_cortex_a15=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_TVHEADEND=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index bb71d81..f7182a1 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_TVHEADEND
 	# architecture is avr32, which uses gcc 4.2.
 	depends on !BR2_avr32
 	select BR2_PACKAGE_DTV_SCAN_TABLES
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Tvheadend is a TV streaming server for Linux supporting DVB-S,
-- 
1.7.10.4
