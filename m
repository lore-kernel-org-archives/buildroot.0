From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Nov 2018 20:55:34 +0100
Subject: [Buildroot] [git commit] motion: fix static build with webp
Message-ID: <20181121195249.A177983F6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4cb4d405eadd7c9e7234055012c06544b9eb892
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Static build with webp fails because webp is put before webpmux

Fixes:
 - http://autobuild.buildroot.org/results/4d4e72808300ba1ff79ca794930112b554eb2533

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../motion/0001-fix-static-linking-with-webp.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/motion/0001-fix-static-linking-with-webp.patch b/package/motion/0001-fix-static-linking-with-webp.patch
new file mode 100644
index 0000000000..201ef3d8a5
--- /dev/null
+++ b/package/motion/0001-fix-static-linking-with-webp.patch
@@ -0,0 +1,32 @@
+From 3e59613c286316e963d98ea99ded35ded4361c48 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 21 Nov 2018 18:55:31 +0100
+Subject: [PATCH] fix static linking with webp
+
+Static build with webp fails because webp is put before webpmux
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4d4e72808300ba1ff79ca794930112b554eb2533
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/Motion-Project/motion/pull/850]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 89179e5..60147fb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -276,7 +276,7 @@ if test "${WEBP}" = "yes"; then
+     AC_MSG_RESULT(found)
+     AC_DEFINE([HAVE_WEBP], 1, [Define to 1 if WEBP is around])
+     HAVE_WEBP="yes"
+-    TEMP_LIBS="$TEMP_LIBS -lwebp -lwebpmux"
++    TEMP_LIBS="$TEMP_LIBS -lwebpmux -lwebp"
+   else
+     AC_MSG_RESULT(not found)
+   fi
+-- 
+2.14.1
+
