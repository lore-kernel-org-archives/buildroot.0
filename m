From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Sep 2020 22:26:29 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/mraa: fix build
 with gcc 10
Message-ID: <20200911201833.A7A79812F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a4dd3cb03ba29eda25058e68337efc378458b6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes:
 - http://autobuild.buildroot.org/results/7701c317e300f0b06d258aed2a3bda866e740f48

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fd5376a39d079cc5aa26d67788a0c32d234f2f96)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...include-Declare-gVERSION-global-as-extern.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/mraa/0002-include-Declare-gVERSION-global-as-extern.patch b/package/mraa/0002-include-Declare-gVERSION-global-as-extern.patch
new file mode 100644
index 0000000000..b3a1f5a03a
--- /dev/null
+++ b/package/mraa/0002-include-Declare-gVERSION-global-as-extern.patch
@@ -0,0 +1,29 @@
+From dbb5961f106ec42cd70689d933674c9c37aedfe1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bj=C3=B6rn=20Esser?= <besser82@fedoraproject.org>
+Date: Mon, 13 Apr 2020 20:12:11 +0200
+Subject: [PATCH] include: Declare gVERSION global as 'extern'.
+
+Fixes build with '-fno-common'.
+
+[Retrieved from:
+https://github.com/eclipse/mraa/pull/1012/commits/dbb5961f106ec42cd70689d933674c9c37aedfe1]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmaail.com>
+---
+ include/version.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/version.h b/include/version.h
+index 47366ef6f..3a567a1d5 100644
+--- a/include/version.h
++++ b/include/version.h
+@@ -11,8 +11,8 @@
+ extern "C" {
+ #endif
+ 
+-const char* gVERSION;
+-const char* gVERSION_SHORT;
++extern const char* gVERSION;
++extern const char* gVERSION_SHORT;
+ 
+ #ifdef __cplusplus
+ }
