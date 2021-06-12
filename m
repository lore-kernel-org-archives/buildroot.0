From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jun 2021 23:47:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/pppd: requires DES support in
 openssl
Message-ID: <20210612214720.655521-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable DES in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/3cd38e6dfd5f94f0bd1689e7db4ea1d723dd2a80

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pppd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index 7db5674bf1..3e7759c87c 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PPPD
 	depends on !BR2_TOOLCHAIN_USES_MUSL # Use __P() macro all over the tree
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_OPENSSL if BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  An implementation of the Point-to-point protocol.
 
-- 
2.30.2
