From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 02 Sep 2017 13:13:48 -0000
Subject: [Buildroot] [git commit] package/mono: bump to version 5.0.1.1 and
	monolite to version 1050001000
Message-ID: <20170902130617.24EBA818F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=309b466a1d80c5cbf254478348c06996ea914700
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps to mono 5.0.1.1 and updates the unit tests patch
accordingly.

The latest version of mono carries a bit of changes in the monolite
package: the version string changes and from now on, monolite should
be installed in a subdirectory with the exact version string as a name.
Therefore, mono and monolite are bumped in a single commit.

Patch 0004, although applied in upstream master, is not yet in this
(stable) release.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
[Arnout: squashed the patches, removed /usr part from HOST_DIR]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0006-Remove-unit-tests-from-mono-compilation.patch     | 14 +++++++-------
 package/mono/mono.hash                                     |  2 +-
 package/mono/mono.mk                                       |  2 +-
 package/monolite/monolite.hash                             |  2 +-
 package/monolite/monolite.mk                               |  6 +++---
 5 files changed, 13 insertions(+), 13 deletions(-)

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
index ec7e14e..ec2f38f 100644
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
diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
index 09f9554..7638ce2 100644
--- a/package/monolite/monolite.hash
+++ b/package/monolite/monolite.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 2cdf6cff1d82d76412461a4c8a3616bb2aa1e835fb55479941662dec3799c924  monolite-156-latest.tar.gz
+sha256 365dc589e6d336530ef8efaa491e932c15163f449632daef6c41bed770d9fe53  monolite-1050001000-latest.tar.gz
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index 5317898..a2815ef 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-MONOLITE_VERSION = 156
+MONOLITE_VERSION = 1050001000
 MONOLITE_SITE = http://download.mono-project.com/monolite/
 MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPL-2.0 or commercial
 
 define HOST_MONOLITE_INSTALL_CMDS
-	mkdir -p $(HOST_DIR)/lib/monolite
-	cp $(@D)/* $(HOST_DIR)/lib/monolite
+	mkdir -p $(HOST_DIR)/lib/monolite/$(MONOLITE_VERSION)
+	cp -r $(@D)/* $(HOST_DIR)/lib/monolite/$(MONOLITE_VERSION)
 endef
 
 $(eval $(host-generic-package))
