Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25EACAC5B9
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 17:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DE5561CBD;
	Fri, 26 Sep 2025 17:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcAk8kxT_VcB; Fri, 26 Sep 2025 17:18:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E2B461CA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E2B461CA9;
	Fri, 26 Sep 2025 17:18:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1800E198
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB8F661C01
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bgsjUuA_SH8A for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 17:18:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C82761C71
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C82761C71
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:18:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0CEB864D6; Fri, 26 Sep 2025 17:18:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Sep 2025 19:10:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7b455c9f085306d43c2c5cca276db6df5bb696b
X-Git-Newrev: 5986c51219f9bc8a05d5903477a5a0292a869b94
X-Patchwork-Hint: ignore
Message-Id: <20250926171847.F0CEB864D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: use
 BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=5986c51219f9bc8a05d5903477a5a0292a869b94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate the BR2_TARGET_UBOOT_ZYNQMP dependency to the new
BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS symbol. Also, add a cpu dependency
on BR2_cortex_a53 since the zynqmp platform is based on the ARM Cortex-A53
and the BR2_TARGET_UBOOT_ZYNQMP should not be available for other CPUs with
aarch64 architecture.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/uboot/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 445fbd3ed0..9320f942d6 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -575,7 +575,8 @@ config BR2_TARGET_UBOOT_INITIAL_ENV
 
 config BR2_TARGET_UBOOT_ZYNQMP
 	bool "Boot on the Xilinx ZynqMP SoCs"
-	depends on BR2_aarch64
+	depends on BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
+	depends on BR2_cortex_a53
 	help
 	  Enable options specific to the Xilinx ZynqMP family of SoCs.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
