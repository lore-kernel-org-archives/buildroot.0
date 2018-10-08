From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 10:40:47 +0200
Subject: [Buildroot] [git commit] perl-posix-strftime-compiler: new package
Message-ID: <20181008084006.762E58E1F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7354fc057b031d08d6379cc6642b5e740b1cf3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                          |  1 +
 package/perl-posix-strftime-compiler/Config.in             |  6 ++++++
 .../perl-posix-strftime-compiler.hash                      |  6 ++++++
 .../perl-posix-strftime-compiler.mk                        | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d768cb0bb5..d028756971 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -737,6 +737,7 @@ menu "Perl libraries/modules"
 	source "package/perl-package-stash/Config.in"
 	source "package/perl-params-util/Config.in"
 	source "package/perl-path-tiny/Config.in"
+	source "package/perl-posix-strftime-compiler/Config.in"
 	source "package/perl-sub-install/Config.in"
 	source "package/perl-sys-cpu/Config.in"
 	source "package/perl-sys-meminfo/Config.in"
diff --git a/package/perl-posix-strftime-compiler/Config.in b/package/perl-posix-strftime-compiler/Config.in
new file mode 100644
index 0000000000..279d9f9a84
--- /dev/null
+++ b/package/perl-posix-strftime-compiler/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_POSIX_STRFTIME_COMPILER
+	bool "perl-posix-strftime-compiler"
+	help
+	  GNU C library compatible strftime for loggers and servers
+
+	  https://github.com/kazeburo/POSIX-strftime-Compiler
diff --git a/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.hash b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.hash
new file mode 100644
index 0000000000..e8c5219c48
--- /dev/null
+++ b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    c0a5f76b1b0ce9cdb90d627b017e6cf5 POSIX-strftime-Compiler-0.42.tar.gz
+sha256 26582bdd78b254bcc1c56d0b770fa280e8b8f70957c84dc44572ba4cacb0ac11 POSIX-strftime-Compiler-0.42.tar.gz
+
+# computed by scancpan
+sha256 79c2a066104e71602785fd815c5aea6f7db78c19451d68521380083f9c2a8805 LICENSE
diff --git a/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk
new file mode 100644
index 0000000000..b95637de0a
--- /dev/null
+++ b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-posix-strftime-compiler
+#
+################################################################################
+
+PERL_POSIX_STRFTIME_COMPILER_VERSION = 0.42
+PERL_POSIX_STRFTIME_COMPILER_SOURCE = POSIX-strftime-Compiler-$(PERL_POSIX_STRFTIME_COMPILER_VERSION).tar.gz
+PERL_POSIX_STRFTIME_COMPILER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
+PERL_POSIX_STRFTIME_COMPILER_DEPENDENCIES = host-perl-module-build
+PERL_POSIX_STRFTIME_COMPILER_LICENSE = Artistic or GPL-1.0+
+PERL_POSIX_STRFTIME_COMPILER_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
