Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0598C64EC4
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DC9161383;
	Tue, 21 Feb 2023 01:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DC9161383
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9GJdwpbtkF3P; Tue, 21 Feb 2023 01:13:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA6D56F99C;
	Tue, 21 Feb 2023 01:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA6D56F99C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71B471BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A15E6FBC7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A15E6FBC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTg9ta357_1m for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F1EB6FBBD
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F1EB6FBBD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D97C828C8; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 11:22:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 58cc22a6d095b9b589e5b001e005032589749084
X-Git-Newrev: fa341f029832a658865ed4b5849efc4b765452f9
X-Patchwork-Hint: ignore
Message-Id: <20230220205240.4D97C828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/zynqmp/kria/uboot.fragment: remove unnecessary configs
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa341f029832a658865ed4b5849efc4b765452f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Reduce the configs in the kria/uboot.fragment to only what is necessary.
These 4 configs are already included in the xilinx_zynqmp_virt_defconfig, so
it is redundant to include them in the kria/uboot.fragment file.  Applying
this patch has zero impact on the u-boot binaries that are built.

This patch has been build and run tested on a kria kv260 starter kit.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/zynqmp/kria/uboot.fragment | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/board/zynqmp/kria/uboot.fragment b/board/zynqmp/kria/uboot.fragment
index 40709549dc..d8efc230a0 100644
--- a/board/zynqmp/kria/uboot.fragment
+++ b/board/zynqmp/kria/uboot.fragment
@@ -7,9 +7,5 @@ CONFIG_PHY=y
 CONFIG_PHY_XILINX_ZYNQMP=y
 CONFIG_PINCTRL=y
 CONFIG_PINCONF=y
-CONFIG_POWER_DOMAIN=y
-CONFIG_ZYNQMP_POWER_DOMAIN=y
-CONFIG_DM_RESET=y
-CONFIG_RESET_ZYNQMP=y
 CONFIG_VIDEO_ZYNQMP_DPSUB=y
 CONFIG_SF_DEFAULT_SPEED=40000000
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
