Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A7EC25B74
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 10:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9019C60883;
	Mon,  6 May 2024 10:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x1RXbgpYTw4F; Mon,  6 May 2024 10:51:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 830956086C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 830956086C;
	Mon,  6 May 2024 10:51:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A0AD1BF33E
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A75760820
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIv1-jkWMIfQ for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 10:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FC2060818
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FC2060818
 for <buildroot@buildroot.org>; Mon,  6 May 2024 10:51:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66FCB8671B; Mon,  6 May 2024 10:51:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 12:50:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4d07f8d816c864421b9f33ccaf2922cbd5d5a12
X-Git-Newrev: 91b1de167e4b4c52850d464a7062a4fd6c68ed12
X-Patchwork-Hint: ignore
Message-Id: <20240506105145.66FCB8671B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/{uboot,
 ti-k3-r5-loader}: remove unneeded python-jsonschema dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=91b1de167e4b4c52850d464a7062a4fd6c68ed12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commits 8a4c3c91e7 ("boot/ti-k3-r5-loader: add BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option")
and 1aec483412 ("boot/uboot: add BR2_TARGET_UBOOT_USE_BINMAN option")
added the python-jsonschema (target variant) dependency to the binman
option while only host-python-jsonschema is required.

http://lists.busybox.net/pipermail/buildroot/2024-April/689291.html

Reported-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/ti-k3-r5-loader/Config.in | 1 -
 boot/uboot/Config.in           | 1 -
 2 files changed, 2 deletions(-)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index df885cc2af..a6cc16a0c3 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -1,7 +1,6 @@
 config BR2_TARGET_TI_K3_R5_LOADER
 	bool "ti-k3-r5-loader"
 	depends on BR2_aarch64
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
 	select BR2_TARGET_TI_K3_BOOT_FIRMWARE # binman
 	help
 	  Separate U-Boot SPL build for R5 core on TI's K3 processors.
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8133b780bb..ba95964139 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -273,7 +273,6 @@ config BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN
 
 config BR2_TARGET_UBOOT_USE_BINMAN
 	bool "U-Boot use binman"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
 	select BR2_TARGET_UBOOT_NEEDS_PYTHON3
 	select BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS
 	select BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
