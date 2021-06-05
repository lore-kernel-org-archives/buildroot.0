From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jun 2021 12:49:34 +0200
Subject: [Buildroot] [git commit branch/next] package/aircrack-ng: requires
 RC4 support in openssl
Message-ID: <20210605102059.68C4E80E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81a9e7297cb93eba27a7b7dd85c5fc72a2e270e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enable RC4 in openssl to fix build failure when openssl is the crypto
backend of aircrack-ng.

Fixes:
http://autobuild.buildroot.net/results/007b7d88aed3902fb8ed10ee5c0ff0dc1899756d/
http://autobuild.buildroot.net/results/da464dd449bb950104122535eabf8a4e914d0a9e/
http://autobuild.buildroot.net/results/d10fec8378c334e896d9e38afe00193ef747192f/

Cc: Laurent Cans <laurent.cans@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Laurent Cans <laurent.cans@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/aircrack-ng/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index f3e2bc4ef1..eb997e8d1b 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_AIRCRACK_NG
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  A set of tools for auditing wireless networks
 
