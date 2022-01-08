Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656D8C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C77D81427;
	Sat,  8 Jan 2022 18:58:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9q3juiF4LLOK; Sat,  8 Jan 2022 18:58:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D848813F7;
	Sat,  8 Jan 2022 18:58:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 873CD1BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 747E760A89
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:58:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id to32ZS5yBRul for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:58:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8721360A7F
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:58:32 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 f189-20020a1c1fc6000000b00347ac5ccf6cso2775063wmf.3
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 10:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TCVkmPZ1uof1dxiFIfIMqjyTSaEHcJ8gPVio20MFtCo=;
 b=nRUw1Wj1nsRb/fL6jZVm1DWg9eF3iEoYh59wzcFd29rRCKyTTTFsZ+IFcXFCZHWt+I
 6RhpOhndxUnI0Y1FWaXUb+izgLd8JsmSiPkTvj5prV0tt0Kmj4o1us2vBUlCmzTKo3oH
 3ppYENJfUx2rLAgtcO9rrGsayCcGUHFiMFocGGxVRVh76lK6Ni8Z+FocZIYlEyuL4V6Z
 5KfSC5wHlyXF/ckwMRy7ZEPhQijm3rNI9sn9xW7wNADTyK5EPwhnQfLkh2oyk5k6cRdF
 PZS5LCTmrr67Qmk6Qo7+h8zvAjHaz+Uwx6jK1Sv6UsBi/rlL3I2qOTfxnVMruXocD5wj
 PnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TCVkmPZ1uof1dxiFIfIMqjyTSaEHcJ8gPVio20MFtCo=;
 b=KOc62K3NVlZPSOIL6391mIGXmlGWZQMLM2ZVj7V+eiAoyxkmuH4aOBWpBTJEB8qN8r
 ASZsquKCPB7cvdnuoIhl5qZM3mYUgbFL3vYmTqP72nw16cwi6dTeIZU6k/ahhXtUPoaW
 7TD1457iD2tb66VnBiDLhUQEU0oglfBDwtPFybwuhl2sz/Gk3RWT4of7kEg9oT1SRMiJ
 IAB4We5QdxoG463e+T8zPsf2OcQpe62ki10yHW5mNsxyDWCzZviK58/0b88PgsC6Y30O
 hS2hMxZ6pY0z0wJ3DyiIQVT8ATR6CV3q27YtVHdUJfyhgF4LeqK/A5xmDhgK1FMMvWTc
 pP0A==
X-Gm-Message-State: AOAM531TaMxR3xNhHk84OgLVy0gsmDj7LF+Sf5Cwr4jwkQYa26UtHtdc
 NrM1ovbRSebrmO8aM45n3oHugahxkYc=
X-Google-Smtp-Source: ABdhPJy72BwVA/l2BgwWtrLpSY6fKVstmHmPGgymkf4AUgVQneOWnWq2Uwnca2BNxxngeN+pOS7Lgw==
X-Received: by 2002:a7b:cbda:: with SMTP id n26mr1280713wmi.93.1641668310541; 
 Sat, 08 Jan 2022 10:58:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id p13sm2673845wrs.54.2022.01.08.10.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 10:58:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 19:57:13 +0100
Message-Id: <20220108185713.3193240-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/btrfs-progs: disable zoned on host
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

Disable zoned on host variant to avoid the following build failure since
bump to version 5.15.1 in commit
20181c3f1b7191d2b6a1b78bfbe32c1f58e87359 and
https://github.com/kdave/btrfs-progs/commit/7953f4357bfc6c6526451bc889527b07f0840816:

checking linux/blkzoned.h usability... yes
checking linux/blkzoned.h presence... yes
checking for linux/blkzoned.h... yes
checking for struct blk_zone.capacity... no
checking for BLKGETZONESZ defined in linux/blkzoned.h... no
configure: error: linux/blkzoned.h does not provide blk_zone.capacity

Fixes:
 - http://autobuild.buildroot.org/results/03235edd829436d784a9b214050cc97584f372fb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/btrfs-progs/btrfs-progs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 50c8e59e50..4c26cf0df5 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -41,6 +41,7 @@ HOST_BTRFS_PROGS_DEPENDENCIES = host-util-linux host-lzo host-zlib
 HOST_BTRFS_PROGS_CONF_OPTS = \
 	--disable-backtrace \
 	--disable-libudev \
+	--disable-zoned \
 	--disable-zstd \
 	--disable-python \
 	--disable-convert
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
