From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:49:50 +0200
Subject: [Buildroot] [git commit] perl-xml-namespacesupport: new package
Message-ID: <20140629085038.57DC59BBA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8895cb5ddff7ece4e6deffe97c5a13bd231bd9ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: split from the original patch of Francois.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/perl-xml-namespacesupport/Config.in        |    6 ++++++
 .../perl-xml-namespacesupport.mk                   |   13 +++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 01a91b6..4c62f82 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -425,6 +425,7 @@ if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-ssleay/Config.in"
+	source "package/perl-xml-namespacesupport/Config.in"
 endmenu
 endif
 	source "package/php/Config.in"
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
