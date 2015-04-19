From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 12:17:17 +0200
Subject: [Buildroot] [PATCH v2 22/25] package/perl-crypt-openssl-random: new
	package
In-Reply-To: <1429438640-9367-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429438640-9367-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429438640-9367-23-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                        |    1 +
 package/perl-crypt-openssl-random/Config.in              |   12 ++++++++++++
 .../perl-crypt-openssl-random.hash                       |    3 +++
 .../perl-crypt-openssl-random.mk                         |   14 ++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/perl-crypt-openssl-random/Config.in
 create mode 100644 package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash
 create mode 100644 package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk

diff --git a/package/Config.in b/package/Config.in
index dd2fedb..2a536a2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -502,6 +502,7 @@ endif
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
+	source "package/perl-crypt-openssl-random/Config.in"
 	source "package/perl-datetime-tiny/Config.in"
 	source "package/perl-digest-hmac/Config.in"
 	source "package/perl-digest-sha1/Config.in"
diff --git a/package/perl-crypt-openssl-random/Config.in b/package/perl-crypt-openssl-random/Config.in
new file mode 100644
index 0000000..2095cac
--- /dev/null
+++ b/package/perl-crypt-openssl-random/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PERL_CRYPT_OPENSSL_RANDOM
+	bool "perl-crypt-openssl-random"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Routines for accessing the OpenSSL pseudo-random number generator
+	  using the openSSL libraries
+
+	  http://sourceforge.net/projects/perl-openssl/
+
+comment "perl-crypt-openssl-random needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash
new file mode 100644
index 0000000..2de6547
--- /dev/null
+++ b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    b89ca9314c3a066b440a7bb3cb8d725d Crypt-OpenSSL-Random-0.10.tar.gz
+sha256 ae65d0ab6907edd1d67f87fdf0923ecae4d54c4c2e0ac9d9df97227903ccf18a Crypt-OpenSSL-Random-0.10.tar.gz
diff --git a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
new file mode 100644
index 0000000..2692236
--- /dev/null
+++ b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-crypt-openssl-random
+#
+################################################################################
+
+PERL_CRYPT_OPENSSL_RANDOM_VERSION = 0.10
+PERL_CRYPT_OPENSSL_RANDOM_SOURCE = Crypt-OpenSSL-Random-$(PERL_CRYPT_OPENSSL_RANDOM_VERSION).tar.gz
+PERL_CRYPT_OPENSSL_RANDOM_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
+PERL_CRYPT_OPENSSL_RANDOM_DEPENDENCIES = openssl perl
+PERL_CRYPT_OPENSSL_RANDOM_LICENSE = Artistic or GPLv1+
+PERL_CRYPT_OPENSSL_RANDOM_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
1.7.10.4
