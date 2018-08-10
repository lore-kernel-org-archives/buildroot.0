From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 09:14:48 -0700
Subject: [Buildroot] [PATCH 04/18] perl-class-std: new package
In-Reply-To: <20180810161502.21598-1-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
Message-ID: <20180810161502.21598-5-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/Config.in                          |  1 +
 package/perl-class-std/Config.in           |  6 ++++++
 package/perl-class-std/perl-class-std.hash |  6 ++++++
 package/perl-class-std/perl-class-std.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/perl-class-std/Config.in
 create mode 100644 package/perl-class-std/perl-class-std.hash
 create mode 100644 package/perl-class-std/perl-class-std.mk

diff --git a/package/Config.in b/package/Config.in
index a05b613789..d1f0947d6d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -668,6 +668,7 @@ menu "Perl libraries/modules"
 	source "package/perl-appconfig/Config.in"
 	source "package/perl-astro-suntime/Config.in"
 	source "package/perl-cgi/Config.in"
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
-- 
2.14.4
