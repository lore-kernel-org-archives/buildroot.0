Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A459C43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 21:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B749E41C6D;
	Thu,  9 Jun 2022 21:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tIScgTX2Yspb; Thu,  9 Jun 2022 21:31:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A408241B49;
	Thu,  9 Jun 2022 21:31:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39AB31BF340
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 21:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28AA884279
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 21:31:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W198lgKe2eZ2 for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 21:31:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B1EC84269
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 21:31:05 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a15so25572642wrh.2
 for <buildroot@buildroot.org>; Thu, 09 Jun 2022 14:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B/oa/ij3/UKzPxlpONpxv5vJzMryX4MzO9JW0XDXKa0=;
 b=SInltnJHVY0KmRLNJ4JX/LSW7QepxPBsYeUZv3FmDFckM3Lvw2CMjSyHb+deA1bwow
 pxFRrooM5Du2MFaBZmRAC6A4Ml/Cxc5E2MFJAF5aD17hZWux0b3y9gpuHTs8yKzI3JSM
 +6YSUqkF2x0toz30eeUUNkpOW/mjuVpKC3cS/jhFwF2F8rA/ndDBMlqQvzyijQ0SwhbO
 Isqt54bl6cVJ4o9lI7bJuua9JG5ZVYLiF32Cz0NRFXsYFqDHgiwcAdrwW/XfGGG22GTW
 OwJcOQ/Qxl3Q7/Ht8Eus8qnAIjtlR3Wp+CaeylGqv5LWr2perq8+1hcFKK6NCf+rGUJp
 M96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B/oa/ij3/UKzPxlpONpxv5vJzMryX4MzO9JW0XDXKa0=;
 b=3eGPV4gPD/cEmd3nb/pXrPf/s/z0sgH4kg57N6YwUbaPYZi6KyObinWru1gke3y81G
 HaJFAp8+ZqyEnvD3/RZjnuPZEhvmoXpxVjoMK/WKX1ysYLpoQ/bwpNTouUSgEeEhRLWt
 3B+7J0vzdFqbNfxd/8QbeYTMacpYus8ODuhK1lT1R2S3G/LQW4MpiO+p4aPr7I2GUOi8
 gM+/wYDEoXXQdG6vV/UWD5PxwqQ2qUDloL1C0QgD9jfYHcFhYESvAA5KQMk1a2316JgI
 JoC3ZmIAvjxAxs/vW/Ce3Oe4/+J67NmXL+Day2pYvhZGnf4UvXPfFOt2os7itURaUA++
 4QIw==
X-Gm-Message-State: AOAM530Ez7nCdPdJGNflrMXetndhrvGu42rbrQNS5pkgFdZeEQFQvTEb
 xc0D+yItkcWFTVhgwJyWOCCLUCkmcTY=
X-Google-Smtp-Source: ABdhPJyp9to7jMIjm4KFbwxIrBOyAgpZagNXGz3asR0axvfwKTOWNungQF2+HV8Op3DwAEPNWk+RHA==
X-Received: by 2002:adf:c614:0:b0:215:cd85:bd88 with SMTP id
 n20-20020adfc614000000b00215cd85bd88mr31166686wrg.437.1654810263080; 
 Thu, 09 Jun 2022 14:31:03 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a7bc74c000000b003973d425a7fsm494876wmk.41.2022.06.09.14.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 14:31:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jun 2022 23:28:24 +0200
Message-Id: <20220609212824.2942413-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/luajit: add BR2_aarch64_be support
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ARM64 big-endian is supported since
https://github.com/LuaJIT/LuaJIT/commit/3143b218946395834f0bfef741061ac6ef3f5b56

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/luajit/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index d890d65b10..31e9e0243e 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	bool
-	default y if BR2_arm || BR2_aarch64
+	default y if BR2_arm || BR2_aarch64 || BR2_aarch64_be
 	default y if BR2_i386 || BR2_x86_64
 	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT \
 		&& !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
