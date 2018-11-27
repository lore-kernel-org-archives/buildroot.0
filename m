From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 27 Nov 2018 23:54:25 +0100
Subject: [Buildroot] [PATCH] perl-net-ssleay: fix dependency
Message-ID: <20181127225425.14311-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this dependency was accidentally removed
by https://git.busybox.net/buildroot/commit/package/perl-net-ssleay?id=da9e06cabc578bf9138e100d1492a2d5f2038415

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-ssleay/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-net-ssleay/Config.in b/package/perl-net-ssleay/Config.in
index 16b18c45d..6998553ef 100644
--- a/package/perl-net-ssleay/Config.in
+++ b/package/perl-net-ssleay/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_NET_SSLEAY
 	bool "perl-net-ssleay"
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_OPENSSL
 	help
 	  Perl extension for using OpenSSL.
 
-- 
2.17.1
