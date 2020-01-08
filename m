From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  8 Jan 2020 16:10:38 +0100
Subject: [Buildroot] [PATCH v2 2/5] package/perl-digest-md5: remove it
In-Reply-To: <20200108151041.12757-1-francois.perrad@gadz.org>
References: <20200108151041.12757-1-francois.perrad@gadz.org>
Message-ID: <20200108151041.12757-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Digest::MD5 is a Perl core module (ie. bundled with perl)
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 Config.in.legacy                             |  8 ++++++++
 DEVELOPERS                                   |  1 -
 package/Config.in                            |  1 -
 package/perl-digest-md5/Config.in            | 10 ----------
 package/perl-digest-md5/perl-digest-md5.hash |  6 ------
 package/perl-digest-md5/perl-digest-md5.mk   | 14 --------------
 6 files changed, 8 insertions(+), 32 deletions(-)
 delete mode 100644 package/perl-digest-md5/Config.in
 delete mode 100644 package/perl-digest-md5/perl-digest-md5.hash
 delete mode 100644 package/perl-digest-md5/perl-digest-md5.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index aa66a564a..297a25994 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,14 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2020.02"
+
+config BR2_PACKAGE_PERL_DIGEST_MD5
+	bool "perl-digest-md5 was removed"
+	select BR2_LEGACY
+	help
+	  Digest::MD5 is a Perl core module (ie. bundled with perl).
+
 comment "Legacy options removed in 2019.11"
 
 config BR2_PACKAGE_OPENVMTOOLS_PROCPS
diff --git a/DEVELOPERS b/DEVELOPERS
index 6375e368e..b181cb6e1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2284,7 +2284,6 @@ F:	package/perl-convert-asn1/
 F:	package/perl-crypt-blowfish/
 F:	package/perl-crypt-cbc/
 F:	package/perl-crypt-openssl-aes/
-F:	package/perl-digest-md5/
 F:	package/perl-math-bigint/
 F:	package/perl-math-prime-util/
 F:	package/perl-mime-base64-urlsafe/
diff --git a/package/Config.in b/package/Config.in
index 5cff2d0c0..894a4d9b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -717,7 +717,6 @@ menu "Perl libraries/modules"
 	source "package/perl-devel-stacktrace-ashtml/Config.in"
 	source "package/perl-device-serialport/Config.in"
 	source "package/perl-digest-hmac/Config.in"
-	source "package/perl-digest-md5/Config.in"
 	source "package/perl-digest-sha1/Config.in"
 	source "package/perl-dist-checkconflicts/Config.in"
 	source "package/perl-encode-detect/Config.in"
diff --git a/package/perl-digest-md5/Config.in b/package/perl-digest-md5/Config.in
deleted file mode 100644
index 88aeab6fc..000000000
--- a/package/perl-digest-md5/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_PERL_DIGEST_MD5
-	bool "perl-digest-md5"
-	depends on !BR2_STATIC_LIBS
-	help
-	  Perl interface to the MD-5 algorithm.
-
-	  https://metacpan.org/release/Digest-MD5
-
-comment "perl-digest-md5 needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
diff --git a/package/perl-digest-md5/perl-digest-md5.hash b/package/perl-digest-md5/perl-digest-md5.hash
deleted file mode 100644
index 3876f3aca..000000000
--- a/package/perl-digest-md5/perl-digest-md5.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5    601519b826ca14c233f13a4578b967ef Digest-MD5-2.55.tar.gz
-sha256 03b198a2d14425d951e5e50a885d3818c3162c8fe4c21e18d7798a9a179d0e3c Digest-MD5-2.55.tar.gz
-
-# computed by scancpan
-sha256 f92f16702159fc57cd29c23f29b7f2420bff578ed72365d0225d2945a501cd5a README
diff --git a/package/perl-digest-md5/perl-digest-md5.mk b/package/perl-digest-md5/perl-digest-md5.mk
deleted file mode 100644
index 19c89d95a..000000000
--- a/package/perl-digest-md5/perl-digest-md5.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# perl-digest-md5
-#
-################################################################################
-
-PERL_DIGEST_MD5_VERSION = 2.55
-PERL_DIGEST_MD5_SOURCE = Digest-MD5-$(PERL_DIGEST_MD5_VERSION).tar.gz
-PERL_DIGEST_MD5_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_DIGEST_MD5_LICENSE = Artistic or GPL-1.0+
-PERL_DIGEST_MD5_LICENSE_FILES = README
-PERL_DIGEST_MD5_DISTNAME = Digest-MD5
-
-$(eval $(perl-package))
-- 
2.20.1
