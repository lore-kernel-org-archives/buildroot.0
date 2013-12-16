From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2013 12:19:58 +0100
Subject: [Buildroot] [git commit] neardal: bump to recent git snapshot
Message-ID: <20131216113554.C42DD9BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b19406686d002e291e8973fc3825649e8cef60c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also remove a local patch which has now been accepted upstream.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/neardal/neardal-01-automake.patch |   35 -----------------------------
 package/neardal/neardal.mk                |    3 +-
 2 files changed, 1 insertions(+), 37 deletions(-)

diff --git a/package/neardal/neardal-01-automake.patch b/package/neardal/neardal-01-automake.patch
deleted file mode 100644
index e5d822e..0000000
--- a/package/neardal/neardal-01-automake.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 08f26bdd093c7f289638ab506b0e842bd93f3d0d Mon Sep 17 00:00:00 2001
-From: Dmytro Bagrii <dimich@softerra.com>
-Date: Thu, 14 Mar 2013 15:44:40 +0100
-Subject: [PATCH 1/2] Fix 'AM_PROG_AR' autogen.sh error There is an error while
- running autogen.sh in some distributions (e.g. Archlinux, automake 1.13.1).
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6a4a7c5..eb03a50 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1,7 +1,6 @@
- AC_INIT([neardal], 0.8.0, Neardal for Neard v0.8)
- AM_INIT_AUTOMAKE([foreign -Wall -Werror])
- 
--AC_PROG_LIBTOOL
- AC_CONFIG_HEADERS([config.h])
- 
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
-@@ -15,6 +14,8 @@ traces=no
- 
- AC_PROG_CC
- AM_PROG_CC_C_O
-+AM_PROG_AR
-+AC_PROG_LIBTOOL
- 
- ## Compiler option
- ## Debug ?
--- 
-1.8.1.5
-
diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index c07ae5f..0720fe8 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-NEARDAL_VERSION = 0.8
+NEARDAL_VERSION = da8e06d3884d214bb19b894d2b8fdc9c7ca8575f
 NEARDAL_SITE = $(call github,connectivity,neardal,$(NEARDAL_VERSION))
-NEARDAL_SOURCE = connectivity-neardal-$(NEARDAL_VERSION).tar.gz
 NEARDAL_INSTALL_STAGING = YES
 NEARDAL_LICENSE = GPLv2
 NEARDAL_LICENSE_FILES = COPYING
