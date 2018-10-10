From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 14:22:27 +0200
Subject: [Buildroot] [git commit] perl-moo: new package
Message-ID: <20181010122218.9D0B082285@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b10bdca05eaccc5bd3aa70ed80cfe0c8b108218f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in              |  1 +
 package/perl-moo/Config.in     | 11 +++++++++++
 package/perl-moo/perl-moo.hash |  6 ++++++
 package/perl-moo/perl-moo.mk   | 13 +++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index edea04b0dd..fd556f3ad7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -733,6 +733,7 @@ menu "Perl libraries/modules"
 	source "package/perl-module-runtime/Config.in"
 	source "package/perl-mojolicious-plugin-authentication/Config.in"
 	source "package/perl-mojolicious/Config.in"
+	source "package/perl-moo/Config.in"
 	source "package/perl-net-dns/Config.in"
 	source "package/perl-net-http/Config.in"
 	source "package/perl-net-ping/Config.in"
diff --git a/package/perl-moo/Config.in b/package/perl-moo/Config.in
new file mode 100644
index 0000000000..4d88e1a796
--- /dev/null
+++ b/package/perl-moo/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PERL_MOO
+	bool "perl-moo"
+	select BR2_PACKAGE_PERL_CLASS_METHOD_MODIFIERS # runtime
+	select BR2_PACKAGE_PERL_DEVEL_GLOBALDESTRUCTION # runtime
+	select BR2_PACKAGE_PERL_MODULE_RUNTIME # runtime
+	select BR2_PACKAGE_PERL_ROLE_TINY # runtime
+	select BR2_PACKAGE_PERL_SUB_QUOTE # runtime
+	help
+	  Minimalist Object Orientation (with Moose compatibility)
+
+	  https://metacpan.org/release/Moo
diff --git a/package/perl-moo/perl-moo.hash b/package/perl-moo/perl-moo.hash
new file mode 100644
index 0000000000..509a9ea4ed
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
index 0000000000..babb3841b7
--- /dev/null
+++ b/package/perl-moo/perl-moo.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-moo
+#
+################################################################################
+
+PERL_MOO_VERSION = 2.003004
+PERL_MOO_SOURCE = Moo-$(PERL_MOO_VERSION).tar.gz
+PERL_MOO_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
+PERL_MOO_LICENSE = Artistic or GPL-1.0+
+PERL_MOO_LICENSE_FILES = README
+
+$(eval $(perl-package))
