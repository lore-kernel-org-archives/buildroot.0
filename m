Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734A2C7EE2E
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 20:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 105E9416A9;
	Mon, 12 Jun 2023 20:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 105E9416A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4uRDd4i68efX; Mon, 12 Jun 2023 20:23:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D0D840ACD;
	Mon, 12 Jun 2023 20:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D0D840ACD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5BE301BF2BF
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 20:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36559414DE
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 20:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36559414DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R5uv2E-XQ5tt for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 20:22:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEC2D414CD
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 20:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEC2D414CD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA6288283D; Mon, 12 Jun 2023 20:22:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Jun 2023 22:13:26 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: f71c30405022f39e5a965cfb14a6c0b7efc08854
X-Git-Newrev: e8fa92e01695bfb6b2955f012c4bc08cacd02da6
X-Patchwork-Hint: ignore
Message-Id: <20230612202222.CA6288283D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 configs/versal_vck190_defconfig: set BR2_cortex_a72
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8fa92e01695bfb6b2955f012c4bc08cacd02da6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The versal vc1902 on the vck190 evaluation board has an ARM Cortex A72 core.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e217cd28ece8bb07d5eb5c61f9b22b3de8480b3c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/versal_vck190_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 2808fa522b..a393b681c8 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -1,4 +1,5 @@
 BR2_aarch64=y
+BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
