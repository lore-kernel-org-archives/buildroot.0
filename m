Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FF7FD88CA
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 22:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFABE61398;
	Tue, 10 Mar 2026 22:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQNRrf0hRmZ9; Tue, 10 Mar 2026 22:44:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AC2C60EBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773182666;
	bh=ra1UasJJViK4LYIhroJWW7RO2DYwKp9WMA5or76djZA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fwW4uChk0gg9oQKNaaTJ9pT0SsX1BvtGVmBwn7a6dQjzV9tfBP3J+hBlvTpz8UZNA
	 +rapMT3TdPOdrdE1FbMF2ppbljB1ov0CsdlIZbrqT6BGdgLIGMmiiwnS5e0BMclgXG
	 XqDkaQPy2ohESxJfqRTxT6xFdwOpdX9DyJoFtY05fV9+Kt14S80pzsy21Q80ucEvCa
	 qKS6aCZXe8fm6ib3lnKDSoA5LM6/cJ7XdnktZmpZBTfN1egF/p3Z0ebSUPS6EemE7E
	 xMZ6P7dzKdnuKxNykBLM6kJ0QIDh9gRbYh9+7Jk1ApE3HK3Pn5KqMa6GlkXol5UB6G
	 H1l0SMspS8VZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AC2C60EBB;
	Tue, 10 Mar 2026 22:44:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DED199E3
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBCFF40210
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNIuLb1T767Z for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 22:44:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E34640176
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E34640176
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:44:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 566FE869CC; Tue, 10 Mar 2026 22:44:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Mar 2026 23:20:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d18531b529491a70397a73690b17304a93a127ab
X-Git-Newrev: 07882440cbc0f6cb754e207db92806aef7c55807
X-Patchwork-Hint: ignore
Message-Id: <20260310224423.566FE869CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beagleboneai64_defconfig: use
 BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_RAW_BIN
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/07882440cbc0f6cb754e207db92806aef7c55807
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This defconfig use BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS to provide the path
to the TEE in raw binary format but use the legacy file name
"tee-pager_v2.bin" rather than the recommended "tee-raw.bin" [1][2].

Instead of just replacing the file name, use the newly introduced
BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_RAW_BIN option. Since this option
needs BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE, we now have an explicit
dependency between u-boot and optee-os package.

Previously we had an indirect dependency: optee-os <- ATF <- u-boot
with both BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE and
BR2_TARGET_UBOOT_NEEDS_ATF_BL31 options enabled at the same time.

[1] https://github.com/OP-TEE/optee_os/commit/376cb124dd8d4f0a8737359211fa6883bdb4c77c
[2] https://source.denx.de/u-boot/u-boot/-/commit/4e0b8238eea83b71713230e67e781111ea897035

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/beagleboneai64_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/beagleboneai64_defconfig b/configs/beagleboneai64_defconfig
index db5837fe36..5e0adc0dc2 100644
--- a/configs/beagleboneai64_defconfig
+++ b/configs/beagleboneai64_defconfig
@@ -38,12 +38,13 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="j721e_beagleboneai64_a72"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_RAW_BIN=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="tispl.bin_unsigned"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
