From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  2 Feb 2016 09:40:56 -0300
Subject: [Buildroot] [PATCH] socat: security bump to version 2.0.0-b9
Message-ID: <1454416856-5879-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
Socat security advisory 7 and MSVR-1499: "Bad DH p parameter in OpenSSL"
Socat security advisory 8: "Stack overflow in arguments parser"

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0002-ptrdiff_t-is-defined-in-stddef.h.patch    | 26 ++++++++++++++++++++++
 package/socat/socat.hash                           |  4 +++-
 package/socat/socat.mk                             |  2 +-
 3 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 package/socat/0002-ptrdiff_t-is-defined-in-stddef.h.patch

diff --git a/package/socat/0002-ptrdiff_t-is-defined-in-stddef.h.patch b/package/socat/0002-ptrdiff_t-is-defined-in-stddef.h.patch
new file mode 100644
index 0000000..7b435a9
--- /dev/null
+++ b/package/socat/0002-ptrdiff_t-is-defined-in-stddef.h.patch
@@ -0,0 +1,26 @@
+From 99c55f2694fe8621ca2344eb002610dac7f9c969 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 2 Feb 2016 09:34:24 -0300
+Subject: [PATCH] ptrdiff_t is defined in stddef.h
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ nestlex.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/nestlex.c b/nestlex.c
+index f7950f0..f49482d 100644
+--- a/nestlex.c
++++ b/nestlex.c
+@@ -4,6 +4,8 @@
+ 
+ /* a function for lexical scanning of nested character patterns */
+ 
++#include <stddef.h>	/* ptrdiff_t */
++
+ #include "config.h"
+ #include "mytypes.h"
+ 
+-- 
+2.4.10
+
diff --git a/package/socat/socat.hash b/package/socat/socat.hash
index a876ae2..3f586ac 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,2 +1,4 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5	ff56576703dfdeac221357a348c30760	socat-2.0.0-b8.tar.bz2
+md5	553b1593d0a192cb09cbdc687ef1baac	socat-2.0.0-b9.tar.bz2
+#
+sha256	49efb0a5c66b94b279014addc2851faf8ebbd1ec4b7e31c1de7e912d7b4983d2	socat-2.0.0-b9.tar.bz2
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index eaf13bc..754b210 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 2.0.0-b8
+SOCAT_VERSION = 2.0.0-b9
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPLv2
-- 
2.4.10
