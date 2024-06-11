Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA185C27C75
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7908D60EDF;
	Tue, 11 Jun 2024 18:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPupQl1iwduj; Tue, 11 Jun 2024 18:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B61361015
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B61361015;
	Tue, 11 Jun 2024 18:02:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20B661BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBD2A403C9
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yJy_UHT061-M for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:02:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DCE22403BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCE22403BF
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DCE22403BF
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:02:19 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-6e7b121be30so2553670a12.1
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128939; x=1718733739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IAKJ84k60KwKFWlNazMh769RxEiZ+fiuglm4Zxh+uPg=;
 b=g0Bm85kodeC77rQ5dFo/N3hNaEgoICMK/9cp7pApvQDcm+9wdv8tOMmGeNXl1o2QrM
 QXQMygN/99vkW1Ug872lAYtna3gUhmSjWnMXNmnaDiU+8+7SIkKkxW6dwgYjMRPmvN3g
 WzrPICQ2xIPuW6q52Yqd8lTpxn1nLfoooMEbqWzONO3g6u64UxLk3cfef+LQmP/4EpGS
 dXRRYgRVr4cC1uj/6v07f0ssdcvlRDknz0LVGvWjBGCLIy/G+OtRTnvS09shXYU8h4b6
 CPCpK/5ULs8QHRZqDSrGEj38ZzyYlDsscnVdxotFtXpy8068b9qxC5jxsYKzJ/JlRRch
 F3QQ==
X-Gm-Message-State: AOJu0YyfTYVMYVZn87cx0vurik4U8BoZMCiL8JYK9+rVoCgJw/9m9mKb
 En6USLFJhNejRC5ZuD4TeRxECh9mTO8Kv9nzi7JlhmyX8C+vcU6fLBMi7pWb
X-Google-Smtp-Source: AGHT+IEbFRypzmIv75tE3cdE5tLbMMe48OTjGOeuxZeucTxzExTEjOcYEf7/7cRIvQHeu7sJiJb9Bw==
X-Received: by 2002:a17:90a:fc93:b0:2c3:2da1:c8bc with SMTP id
 98e67ed59e1d1-2c32da1ce04mr3146221a91.15.1718128938792; 
 Tue, 11 Jun 2024 11:02:18 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2c2fbde41ccsm5673927a91.11.2024.06.11.11.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:02:18 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 11:02:05 -0700
Message-ID: <20240611180207.2138847-7-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611180207.2138847-1-cdimich2188@gmail.com>
References: <20240611180207.2138847-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128939; x=1718733739; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IAKJ84k60KwKFWlNazMh769RxEiZ+fiuglm4Zxh+uPg=;
 b=XwO590xO3Be2obpso01CWDgzCqR45Un31gPOfcMCaoLY2H5U6YoF/ZAGtm7vCK2RD1
 aoF4//83LL+fS7mL4S5nmQd2J9CVCYODPnCxUPAA/YeG1bXxy81KKmJprExXu4E787sz
 s02mdudj/Lus89A4mIUqdaYrEk8pbs71pH8XxhM6EpzDdV1T0vt1HKvx9exfrLpwQwfi
 +3k47CGuMRhIKSW/g9zEo4Jj3wweWVqW5h+j5AI3aj0vFOP4aSsG86tLYw1P8hUUnY7n
 uTWMRXYxQk/3wzhyoRPEuErWHQhshrbrj1CQJW4fYZfvivC4f//lNLHPkd9Fz9lf+QvA
 eSQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XwO590xO
Subject: [Buildroot] [PATCH 6/8] configs/nitrogen8mm_defconfig: add SMARC
 support
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
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 configs/nitrogen8mm_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index 3a0cfbd8e5..5c2fde7828 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -56,5 +56,5 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/lin
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-nitrogen8mm freescale/imx8mm-nitrogen8mm-m4 freescale/imx8mm-nitrogen8mm_rev2 freescale/imx8mm-nitrogen8mm_rev2-m4 freescale/imx8mm-nitrogen8mm_som freescale/imx8mm-nitrogen8mm_som-m4"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-nitrogen8mm freescale/imx8mm-nitrogen8mm-m4 freescale/imx8mm-nitrogen8mm_rev2 freescale/imx8mm-nitrogen8mm_rev2-m4 freescale/imx8mm-nitrogen8mm_som freescale/imx8mm-nitrogen8mm_som-m4 freescale/imx8mm-nitrogen_smarc"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
