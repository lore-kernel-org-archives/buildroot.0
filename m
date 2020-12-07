From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon,  7 Dec 2020 11:04:40 +0100
Subject: [Buildroot] [PATCH 3/3] package/perl-math-int64: new package
In-Reply-To: <20201207100443.13727-1-patrickdepinguin@gmail.com>
References: <20201207100443.13727-1-patrickdepinguin@gmail.com>
Message-ID: <20201207100443.13727-3-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joeri Barbarien <joeri.barbarien@nokia.com>

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/perl-math-int64/Config.in            | 10 ++++++++++
 package/perl-math-int64/perl-math-int64.hash |  6 ++++++
 package/perl-math-int64/perl-math-int64.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/perl-math-int64/Config.in
 create mode 100644 package/perl-math-int64/perl-math-int64.hash
 create mode 100644 package/perl-math-int64/perl-math-int64.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fceea601ed..2b668fd1b9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2514,6 +2514,7 @@ F:	package/perl-devel-size/
 F:	package/perl-i18n/
 F:	package/perl-locale-maketext-lexicon/
 F:	package/perl-lwp-protocol-https/
+F:	package/perl-math-int64/
 F:	package/perl-math-prime-util/
 F:	package/perl-mime-base64-urlsafe/
 F:	package/perl-mojolicious-plugin-authentication/
diff --git a/package/Config.in b/package/Config.in
index 7f3ffc6093..dc513e0bc7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -783,6 +783,7 @@ menu "Perl libraries/modules"
 	source "package/perl-lwp-protocol-https/Config.in"
 	source "package/perl-mail-dkim/Config.in"
 	source "package/perl-mailtools/Config.in"
+	source "package/perl-math-int64/Config.in"
 	source "package/perl-math-prime-util/Config.in"
 	source "package/perl-mime-base64-urlsafe/Config.in"
 	source "package/perl-mime-tools/Config.in"
diff --git a/package/perl-math-int64/Config.in b/package/perl-math-int64/Config.in
new file mode 100644
index 0000000000..8fbea44af3
--- /dev/null
+++ b/package/perl-math-int64/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PERL_MATH_INT64
+	bool "perl-math-int64"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Manipulate 64 bits integers in Perl.
+
+	  http://metacpan.org/release/Math-Int64
+
+comment "perl-math-int64 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-math-int64/perl-math-int64.hash b/package/perl-math-int64/perl-math-int64.hash
new file mode 100644
index 0000000000..4f2374b107
--- /dev/null
+++ b/package/perl-math-int64/perl-math-int64.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5  1ad0ce8b5e903dfe9f7ffbabd8a43014  Math-Int64-0.54.tar.gz
+sha256  dcfc51e698437ea6b9cefe0276215c56cdb6a7f85e3e24a2b6b4189f1960d351  Math-Int64-0.54.tar.gz
+
+# computed by scancpan
+sha256  59feedfdc4f99a746c54e06ac46c4627fb1e29be3bc71756184f92333600f72b  COPYING
diff --git a/package/perl-math-int64/perl-math-int64.mk b/package/perl-math-int64/perl-math-int64.mk
new file mode 100644
index 0000000000..749ff60c97
--- /dev/null
+++ b/package/perl-math-int64/perl-math-int64.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-math-int64
+#
+################################################################################
+
+PERL_MATH_INT64_VERSION = 0.54
+PERL_MATH_INT64_SOURCE = Math-Int64-$(PERL_MATH_INT64_VERSION).tar.gz
+PERL_MATH_INT64_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SA/SALVA
+PERL_MATH_INT64_LICENSE = Artistic or GPL-1.0+
+PERL_MATH_INT64_LICENSE_FILES = COPYING
+PERL_MATH_INT64_DISTNAME = Math-Int64
+
+$(eval $(perl-package))
-- 
2.26.2
