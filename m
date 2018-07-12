From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Thu, 12 Jul 2018 23:00:48 +0200
Subject: [Buildroot] [PATCH 04/10] perl-digest-md5: new package
In-Reply-To: <20180712210054.13775-1-thomas.de_schampheleire@nokia.com>
References: <20180712210054.13775-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180712210054.13775-5-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/perl-digest-md5/Config.in            | 10 ++++++++++
 package/perl-digest-md5/perl-digest-md5.hash |  6 ++++++
 package/perl-digest-md5/perl-digest-md5.mk   | 13 +++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/perl-digest-md5/Config.in
 create mode 100644 package/perl-digest-md5/perl-digest-md5.hash
 create mode 100644 package/perl-digest-md5/perl-digest-md5.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ca7e1efd7e..6208e2b6b2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1924,6 +1924,7 @@ F:	package/opkg-utils/
 F:	package/perl-convert-asn1/
 F:	package/perl-crypt-blowfish/
 F:	package/perl-crypt-cbc/
+F:	package/perl-digest-md5/
 F:	package/pigz/
 F:	support/scripts/size-stats
 F:	utils/size-stats-compare
diff --git a/package/Config.in b/package/Config.in
index 981c84c350..1408b46bb7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -671,6 +671,7 @@ menu "Perl libraries/modules"
 	source "package/perl-crypt-openssl-rsa/Config.in"
 	source "package/perl-datetime-tiny/Config.in"
 	source "package/perl-digest-hmac/Config.in"
+	source "package/perl-digest-md5/Config.in"
 	source "package/perl-digest-sha1/Config.in"
 	source "package/perl-encode-detect/Config.in"
 	source "package/perl-encode-locale/Config.in"
diff --git a/package/perl-digest-md5/Config.in b/package/perl-digest-md5/Config.in
new file mode 100644
index 0000000000..e8bb3fd8e7
--- /dev/null
+++ b/package/perl-digest-md5/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PERL_DIGEST_MD5
+	bool "perl-digest-md5"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Perl interface to the MD-5 algorithm
+
+	  https://metacpan.org/release/Digest-MD5
+
+comment "perl-digest-md5 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-digest-md5/perl-digest-md5.hash b/package/perl-digest-md5/perl-digest-md5.hash
new file mode 100644
index 0000000000..3876f3aca3
--- /dev/null
+++ b/package/perl-digest-md5/perl-digest-md5.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    601519b826ca14c233f13a4578b967ef Digest-MD5-2.55.tar.gz
+sha256 03b198a2d14425d951e5e50a885d3818c3162c8fe4c21e18d7798a9a179d0e3c Digest-MD5-2.55.tar.gz
+
+# computed by scancpan
+sha256 f92f16702159fc57cd29c23f29b7f2420bff578ed72365d0225d2945a501cd5a README
diff --git a/package/perl-digest-md5/perl-digest-md5.mk b/package/perl-digest-md5/perl-digest-md5.mk
new file mode 100644
index 0000000000..f39f4b2323
--- /dev/null
+++ b/package/perl-digest-md5/perl-digest-md5.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-digest-md5
+#
+################################################################################
+
+PERL_DIGEST_MD5_VERSION = 2.55
+PERL_DIGEST_MD5_SOURCE = Digest-MD5-$(PERL_DIGEST_MD5_VERSION).tar.gz
+PERL_DIGEST_MD5_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_DIGEST_MD5_LICENSE = Artistic or GPL-1.0+
+PERL_DIGEST_MD5_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
2.16.4
