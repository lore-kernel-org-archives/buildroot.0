From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 11:03:05 +0100
Subject: [Buildroot] [git commit] package/perl-math-prime-util: new package
Message-ID: <20191222095420.744918D4D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98dc1cbc159dfd2c3ee2123941660d981a58704a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Standard generated with utils/scancpan.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                             |  1 +
 package/Config.in                                      |  1 +
 package/perl-math-prime-util/Config.in                 | 11 +++++++++++
 package/perl-math-prime-util/perl-math-prime-util.hash |  6 ++++++
 package/perl-math-prime-util/perl-math-prime-util.mk   | 14 ++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 593b79b4f1..dd2bb60cbb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2335,6 +2335,7 @@ F:	package/perl-crypt-cbc/
 F:	package/perl-crypt-openssl-aes/
 F:	package/perl-digest-md5/
 F:	package/perl-math-bigint/
+F:	package/perl-math-prime-util/
 F:	package/perl-mime-base64-urlsafe/
 F:	package/perl-mojolicious-plugin-authentication/
 F:	package/perl-net-ping/
diff --git a/package/Config.in b/package/Config.in
index f59c11f9f9..bbbfc3adc0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -756,6 +756,7 @@ menu "Perl libraries/modules"
 	source "package/perl-mail-dkim/Config.in"
 	source "package/perl-mailtools/Config.in"
 	source "package/perl-math-bigint/Config.in"
+	source "package/perl-math-prime-util/Config.in"
 	source "package/perl-mime-base64/Config.in"
 	source "package/perl-mime-base64-urlsafe/Config.in"
 	source "package/perl-mime-tools/Config.in"
diff --git a/package/perl-math-prime-util/Config.in b/package/perl-math-prime-util/Config.in
new file mode 100644
index 0000000000..1c7b700ac7
--- /dev/null
+++ b/package/perl-math-prime-util/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PERL_MATH_PRIME_UTIL
+	bool "perl-math-prime-util"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Utilities related to prime numbers, including fast sieves and
+	  factoring.
+
+	  https://github.com/danaj/Math-Prime-Util
+
+comment "perl-math-prime-util needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-math-prime-util/perl-math-prime-util.hash b/package/perl-math-prime-util/perl-math-prime-util.hash
new file mode 100644
index 0000000000..789f3a35fc
--- /dev/null
+++ b/package/perl-math-prime-util/perl-math-prime-util.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    26496630990db586dfede6551de79cbe Math-Prime-Util-0.73.tar.gz
+sha256 4afa6dd8cdb97499bd4eca6925861812c29d9f5a0f1ac27ad9d2d9c9b5602894 Math-Prime-Util-0.73.tar.gz
+
+# computed by scancpan
+sha256 475b5f12062de0e197fb8cfa44eef3b032342d097752868e72c1239fe52a8942 LICENSE
diff --git a/package/perl-math-prime-util/perl-math-prime-util.mk b/package/perl-math-prime-util/perl-math-prime-util.mk
new file mode 100644
index 0000000000..5781fe75d6
--- /dev/null
+++ b/package/perl-math-prime-util/perl-math-prime-util.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-math-prime-util
+#
+################################################################################
+
+PERL_MATH_PRIME_UTIL_VERSION = 0.73
+PERL_MATH_PRIME_UTIL_SOURCE = Math-Prime-Util-$(PERL_MATH_PRIME_UTIL_VERSION).tar.gz
+PERL_MATH_PRIME_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DANAJ
+PERL_MATH_PRIME_UTIL_LICENSE = Artistic or GPL-1.0+
+PERL_MATH_PRIME_UTIL_LICENSE_FILES = LICENSE
+PERL_MATH_PRIME_UTIL_DISTNAME = Math-Prime-Util
+
+$(eval $(perl-package))
