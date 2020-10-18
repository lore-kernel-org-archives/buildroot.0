From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Oct 2020 18:43:54 +0200
Subject: [Buildroot] [git commit] package/libapparmor: fix build with musl
Message-ID: <20201018163242.A4660840E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30d866c11de038e51acd73c3ed434ccff7dea388
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build of apparmor 3.0.0 with musl

Fixes:
 - http://autobuild.buildroot.org/results/ccbee89030308cf1e4bfce89635d40676c7c63a0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0003-aa_status-Fix-build-issue-with-musl.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/libapparmor/3.0.0/0003-aa_status-Fix-build-issue-with-musl.patch b/package/libapparmor/3.0.0/0003-aa_status-Fix-build-issue-with-musl.patch
new file mode 100644
index 0000000000..83981bfecc
--- /dev/null
+++ b/package/libapparmor/3.0.0/0003-aa_status-Fix-build-issue-with-musl.patch
@@ -0,0 +1,33 @@
+From a2a0d14b9c5046b76124c828a53b0e9cbc1bc5c8 Mon Sep 17 00:00:00 2001
+From: Armin Kuster <akuster808@gmail.com>
+Date: Wed, 7 Oct 2020 08:27:11 -0700
+Subject: [PATCH] aa_status: Fix build issue with musl
+
+add limits.h
+
+aa_status.c:269:22: error: 'PATH_MAX' undeclared (first use in this function); did you mean 'AF_MAX'?
+|   269 |    real_exe = calloc(PATH_MAX + 1, sizeof(char));
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+[Retrieved from:
+https://gitlab.com/apparmor/apparmor/-/commit/a2a0d14b9c5046b76124c828a53b0e9cbc1bc5c8]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ binutils/aa_status.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/binutils/aa_status.c b/binutils/aa_status.c
+index 78b034090..41f1954e9 100644
+--- a/binutils/aa_status.c
++++ b/binutils/aa_status.c
+@@ -10,6 +10,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <limits.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/wait.h>
+-- 
+GitLab
+
