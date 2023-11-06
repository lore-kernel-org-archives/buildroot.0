Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A94C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 12:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59C4B417DA;
	Mon,  6 Nov 2023 12:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59C4B417DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n1-i4gljJSgg; Mon,  6 Nov 2023 12:37:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFF77417CA;
	Mon,  6 Nov 2023 12:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFF77417CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46D091BF3C1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 12:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 204358218C
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 12:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 204358218C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TvFRM27hCo6k for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 12:37:11 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D0278216D
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 12:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D0278216D
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5079f6efd64so5403556e87.2
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 04:37:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699274229; x=1699879029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VDWesOaYlBVoH2J4M7rIY3XMkrSGdQnJLc2GozxMSes=;
 b=JQD6aRGLOvPfltiuVpxHAz3JoB7K5nCywg/vWN5CgHjncpiaQXS8EnJMs/zxUSEdDl
 8J533nP8ZqgsLj19K734J50/1HEb6C3ERddMhPx26eK6cYmI/uu2yesBhB1Ejum4Rua6
 9Vgbm7ZXqw7GBdXTD8tVrEzwLyVCK87+jOVykRXXGVVjez146UC95yWDoiuJcbvMV8pN
 UgOYd/T8xhlJ7g0i5hy8QtnwX2kpIYT6dO55Tbfq14cbdvzhgwdSmVO9OR+5aD+oeceP
 qg0y5vfJVhtrW3NzlnYon/StENcUk91G5V9r6QxGGjCXbPlxcp93vfayxdcWgzrnP6Vp
 Dtuw==
X-Gm-Message-State: AOJu0Yww7J6Jku3BXR5+8ZY7KPyyS/dGFhpzB4h80uiSknokYBr1Kk2z
 kRmW7Z0DykL+8FdNA6HtHMpBahWyoxiC4hcrU5w=
X-Google-Smtp-Source: AGHT+IHnz0AGoPUhIaS788Vv21IYKEBVt4/WtwyNSQsbTkarx94sceUmlOkZM76fBZl3sRJyw7ayNg==
X-Received: by 2002:a05:6512:3d8e:b0:507:9854:3b95 with SMTP id
 k14-20020a0565123d8e00b0050798543b95mr25822646lfv.14.1699274229031; 
 Mon, 06 Nov 2023 04:37:09 -0800 (PST)
Received: from arnold.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020adfb648000000b0032f7cfac0fesm6505695wre.51.2023.11.06.04.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 04:37:08 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 12:37:05 +0000
Message-Id: <20231106123705.311899-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699274229; x=1699879029;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VDWesOaYlBVoH2J4M7rIY3XMkrSGdQnJLc2GozxMSes=;
 b=tP33h8jE5Y639XhFPXRS6P3yhZpOt2p2fZWclJx7WDw1fm4sZyyHhncB3laLAEmt63
 dIrdwgZElabxeMEyc6F3OC4vbXGAt4jCGuUIfqyGVvn7tsS+jOU1F1O3XFBjsHEybLLY
 xryTvjXpCxNyvUBrPfeOvKo0p66iYyBj7P2nntNsTHL3Cts8Lr0ZjfmZvr1GQxfxUIa1
 rV29bWYyWm1jHLzCLbn3JLh90c21GjTV7quU7H/dthlPWnGg2ijXoNliaNL7fkRAlj/2
 cmcCNNQNiqSDc8epED/B50Rp9l4vDekaYm5TvQpadQBRqgOpMOCCuoni/T+8GPUi+LkT
 6bAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=tP33h8jE
Subject: [Buildroot] [PATCH 1/1] linux: Use the choosen rootfs compression
 type when rootfs is builtin
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
Cc: Corentin Labbe <clabbe@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I have built a buildroot with:
BR2_TARGET_ROOTFS_CPIO_XZ=y
BR2_TARGET_ROOTFS_INITRAMFS=y
With this buildroot produces an images/rootfs.cpio.xz but the kernel still use gzip (CONFIG_INITRAMFS_COMPRESSION_GZIP)
as compression for a plain rootfs.cpio

Setting CONFIG_INITRAMFS_COMPRESSION_XZ in a linux.fragment does not
work as it seems the fragment is setup before buildroot set
CONFIG_INITRAMFS_SOURCE which reset the CONFIG_INITRAMFS_COMPRESSION
choice.

So buildroot have to change CONFIG_INITRAMFS_COMPRESSION after setup
CONFIG_INITRAMFS_SOURCE.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 linux/linux.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 1db5c6046d..d64ebb5119 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -116,6 +116,14 @@ LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_XZ) += CONFIG_KERNEL_XZ
 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_ZSTD) += CONFIG_KERNEL_ZSTD
 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_UNCOMPRESSED) += CONFIG_KERNEL_UNCOMPRESSED
 
+LINUX_ROOTFS_COMPRESSION_OPT_$(BR2_TARGET_ROOTFS_CPIO_GZIP) += CONFIG_INITRAMFS_COMPRESSION_GZIP
+LINUX_ROOTFS_COMPRESSION_OPT_$(BR2_TARGET_ROOTFS_CPIO_LZ4) += CONFIG_INITRAMFS_COMPRESSION_LZ4
+LINUX_ROOTFS_COMPRESSION_OPT_$(BR2_TARGET_ROOTFS_CPIO_LZMA) += CONFIG_INITRAMFS_COMPRESSION_LZMA
+LINUX_ROOTFS_COMPRESSION_OPT_$(BR2_TARGET_ROOTFS_CPIO_LZO) += CONFIG_INITRAMFS_COMPRESSION_LZO
+LINUX_ROOTFS_COMPRESSION_OPT_$(BR2_TARGET_ROOTFS_CPIO_XZ) += CONFIG_INITRAMFS_COMPRESSION_XZ
+LINUX_ROOTFS_COMPRESSION_OPT_$(BR2_TARGET_ROOTFS_CPIO_ZSTD) += CONFIG_INITRAMFS_COMPRESSION_ZSTD
+LINUX_ROOTFS_COMPRESSION_OPT_$(BR2_TARGET_ROOTFS_CPIO_NONE) += CONFIG_INITRAMFS_COMPRESSION_NONE
+
 ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL),y)
 LINUX_DEPENDENCIES += host-openssl
 endif
@@ -378,6 +386,10 @@ define LINUX_KCONFIG_FIXUP_CMDS_ROOTFS_CPIO
 	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$${BR_BINARIES_DIR}/rootfs.cpio")
 	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0)
 	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0)
+	$(call KCONFIG_ENABLE_OPT,$(strip $(LINUX_ROOTFS_COMPRESSION_OPT_y)))
+	$(foreach opt, $(LINUX_ROOTFS_COMPRESSION_OPT_),
+		$(call KCONFIG_DISABLE_OPT,$(opt))
+	)
 endef
 endif
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
