From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Dec 2015 17:47:51 +0100
Subject: [Buildroot] [git commit] libhttpparser: bump to 2.6.0
Message-ID: <20151201232125.938B081D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e280283b7d4f4a7f7bb17edeea84dbb4fe09383
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The http-parser repository has been transfered from joyent to nodejs.
Bump version to 2.6.0.

Signed-off-by: Renaud AUBIN <root@renaud.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...1-Use-f-option-when-calling-ln-at-install-time.patch | 17 +++++++++--------
 package/libhttpparser/Config.in                         |  2 +-
 package/libhttpparser/libhttpparser.mk                  |  4 ++--
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/package/libhttpparser/0001-Use-f-option-when-calling-ln-at-install-time.patch b/package/libhttpparser/0001-Use-f-option-when-calling-ln-at-install-time.patch
index 29fe04d..df16656 100644
--- a/package/libhttpparser/0001-Use-f-option-when-calling-ln-at-install-time.patch
+++ b/package/libhttpparser/0001-Use-f-option-when-calling-ln-at-install-time.patch
@@ -1,4 +1,4 @@
-From d9dfeca8736318eaad5cd4554cbae059469decde Mon Sep 17 00:00:00 2001
+From 384917321c45e492b0ca7aaa94d4b15324aef95d Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Fri, 28 Aug 2015 19:02:11 +0200
 Subject: [PATCH] Use -f option when calling ln at install time
@@ -6,29 +6,30 @@ Subject: [PATCH] Use -f option when calling ln at install time
 This allows "make install; make install" to work properly.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Renaud AUBIN <root@renaud.io>
 ---
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 373709c..6206b09 100644
+index 33c8ba0..b36d95a 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -113,12 +113,12 @@ tags: http_parser.c http_parser.h test.c
+@@ -125,12 +125,12 @@ tags: http_parser.c http_parser.h test.c
  install: library
  	$(INSTALL) -D  http_parser.h $(INCLUDEDIR)/http_parser.h
  	$(INSTALL) -D $(SONAME) $(LIBDIR)/$(SONAME)
--	ln -s $(LIBDIR)/$(SONAME) $(LIBDIR)/libhttp_parser.so
-+	ln -sf $(LIBDIR)/$(SONAME) $(LIBDIR)/libhttp_parser.so
+-	ln -s $(LIBDIR)/$(SONAME) $(LIBDIR)/libhttp_parser.$(SOEXT)
++	ln -sf $(LIBDIR)/$(SONAME) $(LIBDIR)/libhttp_parser.$(SOEXT)
  
  install-strip: library
  	$(INSTALL) -D  http_parser.h $(INCLUDEDIR)/http_parser.h
  	$(INSTALL) -D -s $(SONAME) $(LIBDIR)/$(SONAME)
--	ln -s $(LIBDIR)/$(SONAME) $(LIBDIR)/libhttp_parser.so
-+	ln -sf $(LIBDIR)/$(SONAME) $(LIBDIR)/libhttp_parser.so
+-	ln -s $(LIBDIR)/$(SONAME) $(LIBDIR)/libhttp_parser.$(SOEXT)
++	ln -sf $(LIBDIR)/$(SONAME) $(LIBDIR)/libhttp_parser.$(SOEXT)
  
  uninstall:
  	rm $(INCLUDEDIR)/http_parser.h
 -- 
-2.5.0
+2.6.2
 
diff --git a/package/libhttpparser/Config.in b/package/libhttpparser/Config.in
index 31b8b9b..4356304 100644
--- a/package/libhttpparser/Config.in
+++ b/package/libhttpparser/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_LIBHTTPPARSER
 	  40 bytes of data per message stream (in a web server
 	  that is per connection).
 
-	  https://github.com/joyent/http-parser
+	  https://github.com/nodejs/http-parser
 
 comment "libhttpparser needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/libhttpparser/libhttpparser.mk b/package/libhttpparser/libhttpparser.mk
index d6ec236..015efc0 100644
--- a/package/libhttpparser/libhttpparser.mk
+++ b/package/libhttpparser/libhttpparser.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBHTTPPARSER_VERSION = v2.5.0
-LIBHTTPPARSER_SITE = $(call github,joyent,http-parser,$(LIBHTTPPARSER_VERSION))
+LIBHTTPPARSER_VERSION = v2.6.0
+LIBHTTPPARSER_SITE = $(call github,nodejs,http-parser,$(LIBHTTPPARSER_VERSION))
 LIBHTTPPARSER_INSTALL_STAGING = YES
 LIBHTTPPARSER_LICENSE = MIT
 LIBHTTPPARSER_LICENSE_FILES = LICENSE-MIT
