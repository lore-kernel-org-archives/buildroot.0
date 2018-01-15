From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 23:44:26 +0100
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20180115224439.29F1B83E07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f50df815c051bd3a9b2c3dc3fecf0030bb0b90c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version adds support for libva 2.0, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-sbuf-fix-uclibc-compilation-error.patch   | 33 ++++++++++++++++++++++
 package/tvheadend/tvheadend.hash                   |  3 +-
 package/tvheadend/tvheadend.mk                     |  2 +-
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/0002-sbuf-fix-uclibc-compilation-error.patch b/package/tvheadend/0002-sbuf-fix-uclibc-compilation-error.patch
new file mode 100644
index 0000000..deed9f9
--- /dev/null
+++ b/package/tvheadend/0002-sbuf-fix-uclibc-compilation-error.patch
@@ -0,0 +1,33 @@
+From b16ad4d258409fbd6acf843d62a7a84f621e3b70 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 18 Dec 2017 20:52:06 +0100
+Subject: [PATCH] sbuf: fix uclibc compilation error
+
+Fixes build error
+
+tvheadend-e06ffd87beff16103c47d6fa542df2374fca6fd3/src/sbuf.h:77:1:
+ error: unknown type name 'ssize_t'; did you mean 'size_t'?
+ ssize_t sbuf_read(sbuf_t *sb, int fd);
+
+Patch sent upstream: https://github.com/tvheadend/tvheadend/pull/1062
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/sbuf.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/sbuf.h b/src/sbuf.h
+index 78aa546b3..d5aa53042 100644
+--- a/src/sbuf.h
++++ b/src/sbuf.h
+@@ -23,6 +23,7 @@
+ #include <stddef.h>
+ #include <stdio.h>
+ #include <stdint.h>
++#include <unistd.h>
+ 
+ /**
+  * Simple dynamically growing buffer
+-- 
+2.11.0
+
diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index f9fd385..4e890a8 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 7ff9f6a583d7e288c69eb8bfbd628e630e85252e04a8394666cc3c9f9b785df3  tvheadend-a234e2ff6d140e6ffceb7057bf18a8fdd927a5ac.tar.gz
+sha256 32f96937a3ffa72b5bdbfde9a5f9f9535f88e94e44864d4c8c6a152985c16569  tvheadend-e06ffd87beff16103c47d6fa542df2374fca6fd3.tar.gz
+sha256 54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 88f9869..45ea7bf 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = a234e2ff6d140e6ffceb7057bf18a8fdd927a5ac
+TVHEADEND_VERSION = e06ffd87beff16103c47d6fa542df2374fca6fd3
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
