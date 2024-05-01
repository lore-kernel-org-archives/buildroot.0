Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4681C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8173581767;
	Wed,  1 May 2024 21:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtzNGvWjfInR; Wed,  1 May 2024 21:52:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FBA48176D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FBA48176D;
	Wed,  1 May 2024 21:52:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80A921BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D36F40811
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWbZNrCpEeuY for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:52:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 638EC4077D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 638EC4077D
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:52:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C41586542; Wed,  1 May 2024 21:52:06 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 23:50:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d57014449e6e5b32e5373aa2afd4fd8cd3a9883
X-Git-Newrev: e4981d6756c711e2034072247912bc85d3edae02
X-Patchwork-Hint: ignore
Message-Id: <20240501215206.4C41586542@busybox.osuosl.org>
Subject: [Buildroot] [git commit] ti-k3-r5-loader: support devicetree
 customization
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
Content-Type: multipart/mixed; boundary="===============1140990684963500279=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1140990684963500279==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e4981d6756c711e2034072247912bc85d3edae02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is duplicated from the U-Boot makefile & Kconfig.

Similarly to U-Boot custom boards sometimes need to adjust the U-Boot
devicetree. For example, the AM64x SDRAM controller supports inline ECC
which needs to be enabled in the R5 loader devicetree.

Please note that some versions of U-Boot have broken external devicetree
support and may require manual patching to build. See commit [1]
in the U-Boot tree.

[1] https://source.denx.de/u-boot/u-boot/-/commit/3609e1dc5f4d4c238dcd23e045ba6223310feffa

Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Signed-off-by: Gero Schwäricke <gero.schwaericke@grandcentrix.net>
[Romain: add gitlab URL]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/ti-k3-r5-loader/Config.in          | 10 ++++++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 6d1adbeac3..df885cc2af 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -95,6 +95,16 @@ config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
 	help
 	  Path to the TI K3 R5 Loader configuration file.
 
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_DTS_PATH
+	string "Device Tree Source file paths"
+	help
+	  Space-separated list of paths to device tree source files
+	  that will be copied to arch/arm/dts/ before starting the
+	  build.
+
+	  To use this device tree source file, the U-Boot configuration
+	  file must refer to it.
+
 config BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN
 	string "tiboot3.bin binary name"
 	default "tiboot3.bin"
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 891783e40f..98a6d473f1 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -88,7 +88,12 @@ define TI_K3_R5_LOADER_INSTALL_SWSFW_ITB
 	fi
 endef
 
+TI_K3_R5_LOADER_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_DTS_PATH))
+
 define TI_K3_R5_LOADER_BUILD_CMDS
+	$(if $(TI_K3_R5_LOADER_CUSTOM_DTS_PATH),
+		cp -f $(TI_K3_R5_LOADER_CUSTOM_DTS_PATH) $(@D)/arch/arm/dts/
+	)
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
 endef
 

--===============1140990684963500279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1140990684963500279==--
