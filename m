Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D75C87FD2
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 14:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67FDD4134B;
	Mon, 11 Aug 2025 14:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k5hCbuzglbJ4; Mon, 11 Aug 2025 14:13:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73AD0413B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73AD0413B3;
	Mon, 11 Aug 2025 14:13:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA6FF154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 14:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 910B283E34
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 14:13:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2hNMJpvGpA4 for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 14:13:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C12B283E2F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C12B283E2F
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 14:13:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1C5487402; Mon, 11 Aug 2025 14:13:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 15:46:40 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 176fed6cc006629ecd43b9930ab975db54a8f850
X-Git-Newrev: 8ffaffb0b9485f4ff41c4ec8ec6be280d4b461a1
X-Patchwork-Hint: ignore
Message-Id: <20250811141326.B1C5487402@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] linux: fix bump to 6.12.41
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ffaffb0b9485f4ff41c4ec8ec6be280d4b461a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

In commit [1], the linux 6.12 version was bumped to 6.12.41 but didn't
align linux/Config.in to include that bump.

[1] 52f03f832f {linux, linux-headers}: bump 6.{6, 12}.x series

Fixes: https://autobuild.buildroot.org/results/6a9/6a9f7617368d71b810586e29081c5239831b597e
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8a66fd453e..b36f926c18 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.40" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.41" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
