Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7748CC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3991460EE8;
	Mon, 19 May 2025 10:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ICFKsCNmsYm; Mon, 19 May 2025 10:39:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69F4A60EF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69F4A60EF8;
	Mon, 19 May 2025 10:39:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BE55E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B7D48145E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DxCOD9B2c0-y for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE48F81E86
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE48F81E86
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 741A9873D3; Mon, 19 May 2025 10:39:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 5 Mar 2025 21:56:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 77674c6cfbd40e174048897255658d31e3ead15a
X-Git-Newrev: 4519670c623ee70cf05c0d65611ba09d9461daf9
X-Patchwork-Hint: ignore
Message-Id: <20250519103941.741A9873D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/freescale-imx: Forbid
 DDR selection for i.MX93/91
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

commit: https://git.buildroot.net/buildroot/commit/?id=4519670c623ee70cf05c0d65611ba09d9461daf9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The DRAM controller on the i.MX93 and i.MX91 does not support DDR3
nor DDR4 memories.

Forbid the selection of DDR3 and DDR4 firmwares on those SoCs.

Fixes: 1ec956130d6f ("package/freescale-imx: Allow firmware installation on i.MX93")
Reported-by: Sebastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Sebastien Szymanski <sebastien.szymanski@armadeus.com>
[Julien: reword the commit log to also mention i.MX91]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/firmware-imx/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 17c10039b2..0acc235e0a 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -77,6 +77,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_LPDDR4
 	help
 	  Use LPDDR4 binaries (i.e.: lpddr4_pmu_train_*.bin)
 
+if !BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9
 config BR2_PACKAGE_FIRMWARE_IMX_DDR4
 	bool "DDR4"
 	help
@@ -87,6 +88,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_DDR3
 	help
 	  Use DDR3 binaries (i.e.: ddr3_*_201810.bin).
 
+endif
 endchoice # DDR training FW
 
 config BR2_PACKAGE_FIRMWARE_IMX_DDR_VERSION
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
