From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 May 2012 07:36:30 +0200
Subject: [Buildroot] [git commit branch/next] mxml: bump version to 2.7
Message-ID: <20120516061259.994A996D13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca32d33ff5c15fd71946bf5dd3c71044f9424377
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...ch => mxml-fix-cross-target-installation.patch} |   24 ++++++++++---------
 package/mxml/mxml.mk                               |    4 +-
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/package/mxml/mxml-2.6-fix-cross-target-installation.patch b/package/mxml/mxml-fix-cross-target-installation.patch
similarity index 68%
rename from package/mxml/mxml-2.6-fix-cross-target-installation.patch
rename to package/mxml/mxml-fix-cross-target-installation.patch
index 62b6bbc..3a9fa0c 100644
--- a/package/mxml/mxml-2.6-fix-cross-target-installation.patch
+++ b/package/mxml/mxml-fix-cross-target-installation.patch
@@ -10,10 +10,10 @@ The added patch is a workaround for cross build as follows:
 
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
-diff -Nuar mxml-2.6-dist//Makefile.in mxml-2.6/Makefile.in
---- mxml-2.6-dist//Makefile.in	2008-12-06 06:20:38.000000000 +0200
-+++ mxml-2.6/Makefile.in	2011-07-13 07:25:36.615999491 +0300
-@@ -59,7 +59,7 @@
+diff -Nuar mxml-2.7-orig/Makefile.in mxml-2.7/Makefile.in
+--- mxml-2.7-orig/Makefile.in	2011-04-13 18:43:32.000000000 +0300
++++ mxml-2.7/Makefile.in	2012-05-16 07:21:42.677220980 +0300
+@@ -57,7 +57,7 @@
  # Install commands...
  #
  
@@ -23,7 +23,7 @@ diff -Nuar mxml-2.6-dist//Makefile.in mxml-2.6/Makefile.in
  INSTALL_DIR	=	$(INSTALL) -d
  INSTALL_LIB	=	$(LIBTOOL) $(INSTALL) -m 755
 @@ -88,7 +88,7 @@
- 			mxml-node.o mxml-search.o mxml-set.o
+ 			mxml-index.o mxml-node.o mxml-search.o mxml-set.o
  LIBOBJS		=	$(PUBLIBOBJS) mxml-private.o mxml-string.o
  OBJS		=	mxmldoc.o testmxml.o $(LIBOBJS)
 -TARGETS		=	$(LIBMXML) mxmldoc testmxml mxml.xml doc/mxml.man
@@ -31,23 +31,25 @@ diff -Nuar mxml-2.6-dist//Makefile.in mxml-2.6/Makefile.in
  
  
  #
-@@ -134,8 +134,6 @@
+@@ -140,9 +140,6 @@
  #
  
  install:	$(TARGETS) install-$(LIBMXML) install-libmxml.a
+-	echo Installing mxmldoc in $(BUILDROOT)$(bindir)...
 -	$(INSTALL_DIR) $(BUILDROOT)$(bindir)
--	$(INSTALL_BIN) mxmldoc $(BUILDROOT)$(bindir) 
+-	$(INSTALL_BIN) mxmldoc $(BUILDROOT)$(bindir)
+ 	echo Installing documentation in $(BUILDROOT)$(docdir)...
  	$(INSTALL_DIR) $(BUILDROOT)$(docdir)
  	for file in $(DOCFILES); do \
- 		$(INSTALL_MAN) $$file $(BUILDROOT)$(docdir); \
-@@ -144,10 +142,6 @@
- 	$(INSTALL_DATA) mxml.h $(BUILDROOT)$(includedir)
+@@ -154,11 +151,6 @@
+ 	echo Installing pkgconfig files in $(BUILDROOT)$(libdir)/pkgconfig...
  	$(INSTALL_DIR) $(BUILDROOT)$(libdir)/pkgconfig
  	$(INSTALL_DATA) mxml.pc $(BUILDROOT)$(libdir)/pkgconfig
+-	echo Installing man pages in $(BUILDROOT)$(mandir)...
 -	$(INSTALL_DIR) $(BUILDROOT)$(mandir)/man1
 -	$(INSTALL_MAN) doc/mxmldoc.man $(BUILDROOT)$(mandir)/man1/mxmldoc.1
 -	$(INSTALL_DIR) $(BUILDROOT)$(mandir)/man3
 -	$(INSTALL_MAN) doc/mxml.man $(BUILDROOT)$(mandir)/man3/mxml.3
  
  install-libmxml.a:
- 	$(INSTALL_DIR) $(BUILDROOT)$(libdir)
+ 	echo Installing libmxml.a to $(BUILDROOT)$(libdir)...
diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index c05c3a7..ca54a54 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -3,8 +3,8 @@
 # mxml
 #
 #############################################################
-MXML_VERSION = 2.6
-MXML_SITE = http://ftp.easysw.com/pub/mxml/2.6
+MXML_VERSION = 2.7
+MXML_SITE = http://ftp.easysw.com/pub/mxml/$(MXML_VERSION)
 MXML_INSTALL_STAGING = YES
 
 MXML_INSTALL_STAGING_OPT = DSTROOT=$(STAGING_DIR) install
