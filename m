From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 18 Jul 2014 15:43:39 +0200
Subject: [Buildroot] [PATCH 4/4] perl-gdgraph: new package
In-Reply-To: <1405691019-10397-1-git-send-email-francois.perrad@gadz.org>
References: <1405691019-10397-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1405691019-10397-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                    |  1 +
 package/perl-gdgraph/Config.in       | 12 ++++++++++++
 package/perl-gdgraph/perl-gdgraph.mk | 14 ++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/perl-gdgraph/Config.in
 create mode 100644 package/perl-gdgraph/perl-gdgraph.mk

diff --git a/package/Config.in b/package/Config.in
index 701b021..15911c9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -431,6 +431,7 @@ endif
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
index 0000000..856c91c
--- /dev/null
+++ b/package/perl-gdgraph/perl-gdgraph.mk
@@ -0,0 +1,14 @@
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
+PERL_GDGRAPH_LICENSE_FILES = Dustismo.LICENSE
+
+$(eval $(perl-package))
-- 
1.9.1
