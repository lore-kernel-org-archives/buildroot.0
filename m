From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Jun 2017 18:03:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/icu: needs host gcc >= 4.8
Message-ID: <20170605160317.28701-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/2b3/2b3a9be1780857db8827ea70df9d8699116a5df7/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/icu/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/icu/Config.in b/package/icu/Config.in
index 32f35b9d9..4eb0df5a2 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ICU
 	bool "icu"
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
@@ -30,4 +31,5 @@ comment "icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_HOST_GCC_AT_LEAST_4_8
-- 
2.11.0
