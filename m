From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Sep 2019 18:38:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/strace: bump version to 5.3
Message-ID: <20190929163845.7382-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ts.in-work-around-V4L2_PIX_FMT_BGRA4.patch | 42 -------------------
 package/strace/strace.hash                    |  4 +-
 package/strace/strace.mk                      |  2 +-
 3 files changed, 3 insertions(+), 45 deletions(-)
 delete mode 100644 package/strace/0001-xlat-v4l2_pix_fmts.in-work-around-V4L2_PIX_FMT_BGRA4.patch

diff --git a/package/strace/0001-xlat-v4l2_pix_fmts.in-work-around-V4L2_PIX_FMT_BGRA4.patch b/package/strace/0001-xlat-v4l2_pix_fmts.in-work-around-V4L2_PIX_FMT_BGRA4.patch
deleted file mode 100644
index 3057b6ee0c..0000000000
--- a/package/strace/0001-xlat-v4l2_pix_fmts.in-work-around-V4L2_PIX_FMT_BGRA4.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 60da39553ff92cf741bf7f54daff636bb28cbb3c Mon Sep 17 00:00:00 2001
-From: Eugene Syromyatnikov <evgsyr@gmail.com>
-Date: Wed, 24 Jul 2019 00:32:53 +0200
-Subject: [PATCH] xlat/v4l2_pix_fmts.in: work around V4L2_PIX_FMT_BGRA444 value
- change
-
-* xlat/v4l2_pix_fmts.in: Undefine V4L2_PIX_FMT_BGRA444 as it has changed
-its value in Linux commit v5.2-rc5-403-g22be8233b34f.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 60da39553ff92
-
- xlat/v4l2_pix_fmts.in | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/xlat/v4l2_pix_fmts.in b/xlat/v4l2_pix_fmts.in
-index 3276d3818a12..e742d07ac51c 100644
---- a/xlat/v4l2_pix_fmts.in
-+++ b/xlat/v4l2_pix_fmts.in
-@@ -37,8 +37,17 @@ V4L2_PIX_FMT_RGB332  v4l2_fourcc('R', 'G', 'B', '1') /*  8  RGB-3-3-2     */
- V4L2_PIX_FMT_H264_NO_SC v4l2_fourcc('A', 'V', 'C', '1') /* H264 without start codes */
- V4L2_PIX_FMT_PWC1     v4l2_fourcc('P', 'W', 'C', '1') /* pwc older webcam */
- V4L2_PIX_FMT_MPEG1    v4l2_fourcc('M', 'P', 'G', '1') /* MPEG-1 ES     */
--V4L2_PIX_FMT_BGRA444 v4l2_fourcc('B', 'A', '1', '2') /* 16  bbbbgggg rrrraaaa */
- V4L2_PIX_FMT_SGRBG12 v4l2_fourcc('B', 'A', '1', '2') /* 12  GRGR.. BGBG.. */
-+#ifndef STRACE_WORKAROUND_FOR_V4L2_PIX_FMT_BGRA444
-+# define STRACE_WORKAROUND_FOR_V4L2_PIX_FMT_BGRA444
-+/*
-+ * V4L2_PIX_FMT_BGRA444 was introduced in Linux commit v5.2-rc1~33^2~24 with
-+ * the value of v4l2_fourcc('B', 'A', '1', '2') and changed in commit
-+ * v5.2-rc5-403-g22be8233b34f as it clashed with V4L2_PIX_FMT_SGRBG12.
-+ */
-+# undef V4L2_PIX_FMT_BGRA444
-+#endif
-+V4L2_PIX_FMT_BGRA444 v4l2_fourcc('G', 'A', '1', '2') /* 16  bbbbgggg rrrraaaa */
- V4L2_PIX_FMT_RGBA444 v4l2_fourcc('R', 'A', '1', '2') /* 16  rrrrgggg bbbbaaaa */
- V4L2_PIX_FMT_ABGR444 v4l2_fourcc('A', 'B', '1', '2') /* 16  aaaabbbb ggggrrrr */
- V4L2_PIX_FMT_SGBRG12 v4l2_fourcc('G', 'B', '1', '2') /* 12  GBGB.. RGRG.. */
--- 
-2.23.0.rc1
-
diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 51436cf850..2386857c2f 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/5.2/strace-5.2.tar.xz.asc
-sha256	d513bc085609a9afd64faf2ce71deb95b96faf46cd7bc86048bc655e4e4c24d2	strace-5.2.tar.xz
+# https://strace.io/files/5.3/strace-5.3.tar.xz.asc
+sha256	6c131198749656401fe3efd6b4b16a07ea867e8f530867ceae8930bbc937a047	strace-5.3.tar.xz
 sha256	739b2725197137a04ab48ee6b19da3fdf7e497249e0dedd9f51c11a570401ede	COPYING
 sha256	7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa	LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 0fdd7d66ff..46990423d5 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 5.2
+STRACE_VERSION = 5.3
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.20.1
