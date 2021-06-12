From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jun 2021 22:58:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/perl-crypt-openssl-rsa: requires
 RMD160 support in openssl
Message-ID: <20210612205835.546667-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable RMD160 in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/e61d2f06812ce171e20bac96b3573d57927030d0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/perl-crypt-openssl-rsa/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-crypt-openssl-rsa/Config.in b/package/perl-crypt-openssl-rsa/Config.in
index e58a921bcb..7c0c3acf17 100644
--- a/package/perl-crypt-openssl-rsa/Config.in
+++ b/package/perl-crypt-openssl-rsa/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PERL_CRYPT_OPENSSL_RSA
 	bool "perl-crypt-openssl-rsa"
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_PERL_CRYPT_OPENSSL_RANDOM # runtime
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  RSA encoding and decoding, using the openSSL libraries.
 
-- 
2.30.2
