From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 14:18:40 +0200
Subject: [Buildroot] [git commit] perl-sub-quote: new package
Message-ID: <20181010121814.6EA9082242@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=649c19e0af9fae6b3bb93619cf48bbdd1d09aa63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                          |  1 +
 package/perl-sub-quote/Config.in           |  6 ++++++
 package/perl-sub-quote/perl-sub-quote.hash |  6 ++++++
 package/perl-sub-quote/perl-sub-quote.mk   | 13 +++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index c25aaae3e8..5939ad92e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -749,6 +749,7 @@ menu "Perl libraries/modules"
 	source "package/perl-role-tiny/Config.in"
 	source "package/perl-stream-buffered/Config.in"
 	source "package/perl-sub-exporter-progressive/Config.in"
+	source "package/perl-sub-quote/Config.in"
 	source "package/perl-sub-install/Config.in"
 	source "package/perl-sys-cpu/Config.in"
 	source "package/perl-sys-meminfo/Config.in"
diff --git a/package/perl-sub-quote/Config.in b/package/perl-sub-quote/Config.in
new file mode 100644
index 0000000000..ae58b50afd
--- /dev/null
+++ b/package/perl-sub-quote/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_SUB_QUOTE
+	bool "perl-sub-quote"
+	help
+	  Efficient generation of subroutines via string eval
+
+	  https://metacpan.org/release/Sub-Quote
diff --git a/package/perl-sub-quote/perl-sub-quote.hash b/package/perl-sub-quote/perl-sub-quote.hash
new file mode 100644
index 0000000000..8af5e2c07d
--- /dev/null
+++ b/package/perl-sub-quote/perl-sub-quote.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    1b0f288ca8c60243f9bc29cfee4c4986 Sub-Quote-2.005001.tar.gz
+sha256 d6ab4f0775def015367a05e02024b403f991b2be11d774f3d235fe7e9bdbba07 Sub-Quote-2.005001.tar.gz
+
+# computed by scancpan
+sha256 8f7a1d60c718174b7752562007b2643d4a1c23f901cbeb7774015805efe0a817 README
diff --git a/package/perl-sub-quote/perl-sub-quote.mk b/package/perl-sub-quote/perl-sub-quote.mk
new file mode 100644
index 0000000000..7f94322295
--- /dev/null
+++ b/package/perl-sub-quote/perl-sub-quote.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-sub-quote
+#
+################################################################################
+
+PERL_SUB_QUOTE_VERSION = 2.005001
+PERL_SUB_QUOTE_SOURCE = Sub-Quote-$(PERL_SUB_QUOTE_VERSION).tar.gz
+PERL_SUB_QUOTE_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
+PERL_SUB_QUOTE_LICENSE = Artistic or GPL-1.0+
+PERL_SUB_QUOTE_LICENSE_FILES = README
+
+$(eval $(perl-package))
