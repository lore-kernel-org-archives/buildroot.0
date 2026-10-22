Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DA2606ACD9
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=px4Qe/2M;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=AYV9CkuE
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 537A7607BB;
	Thu, 22 Oct 2026 15:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I8kUSD-hNnhH; Thu, 22 Oct 2026 15:14:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7DB2660744
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792682059;
	b=X4FBi1KhlF9ECS3ib3F2p2D7B0MDIpJBnrzUG95+sEQ7Dmufo26UBREDJf19W51Xrd+T
	 87Cnp3eQVIEBjIGFywO62+yrYtY3nQNDqsLx041Qj2k6Gr0Dh+v11mZCnZa24qiXJkJHI
	 SKsRPIxkPuX+5gbNZxg+Dz50/d2KI2TQiOPtRqlhTpHq9RoXGRTBnNtFT+nFmGlEtsOT5
	 uTsx3oBK9krZeMCMHigddJPv83adz59plaQWDkba220vW81aJLuXA/n4MPUF5ig1qOXZw
	 ZZTlqNcahpCYnFCWnMi3/u1MaLLaD/0k0LybsbpmmRKKyg/1/FlGOMwUmtTZFI1rRmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792682059;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Wr2hDVXVMvnBe0euV8VlMv3h+iRQGtWrqqrtxs17fig=;
	b=GNryaYXow1he7yNrcBhhKWpwKywJYyUJxxbpou8NiYWdU+O0utrvDrsgZ2cmkcFqCgbr
	 77CAhBPSaZidcArfC97pIEfuctUWZvAwMuY+bs0OnClY9JKEV4mBUT66+WqXOU8CW+cYt
	 Mur8+WfJXk7mcSzN0Lsxp2fzbwC1kEJhtr+5EsPKZDwTn2HgQO6x7YX4eV525ckmyAb73
	 e7YgUHu3QToXSwwNVvvgSXLwZFrE6njyvlCVRY1P6LprEdhdFpO6FffH36BZDzl8Jk2y/
	 S0bg97hBva7tRtaHW+aVeX2FQTJtYMt2m+9S4BsS0pehqDPEQVr4ELUE/ImxZwLszOQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=AYV9CkuE;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792682059;
	bh=Wr2hDVXVMvnBe0euV8VlMv3h+iRQGtWrqqrtxs17fig=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=px4Qe/2MM4rxoIYnF4JMBd+sdpBZIkCMU3oYsxjFTcwj1IlN8P4dAallzSYgK2AY9
	 8TjBZXNyHk8Vmu88RoIkbM8ovUwnH/E4JBkMr3QKoWs6Yxu46sgWjhkfNrfI4dg7oz
	 FNGcIVeE1hnWGUGgBFcJySFB98PFBxdVFcx2Ji1FHu+b9IF0lGxUJyHSPcI1qK3UKe
	 AkIwcIFSkfd5V6S7eJ7XidT3cYfW4Rwc6JxlAj4xk1eaZBMF8KYcHiPRUIrpw2S73K
	 knDlRWcjb7pcHxk0Lt1l85/ZJCGkyIR6w6ZABvpu+SOh2/f6IeGwvW0k35+sekwJT1
	 yfRpaG32wmt7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DB2660744;
	Thu, 22 Oct 2026 15:14:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 35F1495C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2796E606CB
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IkLl6YHUYhah for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:14:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2AF176062D
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792682053;
 b=jmyrxas86Q6xErgiOw+CvoG34uGJ7OmUNby1tQfjjc9c+l6FvtaLTkJdP7g11FodSUbs
 pnLXe1zNz3tKvASq5P+fei+PVjHPN2GN0K9Eyrvfz32RhZGWlMUhxEn66mkMXI+vV5xl/
 rmmVjDuDwlHb1vziJ+GfSJYMWdUj2kArNvV1qpDxi8PVonsEewDPqRJzRZckK1+VK9xsO
 7Ib3yS79g6t4Nrl6PCapBfpkD+CyW/pYyiO/VoHkaE3FMzjQXeI7Q4/XtCfnXxt8VVAAp
 lU+98UUZW3brXSUQRIRyM8W2BhSP0534x/r5VpMXAlfCdZOsDDCBQkHe5gZPgJrfg9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792682053;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=zSvZYsFGcqbxGWpa+mjemx1SJ4DmbMahGGCkXH18Ybw=;
 b=qXpbBEjSQIMYasqp/NKY/0Z5WvkFaCSW6F9/1GVfEnTYYT59TgtGbuen+TmrtgiZa7tS
 DZimT4G/adI3aHvz933NfyCmEJlSXUD9mZBCUicJGnhDh/VksOhKuLrEA3+f16aiEPaRT
 e+lScJwy7u3qiDuQiyPPpknW6tE38rPHfTDFhgpsZzaRmQfCdOZJfAu1zsTHj8e0RafUc
 l7BWxe8kdZHI0xWcG3p2TaVXcUhTCxonO9RCNrnINC1PABInuxI7IWympmh6YS2QJvUJs
 Wpq568xBaTUQD4wvd0VTwwZf2J7hNnz6QcCtcpjjgxtU+QMyyiyk/9Tjmaii0Xl7t1w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=AYV9CkuE; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=AYV9CkuE
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AF176062D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:12 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48b001cd92bso1133730f8f.2
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1792682051; x=1793286851;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zSvZYsFGcqbxGWpa+mjemx1SJ4DmbMahGGCkXH18Ybw=;
 b=AYV9CkuE32D04tv3Ru/hsFbDw/vEmsf88R9pYhF17iCoujJ2FloQsTD5vvf8XJodLT
 A0GrvE9U9oADKQ0BsqkVXfC/LJTZCpkiZNinbvjzYmJkFsidstN+DwokH1GLorm2wOhc
 IDPFdvB6lIPVwtrSZzfbl4g45CV7SxLriqhDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792682051; x=1793286851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zSvZYsFGcqbxGWpa+mjemx1SJ4DmbMahGGCkXH18Ybw=;
 b=NHI1JxrUYc7C/WCIIYr94Mo8ngZWEZZGCD4YUEwPC9tU7wrkJf5EXwuwROdK75Japl
 B06/DWnd66YyMg/trxnjHvaBhE2DNDcV/+liB48qAP1INsE+HGpVmJDSstP3aHazVkCi
 peEsg/LZnE81r6LBVXkwc1Yl2g5C2YH3HpannQSh9d2OWprBvCaWLxPpWddXq7nephv1
 JOxPTzj4wqqUeTRgECkJlJqIPa4S7Q4INZlEKqa52FZIaFd/ZwkyiP+pDbhGCRsBN7HS
 5wsaKDW+6b+1d0642Us/HsSm0n0BbrDvPEvUJkiQcJqmap3aTsK0AK0hoGX6GP/FfjkI
 ilwg==
