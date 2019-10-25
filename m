From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 15:50:45 +0200
Subject: [Buildroot] [git commit] package/jitterentropy-library: bump to
 version 2.2.0
Message-ID: <20191025143231.070E77FA96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1945d8a58b9af8b7180a5bf498d8b92025c6bb66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Refresh patch
- Update hash of COPYING (date updated, see
  https://github.com/smuellerDD/jitterentropy-library/commit/ab33ee759ff09a1c9b1184fb2e4614d82c355c2f)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Makefile-cleanup-install.patch            | 27 +++++++++++-----------
 .../jitterentropy-library.hash                     |  4 ++--
 .../jitterentropy-library/jitterentropy-library.mk |  2 +-
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/package/jitterentropy-library/0001-Makefile-cleanup-install.patch b/package/jitterentropy-library/0001-Makefile-cleanup-install.patch
index 7d209008c9..9c7e40369a 100644
--- a/package/jitterentropy-library/0001-Makefile-cleanup-install.patch
+++ b/package/jitterentropy-library/0001-Makefile-cleanup-install.patch
@@ -1,24 +1,26 @@
-From 83b1d46ae48eed576cf3dff0ffd7e772c8e638e4 Mon Sep 17 00:00:00 2001
+From 060b9b4147f6e5ff386a8b017796118d783e59fa Mon Sep 17 00:00:00 2001
 From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Mon, 9 Sep 2019 20:42:14 -0500
-Subject: [PATCH] Makefile: cleanup install
+Date: Tue, 22 Oct 2019 12:44:30 -0500
+Subject: [PATCH] Makefile: cleanup install for rebuilds
 
 Support the ability to rebuild and redeploy without a clean. This
-required some force linking and forced man archive creation.
+required some force linking and man archive creation.
 
 Provide the ability to override the stripping of the shared lib for
 cases where a embedded target build may want to control stripping
 or provide cross arch tools.
 
-Upstream: https://github.com/smuellerDD/jitterentropy-library/pull/10
-
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+Signed-off-by: Stephan Mueller <smueller@chronox.de>
+[Retrieved from:
+https://github.com/smuellerDD/jitterentropy-library/commit/060b9b4147f6e5ff386a8b017796118d783e59fa]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
- Makefile | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
+ Makefile | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 5e31276..a575f32 100644
+index 4ff069b..2e78607 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -14,6 +14,8 @@ LIBDIR := lib
@@ -30,7 +32,7 @@ index 5e31276..a575f32 100644
  NAME := jitterentropy
  LIBMAJOR=$(shell cat jitterentropy-base.c | grep define | grep MAJVERSION | awk '{print $$3}')
  LIBMINOR=$(shell cat jitterentropy-base.c | grep define | grep MINVERSION | awk '{print $$3}')
-@@ -49,14 +51,15 @@ scan:	$(OBJS)
+@@ -58,15 +60,15 @@ cppcheck:
  install:
  	install -d -m 0755 $(DESTDIR)$(PREFIX)/share/man/man3
  	install -m 644 doc/$(NAME).3 $(DESTDIR)$(PREFIX)/share/man/man3/
@@ -39,7 +41,7 @@ index 5e31276..a575f32 100644
  	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(LIBDIR)
 -	install -m 0755 -s lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
 +	$(INSTALL_STRIP) -m 0755 lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
-+	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(INCDIR)
+ 	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(INCDIR)
  	install -m 0644 jitterentropy.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
  	install -m 0644 jitterentropy-base-user.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
  	$(RM) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
@@ -50,6 +52,3 @@ index 5e31276..a575f32 100644
  
  clean:
  	@- $(RM) $(NAME)
--- 
-2.17.1
-
diff --git a/package/jitterentropy-library/jitterentropy-library.hash b/package/jitterentropy-library/jitterentropy-library.hash
index 5846f2147d..5ff38f6fea 100644
--- a/package/jitterentropy-library/jitterentropy-library.hash
+++ b/package/jitterentropy-library/jitterentropy-library.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256	38519115c6b750b7fa15547826123a7821b271535c168823259e609b42847223  jitterentropy-library-2.1.2.tar.gz
-sha256	c3352794eff829a3c8097b77e4cbc9f1faf5c3f47a8abed960a0f411cbc6ab9f  COPYING
+sha256	42d4bd1050b5f0d7b45b5453e5b6cfc45c0492bb428791f571d8f69b066351a4  jitterentropy-library-2.2.0.tar.gz
+sha256	96b5a6b49aaeeba9036f9b80e6e299d613a8eca158741a25a67dc78792413e23  COPYING
 sha256	13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  COPYING.bsd
 sha256	e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING.gplv2
diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
index 4e791e19dd..7ce52aa9ad 100644
--- a/package/jitterentropy-library/jitterentropy-library.mk
+++ b/package/jitterentropy-library/jitterentropy-library.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JITTERENTROPY_LIBRARY_VERSION = 2.1.2
+JITTERENTROPY_LIBRARY_VERSION = 2.2.0
 JITTERENTROPY_LIBRARY_SITE = $(call github,smuellerDD,$(JITTERENTROPY_LIBRARY_NAME),v$(JITTERENTROPY_LIBRARY_VERSION))
 JITTERENTROPY_LIBRARY_LICENSE = GPL-2.0 or BSD-3-Clause
 JITTERENTROPY_LIBRARY_LICENSE_FILES = COPYING COPYING.bsd COPYING.gplv2
