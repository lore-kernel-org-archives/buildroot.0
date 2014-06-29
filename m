From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:50:17 +0200
Subject: [Buildroot] [git commit] perl-xml-libxml: new package
Message-ID: <20140629085038.7B3A39D0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f2faf78a5e0ea0bc24aa6589406082e63a52fb1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: split from the original patch of Francois.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |    1 +
 package/perl-xml-libxml/Config.in          |   10 ++++++++++
 package/perl-xml-libxml/perl-xml-libxml.mk |   14 ++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 010f61c..a486dd5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -425,6 +425,7 @@ if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-ssleay/Config.in"
+	source "package/perl-xml-libxml/Config.in"
 	source "package/perl-xml-namespacesupport/Config.in"
 	source "package/perl-xml-sax-base/Config.in"
 	source "package/perl-xml-sax/Config.in"
diff --git a/package/perl-xml-libxml/Config.in b/package/perl-xml-libxml/Config.in
new file mode 100644
index 0000000..9e3a44e
--- /dev/null
+++ b/package/perl-xml-libxml/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PERL_XML_LIBXML
+	bool "perl-xml-libxml"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_PERL_XML_NAMESPACESUPPORT
+	select BR2_PACKAGE_PERL_XML_SAX
+	help
+	  Interface to Gnome libxml2 xml parsing and DOM library
+
+	  https://bitbucket.org/shlomif/perl-xml-libxml
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
new file mode 100644
index 0000000..60a8633
--- /dev/null
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-xml-libxml
+#
+################################################################################
+
+PERL_XML_LIBXML_VERSION = 2.0116
+PERL_XML_LIBXML_SOURCE = XML-LibXML-$(PERL_XML_LIBXML_VERSION).tar.gz
+PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF/
+PERL_XML_LIBXML_DEPENDENCIES = perl zlib libxml2 perl-xml-sax perl-xml-namespacesupport
+PERL_XML_LIBXML_LICENSE = Artistic or GPLv1+
+PERL_XML_LIBXML_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
