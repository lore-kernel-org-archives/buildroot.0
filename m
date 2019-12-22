From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 11:03:05 +0100
Subject: [Buildroot] [git commit] package/perl-crypt-openssl-aes: new package
Message-ID: <20191222095420.5958F8D4D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db61315ed3ce11cc11976b69e8726c01feb7456f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Standard generated with utils/scancpan, manually updating _LICENSE and
adding openssl dependency.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                |  1 +
 package/Config.in                                         |  1 +
 package/perl-crypt-openssl-aes/Config.in                  | 11 +++++++++++
 .../perl-crypt-openssl-aes/perl-crypt-openssl-aes.hash    |  6 ++++++
 package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.mk  | 15 +++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 770888fb23..2c14c36981 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2332,6 +2332,7 @@ F:	package/opkg-utils/
 F:	package/perl-convert-asn1/
 F:	package/perl-crypt-blowfish/
 F:	package/perl-crypt-cbc/
+F:	package/perl-crypt-openssl-aes/
 F:	package/perl-digest-md5/
 F:	package/perl-mime-base64-urlsafe/
 F:	package/perl-mojolicious-plugin-authentication/
diff --git a/package/Config.in b/package/Config.in
index 4480259af5..141fac9a6d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -705,6 +705,7 @@ menu "Perl libraries/modules"
 	source "package/perl-cookie-baker/Config.in"
 	source "package/perl-crypt-blowfish/Config.in"
 	source "package/perl-crypt-cbc/Config.in"
+	source "package/perl-crypt-openssl-aes/Config.in"
 	source "package/perl-crypt-openssl-random/Config.in"
 	source "package/perl-crypt-openssl-rsa/Config.in"
 	source "package/perl-data-dump/Config.in"
diff --git a/package/perl-crypt-openssl-aes/Config.in b/package/perl-crypt-openssl-aes/Config.in
new file mode 100644
index 0000000000..ab408d0a2c
--- /dev/null
+++ b/package/perl-crypt-openssl-aes/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PERL_CRYPT_OPENSSL_AES
+	bool "perl-crypt-openssl-aes"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_OPENSSL
+	help
+	  A Perl wrapper around OpenSSL's AES library.
+
+	  https://metacpan.org/release/Crypt-OpenSSL-AES
+
+comment "perl-crypt-openssl-aes needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.hash b/package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.hash
new file mode 100644
index 0000000000..07064dfbbe
--- /dev/null
+++ b/package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    269db65cbf580c3174471a2cbc9a9d95 Crypt-OpenSSL-AES-0.02.tar.gz
+sha256 b66fab514edf97fc32f58da257582704a210c2b35e297d5c31b7fa2ffd08e908 Crypt-OpenSSL-AES-0.02.tar.gz
+
+# computed by scancpan
+sha256 a60b8c187cc5d90f7a43adc6be3c127abaa4c739e1e7fdcff16be358533d037f README
diff --git a/package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.mk b/package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.mk
new file mode 100644
index 0000000000..c05f3a9c3d
--- /dev/null
+++ b/package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# perl-crypt-openssl-aes
+#
+################################################################################
+
+PERL_CRYPT_OPENSSL_AES_VERSION = 0.02
+PERL_CRYPT_OPENSSL_AES_SOURCE = Crypt-OpenSSL-AES-$(PERL_CRYPT_OPENSSL_AES_VERSION).tar.gz
+PERL_CRYPT_OPENSSL_AES_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TT/TTAR
+PERL_CRYPT_OPENSSL_AES_LICENSE = Artistic or GPL-1.0+
+PERL_CRYPT_OPENSSL_AES_LICENSE_FILES = README
+PERL_CRYPT_OPENSSL_AES_DISTNAME = Crypt-OpenSSL-AES
+PERL_CRYPT_OPENSSL_AES_DEPENDENCIES = openssl
+
+$(eval $(perl-package))
