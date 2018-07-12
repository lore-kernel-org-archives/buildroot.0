From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Thu, 12 Jul 2018 23:00:47 +0200
Subject: [Buildroot] [PATCH 03/10] perl-crypt-cbc: new package
In-Reply-To: <20180712210054.13775-1-thomas.de_schampheleire@nokia.com>
References: <20180712210054.13775-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180712210054.13775-4-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/perl-crypt-cbc/Config.in           |  6 ++++++
 package/perl-crypt-cbc/perl-crypt-cbc.hash |  6 ++++++
 package/perl-crypt-cbc/perl-crypt-cbc.mk   | 12 ++++++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/perl-crypt-cbc/Config.in
 create mode 100644 package/perl-crypt-cbc/perl-crypt-cbc.hash
 create mode 100644 package/perl-crypt-cbc/perl-crypt-cbc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f437401818..ca7e1efd7e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1923,6 +1923,7 @@ F:	docs/manual/
 F:	package/opkg-utils/
 F:	package/perl-convert-asn1/
 F:	package/perl-crypt-blowfish/
+F:	package/perl-crypt-cbc/
 F:	package/pigz/
 F:	support/scripts/size-stats
 F:	utils/size-stats-compare
diff --git a/package/Config.in b/package/Config.in
index 5bd229eab0..981c84c350 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -666,6 +666,7 @@ if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 	source "package/perl-convert-asn1/Config.in"
 	source "package/perl-crypt-blowfish/Config.in"
+	source "package/perl-crypt-cbc/Config.in"
 	source "package/perl-crypt-openssl-random/Config.in"
 	source "package/perl-crypt-openssl-rsa/Config.in"
 	source "package/perl-datetime-tiny/Config.in"
diff --git a/package/perl-crypt-cbc/Config.in b/package/perl-crypt-cbc/Config.in
new file mode 100644
index 0000000000..7ecfa70552
--- /dev/null
+++ b/package/perl-crypt-cbc/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_CRYPT_CBC
+	bool "perl-crypt-cbc"
+	help
+	  Encrypt Data with Cipher Block Chaining Mode
+
+	  https://metacpan.org/release/Crypt-CBC
diff --git a/package/perl-crypt-cbc/perl-crypt-cbc.hash b/package/perl-crypt-cbc/perl-crypt-cbc.hash
new file mode 100644
index 0000000000..f3d5e03c31
--- /dev/null
+++ b/package/perl-crypt-cbc/perl-crypt-cbc.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    3db5117d60df67e3b400fe367e716be0 Crypt-CBC-2.33.tar.gz
+sha256 6a70de21b6cc7f2b100067e8e188db966e9a8001b5db6fa976e7cb5b294ae645 Crypt-CBC-2.33.tar.gz
+
+# computed by scancpan
+sha256 a98da8a2eef02a8823cf2f58111e981796c4aaf38e8d446acd338a559af42bfc README
diff --git a/package/perl-crypt-cbc/perl-crypt-cbc.mk b/package/perl-crypt-cbc/perl-crypt-cbc.mk
new file mode 100644
index 0000000000..3da0561096
--- /dev/null
+++ b/package/perl-crypt-cbc/perl-crypt-cbc.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# perl-crypt-cbc
+#
+################################################################################
+
+PERL_CRYPT_CBC_VERSION = 2.33
+PERL_CRYPT_CBC_SOURCE = Crypt-CBC-$(PERL_CRYPT_CBC_VERSION).tar.gz
+PERL_CRYPT_CBC_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LD/LDS
+PERL_CRYPT_CBC_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
2.16.4
