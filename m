From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Feb 2020 21:17:05 +0100
Subject: [Buildroot] [git commit] package/ptm2human: bump version to
 d0b8b6be98
Message-ID: <20200203200907.1FFE688E96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ae41cedc1d435af38bc5e1f0e0655b99e00b77e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also drop upstreamed patch.

Signed-off-by: Julien Olivain <juju@cotds.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e.ac-remove-unneeded-check-for-c-compiler.patch | 29 ----------------------
 package/ptm2human/ptm2human.hash                   |  2 +-
 package/ptm2human/ptm2human.mk                     |  5 ++--
 3 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/package/ptm2human/0001-configure.ac-remove-unneeded-check-for-c-compiler.patch b/package/ptm2human/0001-configure.ac-remove-unneeded-check-for-c-compiler.patch
deleted file mode 100644
index b5c835a246..0000000000
--- a/package/ptm2human/0001-configure.ac-remove-unneeded-check-for-c-compiler.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 57b32b3785da1e48bd77c4f13ef41125a6abb83d Mon Sep 17 00:00:00 2001
-From: Julien Olivain <juju@cotds.org>
-Date: Fri, 24 Jan 2020 19:12:37 +0100
-Subject: [PATCH] configure.ac: remove unneeded check for c++ compiler
-
-If the c++ compiler is not present, the build configuration
-will fail. This patch remove the check for the c++ compiler
-because all the ptm2human code is written in C.
-
-Signed-off-by: Julien Olivain <juju@cotds.org>
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3b1f337..924dc77 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -7,7 +7,6 @@ AM_INIT_AUTOMAKE([foreign -Wall])
- AC_CONFIG_HEADERS([config.h])
- 
- # Checks for programs.
--AC_PROG_CXX
- AC_PROG_CC
- 
- # Checks for libraries.
--- 
-2.24.1
-
diff --git a/package/ptm2human/ptm2human.hash b/package/ptm2human/ptm2human.hash
index b4372f77f6..5546ef4018 100644
--- a/package/ptm2human/ptm2human.hash
+++ b/package/ptm2human/ptm2human.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256 c3fd505949db82fde4f058cad0b78c8e96ef620c193dfff8acdbbd020d51fa1a  ptm2human-d7dd68ea6495daef50e00ef2d65c99810e0a594f.tar.gz
+sha256 28947eeb458d8b6a362cbeb8c5cb6098006274af04ebb4f5da70eac89f927d95  ptm2human-d0b8b6be9897ea5b04fd6460038a4773cec078bc.tar.gz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/ptm2human/ptm2human.mk b/package/ptm2human/ptm2human.mk
index 8fa15ebf65..28a7b7ab48 100644
--- a/package/ptm2human/ptm2human.mk
+++ b/package/ptm2human/ptm2human.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-PTM2HUMAN_VERSION = d7dd68ea6495daef50e00ef2d65c99810e0a594f
+PTM2HUMAN_VERSION = d0b8b6be9897ea5b04fd6460038a4773cec078bc
 PTM2HUMAN_SITE = $(call github,hwangcc23,ptm2human,$(PTM2HUMAN_VERSION))
 PTM2HUMAN_LICENSE = GPL-2.0
 PTM2HUMAN_LICENSE_FILES = LICENSE
 
-# Straight out from an non-autoconfigured git tree, plus a patch:
-# 0001-configure.ac-remove-unneeded-check-for-c-compiler.patch
+# Straight out from an non-autoconfigured git tree:
 PTM2HUMAN_AUTORECONF = YES
 
 $(eval $(autotools-package))
