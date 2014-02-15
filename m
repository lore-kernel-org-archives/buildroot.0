From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 16 Feb 2014 00:57:47 +0100
Subject: [Buildroot] [PATCH 1/2] imagemagick: disable documentation
Message-ID: <1392508668-27561-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no options to disable the documentation,
so remove it directly in Makefile.am

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 .../imagemagick/imagemagick-02-disable-doc.patch   | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/imagemagick/imagemagick-02-disable-doc.patch

diff --git a/package/imagemagick/imagemagick-02-disable-doc.patch b/package/imagemagick/imagemagick-02-disable-doc.patch
new file mode 100644
index 0000000..b4ffec4
--- /dev/null
+++ b/package/imagemagick/imagemagick-02-disable-doc.patch
@@ -0,0 +1,47 @@
+imagemagick: disable doc
+
+There is no options to disable the documentation,
+so remove it directly in Makefile.am
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Makefile.am | 13 +++----------
+ 1 file changed, 3 insertions(+), 10 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index c74a870..813c65e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -157,18 +157,11 @@ pkgconfig_DATA = \
+ 	cp -f $^ $@
+ 
+ # Manual pages to install
+-man_MANS = \
+-	$(MAGICK_MANS) \
+-	$(WAND_MANS) \
+-	$(MAGICKPP_MANS) \
+-	$(UTILITIES_MANS)
++man_MANS = 
+ 
+ # Architecture independent data files installed in the package's data directory
+ docdir = $(DOCUMENTATION_PATH)
+-doc_DATA = \
+-	LICENSE \
+-	ChangeLog \
+-	NEWS.txt
++doc_DATA = 
+ 
+ if MAINTAINER_MODE
+ MAINTAINER_TARGETS = \
+@@ -236,7 +229,7 @@ pkgdocdir = $(DOCUMENTATION_PATH)
+ DOCDIRSDOXYGEN = www/api/MagickCore www/api/MagickWand
+ DOCDIRSMANUAL = images images/patterns www www/api www/source www/Magick++
+ DOCDIRS= $(DOCDIRSMANUAL) $(DOCDIRSDOXYGEN)
+-HTML_INSTALL_DATA_TARGETS = install-data-html
++HTML_INSTALL_DATA_TARGETS = 
+ install-data-html:
+ 	$(mkinstalldirs) $(DESTDIR)$(pkgdocdir)
+ 	$(INSTALL_DATA) $(srcdir)/index.html $(DESTDIR)$(pkgdocdir)
+-- 
+1.8.5.3
+
-- 
1.8.5.3
