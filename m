From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 12:21:14 +0200
Subject: [Buildroot] [git commit] perl-apache-logformat-compiler: new package
Message-ID: <20181008102150.853C58E2CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08fc2719d52adb477ac9a1231dde0e2c5b803ecc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                          |  1 +
 package/perl-apache-logformat-compiler/Config.in           |  7 +++++++
 .../perl-apache-logformat-compiler.hash                    |  6 ++++++
 .../perl-apache-logformat-compiler.mk                      | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index b667548f66..d68ecaef3f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -665,6 +665,7 @@ endif
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
+	source "package/perl-apache-logformat-compiler/Config.in"
 	source "package/perl-appconfig/Config.in"
 	source "package/perl-astro-suntime/Config.in"
 	source "package/perl-class-inspector/Config.in"
diff --git a/package/perl-apache-logformat-compiler/Config.in b/package/perl-apache-logformat-compiler/Config.in
new file mode 100644
index 0000000000..81d621082c
--- /dev/null
+++ b/package/perl-apache-logformat-compiler/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_APACHE_LOGFORMAT_COMPILER
+	bool "perl-apache-logformat-compiler"
+	select BR2_PACKAGE_PERL_POSIX_STRFTIME_COMPILER
+	help
+	  Compile a log format string to perl-code
+
+	  https://github.com/kazeburo/Apache-LogFormat-Compiler
diff --git a/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.hash b/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.hash
new file mode 100644
index 0000000000..5466435c5a
--- /dev/null
+++ b/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    cbb0bf041ade8a39f65eadbdf8a346c1 Apache-LogFormat-Compiler-0.35.tar.gz
+sha256 1654c0000a042a8af052616e30b91c1f0b95a720c8048b59168a8bd99b07271a Apache-LogFormat-Compiler-0.35.tar.gz
+
+# computed by scancpan
+sha256 ab941cfc4794afa2113795b167177d1b25cbc77ebadd016e5727effc2cadd96b LICENSE
diff --git a/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk b/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk
new file mode 100644
index 0000000000..156a0aaa4b
--- /dev/null
+++ b/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-apache-logformat-compiler
+#
+################################################################################
+
+PERL_APACHE_LOGFORMAT_COMPILER_VERSION = 0.35
+PERL_APACHE_LOGFORMAT_COMPILER_SOURCE = Apache-LogFormat-Compiler-$(PERL_APACHE_LOGFORMAT_COMPILER_VERSION).tar.gz
+PERL_APACHE_LOGFORMAT_COMPILER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
+PERL_APACHE_LOGFORMAT_COMPILER_DEPENDENCIES = host-perl-module-build-tiny perl-posix-strftime-compiler
+PERL_APACHE_LOGFORMAT_COMPILER_LICENSE = Artistic or GPL-1.0+
+PERL_APACHE_LOGFORMAT_COMPILER_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
