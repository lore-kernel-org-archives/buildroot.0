From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 21:46:16 +0200
Subject: [Buildroot] [git commit] perl-json-tiny: new package
Message-ID: <20140723194747.BCF059D2CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dfe9d5b2641bfce2198d519c9be3a949f0fb563b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |    1 +
 package/perl-json-tiny/Config.in         |    6 ++++++
 package/perl-json-tiny/perl-json-tiny.mk |   14 ++++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index aa2f783..b89a98e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -436,6 +436,7 @@ menu "Perl libraries/modules"
 	source "package/perl-gdgraph/Config.in"
 	source "package/perl-gdtextutil/Config.in"
 	source "package/perl-io-socket-ssl/Config.in"
+	source "package/perl-json-tiny/Config.in"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-ssleay/Config.in"
 	source "package/perl-xml-libxml/Config.in"
diff --git a/package/perl-json-tiny/Config.in b/package/perl-json-tiny/Config.in
new file mode 100644
index 0000000..ce943ca
--- /dev/null
+++ b/package/perl-json-tiny/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_JSON_TINY
+	bool "perl-json-tiny"
+	help
+	  Minimalistic JSON. No dependencies.
+
+	  https://metacpan.org/release/JSON-Tiny
diff --git a/package/perl-json-tiny/perl-json-tiny.mk b/package/perl-json-tiny/perl-json-tiny.mk
new file mode 100644
index 0000000..fd99ee7
--- /dev/null
+++ b/package/perl-json-tiny/perl-json-tiny.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-json-tiny
+#
+################################################################################
+
+PERL_JSON_TINY_VERSION = 0.49
+PERL_JSON_TINY_SOURCE = JSON-Tiny-$(PERL_JSON_TINY_VERSION).tar.gz
+PERL_JSON_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAVIDO/
+PERL_JSON_TINY_DEPENDENCIES = perl
+PERL_JSON_TINY_LICENSE = Artistic-2.0
+PERL_JSON_TINY_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
