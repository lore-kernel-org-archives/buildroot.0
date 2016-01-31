From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 23:46:42 +0100
Subject: [Buildroot] [git commit] package/oprofile: bump version to 1.1.0
Message-ID: <20160201224705.942517F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ddf2a6b2cb89026c0b402a76bcb1bf3c1a47c80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:
http://sourceforge.net/p/oprofile/oprofile/ci/f357d40c9f64f3ea2dccf5f9abdff84b2ac62e6f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Include-time.h-for-nanosleep.patch        | 44 ----------------------
 package/oprofile/oprofile.hash                     |  5 ++-
 package/oprofile/oprofile.mk                       |  2 +-
 3 files changed, 4 insertions(+), 47 deletions(-)

diff --git a/package/oprofile/0001-Include-time.h-for-nanosleep.patch b/package/oprofile/0001-Include-time.h-for-nanosleep.patch
deleted file mode 100644
index d4a9ca2..0000000
--- a/package/oprofile/0001-Include-time.h-for-nanosleep.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From c5b93c33a81d7c52dc6089387e415f2d653f758f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 29 Dec 2014 11:43:51 +0100
-Subject: [PATCH] Include <time.h> for nanosleep()
-
-The nanosleep() function prototype is in <time.h>, so this header file
-should be included whenever nanosleep() is used. Not including it
-causes some issues when building OProfile against a non-thread capable
-version of the uClibc C library, probably because in such situation,
-<time.h> does not get included by another header.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- pe_counting/ocount.cpp | 1 +
- pe_profiling/operf.cpp | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/pe_counting/ocount.cpp b/pe_counting/ocount.cpp
-index 07dfd0c..fba29eb 100644
---- a/pe_counting/ocount.cpp
-+++ b/pe_counting/ocount.cpp
-@@ -28,6 +28,7 @@
- #include <getopt.h>
- #include <sys/time.h>
- #include <math.h>
-+#include <time.h>
- 
- #include "op_pe_utils.h"
- #include "ocount_counter.h"
-diff --git a/pe_profiling/operf.cpp b/pe_profiling/operf.cpp
-index 04a25d9..4238754 100644
---- a/pe_profiling/operf.cpp
-+++ b/pe_profiling/operf.cpp
-@@ -33,6 +33,7 @@
- #include <sys/wait.h>
- #include <ftw.h>
- #include <getopt.h>
-+#include <time.h>
- #include <iostream>
- #include "operf_utils.h"
- #include "op_pe_utils.h"
--- 
-2.1.0
-
diff --git a/package/oprofile/oprofile.hash b/package/oprofile/oprofile.hash
index b6ab3ba..cc15ed1 100644
--- a/package/oprofile/oprofile.hash
+++ b/package/oprofile/oprofile.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  847110b4ecdcf8c8353cd38f94c1b704aad4bfcd9453e38b88d112cfb7e3c45a  oprofile-1.0.0.tar.gz
+# From http://sourceforge.net/projects/oprofile/files/oprofile/oprofile-1.1.0/
+sha1	38c0d8812fe605f6ddd1cd183a482aa7605c0e81	oprofile-1.1.0.tar.gz
+md5	248c4c069f9476f427fa7195563f9867		oprofile-1.1.0.tar.gz
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index f27e06e..d91ddab 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPROFILE_VERSION = 1.0.0
+OPROFILE_VERSION = 1.1.0
 OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
 OPROFILE_LICENSE = GPLv2+
 OPROFILE_LICENSE_FILES = COPYING
