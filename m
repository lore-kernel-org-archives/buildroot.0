Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1EDCCA471
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 20:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E1CF40F38;
	Wed,  1 Oct 2025 20:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lIAQREn_ZZ8g; Wed,  1 Oct 2025 20:01:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B5D941044
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B5D941044;
	Wed,  1 Oct 2025 20:01:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16F3972
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BFC48404A
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISeiyEZypo5X for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD94A8404C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD94A8404C
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABBA3866FC; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:04:54 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6e2b0dd9235456ea32fb9987017154b51374428a
X-Git-Newrev: f924ba6ad1f8973e4cf746fe90bd5b040f2cb251
X-Patchwork-Hint: ignore
Message-Id: <20251001200129.ABBA3866FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] boot/xilinx-embeddedsw:
 only allow apps for device family
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f924ba6ad1f8973e4cf746fe90bd5b040f2cb251
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Add an architecture cpu dependency to each application to make sure that users
can only build applications which are applicable to their target device
family.

The versal_plm and versal_psmfw applications are specific to versal devices
which are based on BR2_cortex_a72.

The zynqmp_pmufw application is specific to zynqmp devices which are based on
BR2_cortex_a53.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9e25bcfdab69745b9bd52569b1fa5987f66bbd8a)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 boot/xilinx-embeddedsw/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 007b24e668..261a24dde9 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -28,6 +28,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 	bool "versal plm"
+	depends on BR2_cortex_a72
 	help
 	  Build versal plm application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
@@ -38,6 +39,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 	bool "versal psmfw"
+	depends on BR2_cortex_a72
 	help
 	  Build versal psmfw application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
@@ -48,6 +50,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
 	bool "zynqmp pmufw"
+	depends on BR2_cortex_a53
 	help
 	  Build zynqmp pmufw application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
