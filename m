From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 10 Feb 2020 11:46:55 +0100
Subject: [Buildroot] [PATCH 02/12] package/perl-i18n: new package
In-Reply-To: <20200210104706.19186-1-patrickdepinguin@gmail.com>
References: <20200210104706.19186-1-patrickdepinguin@gmail.com>
Message-ID: <20200210104706.19186-3-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joeri Barbarien <joeri.barbarien@nokia.com>

Added via utils/scancpan, without changes.

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/perl-i18n/Config.in      |  7 +++++++
 package/perl-i18n/perl-i18n.hash |  6 ++++++
 package/perl-i18n/perl-i18n.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/perl-i18n/Config.in
 create mode 100644 package/perl-i18n/perl-i18n.hash
 create mode 100644 package/perl-i18n/perl-i18n.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b179a6aea0..16d07b8e9a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2378,6 +2378,7 @@ F:	package/perl-convert-asn1/
 F:	package/perl-crypt-blowfish/
 F:	package/perl-crypt-cbc/
 F:	package/perl-crypt-openssl-aes/
+F:	package/perl-i18n/
 F:	package/perl-locale-maketext-lexicon/
 F:	package/perl-math-prime-util/
 F:	package/perl-mime-base64-urlsafe/
diff --git a/package/Config.in b/package/Config.in
index b39d6a32d5..bad2314019 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -760,6 +760,7 @@ menu "Perl libraries/modules"
 	source "package/perl-http-message/Config.in"
 	source "package/perl-http-multipartparser/Config.in"
 	source "package/perl-http-negotiate/Config.in"
+	source "package/perl-i18n/Config.in"
 	source "package/perl-io-html/Config.in"
 	source "package/perl-io-interface/Config.in"
 	source "package/perl-io-socket-multicast/Config.in"
diff --git a/package/perl-i18n/Config.in b/package/perl-i18n/Config.in
new file mode 100644
index 0000000000..d504563966
--- /dev/null
+++ b/package/perl-i18n/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_I18N
+	bool "perl-i18n"
+	select BR2_PACKAGE_PERL_LOCALE_MAKETEXT_LEXICON # runtime
+	help
+	  Perl Internationalization Pragma.
+
+	  https://metacpan.org/release/i18n
diff --git a/package/perl-i18n/perl-i18n.hash b/package/perl-i18n/perl-i18n.hash
new file mode 100644
index 0000000000..f6ef8931a2
--- /dev/null
+++ b/package/perl-i18n/perl-i18n.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    4c3004474d6ff3554f82b52f92b3b1e1 i18n-0.13.tar.gz
+sha256 2dbc3e4e25b41578cd83508fe011209e8f3c2b259fa4b5b6eafaac0d6ce4b457 i18n-0.13.tar.gz
+
+# computed by scancpan
+sha256 4755e5f2096e8ef0494f1565bf5a028a8fb4eeb5c1250e7d30948d1ed13c5ad7 README
diff --git a/package/perl-i18n/perl-i18n.mk b/package/perl-i18n/perl-i18n.mk
new file mode 100644
index 0000000000..04d75c2146
--- /dev/null
+++ b/package/perl-i18n/perl-i18n.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-i18n
+#
+################################################################################
+
+PERL_I18N_VERSION = 0.13
+PERL_I18N_SOURCE = i18n-$(PERL_I18N_VERSION).tar.gz
+PERL_I18N_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AU/AUDREYT
+PERL_I18N_LICENSE = MIT
+PERL_I18N_LICENSE_FILES = README
+PERL_I18N_DISTNAME = i18n
+
+$(eval $(perl-package))
-- 
2.24.1
