From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 14:31:15 +0200
Subject: [Buildroot] [git commit] package/freerdp: needs rc4 from libopenssl
Message-ID: <20210612120122.5B7FB874F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49ef039b88bcfd90fc20177906fb4529a18eee0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.org/results/b21b21a66bef2bc09231e475037a8f9be5584fa4/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freerdp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 5705ce0e0c..14c5f98671 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_FREERDP
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBGLIB2
 	help
