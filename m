From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 10:48:24 +0200
Subject: [Buildroot] [git commit] perl-class-method-modifiers: new package
Message-ID: <20181010084731.C387282122@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53402735c77fe614d46e3dcbcc8d37283046fdb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                           |  1 +
 package/perl-class-method-modifiers/Config.in               |  6 ++++++
 .../perl-class-method-modifiers.hash                        |  6 ++++++
 .../perl-class-method-modifiers.mk                          | 13 +++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index aae7855ec3..9c41fccfc7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -671,6 +671,7 @@ menu "Perl libraries/modules"
 	source "package/perl-astro-suntime/Config.in"
 	source "package/perl-class-inspector/Config.in"
 	source "package/perl-class-load/Config.in"
+	source "package/perl-class-method-modifiers/Config.in"
 	source "package/perl-class-std/Config.in"
 	source "package/perl-class-std-fast/Config.in"
 	source "package/perl-convert-asn1/Config.in"
diff --git a/package/perl-class-method-modifiers/Config.in b/package/perl-class-method-modifiers/Config.in
new file mode 100644
index 0000000000..4d46946430
--- /dev/null
+++ b/package/perl-class-method-modifiers/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_CLASS_METHOD_MODIFIERS
+	bool "perl-class-method-modifiers"
+	help
+	  Provides Moose-like method modifiers
+
+	  https://github.com/moose/Class-Method-Modifiers
diff --git a/package/perl-class-method-modifiers/perl-class-method-modifiers.hash b/package/perl-class-method-modifiers/perl-class-method-modifiers.hash
new file mode 100644
index 0000000000..540f357b6c
--- /dev/null
+++ b/package/perl-class-method-modifiers/perl-class-method-modifiers.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    f55400c7a8134acf3657f8af89bdd7af Class-Method-Modifiers-2.12.tar.gz
+sha256 e44c1073020bf55b8c97975ed77235fd7e2a6a56f29b5c702301721184e27ac8 Class-Method-Modifiers-2.12.tar.gz
+
+# computed by scancpan
+sha256 d17e5cba8d4039f6973d5873f73b0c8949c1cffb338fafe7a57e972767546561 LICENSE
diff --git a/package/perl-class-method-modifiers/perl-class-method-modifiers.mk b/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
new file mode 100644
index 0000000000..725b70a74b
--- /dev/null
+++ b/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-class-method-modifiers
+#
+################################################################################
+
+PERL_CLASS_METHOD_MODIFIERS_VERSION = 2.12
+PERL_CLASS_METHOD_MODIFIERS_SOURCE = Class-Method-Modifiers-$(PERL_CLASS_METHOD_MODIFIERS_VERSION).tar.gz
+PERL_CLASS_METHOD_MODIFIERS_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
+PERL_CLASS_METHOD_MODIFIERS_LICENSE = Artistic or GPL-1.0+
+PERL_CLASS_METHOD_MODIFIERS_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
