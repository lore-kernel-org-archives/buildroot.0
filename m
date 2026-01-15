Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5909DCCF2D1
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CC6340CEC;
	Mon, 19 Jan 2026 10:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FiIOp0VzPZIx; Mon, 19 Jan 2026 10:00:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21E1F40D14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816852;
	bh=MOvMrBu/IvgX6dcGLr3dDBpVrKORLvVXxqV07TBzML0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N/vpgRKUacomiR3Pvc1Wjq6FsGrKu2zHQgz44mjztO+q9+aL/I10t2c5Tfcsa/psC
	 OYaa62xK4uCk7H4HWmK+ItxpmJcvmJUYlmjBkUg/e/vQQduWK+KghRotHER361cbnY
	 HcGKOICRfdqoNFte3Yg74+7RlMfkDpUe/XdsgazsPZZDTrmck841PlysLcjKzS9kWb
	 MRcKDisRvGKaNeYEbcf0Bg3TBeCX5+dAoy+2YL/B/zJF9ZLVBibJSWRGpPufLzKuun
	 dEQjTxFpPRwljrbZh4xYNPcK6o5xuzLBORz1k5T2TfNYblDrf5/SAOxTon4Y5CkPWt
	 O8+DjztZiyUtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21E1F40D14;
	Mon, 19 Jan 2026 10:00:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 14F51160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D082A406D4
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EFvTghoTRoOj for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CDCD406D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CDCD406D5
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BE9088587; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:17:32 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 8a6bf80827f48074af7074f4222180682556daa1
X-Git-Newrev: 09e041bdf8ec92d6d2996142f2690ad5952ce3d0
X-Patchwork-Hint: ignore
Message-Id: <20260119100040.9BE9088587@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/vlc: bump to
 version 3.0.22
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=09e041bdf8ec92d6d2996142f2690ad5952ce3d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Release notes:
https://code.videolan.org/videolan/vlc/-/blob/3.0.22/NEWS

Rebased patch 0005.

Removed patch 0011 which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a8c2ab39950037882a527315425b96f0dbbae215)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...0005-Don-t-assume-strerror_l-is-available.patch |  8 ++--
 ...ive555-fix-build-with-versions-2024.11.28.patch | 47 ----------------------
 package/vlc/vlc.hash                               |  8 ++--
 package/vlc/vlc.mk                                 |  2 +-
 4 files changed, 9 insertions(+), 56 deletions(-)

diff --git a/package/vlc/0005-Don-t-assume-strerror_l-is-available.patch b/package/vlc/0005-Don-t-assume-strerror_l-is-available.patch
index cd839b7379..e860f56ac4 100644
--- a/package/vlc/0005-Don-t-assume-strerror_l-is-available.patch
+++ b/package/vlc/0005-Don-t-assume-strerror_l-is-available.patch
@@ -11,8 +11,8 @@ Fix compile error
 Code for #else condition was taken from
 http://patches.osdyson.org/patch/series/view/vlc/2.2.0~rc2-1+dyson2/dyson.patch
 
-[Bernd: rebased for vlc-3.0.6 & 3.0.9.2]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for 3.0.22]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure.ac      | 2 +-
  src/posix/error.c | 4 ++++
@@ -22,13 +22,13 @@ diff --git a/configure.ac b/configure.ac
 index dfb4c1c329..bfe43512a2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -590,7 +590,7 @@ dnl Check for system libs needed
+@@ -667,7 +667,7 @@
  need_libc=false
  
  dnl Check for usual libc functions
 -AC_CHECK_FUNCS([accept4 daemon fcntl flock fstatvfs fork getenv getmntent_r getpwuid_r isatty lstat memalign mkostemp mmap newlocale open_memstream openat pipe2 pread posix_fadvise posix_madvise posix_memalign setlocale stricmp strnicmp strptime uselocale])
 +AC_CHECK_FUNCS([accept4 daemon fcntl flock fstatvfs fork getenv getmntent_r getpwuid_r isatty lstat memalign mkostemp mmap newlocale open_memstream openat pipe2 pread posix_fadvise posix_madvise posix_memalign setlocale strerror_l stricmp strnicmp strptime uselocale])
