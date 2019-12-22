From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:21:28 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/bitcoin: needs
 wchar
Message-ID: <20191222204327.C333B8D6ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c849bd57080500e6c85a9686a47b5a2c6c12c27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

wchar is used in src/tinyformat.h and is a reverse dependency of boost

Fixes:
 - No autobuilder failure (as package can't be enabled yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8703905be0916fe029625985370e71e1b02db523)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bitcoin/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index 78b248890b..3936cd3c79 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_BITCOIN
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_FILESYSTEM
@@ -36,9 +37,9 @@ config BR2_PACKAGE_BITCOIN
 
 	  https://bitcoincore.org
 
-comment "bitcoin needs a toolchain w/ C++"
+comment "bitcoin needs a toolchain w/ C++, wchar"
 	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 
 comment "bitcoin needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
