From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 21 Nov 2013 13:35:19 +0100
Subject: [Buildroot] [pkg-perl infra V2 12/12] libxml-libxml-perl: new
	package
In-Reply-To: <1385037319-2456-1-git-send-email-francois.perrad@gadz.org>
References: <1385037319-2456-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1385037319-2456-12-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(depends on libxml2 & zlib)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cpan/Config.in                             |    1 +
 package/cpan/libxml-libxml-perl/Config.in          |    9 ++++++++
 .../cpan/libxml-libxml-perl/libxml-libxml-perl.mk  |   22 ++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/cpan/libxml-libxml-perl/Config.in
 create mode 100644 package/cpan/libxml-libxml-perl/libxml-libxml-perl.mk

diff --git a/package/cpan/Config.in b/package/cpan/Config.in
index 8574978..62f9fa4 100644
--- a/package/cpan/Config.in
+++ b/package/cpan/Config.in
@@ -1,2 +1,3 @@
 source "package/cpan/libcurses-perl/Config.in"
 source "package/cpan/libnet-ssleay-perl/Config.in"
+source "package/cpan/libxml-libxml-perl/Config.in"
diff --git a/package/cpan/libxml-libxml-perl/Config.in b/package/cpan/libxml-libxml-perl/Config.in
new file mode 100644
index 0000000..19aa55c
--- /dev/null
+++ b/package/cpan/libxml-libxml-perl/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBXML_LIBXML_PERL
+	bool "libxml-libxml-perl"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBXML_SAX_PERL
+	select BR2_PACKAGE_LIBXML_NAMESPACESUPPORT_PERL
+	help
+	  Interface to Gnome libxml2 xml parsing and DOM library
+
diff --git a/package/cpan/libxml-libxml-perl/libxml-libxml-perl.mk b/package/cpan/libxml-libxml-perl/libxml-libxml-perl.mk
new file mode 100644
index 0000000..5d7d0c2
--- /dev/null
+++ b/package/cpan/libxml-libxml-perl/libxml-libxml-perl.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# libxml-libxml-perl
+#
+################################################################################
+
+LIBXML_LIBXML_PERL_VERSION = 2.0107
+LIBXML_LIBXML_PERL_AUTHOR = SHLOMIF
+LIBXML_LIBXML_PERL_SOURCE = XML-LibXML-$(LIBXML_LIBXML_PERL_VERSION).tar.gz
+LIBXML_LIBXML_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF/
+LIBXML_LIBXML_PERL_DEPENDENCIES = perl zlib libxml2 libxml-sax-perl libxml-namespacesupport-perl
+HOST_LIBXML_LIBXML_PERL_DEPENDENCIES = host-libxml2 host-zlib host-libxml-sax-perl host-libxml-namespacesupport-perl
+LIBXML_LIBXML_PERL_LICENSE = perl_5
+
+LIBXML_LIBXML_PERL_CONF_OPT += LIBS=-L$(STAGING_DIR)/usr/lib
+LIBXML_LIBXML_PERL_CONF_OPT += INC=-I$(STAGING_DIR)/usr/include/libxml2
+
+HOST_LIBXML_LIBXML_PERL_CONF_OPT += LIBS=-L$(HOST_DIR)/usr/lib
+HOST_LIBXML_LIBXML_PERL_CONF_OPT += INC=-I$(HOST_DIR)/usr/include/libxml2
+
+$(eval $(perl-package))
+$(eval $(host-perl-package))
-- 
1.7.9.5
