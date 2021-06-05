From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jun 2021 12:49:32 +0200
Subject: [Buildroot] [git commit] package/libssh2: requires RIPEMD160 in
 openssl
Message-ID: <20210607144659.6B756814BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88e55a82e01e29b41e9efd435bc27ec737e95259
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable RIPEMD160 in openssl for libssh2 to avoid link time failure.

Fixes:
http://autobuild.buildroot.net/results/c6e031fca123865138d18c96d895778c03b639be/
http://autobuild.buildroot.net/results/4284098c0f29fdb7a4df9acbc23986e685c542d2/
http://autobuild.buildroot.net/results/a457bf27dfc0029cbfc2fdbf371aad1e2efa5b83/

Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libssh2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
index 90c38813b3..ce2dd303fa 100644
--- a/package/libssh2/Config.in
+++ b/package/libssh2/Config.in
@@ -27,6 +27,7 @@ config BR2_PACKAGE_LIBSSH2_LIBGCRYPT
 config BR2_PACKAGE_LIBSSH2_OPENSSL
 	bool "openssl"
 	depends on BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 
 endchoice
 endif
