From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:11 +0100
Subject: [Buildroot] [PATCH 05/51] fb-test-app: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-5-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch as it was merged upstream.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 .../fb-test-app/fb-test-app-override-cflags.patch  | 35 ----------------------
 package/fb-test-app/fb-test-app.mk                 |  2 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 package/fb-test-app/fb-test-app-override-cflags.patch

diff --git a/package/fb-test-app/fb-test-app-override-cflags.patch b/package/fb-test-app/fb-test-app-override-cflags.patch
deleted file mode 100644
index 550ca6e..0000000
--- a/package/fb-test-app/fb-test-app-override-cflags.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From deb5143e8e4580d7767de59a2e983dda262b0669 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Wed, 10 Oct 2012 14:38:13 +0200
-Subject: [PATCH] allow custom CFLAGS to passed on the make command line
-
-Ensure the required CFLAGS are appended to what is provided on the
-command line.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- Makefile |    8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 057d539..c3102ea 100644
---- a/Makefile
-+++ b/Makefile
-@@ -11,10 +11,10 @@ else
- 	CFLAGS=-O2 -Wall
- endif
- 
--CFLAGS += -DVERSION=$(VERSION)
--CFLAGS += -DPATCHLEVEL=$(PATCHLEVEL)
--CFLAGS += -DSUBLEVEL=$(SUBLEVEL)
--CFLAGS += -DVERSION_NAME=\"$(NAME)\"
-+override CFLAGS += -DVERSION=$(VERSION)
-+override CFLAGS += -DPATCHLEVEL=$(PATCHLEVEL)
-+override CFLAGS += -DSUBLEVEL=$(SUBLEVEL)
-+override CFLAGS += -DVERSION_NAME=\"$(NAME)\"
- 
- PROGS=perf rect fb-test offset
- 
--- 
-1.7.10.4
-
diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
index 85e027a..9cd0aec 100644
--- a/package/fb-test-app/fb-test-app.mk
+++ b/package/fb-test-app/fb-test-app.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FB_TEST_APP_VERSION = v1.0.0
+FB_TEST_APP_VERSION = rosetta-1.1.0
 FB_TEST_APP_SITE = $(call github,prpplague,fb-test-app,$(FB_TEST_APP_VERSION))
 FB_TEST_APP_LICENSE = GPLv2
 FB_TEST_APP_LICENSE_FILES = COPYING
-- 
2.1.1