- AC_REPLACE_FUNCS([aligned_alloc atof atoll dirfd fdopendir ffsll flockfile fsync getdelim getpid lfind lldiv memrchr nrand48 poll recvmsg rewind sendmsg setenv strcasecmp strcasestr strdup strlcpy strndup strnlen strnstr strsep strtof strtok_r strtoll swab tdestroy tfind timegm timespec_get strverscmp pathconf])
+ AC_REPLACE_FUNCS([aligned_alloc atof atoll dirfd fdopendir flockfile fsync getdelim getpid lfind lldiv memrchr nrand48 poll recvmsg rewind sendmsg setenv strcasecmp strcasestr strdup strlcpy strndup strnlen strnstr strsep strtof strtok_r strtoll swab tdestroy tfind timegm timespec_get strverscmp pathconf])
  AC_REPLACE_FUNCS([gettimeofday])
  AC_CHECK_FUNC(fdatasync,,
 diff --git a/src/posix/error.c b/src/posix/error.c
diff --git a/package/vlc/0011-live555-fix-build-with-versions-2024.11.28.patch b/package/vlc/0011-live555-fix-build-with-versions-2024.11.28.patch
deleted file mode 100644
index 9708f680c9..0000000000
--- a/package/vlc/0011-live555-fix-build-with-versions-2024.11.28.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 8befcbfa834b809602db24c9ba7456d8cfc25cdb Mon Sep 17 00:00:00 2001
-From: Florian Albrechtskirchinger <falbrechtskirchinger@gmail.com>
-Date: Sun, 2 Mar 2025 08:30:43 +0100
-Subject: [PATCH] live555: fix build with versions >= 2024.11.28
-
-In the 2024.11.28 release (version 1732752000), live555 introduced
-`EventLoopWatchVariable` as a typedef for `std::atomic<char>`, replacing
-direct use of `char` in earlier versions. Add a conditional typedef to
-define it as `char` for older versions, and update `event_rtsp` and
-`event_data` to use `EventLoopWatchVariable`.
-
-Upstream: https://code.videolan.org/videolan/vlc/-/commit/8befcbfa834b809602db24c9ba7456d8cfc25cdb
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- modules/access/live555.cpp | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/modules/access/live555.cpp b/modules/access/live555.cpp
-index 461766661e49..cacea3c46952 100644
---- a/modules/access/live555.cpp
-+++ b/modules/access/live555.cpp
-@@ -194,6 +194,10 @@ class RTSPClientVlc;
- #define CAP_SUBSESSION_PAUSE    (1 << 3)
- #define CAPS_DEFAULT            CAP_RATE_CONTROL
- 
-+#if LIVEMEDIA_LIBRARY_VERSION_INT < 1732752000 // 2024.11.28
-+typedef char EventLoopWatchVariable;
-+#endif
-+
- struct demux_sys_t
- {
-     char            *p_sdp;    /* XXX mallocated */
-@@ -232,8 +236,8 @@ struct demux_sys_t
-     bool             b_no_data;     /* if we never received any data */
-     int              i_no_data_ti;  /* consecutive number of TaskInterrupt */
- 
--    char             event_rtsp;
--    char             event_data;
-+    EventLoopWatchVariable event_rtsp;
-+    EventLoopWatchVariable event_data;
- 
-     bool             b_get_param;   /* Does the server support GET_PARAMETER */
-     bool             b_paused;      /* Are we paused? */
--- 
-GitLab
-
diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index b3d9a083b9..6733a870b1 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,7 +1,7 @@
-# From https://get.videolan.org/vlc/3.0.21/vlc-3.0.21.tar.xz.sha256
-sha256  24dbbe1d7dfaeea0994d5def0bbde200177347136dbfe573f5b6a4cee25afbb0  vlc-3.0.21.tar.xz
-# From https://get.videolan.org/vlc/3.0.21/vlc-3.0.21.tar.xz.sha1
-sha1  be8557fc2f4be58caebe4a8b1d70f03dc6b95792  vlc-3.0.21.tar.xz
+# From https://get.videolan.org/vlc/3.0.22/vlc-3.0.22.tar.xz.sha256
+sha256  e2cc1cf0ae0902a09da5a37c249a8a4e4b5ec4dc095443b8e1493c6a7cc138ea  vlc-3.0.22.tar.xz
+# From https://get.videolan.org/vlc/3.0.22/vlc-3.0.22.tar.xz.sha1
+sha1  f9871439cdb281e18a78828c389cf7bf66d47d69  vlc-3.0.22.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index a597616470..81783c99ed 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.21
+VLC_VERSION = 3.0.22
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
