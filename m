From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri,  3 Nov 2017 15:43:31 +0100
Subject: [Buildroot] [PATCH] package/mono: bump to version 5.4.0.201
Message-ID: <1509720211-9625-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps mono to version 5.4.0.201 and monolite
to version 1050400003.
It also removes a patch not needed anymore.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 ...-monodoc-Fixing-wrong-monodoc-search-path.patch | 29 ----------------------
 package/mono/mono.hash                             |  2 +-
 package/mono/mono.mk                               |  2 +-
 package/monolite/monolite.hash                     |  2 +-
 package/monolite/monolite.mk                       |  6 ++---
 5 files changed, 6 insertions(+), 35 deletions(-)
 delete mode 100644 package/mono/0008-monodoc-Fixing-wrong-monodoc-search-path.patch

diff --git a/package/mono/0008-monodoc-Fixing-wrong-monodoc-search-path.patch b/package/mono/0008-monodoc-Fixing-wrong-monodoc-search-path.patch
deleted file mode 100644
index 58fa323..0000000
--- a/package/mono/0008-monodoc-Fixing-wrong-monodoc-search-path.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 18bba65adf58d54645398de26eac24081d48f793 Mon Sep 17 00:00:00 2001
-From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
-Date: Thu, 25 Feb 2016 22:19:31 +0100
-Subject: [PATCH] mcs/class/monodoc/Makefile: Fixing wrong monodoc search path
-
-mono_libdir actually leaks host compiler path, fixing
-by hardcoding correct path for our usecase.
-
-Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
----
- mcs/class/monodoc/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mcs/class/monodoc/Makefile b/mcs/class/monodoc/Makefile
-index 3ebba80..ddc2098 100644
---- a/mcs/class/monodoc/Makefile
-+++ b/mcs/class/monodoc/Makefile
-@@ -135,7 +135,7 @@ test-local: setup-doc-sources
- dist-local: Monodoc.Ecma/EcmaUrlParser.cs
- 
- $(the_lib).config: Makefile monodoc.dll.config.in
--	sed 's, at monodoc_refdir@,$(mono_libdir)/monodoc,g' monodoc.dll.config.in > $@
-+	sed 's, at monodoc_refdir@,/usr/lib/monodoc,g' monodoc.dll.config.in > $@
- 
- Monodoc.Ecma/EcmaUrlParser.cs: Monodoc.Ecma/EcmaUrlParser.jay $(topdir)/jay/skeleton.cs jay.sh
- 	$(topdir)/$(thisdir)/jay.sh $(topdir) $< $@ $(JAY_FLAGS)
--- 
-1.9.1
-
diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index 9af7ce3..8503950 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 03b8e463032bc425673dec844b35b4c669f5b99b0e45521195efb3741a9f5e94  mono-5.2.0.224.tar.bz2
+sha256 2a2f5c2a214a9980c086ac7561a5dd106f13d823a630de218eabafe1d995c5b4  mono-5.4.0.201.tar.bz2
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 838963d..802c1d4 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 5.2.0.224
+MONO_VERSION = 5.4.0.201
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
index 0d4fff8..76f5467 100644
--- a/package/monolite/monolite.hash
+++ b/package/monolite/monolite.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 56f313da5f7137fae86db6af1476df0cf6515cedea46369347c4159ed7ce3300  monolite-1050200001-latest.tar.gz
+sha256 8c893c3eb3efb5006e19fb45a878860265c3f47fbaf2470be47612e84725d9fd  monolite-linux-1050400003-latest.tar.gz
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index 78e698a..80b2af9 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MONOLITE_VERSION = 1050200001
-MONOLITE_SITE = http://download.mono-project.com/monolite/
-MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
+MONOLITE_VERSION = 1050400003
+MONOLITE_SITE = http://download.mono-project.com/monolite
+MONOLITE_SOURCE = monolite-linux-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPL-2.0 or commercial
 
 define HOST_MONOLITE_INSTALL_CMDS
-- 
2.7.4
