From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 23:31:21 +0200
Subject: [Buildroot] [git commit branch/next] perl-dbi: new package
Message-ID: <20180812212858.D7B0D8C97D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=741bae2fe584820806dd2abf6677f9d8b62068bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/perl-dbi/Config.in     | 10 ++++++++++
 package/perl-dbi/perl-dbi.hash |  6 ++++++
 package/perl-dbi/perl-dbi.mk   | 13 +++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ab25a63677..3c80c20cf0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -486,6 +486,7 @@ F:	package/perl-astro-suntime/
 F:	package/perl-class-std/
 F:	package/perl-data-uuid/
 F:	package/perl-date-manip/
+F:	package/perl-dbi/
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index 461a004ef3..8d80c41560 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -676,6 +676,7 @@ menu "Perl libraries/modules"
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
