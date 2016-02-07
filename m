From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 15:51:32 +0100
Subject: [Buildroot] [git commit] socat: security bump to version 2.0.0-b9
Message-ID: <20160207145150.87DBC80509@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b1c4583ec27caaa59c6fa1a8ce38664cfc21612
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
Socat security advisory 7 and MSVR-1499: "Bad DH p parameter in OpenSSL"
Socat security advisory 8: "Stack overflow in arguments parser"

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-ptrdiff_t-is-defined-in-stddef.h.patch    | 28 ++++++++++++++++++++++
 package/socat/socat.hash                           |  4 +++-
 package/socat/socat.mk                             |  2 +-
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/package/socat/0002-ptrdiff_t-is-defined-in-stddef.h.patch b/package/socat/0002-ptrdiff_t-is-defined-in-stddef.h.patch
new file mode 100644
index 0000000..acae641
--- /dev/null
+++ b/package/socat/0002-ptrdiff_t-is-defined-in-stddef.h.patch
@@ -0,0 +1,28 @@
+From 99c55f2694fe8621ca2344eb002610dac7f9c969 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 2 Feb 2016 09:34:24 -0300
+Subject: [PATCH] ptrdiff_t is defined in stddef.h
+
+Status: sent upstream via email.
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
index a876ae2..d867d8a 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,2 +1,4 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5	ff56576703dfdeac221357a348c30760	socat-2.0.0-b8.tar.bz2
+md5	553b1593d0a192cb09cbdc687ef1baac	socat-2.0.0-b9.tar.bz2
+# Calculated based on the hash above
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
