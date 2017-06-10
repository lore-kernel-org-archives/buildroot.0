From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jun 2017 11:15:01 +0200
Subject: [Buildroot] [PATCH 1/4] package/beecrypt: needs host gcc >= 4.8 for
	icu support
Message-ID: <20170610091501.28983-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/beecrypt/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
index a007c36a6..885451510 100644
--- a/package/beecrypt/Config.in
+++ b/package/beecrypt/Config.in
@@ -13,6 +13,7 @@ if BR2_PACKAGE_BEECRYPT
 
 config BR2_PACKAGE_BEECRYPT_CPP
 	bool "C++ support"
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
 	depends on BR2_USE_WCHAR # icu
@@ -22,9 +23,10 @@ config BR2_PACKAGE_BEECRYPT_CPP
 	help
 	  Enable C++ support. This pulls in the (large) icu package.
 
-comment "C++ support needs a toolchain w/ C++, wchar, dynamic libraries, gcc >= 4.8"
+comment "C++ support needs a toolchain w/ C++, wchar, dynamic libraries, gcc >= 4.8, host gcc >= 4.8"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		|| !BR2_HOST_GCC_AT_LEAST_4_8
 
 endif # BR2_PACKAGE_BEECRYPT
-- 
2.11.0
