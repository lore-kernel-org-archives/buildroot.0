From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 10:56:56 +0200
Subject: [Buildroot] [git commit] perl-sub-exporter-progressive: new package
Message-ID: <20181010085606.941AB82167@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b776591ce84aa0ff06ef1baf4bd8df8af1d8dff1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                           |  1 +
 package/perl-sub-exporter-progressive/Config.in             |  6 ++++++
 .../perl-sub-exporter-progressive.hash                      |  6 ++++++
 .../perl-sub-exporter-progressive.mk                        | 13 +++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f2c25dfb87..c25aaae3e8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -748,6 +748,7 @@ menu "Perl libraries/modules"
 	source "package/perl-posix-strftime-compiler/Config.in"
 	source "package/perl-role-tiny/Config.in"
 	source "package/perl-stream-buffered/Config.in"
+	source "package/perl-sub-exporter-progressive/Config.in"
 	source "package/perl-sub-install/Config.in"
 	source "package/perl-sys-cpu/Config.in"
 	source "package/perl-sys-meminfo/Config.in"
diff --git a/package/perl-sub-exporter-progressive/Config.in b/package/perl-sub-exporter-progressive/Config.in
new file mode 100644
index 0000000000..7e2911ea3d
--- /dev/null
+++ b/package/perl-sub-exporter-progressive/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_SUB_EXPORTER_PROGRESSIVE
+	bool "perl-sub-exporter-progressive"
+	help
+	  Only use Sub::Exporter if you need it
+
+	  https://github.com/frioux/Sub-Exporter-Progressive
diff --git a/package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.hash b/package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.hash
new file mode 100644
index 0000000000..6bd2441641
--- /dev/null
+++ b/package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    72cf6acdd2a0a8b105821a4db98e4ebe Sub-Exporter-Progressive-0.001013.tar.gz
+sha256 d535b7954d64da1ac1305b1fadf98202769e3599376854b2ced90c382beac056 Sub-Exporter-Progressive-0.001013.tar.gz
+
+# computed by scancpan
+sha256 24c38cba4218e6be62e511bffe21e63aa57335d8929034aa58e8a85eed001e99 LICENSE
diff --git a/package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.mk b/package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.mk
new file mode 100644
index 0000000000..a8a46dd11e
--- /dev/null
+++ b/package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-sub-exporter-progressive
+#
+################################################################################
+
+PERL_SUB_EXPORTER_PROGRESSIVE_VERSION = 0.001013
+PERL_SUB_EXPORTER_PROGRESSIVE_SOURCE = Sub-Exporter-Progressive-$(PERL_SUB_EXPORTER_PROGRESSIVE_VERSION).tar.gz
+PERL_SUB_EXPORTER_PROGRESSIVE_SITE = $(BR2_CPAN_MIRROR)/authors/id/F/FR/FREW
+PERL_SUB_EXPORTER_PROGRESSIVE_LICENSE = Artistic or GPL-1.0+
+PERL_SUB_EXPORTER_PROGRESSIVE_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
