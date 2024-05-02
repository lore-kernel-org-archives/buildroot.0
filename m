Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F54C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 17:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5455440836;
	Thu,  2 May 2024 17:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7wz3zABVyx5a; Thu,  2 May 2024 17:00:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B73DD41E3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B73DD41E3B;
	Thu,  2 May 2024 17:00:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EF2A1BF296
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 989D040988
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJMi58EgjVYh for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 16:59:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE36540997
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE36540997
 for <buildroot@buildroot.org>; Thu,  2 May 2024 16:59:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DCC186640; Thu,  2 May 2024 16:59:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 May 2024 18:56:55 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 3710b671cad96d81c85d91f2384b6c6f6280a507
X-Git-Newrev: bf3225e55137b5c565d37981b6be0348a52a2cd4
X-Patchwork-Hint: ignore
Message-Id: <20240502165955.0DCC186640@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/imx-gpu-viv: fix
 masking fb option
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf3225e55137b5c565d37981b6be0348a52a2cd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Only the 32bit ARM blob provides the framebuffer backend. This is
apparently independent of which imx8 derivate is used, so changed
the condition for the config option accordingly.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 47a02a5afcdf5d6a72d203c31dabd5727547057c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-gpu-viv/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index 3e095b730c..b8dff8f9ab 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -45,8 +45,8 @@ choice
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 	bool "Framebuffer"
-	# The i.MX8 blob doesn't support FB output
-	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	# The i.MX8 aarch64 blob doesn't support FB output
+	depends on BR2_arm
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 	bool "Wayland"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
