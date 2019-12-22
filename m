From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:16:17 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/bitcoin: depends
 on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
Message-ID: <20191222204327.B1800812A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6407043fac6eb44004104b393f36312f2889f5d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Obviously, bitcoin depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735, not on
BR2_TOOLCHAIN_HAS_GCC_BUG_64735

Fixes:
 - No autobuilder failure

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bbdd4cd815d7b6689bf5b4161622f7f926f45fd3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
