From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 14:31:37 +0200
Subject: [Buildroot] [git commit] package/vtun: requires blowfish support in
 openssl
Message-ID: <20210612120122.7784B874F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26fe934fd27de5fa1ce6b482cbfe4cfcebbb0972
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable blowfish in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/38f6b92ead5861c2e15ca768acea9742ad4e0fec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/vtun/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vtun/Config.in b/package/vtun/Config.in
index d63e7c76ef..eca6f67946 100644
--- a/package/vtun/Config.in
+++ b/package/vtun/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_VTUN
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  Tool for easily creating Virtual Tunnels over TCP/IP networks
