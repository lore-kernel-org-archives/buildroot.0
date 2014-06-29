From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:50:14 +0200
Subject: [Buildroot] [git commit] perl-xml-sax: new package
Message-ID: <20140629085038.70F2A9D0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ef07071b6c8f83cb6cb2bb5f4f66940db05afe5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: split from the original patch of Francois.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/perl-xml-sax/Config.in       |    8 ++++++++
 package/perl-xml-sax/perl-xml-sax.mk |   14 ++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 927f133..010f61c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -427,6 +427,7 @@ menu "Perl libraries/modules"
 	source "package/perl-net-ssleay/Config.in"
 	source "package/perl-xml-namespacesupport/Config.in"
 	source "package/perl-xml-sax-base/Config.in"
+	source "package/perl-xml-sax/Config.in"
 endmenu
 endif
 	source "package/php/Config.in"
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
