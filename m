From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:50:10 +0200
Subject: [Buildroot] [git commit] perl-xml-sax-base: new package
Message-ID: <20140629085038.63F439BBA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d413117c41f72621f3dc854f8e55c1b793b64f4a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: split from the original patch of Francois.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                              |    1 +
 package/perl-xml-sax-base/Config.in            |    6 ++++++
 package/perl-xml-sax-base/perl-xml-sax-base.mk |   13 +++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4c62f82..927f133 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -426,6 +426,7 @@ menu "Perl libraries/modules"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-ssleay/Config.in"
 	source "package/perl-xml-namespacesupport/Config.in"
+	source "package/perl-xml-sax-base/Config.in"
 endmenu
 endif
 	source "package/php/Config.in"
diff --git a/package/perl-xml-sax-base/Config.in b/package/perl-xml-sax-base/Config.in
new file mode 100644
index 0000000..2ad25ac
--- /dev/null
+++ b/package/perl-xml-sax-base/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_XML_SAX_BASE
+	bool "perl-xml-sax-base"
+	help
+	  Base class for SAX Drivers and Filters
+
+	  https://metacpan.org/release/XML-SAX-Base
diff --git a/package/perl-xml-sax-base/perl-xml-sax-base.mk b/package/perl-xml-sax-base/perl-xml-sax-base.mk
new file mode 100644
index 0000000..0e8c67b
--- /dev/null
+++ b/package/perl-xml-sax-base/perl-xml-sax-base.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-xml-sax-base
+#
+################################################################################
+
+PERL_XML_SAX_BASE_VERSION = 1.08
+PERL_XML_SAX_BASE_SOURCE = XML-SAX-Base-$(PERL_XML_SAX_BASE_VERSION).tar.gz
+PERL_XML_SAX_BASE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM/
+PERL_XML_SAX_BASE_DEPENDENCIES = perl
+PERL_XML_SAX_BASE_LICENSE = Artistic or GPLv1+
+
+$(eval $(perl-package))
