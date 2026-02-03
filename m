Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08F6E87852
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 18:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A03246063A;
	Tue,  3 Feb 2026 18:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rM0BjpHEyqkK; Tue,  3 Feb 2026 18:10:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5684608C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770142248;
	bh=0vqTZ8Ymqwv6ALTh3K6F6UozZBsnAXqdtcRKWh1HFmw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TM7B+t1BXsvmMuRoehSyN0s6yn6r5qHnrNLCTxYFKnW/T48kDFJ77XwjIJv7dowdp
	 SjWSIP8pSnI5ncCdGraQ/a1UWM6K7//T2i3pHnCqWiUnTGCPvgq24rRGteymVAX5rL
	 iTy/mWFn2bYa+d/pWpANb1rQyGcH6HAzu7g3k0+GZDxyP9FqcRpQ4f0raTNAZbAkVM
	 yQXk3vHzMNfDLJRpxzeJQuKjlAcUZCZto6+5Yy+Lut3lc+D8Aub1xmlLhgnJzqdl15
	 N83P00YXF7XX3q9yO4AOwZJ2/7noidpCTwI9X1LeMeINp3vpiPQYTRLGaFN13ghCON
	 yathb2ANl14UQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5684608C3;
	Tue,  3 Feb 2026 18:10:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EC0513D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58B7840BBB
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JMgdfkL1q0wg for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 18:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BB8240BAE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BB8240BAE
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:10:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FB9E8670B; Tue,  3 Feb 2026 18:10:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 19:06:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d10e677b8fe8cb757dccba8c42b746f52c1a5a4
X-Git-Newrev: 74ac7a38be67a3f136315746a203de83a9f20bc2
X-Patchwork-Hint: ignore
Message-Id: <20260203181046.7FB9E8670B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/ti-k3-r5-loader: add defconfig
 fragment support
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=74ac7a38be67a3f136315746a203de83a9f20bc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are multiple defconfig fragments we can select to modify the final
tiboot3.bin image to support different boot methods or enable features
supported by a board. Allow the ti-k3-r5-loader package to select
defconfig gragments during a build

Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/ti-k3-r5-loader/Config.in          | 6 ++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 1 +
 2 files changed, 7 insertions(+)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index b4fb46e55b..7eb471e6d5 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -95,6 +95,12 @@ config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
 	help
 	  Path to the TI K3 R5 Loader configuration file.
 
+config BR2_TARGET_TI_K3_R5_LOADER_CONFIG_FRAGMENT_FILES
+	string "Additional configuration fragment files"
+	help
+	  A space-separated list of configuration fragment files,
+	  that will be merged to the tiboot3.bin configuration file.
+
 config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_DTS_PATH
 	string "Device Tree Source file paths"
 	help
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index db5c3cdaf8..178db5c0f3 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -77,6 +77,7 @@ TI_K3_R5_LOADER_MAKE_OPTS = \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
 	BINMAN_INDIRS=$(BINARIES_DIR)
 
+TI_K3_R5_LOADER_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CONFIG_FRAGMENT_FILES))
 TI_K3_R5_LOADER_TIBOOT3_BIN = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN))
 
 define TI_K3_R5_LOADER_INSTALL_TIBOOT3_BIN
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
