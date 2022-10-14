Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EC4C43219
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 14:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F7C54119A;
	Fri, 14 Oct 2022 14:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F7C54119A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HeU5P-R43bdc; Fri, 14 Oct 2022 14:10:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC7D740629;
	Fri, 14 Oct 2022 14:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC7D740629
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EDC71BF2F9
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 14:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B340983EC4
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 14:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B340983EC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0aotPTsEu-VT for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 14:09:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30404841C1
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 14:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30404841C1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E33C86CEE; Fri, 14 Oct 2022 14:09:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 16:07:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b790f6e494e65b4704c1e6c5cd38c38fc0bd7719
X-Git-Newrev: dd2ded3355c01f333c18dc16e7d9a3c496007960
X-Patchwork-Hint: ignore
Message-Id: <20221014140933.1E33C86CEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmdbx: bump version to 0.11.12
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
Content-Type: multipart/mixed; boundary="===============5640113494388926349=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5640113494388926349==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=dd2ded3355c01f333c18dc16e7d9a3c496007960
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============5640113494388926349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5640113494388926349==--
