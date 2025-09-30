Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AB2CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 21:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 824E061550;
	Wed,  1 Oct 2025 21:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Mg2qo9p7fAY; Wed,  1 Oct 2025 21:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40D2F61546
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40D2F61546;
	Wed,  1 Oct 2025 21:00:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 100D8E04
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FE6741488
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wn9KvFyPzX8n for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4899741481
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4899741481
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 468B0817A9; Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:31:44 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 6f5a9d7e362b2dfcdd3811a9dd002930dc2e1bca
X-Git-Newrev: 4f73d980267a45fcdd0903371fc65bbb1f048eb6
X-Patchwork-Hint: ignore
Message-Id: <20251001210011.468B0817A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] boot/xilinx-prebuilt:
 only allow binaries for device family
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f73d980267a45fcdd0903371fc65bbb1f048eb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Add an architecture cpu dependency to each family to make sure that users can
only install prebuilt firmware which is applicable to their target device
family.

The versal family is based on BR2_cortex_a72.

The kria and zynqmp families are based on BR2_cortex_a53.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 92f76f6c35ee816f1f4e628bb619da0471ae3eed)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 boot/xilinx-prebuilt/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index a37bdba540..5ebfb83c25 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -25,16 +25,20 @@ config BR2_TARGET_XILINX_PREBUILT_VERSION
 choice
 	bool "family variant"
 	default BR2_TARGET_XILINX_PREBUILT_VERSAL if BR2_PACKAGE_VERSAL_FIRMWARE  # legacy
+	default BR2_TARGET_XILINX_PREBUILT_VERSAL if BR2_cortex_a72
 	default BR2_TARGET_XILINX_PREBUILT_ZYNQMP
 
 config BR2_TARGET_XILINX_PREBUILT_ZYNQMP
 	bool "zynqmp"
+	depends on BR2_cortex_a53
 
 config BR2_TARGET_XILINX_PREBUILT_KRIA
 	bool "kria"
+	depends on BR2_cortex_a53
 
 config BR2_TARGET_XILINX_PREBUILT_VERSAL
 	bool "versal"
+	depends on BR2_cortex_a72
 
 endchoice
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
