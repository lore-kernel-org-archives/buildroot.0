From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 18:32:13 +0100
Subject: [Buildroot] [git commit] imlib2: imlib2-config: delete old
	reference to @my_libs@
Message-ID: <20150308173258.6C3BB807AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76b55b9509bdb3f608e4a0a58388ccf396240691
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The script "imlib2-config" returns "@my_libs@" that causes build failures
on the programs that use it.
This is a regression of version v1.4.6.

Add a upstream patch to fix it and reorder the patches to follow
upstream branch order.

Fixes:
http://autobuild.buildroot.net/results/e1a7691a6528d635c308d7bf47a8be8aa0594190
http://autobuild.buildroot.net/results/23fea2e4d668d69565d5f50493635fc834c54ce1

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...b2-config-delete-old-reference-to-my_libs.patch |   28 ++++++++++++++++++++
 ...Y_MISSING-redefined-warnings-when-X-is-d.patch} |    4 +-
 ...-not-link-with-X-libs-when-X-is-disabled.patch} |    4 +-
 ...06-GIF-loader-Fix-for-libgif-version-5.1.patch} |    4 +-
 4 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/package/imlib2/0003-imlib2-config-delete-old-reference-to-my_libs.patch b/package/imlib2/0003-imlib2-config-delete-old-reference-to-my_libs.patch
new file mode 100644
index 0000000..35babbb
--- /dev/null
+++ b/package/imlib2/0003-imlib2-config-delete-old-reference-to-my_libs.patch
@@ -0,0 +1,28 @@
+From 534e736e52b6be0da58397ef05f55d47f3794ea7 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Sat, 18 Jan 2014 13:56:54 -0500
+Subject: [PATCH 3/6] imlib2-config: delete old reference to @my_libs@
+
+This was cleaned up a while ago, but this file was missed.
+
+URL: https://bugs.gentoo.org/497894
+---
+ imlib2-config.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/imlib2-config.in b/imlib2-config.in
+index cf814c6..965f7c3 100644
+--- a/imlib2-config.in
++++ b/imlib2-config.in
+@@ -46,7 +46,7 @@ while test $# -gt 0; do
+       ;;
+     --libs)
+       libdirs=-L at libdir@
+-      echo $libdirs -lImlib2 @my_libs@
++      echo $libdirs -lImlib2
+       ;;
+     *)
+       echo "${usage}" 1>&2
+-- 
+2.3.1
+
diff --git a/package/imlib2/0003-fix-X_DISPLAY_MISSING-redefined-warnings-when-X-is-d.patch b/package/imlib2/0004-fix-X_DISPLAY_MISSING-redefined-warnings-when-X-is-d.patch
similarity index 92%
rename from package/imlib2/0003-fix-X_DISPLAY_MISSING-redefined-warnings-when-X-is-d.patch
rename to package/imlib2/0004-fix-X_DISPLAY_MISSING-redefined-warnings-when-X-is-d.patch
index b5d451d..513c493 100644
--- a/package/imlib2/0003-fix-X_DISPLAY_MISSING-redefined-warnings-when-X-is-d.patch
+++ b/package/imlib2/0004-fix-X_DISPLAY_MISSING-redefined-warnings-when-X-is-d.patch
@@ -1,7 +1,7 @@
-From aaf62d4c605726e6c5f6869bd6834eca03c50d9c Mon Sep 17 00:00:00 2001
+From 7fb1a4468b9d0314cffcdd1fd2a156e6f8c5101b Mon Sep 17 00:00:00 2001
 From: Mike Frysinger <vapier@gentoo.org>
 Date: Mon, 28 Jul 2014 22:59:35 -0400
-Subject: [PATCH 3/5] fix X_DISPLAY_MISSING redefined warnings when X is
+Subject: [PATCH 4/6] fix X_DISPLAY_MISSING redefined warnings when X is
  disabled
 
 This is set up in config.h by configure, so avoid defining it again.
diff --git a/package/imlib2/0004-do-not-link-with-X-libs-when-X-is-disabled.patch b/package/imlib2/0005-do-not-link-with-X-libs-when-X-is-disabled.patch
similarity index 84%
rename from package/imlib2/0004-do-not-link-with-X-libs-when-X-is-disabled.patch
rename to package/imlib2/0005-do-not-link-with-X-libs-when-X-is-disabled.patch
index 11611eb..85da48d 100644
--- a/package/imlib2/0004-do-not-link-with-X-libs-when-X-is-disabled.patch
+++ b/package/imlib2/0005-do-not-link-with-X-libs-when-X-is-disabled.patch
@@ -1,7 +1,7 @@
-From c7f6ae523bbe165e50c44c21744f56f6f4b575c5 Mon Sep 17 00:00:00 2001
+From 19d568d7a58e88a6e0a43500175d731fb43f97cd Mon Sep 17 00:00:00 2001
 From: Mike Frysinger <vapier@gentoo.org>
 Date: Mon, 28 Jul 2014 23:01:23 -0400
-Subject: [PATCH 4/5] do not link with X libs when X is disabled
+Subject: [PATCH 5/6] do not link with X libs when X is disabled
 
 URL: https://bugs.gentoo.org/517670
 ---
diff --git a/package/imlib2/0005-GIF-loader-Fix-for-libgif-version-5.1.patch b/package/imlib2/0006-GIF-loader-Fix-for-libgif-version-5.1.patch
similarity index 89%
rename from package/imlib2/0005-GIF-loader-Fix-for-libgif-version-5.1.patch
rename to package/imlib2/0006-GIF-loader-Fix-for-libgif-version-5.1.patch
index 63e0ef1..2f319d8 100644
--- a/package/imlib2/0005-GIF-loader-Fix-for-libgif-version-5.1.patch
+++ b/package/imlib2/0006-GIF-loader-Fix-for-libgif-version-5.1.patch
@@ -1,7 +1,7 @@
-From 8531957235f8702f8bdafac31059812d66e95c23 Mon Sep 17 00:00:00 2001
+From aa16abfa6c0198668b6a4e101fde8b42ec9cdb68 Mon Sep 17 00:00:00 2001
 From: Heiko Becker <heirecka@exherbo.org>
 Date: Mon, 13 Oct 2014 17:41:25 +0200
-Subject: [PATCH 5/5] GIF loader: Fix for libgif version 5.1
+Subject: [PATCH 6/6] GIF loader: Fix for libgif version 5.1
 
 Summary:
 From giflib-5.1.0's NEWS:
