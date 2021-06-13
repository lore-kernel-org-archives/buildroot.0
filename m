From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 09:29:24 +0200
Subject: [Buildroot] [git commit] package/pppd: requires DES support in
 openssl
Message-ID: <20210613065911.BCC7888F26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e812aa83437fda05d06626102fa8716a17ea4d72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable DES in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/3cd38e6dfd5f94f0bd1689e7db4ea1d723dd2a80

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: only select it for glibc toolchains]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pppd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index 7db5674bf1..66c935abb1 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_PPPD
 	depends on !BR2_TOOLCHAIN_USES_MUSL # Use __P() macro all over the tree
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_OPENSSL if BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL \
+						 && BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  An implementation of the Point-to-point protocol.
 
