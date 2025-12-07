Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA0FD4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2E8683A73;
	Fri, 12 Dec 2025 07:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmMntjyRm2n3; Fri, 12 Dec 2025 07:59:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB06F8420E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526330;
	bh=W0xUmpv75WLaJnMCz/zmYbbTLBh5FHjRsMcEIIB2KVo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cHJ3K/LavAGdcqgU90hFF4XRa/dZB7Whi5Hwe7hQ4QeUSQlpyQg9pb4C7hwJc16q5
	 7XELMOm6RfU1Floc5lh50nXQ/1xu3vG0rllFWxk6tHb1K9auPjM2zZiqtFGcyN4ybS
	 W+3b9wC94JcqZ5H1TWtidbe8ADWoukKeOi2L30DgcuCGG1Rz+XsnJyRyn4CpK5AhlR
	 cpw1FBW44bXbicW6RFqG9xSEeRA842bvl3NFk4XAY5CFsSJ6BBnwAjL7gOU1u4FoXr
	 1+wI5kltbKtZ/Nzqh5n+CfVR3gMor+fIzMrxEA+S/ctbn6xW7whpVQwVcM4m6mVmiU
	 vuT3e1cmP7dSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB06F8420E;
	Fri, 12 Dec 2025 07:58:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E66662C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24D9B41177
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qUC3Lme8y-fh for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 763C041185
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 763C041185
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7560C807F9; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 22:18:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51fe7dad2cde7491b23a9a120db9f58f498e98d4
X-Git-Newrev: def104dd90952e9f80fb0f3c161d5641a0d168eb
X-Patchwork-Hint: ignore
Message-Id: <20251212075538.7560C807F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swugenerator: bump to version 0.6
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=def104dd90952e9f80fb0f3c161d5641a0d168eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://github.com/sbabic/swugenerator/releases/tag/0.6

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/swugenerator/swugenerator.hash | 2 +-
 package/swugenerator/swugenerator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swugenerator/swugenerator.hash b/package/swugenerator/swugenerator.hash
index 184fd86e27..75a902f2c4 100644
--- a/package/swugenerator/swugenerator.hash
+++ b/package/swugenerator/swugenerator.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  bb816a77278a2d320e36cdd6fd1bb9b8318b4ef4ccd05e79bb1d5ee631a1d5c1  swugenerator-0.5.tar.gz
+sha256  06098c4b3a6c3e5946a11929f95f280baacb512fc4154e16af2262c60a36cbc6  swugenerator-0.6.tar.gz
 # Locally computed sha256 checksums
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/swugenerator/swugenerator.mk b/package/swugenerator/swugenerator.mk
index 5acabc2036..a892002369 100644
--- a/package/swugenerator/swugenerator.mk
+++ b/package/swugenerator/swugenerator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUGENERATOR_VERSION = 0.5
+SWUGENERATOR_VERSION = 0.6
 SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,$(SWUGENERATOR_VERSION))
 SWUGENERATOR_LICENSE = GPL-3.0
 SWUGENERATOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
