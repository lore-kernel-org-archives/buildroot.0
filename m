Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4373CC433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 15:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4CAC81B9A;
	Sat, 15 Oct 2022 15:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4CAC81B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OkXkKXogk74O; Sat, 15 Oct 2022 15:39:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2AF081B04;
	Sat, 15 Oct 2022 15:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2AF081B04
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1190C1BF5DE
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 417BD414CD
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 417BD414CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id scXtkRhGOgti for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 15:38:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 957F141578
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 957F141578
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7040686DD1; Sat, 15 Oct 2022 15:38:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:30:17 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 0777bd794d6dac764e5f0fe6b49dc5f6bd4850f0
X-Git-Newrev: 6112142aa044cc1648ec32665ca2fafad0a84702
X-Patchwork-Hint: ignore
Message-Id: <20221015153823.7040686DD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/libmdbx: bump
 version to 0.11.12
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
Content-Type: multipart/mixed; boundary="===============5493391841131015363=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5493391841131015363==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6112142aa044cc1648ec32665ca2fafad0a84702
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

This is stable bugfix release of libmdbx. So it is reasonable to backport
this patch to all applicable releases/branches of Buildroot.

Release notes for v0.11.12
--------------------------

Fixes:

  - Fixed static assertion failure on platforms where the `off_t` type is wider
    than corresponding fields of `struct flock` used for file locking (backport).
    Now _libmdbx_ will use `fcntl64(F_GETLK64/F_SETLK64/F_SETLKW64)` if available.
  - Fixed assertion check inside `page_retire_ex()` (backport).

Minors:

  - Fixed `-Wint-to-pointer-cast` warnings while casting to `mdbx_tid_t` (backport).
  - Removed needless `LockFileEx()` inside `mdbx_env_copy()` (backport).

The complete ChangeLog: https://gitflic.ru/project/erthink/libmdbx/blob?file=ChangeLog.md

Signed-off-by: Леонид Юрьев (Leonid Yuriev) <leo@yuriev.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dd2ded3355c01f333c18dc16e7d9a3c496007960)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmdbx/libmdbx.hash | 2 +-
 package/libmdbx/libmdbx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index c4d9c8d8ce..79af189633 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,5 +1,5 @@
 # Hashes from: https://libmdbx.dqdkfa.ru/release/SHA256SUMS
-sha256  d2c81db716a33d007cc75702ecf3c45cfb7c33a2261fbacced6945204ece1b67  libmdbx-amalgamated-0.11.11.tar.xz
+sha256  dde8f3626509bb764b17c93fe0629389625cb50362502eb1c27ca208342f3894  libmdbx-amalgamated-0.11.12.tar.xz
 
 # Locally calculated
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index 357b1bac9e..ac1a3a0d6f 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMDBX_VERSION = 0.11.11
+LIBMDBX_VERSION = 0.11.12
 LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.xz
 LIBMDBX_SITE = https://libmdbx.dqdkfa.ru/release
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO

--===============5493391841131015363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5493391841131015363==--
