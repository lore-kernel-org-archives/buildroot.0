Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD310CAC5A5
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 21:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BF5441420;
	Wed, 24 Sep 2025 21:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGsesYC2_syQ; Wed, 24 Sep 2025 21:18:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9469414FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9469414FA;
	Wed, 24 Sep 2025 21:18:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11DF2199
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 21:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4C8E40E58
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 21:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3bM-0i5QFdzq for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 21:18:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E44940E4E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E44940E4E
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 21:18:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D3A7863F8; Wed, 24 Sep 2025 21:18:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Sep 2025 23:04:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98b57fafdf882e8d15f4816e35903270999b50a4
X-Git-Newrev: e0ed51ca8b9ec854caf33c7698d09fa8526f2c55
X-Patchwork-Hint: ignore
Message-Id: <20250924211823.1D3A7863F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: add cpu dependency to
 BR2_TARGET_UBOOT_ZYNQ
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0ed51ca8b9ec854caf33c7698d09fa8526f2c55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the Xilinx Zynq SoC family is always based on ARM Cortex-A9 CPUs, the
BR2_TARGET_UBOOT_ZYNQ option should only be available when the BR2_cortex_a9
option is selected.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/uboot/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 18b58753a7..445fbd3ed0 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -704,6 +704,7 @@ endif
 config BR2_TARGET_UBOOT_ZYNQ
 	bool "Boot on the Xilinx Zynq SoCs"
 	depends on BR2_arm
+	depends on BR2_cortex_a9
 	help
 	  Enable options specific to the Xilinx Zynq family of SoCs.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
