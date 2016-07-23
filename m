From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 23 Jul 2016 14:30:00 -0300
Subject: [Buildroot] [PATCH 1/2] zeromq: bump to version 4.1.5
Message-ID: <1469295001-21786-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to github download URL since upstream switched.
Drop upstream patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../zeromq/0003-allow-to-build-sparc-v8-leon.patch | 30 ----------------------
 package/zeromq/zeromq.hash                         |  6 ++---
 package/zeromq/zeromq.mk                           |  3 ++-
 3 files changed, 5 insertions(+), 34 deletions(-)
 delete mode 100644 package/zeromq/0003-allow-to-build-sparc-v8-leon.patch

diff --git a/package/zeromq/0003-allow-to-build-sparc-v8-leon.patch b/package/zeromq/0003-allow-to-build-sparc-v8-leon.patch
deleted file mode 100644
index 126a03b..0000000
--- a/package/zeromq/0003-allow-to-build-sparc-v8-leon.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d0b22397ebbef8e250c4cad25b8686018804aa15 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Sat, 4 Jun 2016 09:30:49 +0200
-Subject: [PATCH] allow to build sparc (v8,leon)
-
-Only set sparcv9 optimization for sparc64 systems.
-This allows to run for example application using zeromq
-on sparc32 systems.
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index af8293c..cabd734 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -291,7 +291,7 @@ fi
- 
- # CPU-specific optimizations
- case "${host_cpu}" in
--    *sparc*)
-+    *sparc64*)
-         AC_LANG_PUSH([C++])
-         LIBZMQ_CHECK_LANG_FLAG_PREPEND([-mcpu=v9])
-         AC_LANG_POP([C++])
--- 
-2.7.4 (Apple Git-66)
-
diff --git a/package/zeromq/zeromq.hash b/package/zeromq/zeromq.hash
index a3eeb45..76067d9 100644
--- a/package/zeromq/zeromq.hash
+++ b/package/zeromq/zeromq.hash
@@ -1,4 +1,4 @@
-# From http://download.zeromq.org/SHA1SUMS:
-sha1	b632a4b6f8a14390dc17824e37ff7b10831ce2b4	zeromq-4.1.4.tar.gz
+# From https://github.com/zeromq/zeromq4-1/releases
+sha1	2b7490b77860be3060b1b1f92cd73184d309ca69	zeromq-4.1.5.tar.gz
 # Calculated based on the hash above
-sha256	e99f44fde25c2e4cb84ce440f87ca7d3fe3271c2b8cfbc67d55e4de25e6fe378	zeromq-4.1.4.tar.gz
+sha256	04aac57f081ffa3a2ee5ed04887be9e205df3a7ddade0027460b8042432bdbcf	zeromq-4.1.5.tar.gz
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 871f37c..889c94a 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-ZEROMQ_VERSION = 4.1.4
+ZEROMQ_VERSION = 4.1.5
 ZEROMQ_SITE = http://download.zeromq.org
+ZEROMQ_SITE = https://github.com/zeromq/zeromq4-1/releases/download/v$(ZEROMQ_VERSION)
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
 ZEROMQ_LICENSE = LGPLv3+ with exceptions
-- 
2.7.3
