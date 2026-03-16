Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5931DF53D96
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 20:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E79E383753;
	Mon, 16 Mar 2026 20:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OEHCaZ5dmtv3; Mon, 16 Mar 2026 20:56:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 172EF83716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773694587;
	bh=6+84STkeaMEebvLCi5d1xFyVHCAiQxEynFMvk5OezO0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S+swb93g1GD6aXje0M5lGEYOSmocLQ3OHZtT+IYVRahvlfk6pdBY8NOec4q0UbLae
	 idD0bGzo2PrijWgePWC2MNVkSOMf+47F0Ff+UTKodfRT6ZHOCuOMFVlBP5E6KGP/pk
	 7ywR9EjgGpPrVNh/vswg1QCqhrqyJbNp6195UO9lsgMkFBvxH4fAK7sgBE0t3MccEq
	 sVNQzRK/XV2/rowgfPMBt0gd6RDvmTWGG+3R9F95VBbzWBTVj3lZ73enHntJhvAYHk
	 7c+VHBevmRI1ivo1mm5gdMCk+oWgBejq7nKu09L4mApDquU90eHd4aHplpYn31hnyZ
	 D25H+jYkiCYCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 172EF83716;
	Mon, 16 Mar 2026 20:56:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 99C0D3BE
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 20:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A195405A7
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 20:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKoTqi679OnC for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 20:56:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9404740949
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9404740949
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 20:56:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFBF386C49; Mon, 16 Mar 2026 20:56:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Mar 2026 21:54:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7428907828c7715c7f95303068a0dd8db2770c9f
X-Git-Newrev: fe49bf9451b512b3c2d6c441b16ec0a87ea54959
X-Patchwork-Hint: ignore
Message-Id: <20260316205621.BFBF386C49@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/iot-gate-imx8_ebbr: bump u-boot to
 fix the build
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
Content-Type: multipart/mixed; boundary="===============5661405414012622739=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5661405414012622739==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fe49bf9451b512b3c2d6c441b16ec0a87ea54959
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Python setuptools has removed the obsolete pkg_resources python module in
v82.0.0. This module is used by the binman command in U-Boot until
v2025.10.
Since the python-setuptools package has been updated to v82.0.0 in
Buildroot, the iot-gate-imx8_ebbr_defconfig (using U-Boot v2025.07 and
binman) fails to build with the following error [1]:

  ModuleNotFoundError: No module named 'pkg_resources'

Update the defconfig to use a more recent U-Boot v2026.01, to fix the
build.

Link: https://gitlab.com/buildroot.org/buildroot/-/jobs/13476922237 [1]
Fixes: 51365ff06379 ("package/python-setuptools: bump to version 82.0.0")
Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Julien Olivain <ju.o@free.fr>
[Julien: update custom uboot.hash file]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/compulab/iot-gate-imx8-ebbr/patches/uboot/uboot.hash | 2 +-
 configs/iot-gate-imx8_ebbr_defconfig                       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/compulab/iot-gate-imx8-ebbr/patches/uboot/uboot.hash b/board/compulab/iot-gate-imx8-ebbr/patches/uboot/uboot.hash
index 440526977b..b6a925ea4e 100644
--- a/board/compulab/iot-gate-imx8-ebbr/patches/uboot/uboot.hash
+++ b/board/compulab/iot-gate-imx8-ebbr/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/iot-gate-imx8_ebbr_defconfig b/configs/iot-gate-imx8_ebbr_defconfig
index ff646e8adc..460494302a 100644
--- a/configs/iot-gate-imx8_ebbr_defconfig
+++ b/configs/iot-gate-imx8_ebbr_defconfig
@@ -44,7 +44,7 @@ BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES="CFG_TEE_CORE_LOG_LEVEL=2 CFG_TEE_TA_LO
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mm-cl-iot-gate-optee"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/compulab/iot-gate-imx8-ebbr/u-boot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y

--===============5661405414012622739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5661405414012622739==--