X-Gm-Message-State: AFq9FYJQYoo6lbr0QRoDQiVfqmkSVoSxVzhtW0waSLoJ32BitJZb5sJ1
 IFg3rgS2by83KM/xUot/grndukdTS7PoVYRz//Zd95lSjNGz1LFxfr7rSRnrCPgJ4cN1iSnZgTU
 7S3L8
X-Gm-Gg: AYBFou3O950ge+v1aqto01FbaMMvkbVlleUuq9LSSbNcW56OAWW4TxhnS0Atg6nLbTv
 NvcE9wovtrJ1Wy9l/quOjJcLZOtPngbujNIDIT6/dSBa//eVP00/X6TGgFVG+YCuY9zeR3PE9Da
 uJ/UR3aWQZMJfGxM3BrggMM9/VHT/ekIVXR7EDd3ddc00P6pQahWYQaBhpwKR8Ppz3S7LcCsV1d
 nPiS+Z26VoXhuhGJVvFUPUVY/fgKHVvwbBMjRs1asvz5Fs4Zm4Rnw9E10PkxlxgzeQK26FQ39Gs
 88eEDiHDooVH8LqF7MhVXsPydGVL7yFa/w7p+JDyYiozexHSCFsu0MIMk8xMcyXI9HdVsrr9fOd
 lPXeTt6KWs8HaDkF+4IeLZuyaqnTPAzEKiNjF3jqEkUi8V4fzL1dDWSRouQ7y9Wmq4f59qTP6xt
 Qcm+2q8AbQYINSQmsCarjXdlAdV/2Aw1aKYcY9UYJ2uOkpCmyohfjEQmCVzpMxQ/rgFubwP7JBS
 IJs3DstNagb6zs22UEi5H6tfFI3sQL4Yq9iH8cnkzoijUwg8fIMKyIdB/ws4f6lKR/bvCM9LQQ0
 05vZFlk7gtwAypw6YaAXWfm6V66BtcDAjqTBMob4LMqctSXaDpHnkYvjnhPIy1egXa4ZSFchwV0
 kraCTiBo3cZvRVghPRwidDM+k3fSDB2uNLD8F9VCYuoYJiGP8i1uv
X-Received: by 2002:a05:6000:4b0b:b0:487:2387:7c9 with SMTP id
 ffacd0b85a97d-48e264a371dmr11139212f8f.14.1792682050871; 
 Thu, 22 Oct 2026 08:14:10 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25827087sm12732367f8f.21.2026.10.22.08.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 08:14:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 22 Oct 2026 17:13:57 +0200
Message-ID: <20261022151358.2260712-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
References: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/6] boot/arm-trusted-firmware: add
 stm32-ddr-phy-binary support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the stm32-ddr-phy-binary package is enabled, build TF-A after it
and point STM32MP_DDR_FW_PATH to its stm32mp2 firmware directory.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index ebaaaeb38c4b..7b1a43fca22b 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -157,6 +157,11 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
 endif
 
+ifeq ($(BR2_TARGET_STM32_DDR_PHY_BINARY),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += STM32MP_DDR_FW_PATH=$(STM32_DDR_PHY_BINARY_DIR)/stm32mp2
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += stm32-ddr-phy-binary
+endif
+
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
