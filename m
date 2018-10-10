From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 10:49:50 +0200
Subject: [Buildroot] [git commit] perl-role-tiny: new package
Message-ID: <20181010085606.8969F82167@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=322459c9431ff2dabd411ce53b36505b68216579
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                          |  1 +
 package/perl-role-tiny/Config.in           |  6 ++++++
 package/perl-role-tiny/perl-role-tiny.hash |  6 ++++++
 package/perl-role-tiny/perl-role-tiny.mk   | 13 +++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 9c41fccfc7..f2c25dfb87 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -746,6 +746,7 @@ menu "Perl libraries/modules"
 	source "package/perl-path-tiny/Config.in"
 	source "package/perl-plack/Config.in"
 	source "package/perl-posix-strftime-compiler/Config.in"
+	source "package/perl-role-tiny/Config.in"
 	source "package/perl-stream-buffered/Config.in"
 	source "package/perl-sub-install/Config.in"
 	source "package/perl-sys-cpu/Config.in"
diff --git a/package/perl-role-tiny/Config.in b/package/perl-role-tiny/Config.in
new file mode 100644
index 0000000000..ebbe720203
--- /dev/null
+++ b/package/perl-role-tiny/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_ROLE_TINY
+	bool "perl-role-tiny"
+	help
+	  Roles. Like a nouvelle cuisine portion size slice of Moose.
+
+	  https://metacpan.org/release/Role-Tiny
diff --git a/package/perl-role-tiny/perl-role-tiny.hash b/package/perl-role-tiny/perl-role-tiny.hash
new file mode 100644
index 0000000000..33601bb6b2
--- /dev/null
+++ b/package/perl-role-tiny/perl-role-tiny.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    7c277728a7e090f64b495857cadfed08 Role-Tiny-2.000006.tar.gz
+sha256 cc73418c904a0286ecd8915eac11f5be2a8d1e17ea9cb54c9116b0340cd3e382 Role-Tiny-2.000006.tar.gz
+
+# computed by scancpan
+sha256 08292f0e1797371bce0a1b5bd80e0657b3aabf9c0ecc2ce87ad7a448a7adacce README
diff --git a/package/perl-role-tiny/perl-role-tiny.mk b/package/perl-role-tiny/perl-role-tiny.mk
new file mode 100644
index 0000000000..ccc82abc83
--- /dev/null
+++ b/package/perl-role-tiny/perl-role-tiny.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-role-tiny
+#
+################################################################################
+
+PERL_ROLE_TINY_VERSION = 2.000006
+PERL_ROLE_TINY_SOURCE = Role-Tiny-$(PERL_ROLE_TINY_VERSION).tar.gz
+PERL_ROLE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
+PERL_ROLE_TINY_LICENSE = Artistic or GPL-1.0+
+PERL_ROLE_TINY_LICENSE_FILES = README
+
+$(eval $(perl-package))
