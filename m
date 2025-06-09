Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032D4C71143
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C32EE83BA5;
	Thu, 12 Jun 2025 08:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nrDULAXf-8Be; Thu, 12 Jun 2025 08:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E953583B97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E953583B97;
	Thu, 12 Jun 2025 08:41:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D8091E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20C6841700
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ggPwC9KU0nZa for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E95B421F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E95B421F1
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C2E6805F4; Thu, 12 Jun 2025 08:38:35 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Jun 2025 21:25:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c95df7404b04b324a631ddbaa4dc7bc605666e8
X-Git-Newrev: 1106a1006b692b2344c0210655bbaceb5480a776
X-Patchwork-Hint: ignore
Message-Id: <20250612083835.1C2E6805F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynqmp/kria: remove kria specific
 u-boot patch
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1106a1006b692b2344c0210655bbaceb5480a776
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that all 3 zynqmp_kria defconfigs have bumped to xilinx_v2025.1, the kria
specific u-boot patch can be removed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-video-zynqmp-add-support-for-reset.patch  | 42 ----------------------
 1 file changed, 42 deletions(-)

diff --git a/board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch b/board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch
deleted file mode 100644
index ded030b3b2..0000000000
--- a/board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From: Michal Simek <michal.simek@amd.com>
-Date: Mon, 9 Dec 2024 12:11:50 +0100
-Subject: [PATCH] video: zynqmp: Add support for reset
-
-In Kria SOM configuration DP is under reset and access to DP is causing
-hang that's why call reset at probe to avoid this situation.
-
-Signed-off-by: Michal Simek <michal.simek@amd.com>
-Link: https://lore.kernel.org/r/0504474a91a9839828aecd37f8855fd154cdf2e1.1733742708.git.michal.simek@amd.com
-Upstream: https://github.com/u-boot/u-boot/commit/8b81010a2fe385524b58bea9116f1b6954c3d2bd
----
- drivers/video/zynqmp/zynqmp_dpsub.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/drivers/video/zynqmp/zynqmp_dpsub.c b/drivers/video/zynqmp/zynqmp_dpsub.c
-index 76abfeac4433..52af23c3c835 100644
---- a/drivers/video/zynqmp/zynqmp_dpsub.c
-+++ b/drivers/video/zynqmp/zynqmp_dpsub.c
-@@ -11,6 +11,7 @@
- #include <dm.h>
- #include <errno.h>
- #include <generic-phy.h>
-+#include <reset.h>
- #include <stdlib.h>
- #include <video.h>
- #include <wait_bit.h>
-@@ -2093,10 +2094,15 @@ static int zynqmp_dpsub_probe(struct udevice *dev)
- {
- 	struct video_priv *uc_priv = dev_get_uclass_priv(dev);
- 	struct zynqmp_dpsub_priv *priv = dev_get_priv(dev);
-+	struct reset_ctl_bulk resets;
- 	struct clk clk;
- 	int ret;
- 	int mode = RGBA8888;
- 
-+	ret = reset_get_bulk(dev, &resets);
-+	if (!ret)
-+		reset_deassert_bulk(&resets);
-+
- 	ret = clk_get_by_name(dev, "dp_apb_clk", &clk);
- 	if (ret < 0) {
- 		dev_err(dev, "failed to get clock\n");
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
