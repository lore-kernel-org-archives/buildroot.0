From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 23:38:24 +0200
Subject: [Buildroot] [git commit] package/perl-crypt-openssl-rsa: requires
 RMD160 support in openssl
Message-ID: <20210612210930.26C79836F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb00b4e3ced4be606b5f048d80907402a27622b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable RMD160 in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/e61d2f06812ce171e20bac96b3573d57927030d0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-crypt-openssl-rsa/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-crypt-openssl-rsa/Config.in b/package/perl-crypt-openssl-rsa/Config.in
index e2c0131345..b11d8a44c1 100644
--- a/package/perl-crypt-openssl-rsa/Config.in
+++ b/package/perl-crypt-openssl-rsa/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PERL_CRYPT_OPENSSL_RSA
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PERL_CRYPT_OPENSSL_RANDOM # runtime
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  RSA encoding and decoding, using the openSSL libraries.
 
