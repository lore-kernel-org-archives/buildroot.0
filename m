From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Jan 2020 18:19:36 +0100
Subject: [Buildroot] [git commit] package/perl-digest-md5: remove it
Message-ID: <20200108171504.6853E84054@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3fbcfff0ad466f7da9f47510fc6818d13153ac6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Digest::MD5 is a Perl core module (ie. bundled with perl)
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                             |  6 ++++++
 DEVELOPERS                                   |  1 -
 package/Config.in                            |  1 -
 package/perl-digest-md5/Config.in            | 10 ----------
 package/perl-digest-md5/perl-digest-md5.hash |  6 ------
 package/perl-digest-md5/perl-digest-md5.mk   | 14 --------------
 6 files changed, 6 insertions(+), 32 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9f552ad386..14199b81eb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_PERL_DIGEST_MD5
+	bool "perl-digest-md5 was removed"
+	select BR2_LEGACY
+	help
+	  Digest::MD5 is a Perl core module (ie. bundled with perl).
+
 config BR2_PACKAGE_ERLANG_P1_ICONV
 	bool "erlang-p1-iconv has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 5652fc3555..eb36f1c5dc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2373,7 +2373,6 @@ F:	package/perl-convert-asn1/
 F:	package/perl-crypt-blowfish/
 F:	package/perl-crypt-cbc/
 F:	package/perl-crypt-openssl-aes/
-F:	package/perl-digest-md5/
 F:	package/perl-math-bigint/
 F:	package/perl-math-prime-util/
 F:	package/perl-mime-base64-urlsafe/
diff --git a/package/Config.in b/package/Config.in
index 62faf42845..a916e47927 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -731,7 +731,6 @@ menu "Perl libraries/modules"
 	source "package/perl-devel-stacktrace-ashtml/Config.in"
 	source "package/perl-device-serialport/Config.in"
 	source "package/perl-digest-hmac/Config.in"
-	source "package/perl-digest-md5/Config.in"
 	source "package/perl-digest-sha1/Config.in"
 	source "package/perl-dist-checkconflicts/Config.in"
 	source "package/perl-encode-detect/Config.in"
diff --git a/package/perl-digest-md5/Config.in b/package/perl-digest-md5/Config.in
deleted file mode 100644
index 88aeab6fc0..0000000000
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
index 3876f3aca3..0000000000
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
index 19c89d95ac..0000000000
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
