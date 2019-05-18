From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 19 May 2019 00:05:15 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/pptp-linux: bump to version
 1.10.0
Message-ID: <20190518220515.20449-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove third patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0003-pqueue.h-include-sys-types.h.patch   | 30 -------------------
 package/pptp-linux/pptp-linux.hash            | 10 +++++--
 package/pptp-linux/pptp-linux.mk              |  2 +-
 3 files changed, 8 insertions(+), 34 deletions(-)
 delete mode 100644 package/pptp-linux/0003-pqueue.h-include-sys-types.h.patch

diff --git a/package/pptp-linux/0003-pqueue.h-include-sys-types.h.patch b/package/pptp-linux/0003-pqueue.h-include-sys-types.h.patch
deleted file mode 100644
index 1036b3c895..0000000000
--- a/package/pptp-linux/0003-pqueue.h-include-sys-types.h.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 060ad28b9ca5e99d7c6e8010132da58a3a8a0585 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Fri, 22 Jan 2016 10:19:18 -0300
-Subject: [PATCH] pqueue.h: include sys/types.h
-
-We're using u_int32_t here, this breaks on musl libc builds otherwise.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Patch status: applied upstream:
-https://sourceforge.net/p/pptpclient/git/ci/ee8ef349d9543cb48045a27d1cdd801fc6e910e8/
-
- pqueue.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/pqueue.h b/pqueue.h
-index a56590f..8c60c62 100644
---- a/pqueue.h
-+++ b/pqueue.h
-@@ -3,6 +3,7 @@
- 
- #include <time.h>
- #include <sys/time.h>
-+#include <sys/types.h>
- 
- /* wait this many seconds for missing packets before forgetting about them */
- #define DEFAULT_PACKET_TIMEOUT 0.3
--- 
-2.4.10
-
diff --git a/package/pptp-linux/pptp-linux.hash b/package/pptp-linux/pptp-linux.hash
index 6200ef151f..668e01c30b 100644
--- a/package/pptp-linux/pptp-linux.hash
+++ b/package/pptp-linux/pptp-linux.hash
@@ -1,3 +1,7 @@
-# From http://sourceforge.net/projects/pptpclient/files/pptp/pptp-1.9.0/
-md5 b2117b377f65294a9786f80f0235d308  pptp-1.9.0.tar.gz
-sha1 047bb9812be477b44c94ffb1dc95c34658eedc24  pptp-1.9.0.tar.gz
+# From http://sourceforge.net/projects/pptpclient/files/pptp/pptp-1.10.0/
+md5 8d25341352fdae5ad5b36b9f18254908  pptp-1.10.0.tar.gz
+sha1 173c9b7d204c89fd1538116f165bba1e9101b51c  pptp-1.10.0.tar.gz
+
+# Locally calculated
+sha256 82492db8e487ce73b182ee7f444251d20c44f5c26d6e96c553ec7093aefb5af4  pptp-1.10.0.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index 25f3037f88..7fd0733977 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PPTP_LINUX_VERSION = 1.9.0
+PPTP_LINUX_VERSION = 1.10.0
 PPTP_LINUX_SITE = http://downloads.sourceforge.net/project/pptpclient/pptp/pptp-$(PPTP_LINUX_VERSION)
 PPTP_LINUX_SOURCE = pptp-$(PPTP_LINUX_VERSION).tar.gz
 PPTP_LINUX_MAKE = $(MAKE1)
-- 
2.20.1
