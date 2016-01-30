From: Martin Bark <martin@barkynet.com>
Date: Sat, 30 Jan 2016 14:52:22 +0000
Subject: [Buildroot] [PATCH 1/2] package/zic: bump version to 2016a
Message-ID: <1454165543-32439-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed 0001-fix-dependencies.patch as this has now been fixed upstream

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/zic/0001-fix-dependencies.patch | 27 ---------------------------
 package/zic/zic.hash                    |  4 ++--
 package/zic/zic.mk                      |  2 +-
 3 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 package/zic/0001-fix-dependencies.patch

diff --git a/package/zic/0001-fix-dependencies.patch b/package/zic/0001-fix-dependencies.patch
deleted file mode 100644
index e1cbc12..0000000
--- a/package/zic/0001-fix-dependencies.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 4a2a55a640dd9316dac5f31832064f28f59ab0ae Mon Sep 17 00:00:00 2001
-From: Richard Braun <rbraun@sceen.net>
-Date: Fri, 4 Jan 2013 10:57:24 +0100
-Subject: [PATCH] zic: fix dependencies
-
-The yearistype script is provided by the tzdata package, and is required
-at runtime only.
----
- Makefile |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index d76a81e..30df7dc 100644
---- a/Makefile
-+++ b/Makefile
-@@ -349,7 +349,7 @@ version.h:
- zdump:		$(TZDOBJS)
- 		$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(TZDOBJS) $(LDLIBS)
- 
--zic:		$(TZCOBJS) yearistype
-+zic:		$(TZCOBJS)
- 		$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(TZCOBJS) $(LDLIBS)
- 
- yearistype:	yearistype.sh
--- 
-1.7.2.5
-
diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 714b00c..290cfdb 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,2 +1,2 @@
-# From: http://mm.icann.org/pipermail/tz-announce/2015-October/000034.html
-sha512  44da833da3afdb82636a953785372bb4c765e61e40d700da40b46ab70007ebdbde4d480e10b87cbb36c45eaaffcaa6b9894375e2f553b7d16655dc167cd4a11f  tzcode2015g.tar.gz
+# From: http://mm.icann.org/pipermail/tz-announce/2016-January/000035.html
+sha512  33a1078ba16aef19048aa97ce1816fc5368061bfe40eddc0e7e246ca57c4a535eaf2f03847128e971a6d959f34ea77224bf33fd53dc6a0c006450dde35222223  tzcode2016a.tar.gz
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index fcc0288..6f5d160 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2015g
+ZIC_VERSION = 2016a
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = http://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
-- 
2.5.0
