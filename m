Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9962CC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 394C942CEB;
	Mon, 20 Feb 2023 21:29:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 394C942CEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xqbq1jfYgI9R; Mon, 20 Feb 2023 21:29:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE62345AC9;
	Mon, 20 Feb 2023 21:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE62345AC9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27E921BF94D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83BB14159E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83BB14159E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rdAXkIDVxPof for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 200254159D
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 200254159D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C25B86495; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 1 Dec 2022 22:22:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6866076d79ff2e022762b79421f511a8037fda73
X-Git-Newrev: 0b71948c32bdc7f849190cb9501f72faa608dc17
X-Patchwork-Hint: ignore
Message-Id: <20230220205154.1C25B86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libmdbx: bump version
 to 0.11.13 "Swashplate"
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
Content-Type: multipart/mixed; boundary="===============0256124020649705706=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0256124020649705706==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0b71948c32bdc7f849190cb9501f72faa608dc17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is stable bugfix release of libmdbx, in Family Glory and
in memory of Boris Yuriev (the inventor of Helicopter and
Swashplate in 1911) on his 133rd birthday.

It is reasonable to backport this patch to all applicable releases/branches of Buildroot.

Release notes for v0.11.13
--------------------------

Fixes:

 - Fixed builds with older libc versions after using `fcntl64()` (backport).
 - Fixed builds with  older `stdatomic.h` versions,
   where the `ATOMIC_*_LOCK_FREE` macros mistakenly redefined using functions (backport).
 - Added workaround for `mremap()` defect to avoid assertion failure (backport).
 - Workaround for `encryptfs` bug(s) in the `copy_file_range` implementation  (backport).
 - Fixed unexpected `MDBX_BUSY` from `mdbx_env_set_option()`, `mdbx_env_set_syncbytes()`
   and `mdbx_env_set_syncperiod()` (backport).
 - CMake requirements lowered to version 3.0.2 (backport).
 - Added admonition of insecure for RISC-V (backport).

Minors:

 - Minor clarification output of `--help` for `mdbx_test` (backport).
 - Added admonition of insecure for RISC-V (backport).
 - Stochastic scripts and CMake files synchronized with the `devel` branch.
 - Use `--dont-check-ram-size` for small-tests make-targets (backport).

The complete ChangeLog: https://gitflic.ru/project/erthink/libmdbx/blob?file=ChangeLog.md

Signed-off-by: Леонид Юрьев (Leonid Yuriev) <leo@yuriev.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmdbx/libmdbx.hash | 2 +-
 package/libmdbx/libmdbx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index 79af189633..e3fb309461 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,5 +1,5 @@
 # Hashes from: https://libmdbx.dqdkfa.ru/release/SHA256SUMS
-sha256  dde8f3626509bb764b17c93fe0629389625cb50362502eb1c27ca208342f3894  libmdbx-amalgamated-0.11.12.tar.xz
+sha256  9449fd357119e19902363ab90134d82c9a713b706394c2a1389b5bb4787b5164  libmdbx-amalgamated-0.11.13.tar.xz
 
 # Locally calculated
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index ac1a3a0d6f..a139e062f6 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMDBX_VERSION = 0.11.12
+LIBMDBX_VERSION = 0.11.13
 LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.xz
 LIBMDBX_SITE = https://libmdbx.dqdkfa.ru/release
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO

--===============0256124020649705706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0256124020649705706==--
