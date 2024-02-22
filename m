Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5630AC54798
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 10:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AEC541D7D;
	Thu, 22 Feb 2024 10:17:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 46bKicKFUGtT; Thu, 22 Feb 2024 10:17:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D298641D73
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D298641D73;
	Thu, 22 Feb 2024 10:17:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31C0C1BF3FF
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2753182591
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cE2Ath1qNmIz for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 10:17:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E6AB8258D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E6AB8258D
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E6AB8258D
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 10:17:09 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d1094b5568so98738021fa.1
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 02:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708597027; x=1709201827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=osHT6RmVBl0kayP+rvlXuD8WXdmtN//eDpaa2N8Cex4=;
 b=K21nCAUVBMvp6P5OBVDa1Zhsc52HFMH2xYHBB92GQR7udqwdvuhbP4p9Xouq1Ryjdw
 hH0e1KJMtULeEHbJyKZJaNk3dpcysIjKgxBI4FndQie5rvj8lLOkpVmGQQU/LtouCWDW
 9a/h/4PIim9KxxICe3i6AJPKxI/mlD+cfjiHeRXCD8IR7dHpexYSGlXiQp+EVwh0FieH
 paUgKEfcL+KYS5II67GP4lZDMd7JRiTclPReVZu3JZkQ2iGM3fI7SqNlV+kUwpKNHJ1z
 y8ijDBkruU5Jq4veVRBBgeYIqkyJcomyneTH+O8LCHhBBLq00kp4fBM+1TxOCvyWuHte
 MGUw==
X-Gm-Message-State: AOJu0YxvIpc/z2qVlXFJMZIyWHJXH9hcpluLzb42YegzocPJpnhKVULE
 KIjWSQLopzi0zlVZiTT+dKDkj3SHm4eoyaix/jjPCgkMqpu4qxj9lpN3a/7ngHg/kJ7qsbiL2IU
 6WBI=
X-Google-Smtp-Source: AGHT+IGgGFZBZh42szunuRiGa77q/L//xwHr1VRQRzclYuCpRPe8TA8A30X80lgNiZ+8S4j4PqbbDQ==
X-Received: by 2002:ac2:489a:0:b0:511:5f38:76e with SMTP id
 x26-20020ac2489a000000b005115f38076emr12572242lfc.1.1708597027018; 
 Thu, 22 Feb 2024 02:17:07 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4f68:2b3f:b15d:b5a9])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a05600c365100b004126101915esm5619349wmq.4.2024.02.22.02.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 02:17:06 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 22 Feb 2024 11:16:17 +0100
Message-ID: <20240222101617.18422-17-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
References: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708597027; x=1709201827;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=osHT6RmVBl0kayP+rvlXuD8WXdmtN//eDpaa2N8Cex4=;
 b=O35YB5sEgeE1tCZvVNcG16oCblnpffMzoepAaHHLHAXlI0O8wqRf4SQJWa8EoSOE5h
 0eIuJmmmIx2U4ROMEbhwCGe/s59eU3reXCr+kY2yYS+jLtCJP5eNKGxltXNHUZtOdxyh
 k2pgx1yZZZN2MtGId4L9wqlbdclKkV1lBYLqc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=O35YB5sE
Subject: [Buildroot] [PATCH v5 16/16] configs/ti_am62x_sk_defconfig: bump
 Linux version to 6.6.17
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested on SK-AM62B-P1.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5
- Bump to 6.6.17 from 6.6.1
- Update commit message

Changes in v4
- Add BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6 to ti_am62x_sk_defconfig.

no changes since v1

 configs/ti_am62x_sk_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index be01c696b170..e0377591a349 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,11 +1,11 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am62x-sk/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/am62x-sk/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c ttyS2,115200n8 -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.17"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
