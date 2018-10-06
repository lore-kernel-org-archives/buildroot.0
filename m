From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  6 Oct 2018 18:55:05 +0200
Subject: [Buildroot] [PATCH 01/20] perl-class-inspector: new package
In-Reply-To: <20181006165524.23778-1-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
Message-ID: <20181006165524.23778-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                                   |  1 +
 package/perl-class-inspector/Config.in              |  6 ++++++
 .../perl-class-inspector/perl-class-inspector.hash  |  6 ++++++
 .../perl-class-inspector/perl-class-inspector.mk    | 13 +++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/perl-class-inspector/Config.in
 create mode 100644 package/perl-class-inspector/perl-class-inspector.hash
 create mode 100644 package/perl-class-inspector/perl-class-inspector.mk

diff --git a/package/Config.in b/package/Config.in
index 5e4afc87a..cc5578f5d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -667,6 +667,7 @@ if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 	source "package/perl-appconfig/Config.in"
 	source "package/perl-astro-suntime/Config.in"
+	source "package/perl-class-inspector/Config.in"
 	source "package/perl-class-load/Config.in"
 	source "package/perl-class-std/Config.in"
 	source "package/perl-class-std-fast/Config.in"
diff --git a/package/perl-class-inspector/Config.in b/package/perl-class-inspector/Config.in
new file mode 100644
index 000000000..fac3688d5
--- /dev/null
+++ b/package/perl-class-inspector/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_CLASS_INSPECTOR
+	bool "perl-class-inspector"
+	help
+	  Get information about a class and its structure
+
+	  https://metacpan.org/pod/Class::Inspector
diff --git a/package/perl-class-inspector/perl-class-inspector.hash b/package/perl-class-inspector/perl-class-inspector.hash
new file mode 100644
index 000000000..181c09ace
--- /dev/null
+++ b/package/perl-class-inspector/perl-class-inspector.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    db471d6ecf47fa054726553319b7c34f Class-Inspector-1.32.tar.gz
+sha256 cefadc8b5338e43e570bc43f583e7c98d535c17b196bcf9084bb41d561cc0535 Class-Inspector-1.32.tar.gz
+
+# computed by scancpan
+sha256 3ed0185f73a0570b72a2dc95c6bde500dc800c6f778ccbd688df4f88e6e65232 LICENSE
diff --git a/package/perl-class-inspector/perl-class-inspector.mk b/package/perl-class-inspector/perl-class-inspector.mk
new file mode 100644
index 000000000..5aee57257
--- /dev/null
+++ b/package/perl-class-inspector/perl-class-inspector.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-class-inspector
+#
+################################################################################
+
+PERL_CLASS_INSPECTOR_VERSION = 1.32
+PERL_CLASS_INSPECTOR_SOURCE = Class-Inspector-$(PERL_CLASS_INSPECTOR_VERSION).tar.gz
+PERL_CLASS_INSPECTOR_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PL/PLICEASE
+PERL_CLASS_INSPECTOR_LICENSE = Artistic or GPL-1.0+
+PERL_CLASS_INSPECTOR_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
2.17.1
