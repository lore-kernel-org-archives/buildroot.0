From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:15:56 -0000
Subject: [Buildroot] [git commit] perl-sub-install: new package
Message-ID: <20180907111456.6FB0F8019E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09721e4a54257d3709569a482c8768fb41435b1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/perl-sub-install/Config.in             |  6 ++++++
 package/perl-sub-install/perl-sub-install.hash |  6 ++++++
 package/perl-sub-install/perl-sub-install.mk   | 13 +++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 95611897c0..9905d9dd5d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -494,6 +494,7 @@ F:	package/perl-json-maybexs/
 F:	package/perl-module-runtime/
 F:	package/perl-number-bytes-human/
 F:	package/perl-params-util/
+F:	package/perl-sub-install/
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index ccc79090d7..3541451840 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -721,6 +721,7 @@ menu "Perl libraries/modules"
 	source "package/perl-number-bytes-human/Config.in"
 	source "package/perl-params-util/Config.in"
 	source "package/perl-path-tiny/Config.in"
+	source "package/perl-sub-install/Config.in"
 	source "package/perl-time-hires/Config.in"
 	source "package/perl-timedate/Config.in"
 	source "package/perl-try-tiny/Config.in"
diff --git a/package/perl-sub-install/Config.in b/package/perl-sub-install/Config.in
new file mode 100644
index 0000000000..41d57b237f
--- /dev/null
+++ b/package/perl-sub-install/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_SUB_INSTALL
+	bool "perl-sub-install"
+	help
+	  install subroutines into packages easily
+
+	  https://github.com/rjbs/Sub-Install
diff --git a/package/perl-sub-install/perl-sub-install.hash b/package/perl-sub-install/perl-sub-install.hash
new file mode 100644
index 0000000000..3abd9940e6
--- /dev/null
+++ b/package/perl-sub-install/perl-sub-install.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    e1ce4f9cb6b2f6b8778b036c31afa5ab Sub-Install-0.928.tar.gz
+sha256 61e567a7679588887b7b86d427bc476ea6d77fffe7e0d17d640f89007d98ef0f Sub-Install-0.928.tar.gz
+
+# computed by scancpan
+sha256 ad5fb5c05003488f924c60ead21694d629055c9db2ee2d9dd0cf0041b9fedaca LICENSE
diff --git a/package/perl-sub-install/perl-sub-install.mk b/package/perl-sub-install/perl-sub-install.mk
new file mode 100644
index 0000000000..fc7c55afb8
--- /dev/null
+++ b/package/perl-sub-install/perl-sub-install.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-sub-install
+#
+################################################################################
+
+PERL_SUB_INSTALL_VERSION = 0.928
+PERL_SUB_INSTALL_SOURCE = Sub-Install-$(PERL_SUB_INSTALL_VERSION).tar.gz
+PERL_SUB_INSTALL_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
+PERL_SUB_INSTALL_LICENSE = Artistic or GPL-1.0+
+PERL_SUB_INSTALL_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
