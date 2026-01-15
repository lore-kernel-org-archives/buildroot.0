Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF62CCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 09:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E06E81C20;
	Mon, 19 Jan 2026 09:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOzheozCRBBI; Mon, 19 Jan 2026 09:59:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A44C81CA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816740;
	bh=N60qnZ8s96FzDFAOFUXIELzT9/gaKkD4WGg/WSHal1Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B6SrMk0Osyc6y2k/ns/K8tS+Ct1QRMkmwhrga4yqP7qWis6ZIhXV17VMRJG1AQcw4
	 e1wo863XA2vFXGPiCl6L9HtQM+YQ3Kh2WisLHw9itN+OSMI8o6Qm5TOGXh7wNb1c3Z
	 IuRM322LQAG+mXlDxHBu3FugyqU+InKQzC7MzWBoIoml6r7HbCmhgOf+Kimv1+iIBn
	 6q1NcNlxxyTWQ+DGsTuMErv2Nuf8228qvfznpUMzKvTMfoIsgeHV4eB0DA07pJRHUy
	 +tohP9MAApdF86Ekt29K2COk8Go1yFigRbrxtugE+G/kyumW8Gp/3VFqIYZxhSunWN
	 BIjc5WQG2YZng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A44C81CA0;
	Mon, 19 Jan 2026 09:59:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CBDBC347
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB428406DA
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTLCAQowNvJ0 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06D1A406CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06D1A406CF
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0146288366; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:17:29 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: eaeea525189b68a6f7888edab61effa156c342d0
X-Git-Newrev: 9487aafa1bc2d35d901d0c2f9a5425d577d63625
X-Patchwork-Hint: ignore
Message-Id: <20260119095850.0146288366@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/vlc: bump to
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

commit: https://git.buildroot.net/buildroot/commit/?id=9487aafa1bc2d35d901d0c2f9a5425d577d63625
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Release notes:
https://code.videolan.org/videolan/vlc/-/blob/3.0.22/NEWS

Rebased patch 0005.

Removed patch 0011 which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a8c2ab39950037882a527315425b96f0dbbae215)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/vlc/0005-Don-t-assume-strerror_l-is-available.patch | 8 ++++----
 package/vlc/vlc.hash                                        | 8 ++++----
 package/vlc/vlc.mk                                          | 2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

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
