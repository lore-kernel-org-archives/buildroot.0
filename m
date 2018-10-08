From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  8 Oct 2018 21:36:39 +0200
Subject: [Buildroot] [PATCH 1/8] perl-class-method-modifiers: new package
In-Reply-To: <20181008193646.13046-1-francois.perrad@gadz.org>
References: <20181008193646.13046-1-francois.perrad@gadz.org>
Message-ID: <20181008193646.13046-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                                   |  1 +
 package/perl-class-method-modifiers/Config.in       |  6 ++++++
 .../perl-class-method-modifiers.hash                |  6 ++++++
 .../perl-class-method-modifiers.mk                  | 13 +++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/perl-class-method-modifiers/Config.in
 create mode 100644 package/perl-class-method-modifiers/perl-class-method-modifiers.hash
 create mode 100644 package/perl-class-method-modifiers/perl-class-method-modifiers.mk

diff --git a/package/Config.in b/package/Config.in
index 9734ef576..c8a520bcf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -670,6 +670,7 @@ menu "Perl libraries/modules"
 	source "package/perl-astro-suntime/Config.in"
 	source "package/perl-class-inspector/Config.in"
 	source "package/perl-class-load/Config.in"
+	source "package/perl-class-method-modifiers/Config.in"
 	source "package/perl-class-std/Config.in"
 	source "package/perl-class-std-fast/Config.in"
 	source "package/perl-convert-asn1/Config.in"
diff --git a/package/perl-class-method-modifiers/Config.in b/package/perl-class-method-modifiers/Config.in
new file mode 100644
index 000000000..4d4694643
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
index 000000000..540f357b6
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
index 000000000..725b70a74
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
-- 
2.17.1
