Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED4CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 17:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A97706075E;
	Sun, 21 Nov 2021 17:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sOL5oNgyXNuR; Sun, 21 Nov 2021 17:10:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0446660705;
	Sun, 21 Nov 2021 17:10:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A2471BF3E1
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 17:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19C5060705
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 17:09:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b_rrYoYcUI5x for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 17:09:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [IPv6:2607:f8b0:4864:20::a32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 702B5605E8
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 17:09:27 +0000 (UTC)
Received: by mail-vk1-xa32.google.com with SMTP id j1so8913732vkr.1
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 09:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lzv4jpf2Nk+MmFCuE6IreX2eibAKMPO/W0iEmdsJZ/Q=;
 b=i5WzBYTBxryrqk2prFCK2I2HtdPZI9C1afB8+aC6eOx5eev99ZSzHubh+XvqFuJtCB
 uRE8h4gi7lJbTMiLczOlNWAHQ8CCmhVy2dnfepVuhx2FEybcOhmBHbhK5oW1cMmWXNq/
 Kuggr7yOSaFS+daIoNaHVGw+Y5kx/vw1ificp5RhDjdZJ5hX3hmRKVU/XaMrC0sX62zl
 bO141Y7glxus+OcOvSfdj/djtJdEMGg0Aw9EadDt8CfZv8LaiabrO71hmfdA4PDBZyBr
 4JXL/Bqua0CCeQNQeqMNoBqp/CK6wIBCXOkkPcZzpDqaMHlS2qFvrCu2N15jPJ6oi0wb
 ZAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lzv4jpf2Nk+MmFCuE6IreX2eibAKMPO/W0iEmdsJZ/Q=;
 b=BosD8EMJv53VcnFGx3YZe007fbjr3A/HCZLP52jHIl3X6AUVoPmSGs/tMp5z71ESf0
 4fiJL1u7T9dL/I/B+didYSxkwWGXlTiyuQ74hYzSh6k8a+dCApSJg7FwQcbiHxHM7JYT
 hGkPf2P5hkPx4IPHaC2d7WIcf+0gT9cGt50W3Z/FrokuqD72jerbzmkkxCNbL9AZWj1U
 Xl3OTYlvcnGaq1pTTU+jCChEHi/NOaZyqSasGTvYqQA7XxNX1OQWDEFOyK8irb7sB+It
 eQWqaYJlPNM+/VOHrmqzyRHwXo8x6jenna4CvDwreFF/dLvO/HLyn/ghkxiz65l0ejNR
 944w==
X-Gm-Message-State: AOAM532bzFBtoI6SRCNNuKemakRSaSG3pqfYkJwNOYYVNr4HjVb6AhJH
 JJD/2Ifeqx7QKtMapbYdZZkIVJ4q8Qo=
X-Google-Smtp-Source: ABdhPJzFmNWHG4P6OHkS5ovNiFLbwYkWlQRiO0GOkdorRx+t6Go1r90uh7PwxUClPz3Uzny7XPNoJw==
X-Received: by 2002:a05:6122:1796:: with SMTP id
 o22mr149981052vkf.23.1637514566376; 
 Sun, 21 Nov 2021 09:09:26 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id q9sm3159121vkn.44.2021.11.21.09.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 09:09:25 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 14:07:53 -0300
Message-Id: <20211121170756.3810922-4-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211121170756.3810922-1-ricardo.martincoski@gmail.com>
References: <20211121170756.3810922-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-next v2 4/7] package/libftdi: rename patch with
 the proper naming convention
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported by check-package (by calling it directly):
use name <number>-<description>.patch

Output of:
make libftdi-dirclean libftdi-patch | grep 'Patching\|Applying'

Before:
>>> libftdi 0.20 Patching
Applying 0001_pkgconfig_libusb.patch using patch:
Applying 0002-libftdi.pc-requires-libusb-fix-static-build.patch using patch:

After:
>>> libftdi 0.20 Patching
Applying 0001-pkgconfig_libusb.patch using patch:
Applying 0002-libftdi.pc-requires-libusb-fix-static-build.patch using patch:

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
v2: new patch in the series
---
 .../{0001_pkgconfig_libusb.patch => 0001-pkgconfig_libusb.patch}  | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/libftdi/{0001_pkgconfig_libusb.patch => 0001-pkgconfig_libusb.patch} (100%)

diff --git a/package/libftdi/0001_pkgconfig_libusb.patch b/package/libftdi/0001-pkgconfig_libusb.patch
similarity index 100%
rename from package/libftdi/0001_pkgconfig_libusb.patch
rename to package/libftdi/0001-pkgconfig_libusb.patch
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
