From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Oct 2015 11:44:12 +0200
Subject: [Buildroot] [git commit] package/jq: bump to version 1.5
Message-ID: <20151017094901.4FBD87FF27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c7919fef943212b415738d2762ae6bde6c114902
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch applied upstream. Add hash file.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../jq/0001-libm.h-comment-j0-j1-y0-and-y1.patch   |   49 --------------------
 package/jq/jq.hash                                 |    2 +
 package/jq/jq.mk                                   |    4 +-
 3 files changed, 4 insertions(+), 51 deletions(-)

diff --git a/package/jq/0001-libm.h-comment-j0-j1-y0-and-y1.patch b/package/jq/0001-libm.h-comment-j0-j1-y0-and-y1.patch
deleted file mode 100644
index dfc2f4c..0000000
--- a/package/jq/0001-libm.h-comment-j0-j1-y0-and-y1.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From e87163425a67938afde96f01b19587ac3348b369 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 7 Sep 2014 10:49:57 +0200
-Subject: [PATCH] libm.h: comment j0, j1, y0 and y1
-
-Those functions are currently not used by jq, but having them in
-libm.h prevents building with the uClibc C library when it doesn't
-have DO_XSI_MATH option enabled.
-
-This issue was spotted by the Buildroot autobuilder system:
-
-  http://autobuild.buildroot.org/results/aaf/aaf3c114e0ca3e265ae32c646ba67f01aaf608bd/build-end.log
-
-Submitted upstream at https://github.com/stedolan/jq/pull/570.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libm.h | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/libm.h b/libm.h
-index f8c52be..8e82fb7 100644
---- a/libm.h
-+++ b/libm.h
-@@ -10,8 +10,8 @@ LIBM_DD(cosh)
- LIBM_DD(exp2)
- LIBM_DD(exp)
- LIBM_DD(floor)
--LIBM_DD(j0)
--LIBM_DD(j1)
-+/* LIBM_DD(j0) */
-+/* LIBM_DD(j1) */
- LIBM_DD(log10)
- LIBM_DD(log2)
- LIBM_DD(log)
-@@ -21,8 +21,8 @@ LIBM_DD(sqrt)
- LIBM_DD(tan)
- LIBM_DD(tanh)
- LIBM_DD(tgamma)
--LIBM_DD(y0)
--LIBM_DD(y1)
-+/* LIBM_DD(y0) */
-+/* LIBM_DD(y1) */
- /* LIBM_DID(jn) */
- /* LIBM_DID(yn) */
- /* LIBM_DDD(pow) */
--- 
-2.0.0
-
diff --git a/package/jq/jq.hash b/package/jq/jq.hash
new file mode 100644
index 0000000..2cd6405
--- /dev/null
+++ b/package/jq/jq.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c4d2bfec6436341113419debf479d833692cc5cdab7eb0326b5a4d4fbe9f493c  jq-1.5.tar.gz
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index 6a9dfc8..dd13276 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JQ_VERSION = 1.4
-JQ_SITE = http://stedolan.github.io/jq/download/source
+JQ_VERSION = 1.5
+JQ_SITE = https://github.com/stedolan/jq/releases/download/jq-$(JQ_VERSION)
 JQ_LICENSE = MIT (code), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
 
