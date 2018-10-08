From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  8 Oct 2018 21:36:44 +0200
Subject: [Buildroot] [PATCH 6/8] perl-moo: new package
In-Reply-To: <20181008193646.13046-1-francois.perrad@gadz.org>
References: <20181008193646.13046-1-francois.perrad@gadz.org>
Message-ID: <20181008193646.13046-7-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in              |  1 +
 package/perl-moo/Config.in     | 11 +++++++++++
 package/perl-moo/perl-moo.hash |  6 ++++++
 package/perl-moo/perl-moo.mk   | 19 +++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/perl-moo/Config.in
 create mode 100644 package/perl-moo/perl-moo.hash
 create mode 100644 package/perl-moo/perl-moo.mk

diff --git a/package/Config.in b/package/Config.in
index fce8929f9..3e4bc2882 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -732,6 +732,7 @@ menu "Perl libraries/modules"
 	source "package/perl-module-runtime/Config.in"
 	source "package/perl-mojolicious-plugin-authentication/Config.in"
 	source "package/perl-mojolicious/Config.in"
+	source "package/perl-moo/Config.in"
 	source "package/perl-net-dns/Config.in"
 	source "package/perl-net-http/Config.in"
 	source "package/perl-net-ping/Config.in"
diff --git a/package/perl-moo/Config.in b/package/perl-moo/Config.in
new file mode 100644
index 000000000..613467e2f
--- /dev/null
+++ b/package/perl-moo/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PERL_MOO
+	bool "perl-moo"
+	select BR2_PACKAGE_PERL_CLASS_METHOD_MODIFIERS
+	select BR2_PACKAGE_PERL_DEVEL_GLOBALDESTRUCTION
+	select BR2_PACKAGE_PERL_MODULE_RUNTIME
+	select BR2_PACKAGE_PERL_ROLE_TINY
+	select BR2_PACKAGE_PERL_SUB_QUOTE
+	help
+	  Minimalist Object Orientation (with Moose compatibility)
+
+	  https://metacpan.org/release/Moo
diff --git a/package/perl-moo/perl-moo.hash b/package/perl-moo/perl-moo.hash
new file mode 100644
index 000000000..509a9ea4e
--- /dev/null
+++ b/package/perl-moo/perl-moo.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    d4fcd0f240033198571fcc81ce7c5f15 Moo-2.003004.tar.gz
+sha256 f8bbb625f8e963eabe05cff9048fdd72bdd26777404ff2c40bc690f558be91e1 Moo-2.003004.tar.gz
+
+# computed by scancpan
+sha256 3fe29ec1d93827ee69825ed4bf916cc5ce4e7bf0b940ec6dd2d4ed30f4755dc3 README
diff --git a/package/perl-moo/perl-moo.mk b/package/perl-moo/perl-moo.mk
new file mode 100644
index 000000000..e3e4e9aa8
--- /dev/null
+++ b/package/perl-moo/perl-moo.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# perl-moo
+#
+################################################################################
+
+PERL_MOO_VERSION = 2.003004
+PERL_MOO_SOURCE = Moo-$(PERL_MOO_VERSION).tar.gz
+PERL_MOO_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
+PERL_MOO_DEPENDENCIES = \
+	perl-class-method-modifiers \
+	perl-devel-globaldestruction \
+	perl-module-runtime \
+	perl-role-tiny \
+	perl-sub-quote
+PERL_MOO_LICENSE = Artistic or GPL-1.0+
+PERL_MOO_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
2.17.1
