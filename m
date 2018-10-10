From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 10 Oct 2018 10:18:25 +0200
Subject: [Buildroot] [V2 2/8] perl-role-tiny: new package
In-Reply-To: <20181010081831.25014-1-francois.perrad@gadz.org>
References: <20181010081831.25014-1-francois.perrad@gadz.org>
Message-ID: <20181010081831.25014-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                          |  1 +
 package/perl-role-tiny/Config.in           |  6 ++++++
 package/perl-role-tiny/perl-role-tiny.hash |  6 ++++++
 package/perl-role-tiny/perl-role-tiny.mk   | 13 +++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/perl-role-tiny/Config.in
 create mode 100644 package/perl-role-tiny/perl-role-tiny.hash
 create mode 100644 package/perl-role-tiny/perl-role-tiny.mk

diff --git a/package/Config.in b/package/Config.in
index 39eabd80a..a612f5045 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -745,6 +745,7 @@ menu "Perl libraries/modules"
 	source "package/perl-path-tiny/Config.in"
 	source "package/perl-plack/Config.in"
 	source "package/perl-posix-strftime-compiler/Config.in"
+	source "package/perl-role-tiny/Config.in"
 	source "package/perl-stream-buffered/Config.in"
 	source "package/perl-sub-install/Config.in"
 	source "package/perl-sys-meminfo/Config.in"
diff --git a/package/perl-role-tiny/Config.in b/package/perl-role-tiny/Config.in
new file mode 100644
index 000000000..ebbe72020
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
index 000000000..33601bb6b
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
index 000000000..ccc82abc8
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
-- 
2.17.1
