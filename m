From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 17 Jul 2014 18:33:02 +0200
Subject: [Buildroot] [PATCH 5/5] perl-gdgraph: new package
In-Reply-To: <1405614782-3667-1-git-send-email-francois.perrad@gadz.org>
References: <1405614782-3667-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1405614782-3667-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                    |  1 +
 package/perl-gdgraph/Config.in       | 12 ++++++++++++
 package/perl-gdgraph/perl-gdgraph.mk | 13 +++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/perl-gdgraph/Config.in
 create mode 100644 package/perl-gdgraph/perl-gdgraph.mk

diff --git a/package/Config.in b/package/Config.in
index 8a7801a..87d62ba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -429,6 +429,7 @@ endif
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 	source "package/perl-gd/Config.in"
+	source "package/perl-gdgraph/Config.in"
 	source "package/perl-gdtextutil/Config.in"
 	source "package/perl-io-socket-ssl/Config.in"
 	source "package/perl-mojolicious/Config.in"
diff --git a/package/perl-gdgraph/Config.in b/package/perl-gdgraph/Config.in
new file mode 100644
index 0000000..e722c06
--- /dev/null
+++ b/package/perl-gdgraph/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PERL_GDGRAPH
+	bool "perl-gdgraph"
+	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_PACKAGE_PERL_GD
+	select BR2_PACKAGE_PERL_GDTEXTUTIL
+	help
+	  Produces charts with GD
+
+	  https://metacpan.org/release/GDGraph
+
+comment "perl-gdgraph needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/perl-gdgraph/perl-gdgraph.mk b/package/perl-gdgraph/perl-gdgraph.mk
new file mode 100644
index 0000000..d71be3d
--- /dev/null
+++ b/package/perl-gdgraph/perl-gdgraph.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-gdgraph
+#
+################################################################################
+
+PERL_GDGRAPH_VERSION = 1.48
+PERL_GDGRAPH_SOURCE = GDGraph-$(PERL_GDGRAPH_VERSION).tar.gz
+PERL_GDGRAPH_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RUZ/
+PERL_GDGRAPH_DEPENDENCIES = perl perl-gd perl-gdtextutil
+PERL_GDGRAPH_LICENSE = Artistic or GPLv1+
+
+$(eval $(perl-package))
-- 
1.9.1
