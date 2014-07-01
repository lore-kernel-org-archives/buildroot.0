From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  1 Jul 2014 10:18:40 +0200
Subject: [Buildroot] [PATCH] perl-xml-libxml: fix build
Message-ID: <1404202720-24188-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see http://autobuild.buildroot.net/results/f80/f809c99ce4db80e64ca46865fcd9b75b0dcc1fcd/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-xml-libxml-01-Makefile-PL.patch               | 18 ++++++++++++++++++
 package/perl-xml-libxml/perl-xml-libxml.mk             |  5 +++++
 2 files changed, 23 insertions(+)
 create mode 100644 package/perl-xml-libxml/perl-xml-libxml-01-Makefile-PL.patch

diff --git a/package/perl-xml-libxml/perl-xml-libxml-01-Makefile-PL.patch b/package/perl-xml-libxml/perl-xml-libxml-01-Makefile-PL.patch
new file mode 100644
index 0000000..ce2724c
--- /dev/null
+++ b/package/perl-xml-libxml/perl-xml-libxml-01-Makefile-PL.patch
@@ -0,0 +1,18 @@
+fake check_lib for cross-compilation
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/Makefile.PL
+===================================================================
+--- a/Makefile.PL
++++ b/Makefile.PL
+@@ -84,8 +84,7 @@
+ # -------------------------------------------------------------------------- #
+ # -------------------------------------------------------------------------- #
+ 
+-use lib qw(inc);
+-use Devel::CheckLib;
++sub check_lib { return 1; }
+ 
+ # Prompt the user here for any paths and other configuration
+ 
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
index 60a8633..31ff06e 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.mk
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -11,4 +11,9 @@ PERL_XML_LIBXML_DEPENDENCIES = perl zlib libxml2 perl-xml-sax perl-xml-namespace
 PERL_XML_LIBXML_LICENSE = Artistic or GPLv1+
 PERL_XML_LIBXML_LICENSE_FILES = LICENSE
 
+PERL_XML_LIBXML_CONF_OPT = \
+	LIBS="-L $(STAGING_DIR)/usr/lib" \
+	INC="-I $(STAGING_DIR)/usr/include/libxml2" \
+	NO_THREADS
+
 $(eval $(perl-package))
-- 
1.9.1
