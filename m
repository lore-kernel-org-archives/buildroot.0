From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 14:46:58 +0200
Subject: [Buildroot] [git commit] perl-xml-libxml: bump to version 2.0126
Message-ID: <20160723125541.3960580AE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4f37eb633b7a12f418bb791f870d1d260c4efa1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-xml-libxml/Config.in            | 3 ++-
 package/perl-xml-libxml/perl-xml-libxml.hash | 4 ++--
 package/perl-xml-libxml/perl-xml-libxml.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/perl-xml-libxml/Config.in b/package/perl-xml-libxml/Config.in
index 44fe710..fb15e10 100644
--- a/package/perl-xml-libxml/Config.in
+++ b/package/perl-xml-libxml/Config.in
@@ -5,10 +5,11 @@ config BR2_PACKAGE_PERL_XML_LIBXML
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PERL_XML_NAMESPACESUPPORT
 	select BR2_PACKAGE_PERL_XML_SAX
+	select BR2_PACKAGE_PERL_XML_SAX_BASE
 	help
 	  Interface to Gnome libxml2 xml parsing and DOM library
 
-	  https://bitbucket.org/shlomif/perl-xml-libxml
+	  https://github.com/shlomif/perl-XML-LibXML
 
 comment "perl-xml-libxml needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/perl-xml-libxml/perl-xml-libxml.hash b/package/perl-xml-libxml/perl-xml-libxml.hash
index 782cf5c..1d42bf2 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.hash
+++ b/package/perl-xml-libxml/perl-xml-libxml.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    c9eb502f8aa2586c4a4dce3c784a2a0b XML-LibXML-2.0123.tar.gz
-sha256 0525a2491f152cadee8c63550c79a380fb393851fdfc4c1e6cd5f0f92614f7c4 XML-LibXML-2.0123.tar.gz
+md5    c6007524ddec3be6cfbb8f68f5aa791c XML-LibXML-2.0126.tar.gz
+sha256 0e735ab72e2ba77070a58a737fd6c61fa6aa198527abc59a5d5627f0650a60af XML-LibXML-2.0126.tar.gz
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
index 9d7216a..66c606b 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.mk
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PERL_XML_LIBXML_VERSION = 2.0123
+PERL_XML_LIBXML_VERSION = 2.0126
 PERL_XML_LIBXML_SOURCE = XML-LibXML-$(PERL_XML_LIBXML_VERSION).tar.gz
 PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF
-PERL_XML_LIBXML_DEPENDENCIES = zlib libxml2 perl-xml-sax perl-xml-namespacesupport
+PERL_XML_LIBXML_DEPENDENCIES = zlib libxml2 perl-xml-namespacesupport perl-xml-sax perl-xml-sax-base
 PERL_XML_LIBXML_LICENSE = Artistic or GPLv1+
 PERL_XML_LIBXML_LICENSE_FILES = LICENSE
 
