From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 23 Jun 2014 20:14:46 +0200
Subject: [Buildroot] [PATCH 3/3] perl-xml-libxml: new package
In-Reply-To: <1403547286-8858-1-git-send-email-francois.perrad@gadz.org>
References: <1403547286-8858-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1403547286-8858-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

and its CPAN dependencies

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                                          |  4 ++++
 package/perl-xml-libxml/Config.in                          | 10 ++++++++++
 package/perl-xml-libxml/perl-xml-libxml.mk                 | 14 ++++++++++++++
 package/perl-xml-namespacesupport/Config.in                |  6 ++++++
 .../perl-xml-namespacesupport/perl-xml-namespacesupport.mk | 13 +++++++++++++
 package/perl-xml-sax-base/Config.in                        |  6 ++++++
 package/perl-xml-sax-base/perl-xml-sax-base.mk             | 13 +++++++++++++
 package/perl-xml-sax/Config.in                             |  8 ++++++++
 package/perl-xml-sax/perl-xml-sax.mk                       | 14 ++++++++++++++
 9 files changed, 88 insertions(+)
 create mode 100644 package/perl-xml-libxml/Config.in
 create mode 100644 package/perl-xml-libxml/perl-xml-libxml.mk
 create mode 100644 package/perl-xml-namespacesupport/Config.in
 create mode 100644 package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
 create mode 100644 package/perl-xml-sax-base/Config.in
 create mode 100644 package/perl-xml-sax-base/perl-xml-sax-base.mk
 create mode 100644 package/perl-xml-sax/Config.in
 create mode 100644 package/perl-xml-sax/perl-xml-sax.mk

diff --git a/package/Config.in b/package/Config.in
index fb04014..5a380eb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -425,6 +425,10 @@ if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-ssleay/Config.in"
+	source "package/perl-xml-libxml/Config.in"
+	source "package/perl-xml-namespacesupport/Config.in"
+	source "package/perl-xml-sax-base/Config.in"
+	source "package/perl-xml-sax/Config.in"
 endmenu
 endif
 	source "package/php/Config.in"
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
diff --git a/package/perl-xml-namespacesupport/Config.in b/package/perl-xml-namespacesupport/Config.in
new file mode 100644
index 0000000..bc67d47
--- /dev/null
+++ b/package/perl-xml-namespacesupport/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_XML_NAMESPACESUPPORT
+	bool "perl-xml-namespacesupport"
+	help
+	  a simple generic namespace support class
+
+	  https://metacpan.org/release/XML-NamespaceSupport
diff --git a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
new file mode 100644
index 0000000..8b87a2f
--- /dev/null
+++ b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-xml-namespacesupport
+#
+################################################################################
+
+PERL_XML_NAMESPACESUPPORT_VERSION = 1.11
+PERL_XML_NAMESPACESUPPORT_SOURCE = XML-NamespaceSupport-$(PERL_XML_NAMESPACESUPPORT_VERSION).tar.gz
+PERL_XML_NAMESPACESUPPORT_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PERIGRIN/
+PERL_XML_NAMESPACESUPPORT_DEPENDENCIES = perl
+PERL_XML_NAMESPACESUPPORT_LICENSE = Artistic or GPLv1+
+
+$(eval $(perl-package))
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
diff --git a/package/perl-xml-sax/Config.in b/package/perl-xml-sax/Config.in
new file mode 100644
index 0000000..4f5567e
--- /dev/null
+++ b/package/perl-xml-sax/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PERL_XML_SAX
+	bool "perl-xml-sax"
+	select BR2_PACKAGE_PERL_XML_NAMESPACESUPPORT
+	select BR2_PACKAGE_PERL_XML_SAX_BASE
+	help
+	  Simple API for XML
+
+	  https://metacpan.org/release/XML-SAX
diff --git a/package/perl-xml-sax/perl-xml-sax.mk b/package/perl-xml-sax/perl-xml-sax.mk
new file mode 100644
index 0000000..83730c2
--- /dev/null
+++ b/package/perl-xml-sax/perl-xml-sax.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-xml-sax
+#
+################################################################################
+
+PERL_XML_SAX_VERSION = 0.99
+PERL_XML_SAX_SOURCE = XML-SAX-$(PERL_XML_SAX_VERSION).tar.gz
+PERL_XML_SAX_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM/
+PERL_XML_SAX_DEPENDENCIES = perl perl-xml-namespacesupport perl-xml-sax-base
+PERL_XML_SAX_LICENSE = Artistic or GPLv1+
+PERL_XML_SAX_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
1.9.1
