Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852D2C04A95
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C8D760E7B;
	Fri, 23 Sep 2022 21:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C8D760E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5T1aW3bKY-3u; Fri, 23 Sep 2022 21:46:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C7D460ADA;
	Fri, 23 Sep 2022 21:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C7D460ADA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26BE31BF82C
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DC3041864
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DC3041864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MuoavwxPSCl2 for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:46:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACFFD40984
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACFFD40984
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97F0885F4A; Fri, 23 Sep 2022 21:46:03 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 23 Sep 2022 23:44:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 71d35a41640bc4cef818b0d303478595e03d895f
X-Git-Newrev: 80c8c15c8534a24382b900a07082a289a368f736
X-Patchwork-Hint: ignore
Message-Id: <20220923214603.97F0885F4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc, localedef}: bump to version
 glibc-2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=80c8c15c8534a24382b900a07082a289a368f736
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

patch 0002: already applied upstream

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-is-not-posix-conformant-on-microblaze-wi.patch | 37 ----------------------
 package/glibc/glibc.hash                           |  2 +-
 package/glibc/glibc.mk                             |  2 +-
 package/localedef/localedef.mk                     |  2 +-
 4 files changed, 3 insertions(+), 40 deletions(-)

diff --git a/package/glibc/0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch b/package/glibc/0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch
deleted file mode 100644
index 9797f3a935..0000000000
--- a/package/glibc/0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 87d415cc133ff493ccd02464c061cb171d11ef2f Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Mon, 25 Jul 2022 11:25:15 +0200
-Subject: [PATCH] struct stat is not posix conformant on microblaze with
- __USE_FILE_OFFSET64
-
-Commit a06b40cdf5ba0d2ab4f9b4c77d21e45ff284fac7 updated stat.h to use
-__USE_XOPEN2K8 instead of __USE_MISC to add the st_atim, st_mtim and
-st_ctim members to struct stat. However, for microblaze, there are two
-definitions of struct stat, depending on the __USE_FILE_OFFSET64 macro.
-The second one was not updated.
-
-Change __USE_MISC to __USE_XOPEN2K8 in the __USE_FILE_OFFSET64 version
-of struct stat for microblaze.
-
-Upstream: https://sourceware.org/bugzilla/show_bug.cgi?id=29403
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h b/sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h
-index a2787e88343..850697f4fa6 100644
---- a/sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h
-+++ b/sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h
-@@ -89,7 +89,7 @@ struct stat
-         __blksize_t             st_blksize; /* Optimal block size for I/O.  */
-         int                     __pad3;
-         __blkcnt64_t            st_blocks;  /* Number 512-byte blocks allocated.  */
--# ifdef __USE_MISC
-+# ifdef __USE_XOPEN2K8
-         /* Nanosecond resolution timestamps are stored in a format
-          * equivalent to 'struct timespec'. This is the type used
-          * whenever possible but the Unix namespace rules do not allow the
--- 
-2.35.3
-
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 016467cd81..f5c0f1b175 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  f339586a104a8e12ff44d38fb24574d2abe694ddba322404f8bc1a50f4343228  glibc-2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4.tar.gz
+sha256  596bee874d76bc6c5f62af142c9dd40bcb3625ea26975bbc52e552d40e864e54  glibc-2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 5af539ca62..84122db91f 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4
+GLIBC_VERSION = 2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index ae4cc55f30..987f7e8c65 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4
+LOCALEDEF_VERSION = 2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
