From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Mar 2018 23:00:44 +0100
Subject: [Buildroot] [git commit] package/libhttpparser: bump version to
 2.8.0
Message-ID: <20180309221058.1A0C382901@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a646da62850a6e4e38d422988e1c5bd123943cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-f-option-when-calling-ln-at-install-time.patch | 30 ++++++++++++----------
 package/libhttpparser/libhttpparser.hash           |  2 +-
 package/libhttpparser/libhttpparser.mk             |  2 +-
 3 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/package/libhttpparser/0001-Use-f-option-when-calling-ln-at-install-time.patch b/package/libhttpparser/0001-Use-f-option-when-calling-ln-at-install-time.patch
index df166565f9..70f16f662f 100644
--- a/package/libhttpparser/0001-Use-f-option-when-calling-ln-at-install-time.patch
+++ b/package/libhttpparser/0001-Use-f-option-when-calling-ln-at-install-time.patch
@@ -8,28 +8,32 @@ This allows "make install; make install" to work properly.
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Renaud AUBIN <root@renaud.io>
 ---
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ Makefile | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 33c8ba0..b36d95a 100644
+index 6cf63bd..c182e5c 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -125,12 +125,12 @@ tags: http_parser.c http_parser.h test.c
+@@ -133,14 +133,14 @@ tags: http_parser.c http_parser.h test.c
  install: library
- 	$(INSTALL) -D  http_parser.h $(INCLUDEDIR)/http_parser.h
- 	$(INSTALL) -D $(SONAME) $(LIBDIR)/$(SONAME)
--	ln -s $(LIBDIR)/$(SONAME) $(LIBDIR)/libhttp_parser.$(SOEXT)
-+	ln -sf $(LIBDIR)/$(SONAME) $(LIBDIR)/libhttp_parser.$(SOEXT)
+ 	$(INSTALL) -D  http_parser.h $(DESTDIR)$(INCLUDEDIR)/http_parser.h
+ 	$(INSTALL) -D $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(LIBNAME)
+-	ln -s $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SONAME)
+-	ln -s $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SOLIBNAME).$(SOEXT)
++	ln -sf $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SONAME)
++	ln -sf $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SOLIBNAME).$(SOEXT)
  
  install-strip: library
- 	$(INSTALL) -D  http_parser.h $(INCLUDEDIR)/http_parser.h
- 	$(INSTALL) -D -s $(SONAME) $(LIBDIR)/$(SONAME)
--	ln -s $(LIBDIR)/$(SONAME) $(LIBDIR)/libhttp_parser.$(SOEXT)
-+	ln -sf $(LIBDIR)/$(SONAME) $(LIBDIR)/libhttp_parser.$(SOEXT)
+ 	$(INSTALL) -D  http_parser.h $(DESTDIR)$(INCLUDEDIR)/http_parser.h
+ 	$(INSTALL) -D -s $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(LIBNAME)
+-	ln -s $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SONAME)
+-	ln -s $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SOLIBNAME).$(SOEXT)
++	ln -sf $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SONAME)
++	ln -sf $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SOLIBNAME).$(SOEXT)
  
  uninstall:
- 	rm $(INCLUDEDIR)/http_parser.h
+ 	rm $(DESTDIR)$(INCLUDEDIR)/http_parser.h
 -- 
 2.6.2
 
diff --git a/package/libhttpparser/libhttpparser.hash b/package/libhttpparser/libhttpparser.hash
index a1b772e54c..8ffceb24d9 100644
--- a/package/libhttpparser/libhttpparser.hash
+++ b/package/libhttpparser/libhttpparser.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 70409ad324e5de2da6a0f39e859e566d497c1ff0a249c0c38a5012df91b386b3  libhttpparser-v2.7.1.tar.gz
+sha256 7277c6f99bf6fc272eb5d8fc3dca01e7cc1d4ae609b5d2c5d5e18added98479d  libhttpparser-v2.8.0.tar.gz
diff --git a/package/libhttpparser/libhttpparser.mk b/package/libhttpparser/libhttpparser.mk
index 1df26017e7..5f50d877d9 100644
--- a/package/libhttpparser/libhttpparser.mk
+++ b/package/libhttpparser/libhttpparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTTPPARSER_VERSION = v2.7.1
+LIBHTTPPARSER_VERSION = v2.8.0
 LIBHTTPPARSER_SITE = $(call github,nodejs,http-parser,$(LIBHTTPPARSER_VERSION))
 LIBHTTPPARSER_INSTALL_STAGING = YES
 LIBHTTPPARSER_LICENSE = MIT
