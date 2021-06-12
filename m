From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jun 2021 15:52:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/perl-net-ssleay: requires RMD160
 support in openssl
Message-ID: <20210612135233.519344-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable RMD160 in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/c17e37e50d2f6c7a26a9d993ae822e312f7b1f21

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/perl-net-ssleay/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-net-ssleay/Config.in b/package/perl-net-ssleay/Config.in
index 6998553ef8..d699e6671d 100644
--- a/package/perl-net-ssleay/Config.in
+++ b/package/perl-net-ssleay/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PERL_NET_SSLEAY
 	bool "perl-net-ssleay"
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Perl extension for using OpenSSL.
 
-- 
2.30.2
