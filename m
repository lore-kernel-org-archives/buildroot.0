From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 14:22:59 +0200
Subject: [Buildroot] [git commit] perl-exporter-tiny: new package
Message-ID: <20181010122218.A6A5D82285@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc2b892dfe8312511c2a49904b1a9f6588c5385a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                  |  1 +
 package/perl-exporter-tiny/Config.in               |  7 +++++++
 package/perl-exporter-tiny/perl-exporter-tiny.hash |  7 +++++++
 package/perl-exporter-tiny/perl-exporter-tiny.mk   | 13 +++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index fd556f3ad7..7788c1cf3b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -697,6 +697,7 @@ menu "Perl libraries/modules"
 	source "package/perl-dist-checkconflicts/Config.in"
 	source "package/perl-encode-detect/Config.in"
 	source "package/perl-encode-locale/Config.in"
+	source "package/perl-exporter-tiny/Config.in"
 	source "package/perl-file-listing/Config.in"
 	source "package/perl-file-sharedir/Config.in"
 	source "package/perl-file-slurp/Config.in"
diff --git a/package/perl-exporter-tiny/Config.in b/package/perl-exporter-tiny/Config.in
new file mode 100644
index 0000000000..1ee001ef14
--- /dev/null
+++ b/package/perl-exporter-tiny/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_EXPORTER_TINY
+	bool "perl-exporter-tiny"
+	help
+	  an exporter with the features of Sub::Exporter but only core
+	  dependencies
+
+	  https://metacpan.org/release/Exporter-Tiny
diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.hash b/package/perl-exporter-tiny/perl-exporter-tiny.hash
new file mode 100644
index 0000000000..1d36c63a10
--- /dev/null
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.hash
@@ -0,0 +1,7 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    e33f25f7556f5f5264a92cb9870d0eac Exporter-Tiny-1.002001.tar.gz
+sha256 a82c334c02ce4b0f9ea77c67bf77738f76a9b8aa4bae5c7209d1c76453d3c48d Exporter-Tiny-1.002001.tar.gz
+
+# computed by scancpan
+sha256 a109768ea1493cc7555d4381d6178d3cfc1fe52adc5d63d3831a2697d9fc90e6 COPYRIGHT
+sha256 c614dadb36b02257ab492e3d4341e52f3f03fe8147cafd2b7da03b3b5c0361e9 LICENSE
diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.mk b/package/perl-exporter-tiny/perl-exporter-tiny.mk
new file mode 100644
index 0000000000..374abd6f1b
--- /dev/null
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-exporter-tiny
+#
+################################################################################
+
+PERL_EXPORTER_TINY_VERSION = 1.002001
+PERL_EXPORTER_TINY_SOURCE = Exporter-Tiny-$(PERL_EXPORTER_TINY_VERSION).tar.gz
+PERL_EXPORTER_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
+PERL_EXPORTER_TINY_LICENSE = Artistic or GPL-1.0+
+PERL_EXPORTER_TINY_LICENSE_FILES = COPYRIGHT LICENSE
+
+$(eval $(perl-package))
