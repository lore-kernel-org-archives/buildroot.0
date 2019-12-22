From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 22 Dec 2019 17:21:43 +0100
Subject: [Buildroot] [PATCH 2/5] package/perl-digest-md5: remove it
In-Reply-To: <20191222162146.1947-1-francois.perrad@gadz.org>
References: <20191222162146.1947-1-francois.perrad@gadz.org>
Message-ID: <20191222162146.1947-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Digest::MD5 is a Perl core module
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                            |  1 -
 package/perl-digest-md5/Config.in            | 10 ----------
 package/perl-digest-md5/perl-digest-md5.hash |  6 ------
 package/perl-digest-md5/perl-digest-md5.mk   | 14 --------------
 4 files changed, 31 deletions(-)
 delete mode 100644 package/perl-digest-md5/Config.in
 delete mode 100644 package/perl-digest-md5/perl-digest-md5.hash
 delete mode 100644 package/perl-digest-md5/perl-digest-md5.mk

diff --git a/package/Config.in b/package/Config.in
index 44cecff01..233b8402e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -716,7 +716,6 @@ menu "Perl libraries/modules"
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
