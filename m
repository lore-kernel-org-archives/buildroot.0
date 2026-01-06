Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300CBD0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BDEF413A9;
	Wed,  7 Jan 2026 18:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZ8ibazEhwIb; Wed,  7 Jan 2026 18:02:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A89640C0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808932;
	bh=nUGm4TAzBhV6ccUQEPJXNmJ4CnIBs1cYdPDJJQpTUOY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Id7LwcQ8sU8b9TpdpVk+ryutr/ASBKRvGB7dOC9CUBMvXG1v+Yk0QWkNep5mCIZt2
	 UQf2j68mog23H9QdkunLP1G4Eyna+iQF4kjV+DknYOejeKJ1iBYAFAsKwkMIiB9EBf
	 9JuYEaVjehGpx1r6mKXrDc+rDoFJXIR4EsauaqdeybnRohsPNpY1ngpGXSqsSExrgA
	 ggTfVihoJRyGd0WT4vdbgeiKdrsgYLIOZkwyZUvETOYL+cubOLN0sHYORg/YlsPrX3
	 8Kw7obE3E6leORQCCBo+EuU8XGcYY5vH4gyqZ27GpmRt4aVu2TsHyOWtnlM5Ugri60
	 /5/CmGxtF1dSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A89640C0F;
	Wed,  7 Jan 2026 18:02:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1880DA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7079C81102
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQ07NYJyxc9w for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9951580FB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9951580FB2
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9812F8268F; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:51:56 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: f3a7d86a7cb6f6e494f6f2bdc2f194085963ce17
X-Git-Newrev: c55f7eb582e6c9bfcefbcc878143a215dd0d0ed0
X-Patchwork-Hint: ignore
Message-Id: <20260107180112.9812F8268F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] toolchain/Config.in: drop
 BR2_TOOLCHAIN_HAS_GCC_BUG_121567
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
Content-Type: multipart/mixed; boundary="===============1899054271324229560=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1899054271324229560==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c55f7eb582e6c9bfcefbcc878143a215dd0d0ed0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

GCC bug 121567 is actually a duplicate of GCC bug 81426, which already
existed upstream, and for which we already had
BR2_TOOLCHAIN_HAS_GCC_BUG_81246.

In addition, BR2_TOOLCHAIN_HAS_GCC_BUG_81246 is correctly defined as
affecting SuperH regardless of the optimization level. Indeed, when
BR2_TOOLCHAIN_HAS_GCC_BUG_121567 was introduced, it was thought that
only -O2 and -O3 levels are affected, but -Og, -O1 and -Ofast are also
affected, causing the python3 build to fail.

Fixes:

  https://autobuild.buildroot.net/results/aca1812415ee84eef223b0fdff88f31a39775294/ (-O1 build)

  https://autobuild.buildroot.net/results/3fd91ce3ff8727d2f9c12f6721df922c60282d70/ (-Ofast build)

  https://autobuild.buildroot.net/results/e5536dcf598a51f5006343513a76f4e223e80a55/ (-Og build)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2667cab664b568ff0619dacf5d0b38d5926aff61)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python3/python3.mk |  2 +-
 toolchain/Config.in        | 13 +++----------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 4e660ecee2..0690678c04 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -191,7 +191,7 @@ endif
 
 PYTHON3_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_121567),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_81426),y)
 PYTHON3_CFLAGS += -O0
 endif
 
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 8330e652c2..99337a1873 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -141,6 +141,9 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
 	default y if BR2_microblaze
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81426
+# error: unable to find a register to spill in class ‘R0_REGS’
+# The bug exists at least since gcc 6.x, so we are assuming it affects
+# all GCC versions.
 config BR2_TOOLCHAIN_HAS_GCC_BUG_81426
 	bool
 	default y if BR2_sh
@@ -243,16 +246,6 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_111001
 		   BR2_OPTIMIZE_2 || \
 		   BR2_OPTIMIZE_3
 
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121567
-# error: unable to find a register to spill in class ‘R0_REGS’
-# The bug exists at least since gcc 6.x, so we are assuming it affects
-# all GCC versions.
-config BR2_TOOLCHAIN_HAS_GCC_BUG_121567
-	bool
-	default y if BR2_sh
-	depends on BR2_OPTIMIZE_2 || \
-		   BR2_OPTIMIZE_3
-
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 

--===============1899054271324229560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1899054271324229560==--
