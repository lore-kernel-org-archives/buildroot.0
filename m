From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Dec 2019 21:18:43 +0100
Subject: [Buildroot] [PATCH 2/3] package/perl-math-bigint: new package
In-Reply-To: <20191218201845.846-1-patrickdepinguin@gmail.com>
References: <20191218201845.846-1-patrickdepinguin@gmail.com>
Message-ID: <20191218201845.846-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Standard generated with utils/scancpan.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/perl-math-bigint/Config.in             |  6 ++++++
 package/perl-math-bigint/perl-math-bigint.hash |  6 ++++++
 package/perl-math-bigint/perl-math-bigint.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/perl-math-bigint/Config.in
 create mode 100644 package/perl-math-bigint/perl-math-bigint.hash
 create mode 100644 package/perl-math-bigint/perl-math-bigint.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 19c66948f8..92105aae98 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2331,6 +2331,7 @@ F:	package/perl-crypt-blowfish/
 F:	package/perl-crypt-cbc/
 F:	package/perl-crypt-openssl-aes/
 F:	package/perl-digest-md5/
+F:	package/perl-math-bigint/
 F:	package/perl-mime-base64-urlsafe/
 F:	package/perl-mojolicious-plugin-authentication/
 F:	package/perl-net-ping/
diff --git a/package/Config.in b/package/Config.in
index fc5228447a..6d10df8561 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -755,6 +755,7 @@ menu "Perl libraries/modules"
 	source "package/perl-lwp-mediatypes/Config.in"
 	source "package/perl-mail-dkim/Config.in"
 	source "package/perl-mailtools/Config.in"
+	source "package/perl-math-bigint/Config.in"
 	source "package/perl-mime-base64/Config.in"
 	source "package/perl-mime-base64-urlsafe/Config.in"
 	source "package/perl-mime-tools/Config.in"
diff --git a/package/perl-math-bigint/Config.in b/package/perl-math-bigint/Config.in
new file mode 100644
index 0000000000..89722e7b10
--- /dev/null
+++ b/package/perl-math-bigint/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_MATH_BIGINT
+	bool "perl-math-bigint"
+	help
+	  Pure Perl module to test Math::BigInt with scalars.
+
+	  https://metacpan.org/release/Math-BigInt
diff --git a/package/perl-math-bigint/perl-math-bigint.hash b/package/perl-math-bigint/perl-math-bigint.hash
new file mode 100644
index 0000000000..ad3d66bbf8
--- /dev/null
+++ b/package/perl-math-bigint/perl-math-bigint.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    a6e5a6c391b453e04c2b60506e1b5342 Math-BigInt-1.999818.tar.gz
+sha256 b27634356ce2af9b7c0123ac8395a89a32fb15aeae82fcd39de8156cad278c15 Math-BigInt-1.999818.tar.gz
+
+# computed by scancpan
+sha256 b857edab549ac6893e2df5e1ec768ee46b62bcf1607a55e876f4d23f079eacce LICENSE
diff --git a/package/perl-math-bigint/perl-math-bigint.mk b/package/perl-math-bigint/perl-math-bigint.mk
new file mode 100644
index 0000000000..156c6ce38d
--- /dev/null
+++ b/package/perl-math-bigint/perl-math-bigint.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-math-bigint
+#
+################################################################################
+
+PERL_MATH_BIGINT_VERSION = 1.999818
+PERL_MATH_BIGINT_SOURCE = Math-BigInt-$(PERL_MATH_BIGINT_VERSION).tar.gz
+PERL_MATH_BIGINT_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PJ/PJACKLAM
+PERL_MATH_BIGINT_LICENSE = Artistic or GPL-1.0+
+PERL_MATH_BIGINT_LICENSE_FILES = LICENSE
+PERL_MATH_BIGINT_DISTNAME = Math-BigInt
+
+$(eval $(perl-package))
-- 
2.23.0
