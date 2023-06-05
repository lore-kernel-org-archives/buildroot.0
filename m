Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717ABC77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 10:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA96A82369;
	Mon,  5 Jun 2023 10:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA96A82369
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnilYyhBCuJ2; Mon,  5 Jun 2023 10:21:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6EFF8235D;
	Mon,  5 Jun 2023 10:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6EFF8235D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32DFA1BF4DD
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 10:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1425C60BE9
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 10:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1425C60BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TiWL5_NZJ-Om for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 10:21:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B06F360797
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B06F360797
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 10:21:54 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-30c5e5226bdso2901694f8f.2
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 03:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685960513; x=1688552513;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m2ewCFHvV3NCYBwuD3+AfmmxGEwKIGr/EUjGznALOv0=;
 b=H5z3YRtGQkB6Ey44j0Xuhe1H3aITQrRfwHaMEAS+p4XVJCPUjRTaPYBbr1HMuoSSf+
 9onsIzPpo9+2GawxKBTTqgeawjfe29/FVBL3p8KS2jeTn1qGqwbP/X4OeSK8hsz6Y61q
 j0EJJHI8vav1cETCxuUa1E+nF/JNZMH+/Dg/CLZeikUM/VyCXoDN9kNfA0Xl9XXXHUX5
 JIgnM568gkY940wtkRNUywahi0zcV+gKxW/Pd3zlpA570tl1d1veNmIYdXepz68vNrdh
 3tv1YpzEQ9hkyYVG3awkMzm+d1m3LutocfNO06ALGS9zZOK6K7JO2KGyZSYd0F3LcBtq
 315Q==
X-Gm-Message-State: AC+VfDwY8jke4XQzsrm+aqRC7Dj7En7yVnwtcYbtVkLQQj6EPPcDjCO6
 3gH27S2WkxoWOR8DrPRuq011KWpTIzY=
X-Google-Smtp-Source: ACHHUZ53vgThZyYnvFyuEvei2DnV3YKh5IZgAZZBhRoImiiFP0GXRDlpjndJfhtJWyQl68ClPvCBjQ==
X-Received: by 2002:a5d:6847:0:b0:30e:4886:3530 with SMTP id
 o7-20020a5d6847000000b0030e48863530mr589149wrw.34.1685960512580; 
 Mon, 05 Jun 2023 03:21:52 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a056000110a00b003063a92bbf5sm9371011wrw.70.2023.06.05.03.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 03:21:52 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 12:21:49 +0200
Message-Id: <20230605102149.705474-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685960513; x=1688552513;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m2ewCFHvV3NCYBwuD3+AfmmxGEwKIGr/EUjGznALOv0=;
 b=iYIEW8nMIcv61Rr6wHWGPA3mzJz/KA5KvgNclTz5zRiESuEWnWV0d5Mch0DO/nQSFL
 Ft761kiji7NwgLqtlcOqh8g8yDgd33BAqXUq5eajRT/WfgJ3mKe3SgucmFYbc1XEMhF2
 2/HwUwJGB2UoLgvOrh1xMW337c9fdMNmhN4KQnUi5cab4+xOYRnZ9iF3JgYadfZhp7bz
 S4uYu419e8dQ1Mt/+AeNGThzVr+sx2xGygNV8e4R/K9GacnBQ7SkiCZV4eJCpV+pn2XC
 4+wiOzQ2aY1TfBYi85CAPv0p6WZ3c7Ry7ncVsKUcZN1mhQfuOu1EIBosDX2bxvyRv9uA
 XUZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=iYIEW8nM
Subject: [Buildroot] [PATCH] configs/qemu s390x: increase image size to 120M
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The default kernel configuration for s390x enable a lot of
drivers by default so increase the image site to 120M.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4364600444

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 configs/qemu_s390x_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
index ee18bdb011..4853cd0897 100644
--- a/configs/qemu_s390x_defconfig
+++ b/configs/qemu_s390x_defconfig
@@ -9,6 +9,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Linux headers same as kernel
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
