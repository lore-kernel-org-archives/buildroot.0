From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Aug 2018 20:15:56 +0200
Subject: [Buildroot] [PATCH/next 1/3] package/perl-crypt-openssl-guess: new
 package
Message-ID: <20180819181558.15338-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for upcoming version bumps of perl-crypt-openssl-random and
perl-crypt-openssl-rsa.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS                                          |  1 +
 package/Config.in                                   |  1 +
 package/perl-crypt-openssl-guess/Config.in          |  6 ++++++
 .../perl-crypt-openssl-guess.hash                   |  6 ++++++
 .../perl-crypt-openssl-guess.mk                     | 13 +++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/perl-crypt-openssl-guess/Config.in
 create mode 100644 package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash
 create mode 100644 package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d1bfc98360..f65c688c21 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -330,6 +330,7 @@ F:	package/libyuv/
 F:	package/mesa3d/
 F:	package/minidlna/
 F:	package/mjpg-streamer/
+F:	package/perl-crypt-openssl-guess/
 F:	package/perl-crypt-openssl-random/
 F:	package/perl-crypt-openssl-rsa/
 F:	package/perl-digest-sha1/
diff --git a/package/Config.in b/package/Config.in
index 9b6e5b0250..6ca3259918 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -671,6 +671,7 @@ menu "Perl libraries/modules"
 	source "package/perl-convert-asn1/Config.in"
 	source "package/perl-crypt-blowfish/Config.in"
 	source "package/perl-crypt-cbc/Config.in"
+	source "package/perl-crypt-openssl-guess/Config.in"
 	source "package/perl-crypt-openssl-random/Config.in"
 	source "package/perl-crypt-openssl-rsa/Config.in"
 	source "package/perl-data-optlist/Config.in"
diff --git a/package/perl-crypt-openssl-guess/Config.in b/package/perl-crypt-openssl-guess/Config.in
new file mode 100644
index 0000000000..6527609d37
--- /dev/null
+++ b/package/perl-crypt-openssl-guess/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_CRYPT_OPENSSL_GUESS
+	bool "perl-crypt-openssl-guess"
+	help
+	  Guess OpenSSL include path
+
+	  https://metacpan.org/pod/Crypt::OpenSSL::Guess
diff --git a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash
new file mode 100644
index 0000000000..327b06900a
--- /dev/null
+++ b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    e768fe2c07826b0ac9ea604c79f93032 Crypt-OpenSSL-Guess-0.11.tar.gz
+sha256 aa6b18e38cb852cbad80a58cd90c395b40819d4d01e0ab37e7703149094d7167 Crypt-OpenSSL-Guess-0.11.tar.gz
+
+# computed by scancpan
+sha256 5c739f181ce7aa31d739277996ff230067dad39332e5597c0dffd36e5d784072 LICENSE
diff --git a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
new file mode 100644
index 0000000000..7a1a82014c
--- /dev/null
+++ b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-crypt-openssl-guess
+#
+################################################################################
+
+PERL_CRYPT_OPENSSL_GUESS_VERSION = 0.11
+PERL_CRYPT_OPENSSL_GUESS_SOURCE = Crypt-OpenSSL-Guess-$(PERL_CRYPT_OPENSSL_GUESS_VERSION).tar.gz
+PERL_CRYPT_OPENSSL_GUESS_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AK/AKIYM
+PERL_CRYPT_OPENSSL_GUESS_LICENSE = Artistic or GPL-1.0+
+PERL_CRYPT_OPENSSL_GUESS_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
2.18.0
