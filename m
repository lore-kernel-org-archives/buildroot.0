Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEEAC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 18:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1DF884C9F;
	Wed,  1 Nov 2023 18:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1DF884C9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gxl301AtEQXK; Wed,  1 Nov 2023 18:07:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A884084C33;
	Wed,  1 Nov 2023 18:07:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A884084C33
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CE781BF59F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3506E431E6
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3506E431E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M7Xu2JYdXG1v for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 18:07:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9042B431DC
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 18:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9042B431DC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 697728641B; Wed,  1 Nov 2023 18:07:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 19:06:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 095cab35a92d7f3765393a266bbe5a5355fdad73
X-Git-Newrev: fb66b31f0abda33afd4a0fa0ccc7034be0c47977
X-Patchwork-Hint: ignore
Message-Id: <20231101180725.697728641B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmdbx: bump version to 0.12.8
 "Vladimir Utkin"
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0436244654783151201=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0436244654783151201==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fb66b31f0abda33afd4a0fa0ccc7034be0c47977
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is bugfix release of stable libmdbx branch, on the day of the 100th
anniversary of the birth of the outstanding Soviet and Russian scientist
and engineer Vladimir Fedorovich Utkin.

It is reasonable to backport this patch to all applicable releases/branches of Buildroot.

The most significant fixes of v0.12.8:
 - Fixed regression of mdbx_put(MDBX_MULTIPLE) during batch/bulk
   insertion of multi-values (aka "dupsort").
 - Implemented overwriting in mdbx_put(MDBX_CURRENT) of all current
   multi-key values in the absence of the flag MDBX_NOOVERWRITE.
 - Added the ability to use mdbx_cursor_get(MDBX_GET_MULTIPLE) without
   first setting the cursor, combining the batch data getting operation
   with positioning the cursor.
 - Micro-optimization and refactoring cursor_put_nochecklen().
 - Clarifying the wording in the API description, including explanation
   about SIGSEGV and not allowing direct data changes.

The complete ChangeLog: https://gitflic.ru/project/erthink/libmdbx/blob?file=ChangeLog.md

Signed-off-by: Леонид Юрьев (Leonid Yuriev) <leo@yuriev.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmdbx/libmdbx.hash | 2 +-
 package/libmdbx/libmdbx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index 0f5908cf38..82cf28d6a9 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,5 +1,5 @@
 # Hashes from: https://libmdbx.dqdkfa.ru/release/SHA256SUMS
-sha256  e150541c2b07558b961e754e8e9171bf1aa974c8e936f62bd375606f7d550667  libmdbx-amalgamated-0.12.7.tar.xz
+sha256  c78c56c53708bbfc519bf53ebf520d1f09d30ee6427a4bedf713316696e671d0  libmdbx-amalgamated-0.12.8.tar.xz
 
 # Locally calculated
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index 84b58632b6..4cc6cbd08e 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMDBX_VERSION = 0.12.7
+LIBMDBX_VERSION = 0.12.8
 LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.xz
 LIBMDBX_SITE = https://libmdbx.dqdkfa.ru/release
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO

--===============0436244654783151201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0436244654783151201==--
