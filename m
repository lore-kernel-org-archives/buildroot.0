From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Mar 2011 10:44:31 -0300
Subject: [Buildroot] [PATCH 1/5] mesa3d: fix build failure bug #3313
Message-ID: <1299764675-23308-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to fix the build failure as reported in bug #3313

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/mesa3d/mesa3d-uclibc.patch |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 package/x11r7/mesa3d/mesa3d-uclibc.patch

diff --git a/package/x11r7/mesa3d/mesa3d-uclibc.patch b/package/x11r7/mesa3d/mesa3d-uclibc.patch
new file mode 100644
index 0000000..37f620b
--- /dev/null
+++ b/package/x11r7/mesa3d/mesa3d-uclibc.patch
@@ -0,0 +1,12 @@
+diff -Nura Mesa-7.6.1/src/mesa/main/imports.c Mesa-7.6.1.uclibc/src/mesa/main/imports.c
+--- Mesa-7.6.1/src/mesa/main/imports.c	2009-12-21 23:08:13.000000000 -0300
++++ Mesa-7.6.1.uclibc/src/mesa/main/imports.c	2011-03-02 15:09:56.342618892 -0300
+@@ -915,7 +915,7 @@
+ double
+ _mesa_strtod( const char *s, char **end )
+ {
+-#ifdef _GNU_SOURCE
++#if defined(_GNU_SOURCE) && !defined(__UCLIBC__)
+    static locale_t loc = NULL;
+    if (!loc) {
+       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
-- 
1.7.3.4
