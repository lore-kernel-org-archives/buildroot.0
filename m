From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  8 Jan 2020 16:10:39 +0100
Subject: [Buildroot] [PATCH v2 3/5] package/perl-math-bigint: remove it
In-Reply-To: <20200108151041.12757-1-francois.perrad@gadz.org>
References: <20200108151041.12757-1-francois.perrad@gadz.org>
Message-ID: <20200108151041.12757-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Math::BigInt is a Perl core module (ie. bundled with perl)

This package was never released with BR,
so no need to add an entry in Config.legacy

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                                     |  1 -
 package/Config.in                              |  1 -
 package/perl-math-bigint/Config.in             |  6 ------
 package/perl-math-bigint/perl-math-bigint.hash |  6 ------
 package/perl-math-bigint/perl-math-bigint.mk   | 14 --------------
 5 files changed, 28 deletions(-)
 delete mode 100644 package/perl-math-bigint/Config.in
 delete mode 100644 package/perl-math-bigint/perl-math-bigint.hash
 delete mode 100644 package/perl-math-bigint/perl-math-bigint.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b181cb6e1..071095ef6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2284,7 +2284,6 @@ F:	package/perl-convert-asn1/
 F:	package/perl-crypt-blowfish/
 F:	package/perl-crypt-cbc/
 F:	package/perl-crypt-openssl-aes/
-F:	package/perl-math-bigint/
 F:	package/perl-math-prime-util/
 F:	package/perl-mime-base64-urlsafe/
 F:	package/perl-mojolicious-plugin-authentication/
diff --git a/package/Config.in b/package/Config.in
index 894a4d9b4..6f0432a37 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -751,7 +751,6 @@ menu "Perl libraries/modules"
 	source "package/perl-lwp-mediatypes/Config.in"
 	source "package/perl-mail-dkim/Config.in"
 	source "package/perl-mailtools/Config.in"
-	source "package/perl-math-bigint/Config.in"
 	source "package/perl-math-prime-util/Config.in"
 	source "package/perl-mime-base64/Config.in"
 	source "package/perl-mime-base64-urlsafe/Config.in"
diff --git a/package/perl-math-bigint/Config.in b/package/perl-math-bigint/Config.in
deleted file mode 100644
index 89722e7b1..000000000
--- a/package/perl-math-bigint/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_PERL_MATH_BIGINT
-	bool "perl-math-bigint"
-	help
-	  Pure Perl module to test Math::BigInt with scalars.
-
-	  https://metacpan.org/release/Math-BigInt
diff --git a/package/perl-math-bigint/perl-math-bigint.hash b/package/perl-math-bigint/perl-math-bigint.hash
deleted file mode 100644
index ad3d66bbf..000000000
--- a/package/perl-math-bigint/perl-math-bigint.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5    a6e5a6c391b453e04c2b60506e1b5342 Math-BigInt-1.999818.tar.gz
-sha256 b27634356ce2af9b7c0123ac8395a89a32fb15aeae82fcd39de8156cad278c15 Math-BigInt-1.999818.tar.gz
-
-# computed by scancpan
-sha256 b857edab549ac6893e2df5e1ec768ee46b62bcf1607a55e876f4d23f079eacce LICENSE
diff --git a/package/perl-math-bigint/perl-math-bigint.mk b/package/perl-math-bigint/perl-math-bigint.mk
deleted file mode 100644
index 156c6ce38..000000000
--- a/package/perl-math-bigint/perl-math-bigint.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# perl-math-bigint
-#
-################################################################################
-
-PERL_MATH_BIGINT_VERSION = 1.999818
-PERL_MATH_BIGINT_SOURCE = Math-BigInt-$(PERL_MATH_BIGINT_VERSION).tar.gz
-PERL_MATH_BIGINT_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PJ/PJACKLAM
-PERL_MATH_BIGINT_LICENSE = Artistic or GPL-1.0+
-PERL_MATH_BIGINT_LICENSE_FILES = LICENSE
-PERL_MATH_BIGINT_DISTNAME = Math-BigInt
-
-$(eval $(perl-package))
-- 
2.20.1
