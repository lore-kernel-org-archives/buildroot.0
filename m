Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50FE606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 15:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YXZEdy0d
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DEAB81780;
	Sat, 24 Oct 2026 15:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ho1JF6zaMvHI; Sat, 24 Oct 2026 15:10:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8BDC58175E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792854659;
	b=tHFUvZME1VkHvtCoE8wqEVHR/gJ7dO6hEMpu8MwrwPd9MNcDoUEH8N8HNHa1UuGCFS3n
	 XNNmiXoFveo6NXuhlyryNsXJmRhzNiKE05dXSmonUyLlDXfdsSnOeQ/TRffjFtQTvAbYa
	 PeOU13TlXiWwJRNwWkz+D6OICtB79/bmvWhAHvopOq37sFPxB8EuS/mU6plix9ZXOnmxq
	 6MDY2GDORW0f5y7DRqvHdOhIYUNHtY1n8TiL30P1msRF7HwP1MyAH6hqk2EExM5tHLJpj
	 Gt20FhCvZAz9un0AJTeF9dYmlyvWglKhW22bJBBT1vw9s3oMyfbMohDrLt9IkCmL5og==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792854659;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rEPLIVEAqp1rY/hyqCUxdyB/Iv4O5+34V5DpVt6aKy4=;
	b=qItrix7dOaFHQqUeWWgwjlHGLyHUgFUWp/Z0HS8QXSQ/NEClwMiIYKUr/vtoDHJW8t0k
	 6gpW6qVQtE4kpOJyBCDMOpBvHd7I1U8mjVNm83we/i41EBvBEzs+F4Q4g1epKtixwozP9
	 uDccARuUPy5lNHQ2Hxm9vjvgIBket7lXdl9FF6OMAPKHHk0jT6JgUr1QBqu6t/z+mq2xM
	 bnN5Icp18YqOf1gf3a/HnMISYc7QE+xtvUThVifgtAYeU6OGhjHSXqs8MAgF8V7oNGCtK
	 Mncdn4LBjvO9tBtb9q00dTEuP9dQy+7a5mLr0Hix6zj5b006XDxmLyzKXBahbzQ6FgQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792854659;
	bh=rEPLIVEAqp1rY/hyqCUxdyB/Iv4O5+34V5DpVt6aKy4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YXZEdy0d/DP4qEFGHJYbNLa8a2PgEFVaOm6iibojXg4G2vUDy5STNxLaD0F6zMzk0
	 ta73uOzWaPTmcK8k8ItJyfBMCSM7DAnHgvaYGGXjdM3kDL1rHt1DN0ZEcha0Hj/JA+
	 BdcAKYnCaG06entHDsOVTJyZ/oJytCzTgGWNMj2XudXU+IwaV4FEkN0r2WOE+TvPOz
	 6vhCmY/RbMe/fDWmn82kc7ORqHmxiKkUNZYhFNQg4PmD4amI5Ccl9ydgRirUkwlYKQ
	 mewXjRY4Dg/V/ULobQLhQk9wE+hWz56btWo+wZJD1rOnXKF70gmmuJtN4s0i5LM7+q
	 qLfmoVISQwA3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BDC58175E;
	Sat, 24 Oct 2026 15:10:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B849279
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1906E400AF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFExc5USrDT5 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 15:10:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C8FFF4006B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792854655;
 b=sJNXma7YappB7RZfKwPGRsAYIbF7vVLuFcI2ePo2N2JaxjkbXKEMAsf6Vy6v8VMZA1yd
 seBd1OUOmUUiWCIs4uGosOK6Md6MYv2Etod77zrnW7cRvQ30czazUJ9TLHQR/SICMGzed
 bcL76JIOBvbhMuH042IZuLeUhagzfpmWt+/NAJwjDotvmJS00s687Df74kEylI/FyKErl
 bE5HNbnwgDwjb5as6bPj+jEXROWMXerasm4C8gzESVcPUJUM42iDZkJ7HhO1hGLIk66VU
 UA35FTYZj7CEF7pnIvIPazOeIlJL2AASSKyaKe3U7KqEopnb/Ob9K7j1WCuDcsY3CEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792854655;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=wQkos09f4njWuEdiM/dzw8kewQYqBlQCd0mkTxAqiuk=;
 b=q0vKndY27N/kjY7PKCabfNxy+XWpBsP/bYlAXUjWT2dOhlFKSbp7gLrHB5edeZY/xvBn
 nuf0PEJJ3ZWTP5roLttiijw7hD2IY6ka5ej7OIx+RKeUnBV4b2X77Z8MXQeJ+hWD0PpGg
 PqHE42EvZMG2qpf/M+kwET/yed07OTi4PghwW3ZX/OeyXRgKr+b8G+ACN40PsWKHCwmiV
 AIdY3/2U0vfeWY6SHNx7tH5BtH1qdWUhfo60yt6pzaBCg4mJhnKXH8ZqgZgYGp6/Vw4dd
 6VcIxkmFIQPIH+vUIeQujePls9Cj+PKH1YUNpvifEkTQGNFMAiOQpUvBOXzw7AAXHgw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=b2ZlT1Cb; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8FFF4006B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:10:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6sit-1wVbQR2FJv-015rCk; Sat, 24
 Oct 2026 17:10:52 +0200
To: buildroot@buildroot.org
Cc: Meena Murthy <meena.murthy@amarulasolutions.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 24 Oct 2026 17:10:43 +0200
Message-ID: <20261024151043.1971569-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261024151043.1971569-1-fiona.klute@gmx.de>
References: <20261024151043.1971569-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:z++4SPDnSm3tB5RhrhpPTqWdFC0irsVFQmcw0N1ygxbJlujStP8
 4llsgj+iOTzyRrjr88GDVKn9e+IJM5D7rpg9X2LogPNPsie4Mfy+Z5ZiqULk7lv4+T/pwjv
 K+5mLGgEEcmI9itd6AUJNZwk3vFslAoFy4iax5/tSglulYmiwcZQDaZX87svfamfEtciLVe
 hZJ0HoyjJ5o+E/QEA6Z5g==
UI-OutboundReport: notjunk:1;M01:P0:fA4LazXGTOE=;jdblGjb3Ks5ROuOh6eCFFVNXk4i
 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
Subject: [Buildroot] [PATCH 2/2] configs/engicam_px30_core_defconfig:
 require pkg_resources for binman
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The defconfig uses U-Boot 2025.04, so binman fails without
pkg_resources. Also update the kernel to the latest release of the
6.12 series.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Compile-tested only to verify the U-Boot option, I do not have the
board.

 configs/engicam_px30_core_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/engicam_px30_core_defconfig b/configs/engicam_px30_core_defconfig
index be5c56e19f..10f3d3157c 100644
--- a/configs/engicam_px30_core_defconfig
+++ b/configs/engicam_px30_core_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/engicam/px30core/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.22"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.114"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/px30-engicam-px30-core-ctouch2-of10"
@@ -36,6 +36,7 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
+BR2_TARGET_UBOOT_BINMAN_NEEDS_PKG_RESOURCES=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
