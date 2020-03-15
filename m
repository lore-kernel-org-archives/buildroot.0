From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 21:38:55 +0100
Subject: [Buildroot] [git commit] package/perl-locale-maketext-lexicon: new
 package
Message-ID: <20200315203841.B515B8157C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ee07cc901f7c02abfcdf5c80af20eb9cde3f33e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a dependency of perl-i18n added in a subsequent patch.

Added via utils/scancpan, without changes.

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/perl-locale-maketext-lexicon/Config.in             |  6 ++++++
 .../perl-locale-maketext-lexicon.hash                      |  6 ++++++
 .../perl-locale-maketext-lexicon.mk                        | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5394150e5a..593e3c88f1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2400,6 +2400,7 @@ F:	package/perl-convert-asn1/
 F:	package/perl-crypt-blowfish/
 F:	package/perl-crypt-cbc/
 F:	package/perl-crypt-openssl-aes/
+F:	package/perl-locale-maketext-lexicon/
 F:	package/perl-math-prime-util/
 F:	package/perl-mime-base64-urlsafe/
 F:	package/perl-mojolicious-plugin-authentication/
diff --git a/package/Config.in b/package/Config.in
index 146fc1bbc3..09bdc7ed81 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -767,6 +767,7 @@ menu "Perl libraries/modules"
 	source "package/perl-json-maybexs/Config.in"
 	source "package/perl-json-tiny/Config.in"
 	source "package/perl-libwww-perl/Config.in"
+	source "package/perl-locale-maketext-lexicon/Config.in"
 	source "package/perl-lwp-mediatypes/Config.in"
 	source "package/perl-mail-dkim/Config.in"
 	source "package/perl-mailtools/Config.in"
diff --git a/package/perl-locale-maketext-lexicon/Config.in b/package/perl-locale-maketext-lexicon/Config.in
new file mode 100644
index 0000000000..4aed7b63b5
--- /dev/null
+++ b/package/perl-locale-maketext-lexicon/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_LOCALE_MAKETEXT_LEXICON
+	bool "perl-locale-maketext-lexicon"
+	help
+	  Use other catalog formats in Maketext.
+
+	  http://search.cpan.org/dist/Locale-Maketext-Lexicon
diff --git a/package/perl-locale-maketext-lexicon/perl-locale-maketext-lexicon.hash b/package/perl-locale-maketext-lexicon/perl-locale-maketext-lexicon.hash
new file mode 100644
index 0000000000..683e8c7d16
--- /dev/null
+++ b/package/perl-locale-maketext-lexicon/perl-locale-maketext-lexicon.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    51acf0cb00cc01a2c8f560d74dd6c593 Locale-Maketext-Lexicon-1.00.tar.gz
+sha256 b73f6b04a58d3f0e38ebf2115a4c1532f1a4eef6fac5c6a2a449e4e14c1ddc7c Locale-Maketext-Lexicon-1.00.tar.gz
+
+# computed by scancpan
+sha256 af693c8c99bee68656f09328c97d50b24eb742ae4473f57cdafaa90691807fbe LICENSE
diff --git a/package/perl-locale-maketext-lexicon/perl-locale-maketext-lexicon.mk b/package/perl-locale-maketext-lexicon/perl-locale-maketext-lexicon.mk
new file mode 100644
index 0000000000..64b37f9206
--- /dev/null
+++ b/package/perl-locale-maketext-lexicon/perl-locale-maketext-lexicon.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-locale-maketext-lexicon
+#
+################################################################################
+
+PERL_LOCALE_MAKETEXT_LEXICON_VERSION = 1.00
+PERL_LOCALE_MAKETEXT_LEXICON_SOURCE = Locale-Maketext-Lexicon-$(PERL_LOCALE_MAKETEXT_LEXICON_VERSION).tar.gz
+PERL_LOCALE_MAKETEXT_LEXICON_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DR/DRTECH
+PERL_LOCALE_MAKETEXT_LEXICON_LICENSE = MIT
+PERL_LOCALE_MAKETEXT_LEXICON_LICENSE_FILES = LICENSE
+PERL_LOCALE_MAKETEXT_LEXICON_DISTNAME = Locale-Maketext-Lexicon
+
+$(eval $(perl-package))
