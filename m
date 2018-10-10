From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 14:20:00 +0200
Subject: [Buildroot] [git commit] perl-devel-globaldestruction: new package
Message-ID: <20181010122047.7CE0082262@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc1d5fe199190a1c4dea822a3994d9bbdf7c6902
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                           |  1 +
 package/perl-devel-globaldestruction/Config.in              |  8 ++++++++
 .../perl-devel-globaldestruction.hash                       |  6 ++++++
 .../perl-devel-globaldestruction.mk                         | 13 +++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 5939ad92e1..edea04b0dd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -687,6 +687,7 @@ menu "Perl libraries/modules"
 	source "package/perl-datetime-tiny/Config.in"
 	source "package/perl-dbd-mysql/Config.in"
 	source "package/perl-dbi/Config.in"
+	source "package/perl-devel-globaldestruction/Config.in"
 	source "package/perl-devel-stacktrace/Config.in"
 	source "package/perl-devel-stacktrace-ashtml/Config.in"
 	source "package/perl-device-serialport/Config.in"
diff --git a/package/perl-devel-globaldestruction/Config.in b/package/perl-devel-globaldestruction/Config.in
new file mode 100644
index 0000000000..a951e20d9f
--- /dev/null
+++ b/package/perl-devel-globaldestruction/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PERL_DEVEL_GLOBALDESTRUCTION
+	bool "perl-devel-globaldestruction"
+	select BR2_PACKAGE_PERL_SUB_EXPORTER_PROGRESSIVE # runtime
+	help
+	  Provides function returning the equivalent of
+	  ${^GLOBAL_PHASE} eq 'DESTRUCT' for older perls.
+
+	  https://metacpan.org/release/Devel-GlobalDestruction
diff --git a/package/perl-devel-globaldestruction/perl-devel-globaldestruction.hash b/package/perl-devel-globaldestruction/perl-devel-globaldestruction.hash
new file mode 100644
index 0000000000..b3cd6e32f1
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
index 0000000000..95155b6766
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
