From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 23:15:47 +0200
Subject: [Buildroot] [git commit branch/next] perl-class-std: new package
Message-ID: <20180812211743.ACB1E8C96B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=baed636042f4cde897b8bab11d3f8724a4932c68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/perl-class-std/Config.in           |  6 ++++++
 package/perl-class-std/perl-class-std.hash |  6 ++++++
 package/perl-class-std/perl-class-std.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a7530b312d..35c21817c7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -483,6 +483,7 @@ F:	package/targetcli-fb/
 N:	Christopher McCrory <chrismcc@gmail.com>
 F:	package/perl-appconfig/
 F:	package/perl-astro-suntime/
+F:	package/perl-class-std/
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index 1092c692c7..ab54bf5968 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -667,6 +667,7 @@ if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 	source "package/perl-appconfig/Config.in"
 	source "package/perl-astro-suntime/Config.in"
+	source "package/perl-class-std/Config.in"
 	source "package/perl-convert-asn1/Config.in"
 	source "package/perl-crypt-blowfish/Config.in"
 	source "package/perl-crypt-cbc/Config.in"
diff --git a/package/perl-class-std/Config.in b/package/perl-class-std/Config.in
new file mode 100644
index 0000000000..10734a7902
--- /dev/null
+++ b/package/perl-class-std/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_CLASS_STD
+	bool "perl-class-std"
+	help
+	  Support for creating standard "inside-out" classes
+
+	  https://metacpan.org/release/Class-Std
diff --git a/package/perl-class-std/perl-class-std.hash b/package/perl-class-std/perl-class-std.hash
new file mode 100644
index 0000000000..0cc3861416
--- /dev/null
+++ b/package/perl-class-std/perl-class-std.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    82bcc56d9769edce671b0bd0e183ec3a Class-Std-0.013.tar.gz
+sha256 bcd6d82f6c8af0fe069fced7dd165a4795b0b6e92351c7d4e5a1ab9a14fc35c6 Class-Std-0.013.tar.gz
+
+# computed by scancpan
+sha256 b8175bf3750dc54096bf1506c681b4f13262e5b82e40244e9a77730c6b72e4d6 README
diff --git a/package/perl-class-std/perl-class-std.mk b/package/perl-class-std/perl-class-std.mk
new file mode 100644
index 0000000000..2e3ba95a8b
--- /dev/null
+++ b/package/perl-class-std/perl-class-std.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-class-std
+#
+################################################################################
+
+PERL_CLASS_STD_VERSION = 0.013
+PERL_CLASS_STD_SOURCE = Class-Std-$(PERL_CLASS_STD_VERSION).tar.gz
+PERL_CLASS_STD_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CH/CHORNY
+PERL_CLASS_STD_DEPENDENCIES = host-perl-module-build
+PERL_CLASS_STD_LICENSE = Artistic or GPL-1.0+
+PERL_CLASS_STD_LICENSE_FILES = README
+
+$(eval $(perl-package))
