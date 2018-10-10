From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 10 Oct 2018 10:18:28 +0200
Subject: [Buildroot] [V2 5/8] perl-devel-globaldestruction: new package
In-Reply-To: <20181010081831.25014-1-francois.perrad@gadz.org>
References: <20181010081831.25014-1-francois.perrad@gadz.org>
Message-ID: <20181010081831.25014-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                                   |  1 +
 package/perl-devel-globaldestruction/Config.in      |  9 +++++++++
 .../perl-devel-globaldestruction.hash               |  6 ++++++
 .../perl-devel-globaldestruction.mk                 | 13 +++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/perl-devel-globaldestruction/Config.in
 create mode 100644 package/perl-devel-globaldestruction/perl-devel-globaldestruction.hash
 create mode 100644 package/perl-devel-globaldestruction/perl-devel-globaldestruction.mk

diff --git a/package/Config.in b/package/Config.in
index 9239cda36..e7efaee99 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -686,6 +686,7 @@ menu "Perl libraries/modules"
 	source "package/perl-datetime-tiny/Config.in"
 	source "package/perl-dbd-mysql/Config.in"
 	source "package/perl-dbi/Config.in"
+	source "package/perl-devel-globaldestruction/Config.in"
 	source "package/perl-devel-stacktrace/Config.in"
 	source "package/perl-devel-stacktrace-ashtml/Config.in"
 	source "package/perl-device-serialport/Config.in"
diff --git a/package/perl-devel-globaldestruction/Config.in b/package/perl-devel-globaldestruction/Config.in
new file mode 100644
index 000000000..918483208
--- /dev/null
+++ b/package/perl-devel-globaldestruction/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PERL_DEVEL_GLOBALDESTRUCTION
+	bool "perl-devel-globaldestruction"
+	# runtime
+	select BR2_PACKAGE_PERL_SUB_EXPORTER_PROGRESSIVE
+	help
+	  Provides function returning the equivalent of
+	  ${^GLOBAL_PHASE} eq 'DESTRUCT' for older perls.
+
+	  https://metacpan.org/release/Devel-GlobalDestruction
diff --git a/package/perl-devel-globaldestruction/perl-devel-globaldestruction.hash b/package/perl-devel-globaldestruction/perl-devel-globaldestruction.hash
new file mode 100644
index 000000000..b3cd6e32f
--- /dev/null
+++ b/package/perl-devel-globaldestruction/perl-devel-globaldestruction.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    24221ba322cf2dc46a1fc99b53e2380b Devel-GlobalDestruction-0.14.tar.gz
+sha256 34b8a5f29991311468fe6913cadaba75fd5d2b0b3ee3bb41fe5b53efab9154ab Devel-GlobalDestruction-0.14.tar.gz
+
+# computed by scancpan
+sha256 f7adbd1db623233e220f9157521a620dbae4918ae7088845aa61e87b7f62bb23 README
diff --git a/package/perl-devel-globaldestruction/perl-devel-globaldestruction.mk b/package/perl-devel-globaldestruction/perl-devel-globaldestruction.mk
new file mode 100644
index 000000000..95155b676
--- /dev/null
+++ b/package/perl-devel-globaldestruction/perl-devel-globaldestruction.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-devel-globaldestruction
+#
+################################################################################
+
+PERL_DEVEL_GLOBALDESTRUCTION_VERSION = 0.14
+PERL_DEVEL_GLOBALDESTRUCTION_SOURCE = Devel-GlobalDestruction-$(PERL_DEVEL_GLOBALDESTRUCTION_VERSION).tar.gz
+PERL_DEVEL_GLOBALDESTRUCTION_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
+PERL_DEVEL_GLOBALDESTRUCTION_LICENSE = Artistic or GPL-1.0+
+PERL_DEVEL_GLOBALDESTRUCTION_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
2.17.1
