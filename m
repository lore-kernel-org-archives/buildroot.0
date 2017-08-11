From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 11 Aug 2017 10:14:05 +0200
Subject: [Buildroot] [PATCH 2/2] package/mono: bump to version 5.0.1.1
In-Reply-To: <1502439245-18039-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1502439245-18039-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1502439245-18039-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps to mono 5.0.1.1 and updates the unit tests patch
accordingly.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 .../0006-Remove-unit-tests-from-mono-compilation.patch     | 14 +++++++-------
 package/mono/mono.hash                                     |  2 +-
 package/mono/mono.mk                                       |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/mono/0006-Remove-unit-tests-from-mono-compilation.patch b/package/mono/0006-Remove-unit-tests-from-mono-compilation.patch
index 6adbd81..a3e88e7 100644
--- a/package/mono/0006-Remove-unit-tests-from-mono-compilation.patch
+++ b/package/mono/0006-Remove-unit-tests-from-mono-compilation.patch
@@ -1,6 +1,6 @@
-From 357bea890354acda52aa6dfaec7fa232fa0b8208 Mon Sep 17 00:00:00 2001
+From 26e31fc54af591bdd88d6a4a79b7fa91c57f4b0c Mon Sep 17 00:00:00 2001
 From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
-Date: Tue, 23 May 2017 11:19:58 +0200
+Date: Thu, 10 Aug 2017 23:30:05 +0200
 Subject: [PATCH] Remove unit-tests from mono compilation
 
 This patch fixes compiling errors with unit-tests under linux.
@@ -15,15 +15,15 @@ index 8c9c2cb..7af36ec 100644
 --- a/mono/Makefile.am
 +++ b/mono/Makefile.am
 @@ -34,7 +34,7 @@ monotouch-do-clean:
-          (cd $$subdir && $(MAKE) $(AM_MAKEFLAGS) $$target); \
+ 	  (cd $$subdir && $(MAKE) $(AM_MAKEFLAGS) $$target); \
      done;
  else
--SUBDIRS = $(btls_dirs) arch utils io-layer cil metadata $(sgen_dirs) mini dis tests unit-tests benchmark profiler
-+SUBDIRS = $(btls_dirs) arch utils io-layer cil metadata $(sgen_dirs) mini dis tests benchmark profiler
+-SUBDIRS = $(btls_dirs) arch utils cil metadata $(sgen_dirs) mini dis tests unit-tests benchmark profiler
++SUBDIRS = $(btls_dirs) arch utils cil metadata $(sgen_dirs) mini dis tests benchmark profiler
  endif
  endif
--DIST_SUBDIRS = btls arch utils io-layer cil metadata $(sgen_dirs) mini dis tests unit-tests benchmark profiler
-+DIST_SUBDIRS = btls arch utils io-layer cil metadata $(sgen_dirs) mini dis tests benchmark profiler
+-DIST_SUBDIRS = btls arch utils cil metadata $(sgen_dirs) mini dis tests unit-tests benchmark profiler
++DIST_SUBDIRS = btls arch utils cil metadata $(sgen_dirs) mini dis tests benchmark profiler
 -- 
 2.7.4
 
diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index 89b8ed0..5d14a52 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 18cb38a670e51609c36c687ed90ad42cfedabeffd0a2dc5f7f0c46249eb8dbef  mono-4.8.1.0.tar.bz2
+sha256 48d6ae71d593cd01bf0f499de569359d45856cda325575e1bacb5fabaa7e9718  mono-5.0.1.1.tar.bz2
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 0fafc97..e1f16b4 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 4.8.1.0
+MONO_VERSION = 5.0.1.1
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
-- 
2.7.4
