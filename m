Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137D7E9A059
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 18:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C74BF8230F;
	Thu, 19 Feb 2026 18:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktuUp4wnlktN; Thu, 19 Feb 2026 18:55:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAE0A825E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771527324;
	bh=M+QP140BE2SYZOkmByQfQJ/BK0VkgA2G2Cr2OzvCMTM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d0L528/GvA2LATVesDJMcIO0Lk+A7Lg+XYMHzz4x5dK23t4GMce/pV9gL8SovHbqU
	 RMUzeatmJ9jGQ3fNMyqVJ+kDiYKmzbYR1T/nLkNJvoajbFFBu1nFIY/grvLH1dar8+
	 RfVOZlOsXv7vDBoKM4jHObew3gZt5790FbCbuSv2wlP4QLyeLaHKkpy7Yk6WGsBouE
	 UCxHdY9Abq0vt6St+RkorluM/zIehE25HAJdhEwDzRYkJ3uxcleSo0YAoDADZc1WCt
	 KFczpZsxlJY7J3o/tK6/efH0a6DQFINEnJgKXvjXMzpyeV5H/eYwl+Bsd+aMETEh5B
	 PFDlAJyZ4ujTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAE0A825E8;
	Thu, 19 Feb 2026 18:55:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B1FA37A
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 18:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30EF140C0C
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 18:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYWbeIx_NZnn for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 18:55:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2127140BF9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2127140BF9
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 18:55:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DAFD870EA; Thu, 19 Feb 2026 18:55:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:54:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07006bb7350b28403f59fba4e8ac0338d97698ad
X-Git-Newrev: 854e7443ca4f247f803d2738bd8d64429267ce81
X-Patchwork-Hint: ignore
Message-Id: <20260219185520.0DAFD870EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/olimex_a20_olinuxino_lime: bump
 Linux to version 6.18.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/854e7443ca4f247f803d2738bd8d64429267ce81
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/olimex_a20_olinuxino_lime_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 437a6113c9..7edbdcf369 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
