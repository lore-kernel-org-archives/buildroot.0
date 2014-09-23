From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 21:47:58 +0200
Subject: [Buildroot] [git commit] pifmrds: bump version and remove strcmp
	patch
Message-ID: <20140923194816.1B0859D74F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ce02b39a988a2546d30a8bd8ba935e7ad741257
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to git revision 0bf57f9...
- Remove strcmp patch, has been fixed upstream

Signed-off-by: Eric Limpens <limpens@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pifmrds/pifmrds-0003-rds_wav-strcmp.patch |   17 -----------------
 package/pifmrds/pifmrds.mk                        |    2 +-
 2 files changed, 1 insertions(+), 18 deletions(-)

diff --git a/package/pifmrds/pifmrds-0003-rds_wav-strcmp.patch b/package/pifmrds/pifmrds-0003-rds_wav-strcmp.patch
deleted file mode 100644
index faf7ee5..0000000
--- a/package/pifmrds/pifmrds-0003-rds_wav-strcmp.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-rds_wav: add missign include for strcmp()
-
-strcmp() is declared in string.h, so include it.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1.orig/src/rds_wav.c pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/rds_wav.c
---- pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1.orig/src/rds_wav.c	2014-05-04 18:21:40.000000000 +0200
-+++ pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/rds_wav.c	2014-06-21 17:39:22.999128453 +0200
-@@ -26,6 +26,7 @@
- #include <stdlib.h>
- #include <math.h>
- #include <sndfile.h>
-+#include <string.h>
- 
- #include "rds.h"
- #include "fm_mpx.h"
diff --git a/package/pifmrds/pifmrds.mk b/package/pifmrds/pifmrds.mk
index 0f27fce..5179715 100644
--- a/package/pifmrds/pifmrds.mk
+++ b/package/pifmrds/pifmrds.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIFMRDS_VERSION = c67306ea9b8d827f45e0d90279d367e97119bcb1
+PIFMRDS_VERSION = 0bf57f9ce0d954365a38d8af8e7be6f28521c3f2
 PIFMRDS_SITE = $(call github,ChristopheJacquet,PiFmRds,$(PIFMRDS_VERSION))
 PIFMRDS_DEPENDENCIES = libsndfile
 PIFMRDS_LICENSE = GPLv3+
