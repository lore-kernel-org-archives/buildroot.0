From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jun 2017 23:06:23 +0200
Subject: [Buildroot] [git commit] package/beecrypt: needs host gcc >= 4.8
	for icu support
Message-ID: <20170610210719.EA5CC8019D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c99ffabe6f870afa180a75305e081fc7a0e5891
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/beecrypt/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
index a007c36..8854515 100644
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
