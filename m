From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  8 Dec 2019 17:27:18 +0100
Subject: [Buildroot] [PATCH 1/8] package/bitcoin: depends on
 !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
Message-ID: <20191208162725.2561301-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Obviously, bitcoin depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735, not on
BR2_TOOLCHAIN_HAS_GCC_BUG_64735

Fixes:
 - No autobuilder failure

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bitcoin/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index 03e040d8f5..c6788d5f98 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
 config BR2_PACKAGE_BITCOIN
 	bool "bitcoin"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_SYSTEM
-- 
2.24.0
