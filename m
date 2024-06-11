Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9BFC27C65
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4A5160B01;
	Tue, 11 Jun 2024 18:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hvGQYSygdoRK; Tue, 11 Jun 2024 18:02:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B1F160ED4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B1F160ED4;
	Tue, 11 Jun 2024 18:02:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95C6A1BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F418405DC
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADbBT1V13d2y for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:02:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C7882405D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7882405D0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7882405D0
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:02:14 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-6e54287a719so1074586a12.1
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128934; x=1718733734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mst2QuDK4nmZ6DpsrumXTbu9cM2VdWLg5Heul10+Dd8=;
 b=Lfyc2ZuQYEiS4Hn/48BAkj3KkwL8u90F/qItB+tw90QyRSIsZvvpjTv/PTshryzIOT
 t/XPK/ZD48WTyc7hWMUVv807wz9WOqy614e8NjMm88dMw+ARQTZGhsVFxGa9+bT7tgzH
 wFaOW/DUkCTAe6NXClXtl69bQEqnIHq31PacUMHaeJLLBVF/iTTuEcmTPDOgLyn+/b3K
 jzP4MIA2RdSozJ9bEIfj9VgDO92hfvMJzo+o/qWYW1NsUgTRSBWezkrol+6haMISMd0d
 6LlpZGhYpfhk+/kc56IDX2v75EwPnoNwZtSgpjxbWUUbVIeV1KsPTio+KEIqbKtuer1n
 n8Sw==
X-Gm-Message-State: AOJu0YxYhPt726CGh29DcDiai0tzv6tzhqQB6O6zeumgdrUg8Pmf/or+
 HWxba9h/DfKrgFwMrmiMUB0JavgM1f4aKS+6TbVhiFzvNoKmHh/pIUQ9oFBX
X-Google-Smtp-Source: AGHT+IHOidJXUUdjXVBbNMgqEIGMMcsfQsivwiQ3qHa5OspSbzy/iwok2bgkdEZkfHBKnh5cXW6LRw==
X-Received: by 2002:a17:90a:fe88:b0:2c3:15d1:9f34 with SMTP id
 98e67ed59e1d1-2c315d1a01cmr4911285a91.11.1718128933732; 
 Tue, 11 Jun 2024 11:02:13 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2c2fbde41ccsm5673927a91.11.2024.06.11.11.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:02:13 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 11:02:01 -0700
Message-ID: <20240611180207.2138847-3-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611180207.2138847-1-cdimich2188@gmail.com>
References: <20240611180207.2138847-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128934; x=1718733734; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mst2QuDK4nmZ6DpsrumXTbu9cM2VdWLg5Heul10+Dd8=;
 b=FF8+f0cG8zEyU6ra9BF/8dV5rrPOipJTegJxeL3jOZ3zWA+CkhZkDjJcovw9xm/dFZ
 Twr86Z/TjYKTn+avy3jPJd0/CJM4NgVkO/H5PUXnbd+stFXBtfeXLItlGpw839MER/KA
 mfT3EB+d4IWa+JWGktT+/U6OBX77GaqwQ+Fm1cEutfFVyopGCmBnFToQHlJTbgyWs8Gn
 BjJKzbYvLYN4imQycepdEswPRHxzyMHxJgUjHFu4ZtQ6DYB//pwkrUTkYS8LVSP3d8Xv
 z6LSf01QR68QNlxgrlx8z3gQjcq6orfLFKarGnXXMDXk4bsKjF/4HNLaB4daXYA1hlX2
 ILIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FF8+f0cG
Subject: [Buildroot] [PATCH 2/8] board/boundarydevices: add i.MX 93 support
 to post-build.sh
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
 board/boundarydevices/common/post-build.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/board/boundarydevices/common/post-build.sh b/board/boundarydevices/common/post-build.sh
index 161ec0643f..12341ae75f 100755
--- a/board/boundarydevices/common/post-build.sh
+++ b/board/boundarydevices/common/post-build.sh
@@ -10,7 +10,11 @@ UBOOT_DEFCONFIG="$(grep BR2_TARGET_UBOOT_BOARD_DEFCONFIG ${BR2_CONFIG} | sed 's/
 
 if grep -Eq "^BR2_aarch64=y$" ${BR2_CONFIG}; then
 	MKIMAGE_ARCH=arm64
-	UBOOT_BINARY=imx8-boot-sd.bin
+	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93=y$" ${BR2_CONFIG}; then
+		UBOOT_BINARY=imx9-boot-sd.bin
+	else
+		UBOOT_BINARY=imx8-boot-sd.bin
+	fi
 else
 	MKIMAGE_ARCH=arm
 	UBOOT_BINARY=u-boot.imx
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
