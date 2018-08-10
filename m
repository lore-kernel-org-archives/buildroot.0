From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 09:14:51 -0700
Subject: [Buildroot] [PATCH 07/18] perl-dbi: new package
In-Reply-To: <20180810161502.21598-1-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
Message-ID: <20180810161502.21598-8-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/Config.in              |  1 +
 package/perl-dbi/Config.in     | 10 ++++++++++
 package/perl-dbi/perl-dbi.hash |  6 ++++++
 package/perl-dbi/perl-dbi.mk   | 13 +++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/perl-dbi/Config.in
 create mode 100644 package/perl-dbi/perl-dbi.hash
 create mode 100644 package/perl-dbi/perl-dbi.mk

diff --git a/package/Config.in b/package/Config.in
index c5edc5cb76..73adb62e0b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -677,6 +677,7 @@ menu "Perl libraries/modules"
 	source "package/perl-data-uuid/Config.in"
 	source "package/perl-date-manip/Config.in"
 	source "package/perl-datetime-tiny/Config.in"
+	source "package/perl-dbi/Config.in"
 	source "package/perl-digest-hmac/Config.in"
 	source "package/perl-digest-md5/Config.in"
 	source "package/perl-digest-sha1/Config.in"
diff --git a/package/perl-dbi/Config.in b/package/perl-dbi/Config.in
new file mode 100644
index 0000000000..069669b9bc
--- /dev/null
+++ b/package/perl-dbi/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PERL_DBI
+	bool "perl-dbi"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Database independent interface for Perl
+
+	  http://dbi.perl.org/
+
+comment "perl-dbi needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-dbi/perl-dbi.hash b/package/perl-dbi/perl-dbi.hash
new file mode 100644
index 0000000000..1d0b7e9ad5
--- /dev/null
+++ b/package/perl-dbi/perl-dbi.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    e77fd37fcf77fc88fde029c1b75ded54 DBI-1.641.tar.gz
+sha256 5509e532cdd0e3d91eda550578deaac29e2f008a12b64576e8c261bb92e8c2c1 DBI-1.641.tar.gz
+
+# computed by scancpan
+sha256 33453c8b0d8d474a42669ac702a13c20f39c91a34b3df4e6ca778fc2f0f711c7 LICENSE
diff --git a/package/perl-dbi/perl-dbi.mk b/package/perl-dbi/perl-dbi.mk
new file mode 100644
index 0000000000..f7ae6ca5a1
--- /dev/null
+++ b/package/perl-dbi/perl-dbi.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-dbi
+#
+################################################################################
+
+PERL_DBI_VERSION = 1.641
+PERL_DBI_SOURCE = DBI-$(PERL_DBI_VERSION).tar.gz
+PERL_DBI_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TI/TIMB
+PERL_DBI_LICENSE = Artistic or GPL-1.0+
+PERL_DBI_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
2.14.4
