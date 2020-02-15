From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2020 11:53:57 +0100
Subject: [Buildroot] [git commit] package/libhttpparser: bump to version
 2.9.3
Message-ID: <20200215105640.822788E0BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7faf7f9963618b02a465e1e185b2d2b1d767114
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also dropped patch that was pushed upstream

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-f-option-when-calling-ln-at-install-time.patch | 39 ----------------------
 package/libhttpparser/libhttpparser.hash           |  2 +-
 package/libhttpparser/libhttpparser.mk             |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/package/libhttpparser/0001-Use-f-option-when-calling-ln-at-install-time.patch b/package/libhttpparser/0001-Use-f-option-when-calling-ln-at-install-time.patch
deleted file mode 100644
index 70f16f662f..0000000000
--- a/package/libhttpparser/0001-Use-f-option-when-calling-ln-at-install-time.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 384917321c45e492b0ca7aaa94d4b15324aef95d Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 28 Aug 2015 19:02:11 +0200
-Subject: [PATCH] Use -f option when calling ln at install time
-
-This allows "make install; make install" to work properly.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Renaud AUBIN <root@renaud.io>
----
- Makefile | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 6cf63bd..c182e5c 100644
---- a/Makefile
-+++ b/Makefile
-@@ -133,14 +133,14 @@ tags: http_parser.c http_parser.h test.c
- install: library
- 	$(INSTALL) -D  http_parser.h $(DESTDIR)$(INCLUDEDIR)/http_parser.h
- 	$(INSTALL) -D $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(LIBNAME)
--	ln -s $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SONAME)
--	ln -s $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SOLIBNAME).$(SOEXT)
-+	ln -sf $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SONAME)
-+	ln -sf $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SOLIBNAME).$(SOEXT)
- 
- install-strip: library
- 	$(INSTALL) -D  http_parser.h $(DESTDIR)$(INCLUDEDIR)/http_parser.h
- 	$(INSTALL) -D -s $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(LIBNAME)
--	ln -s $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SONAME)
--	ln -s $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SOLIBNAME).$(SOEXT)
-+	ln -sf $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SONAME)
-+	ln -sf $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SOLIBNAME).$(SOEXT)
- 
- uninstall:
- 	rm $(DESTDIR)$(INCLUDEDIR)/http_parser.h
--- 
-2.6.2
-
diff --git a/package/libhttpparser/libhttpparser.hash b/package/libhttpparser/libhttpparser.hash
index a87c0ffa7a..4634b06620 100644
--- a/package/libhttpparser/libhttpparser.hash
+++ b/package/libhttpparser/libhttpparser.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 5199500e352584852c95c13423edc5f0cb329297c81dd69c3c8f52a75496da08  libhttpparser-2.9.2.tar.gz
+sha256 8fa0ab8770fd8425a9b431fdbf91623c4d7a9cdb842b9339289bd2b0b01b0d3d  libhttpparser-2.9.3.tar.gz
 sha256 79e6ba8b687cb54786207342b9b6fcee0ac10218453ed9009b84d949b2233cc0  LICENSE-MIT
diff --git a/package/libhttpparser/libhttpparser.mk b/package/libhttpparser/libhttpparser.mk
index 082fe12767..d7b6907493 100644
--- a/package/libhttpparser/libhttpparser.mk
+++ b/package/libhttpparser/libhttpparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTTPPARSER_VERSION = 2.9.2
+LIBHTTPPARSER_VERSION = 2.9.3
 LIBHTTPPARSER_SITE = $(call github,nodejs,http-parser,v$(LIBHTTPPARSER_VERSION))
 LIBHTTPPARSER_INSTALL_STAGING = YES
 LIBHTTPPARSER_LICENSE = MIT
