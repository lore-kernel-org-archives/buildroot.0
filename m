From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 15:00:18 +0200
Subject: [Buildroot] [git commit] perl-xml-libxml: fix build
Message-ID: <20140701130717.C1EA19D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42ecaf45dc372de1bbdfd3ca120c17e981ebac33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

see http://autobuild.buildroot.net/results/f80/f809c99ce4db80e64ca46865fcd9b75b0dcc1fcd/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../perl-xml-libxml-01-Makefile-PL.patch           |   18 ++++++++++++++++++
 package/perl-xml-libxml/perl-xml-libxml.mk         |    5 +++++
 2 files changed, 23 insertions(+), 0 deletions(-)

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
