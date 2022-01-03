Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80730C433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 21:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 272E860E3C;
	Mon,  3 Jan 2022 21:07:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TgObUiqyTpCC; Mon,  3 Jan 2022 21:07:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F19160B3A;
	Mon,  3 Jan 2022 21:07:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BB831BF285
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 21:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A64140180
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 21:07:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ch0fmyGU2CLM for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 21:07:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD9444016D
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 21:07:18 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v7so71995387wrv.12
 for <buildroot@buildroot.org>; Mon, 03 Jan 2022 13:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1IEWuRK9WdngOW+6EeOQzbcDGiS+A2oh1BvOoB4nRdU=;
 b=ow7KJ90hkkMqUpvU9co5YXHxSDDG1ZvWWfkC5CynqcqGlDrI6NZywY1v2iWjpzi0Io
 /w72DJE63/A84V9cIk++Ay32aFdy6cEr+Rf6ONTYuO+HmrFQPPi2hFA9MM+znme5rlGX
 5yKAnD8fq+EZsnElCglR9NnIv391QzIsXjVrGkvWuezqbxa4qJS1q/9q4EkeVlHngcMf
 NTDdnvusL59tDkuRgKlnr3X4O+HcJA1e9BUQl9hH9JE//j0fthWkLithqr3oNZhGATEY
 BDRcn4YFU7uZ2lDY40B4d9dbSybmRaIP2GIGj699aB8qGm9uspopQiDp54nWH0Ch9Tbl
 XGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1IEWuRK9WdngOW+6EeOQzbcDGiS+A2oh1BvOoB4nRdU=;
 b=EJx3a2Ax5iGaAAld/cvGRegR30Gq0B3XvR6p6VjekmKapiMzVk6X37v7QYkCGj1GtB
 bY93EbIuWRQevG92mKZ6pr0GBmru6yWYZrLNgGQMvE9J2b8hgDoy15oO9yp6jJScynYb
 goKEZablbha2Js/zuR8eLaaLuFqEJRRh7vhySzl2kAfJPz4U7PXTr17R4nmNC3fGNb45
 b9oYLo5OP8ctu0pkHX8DgEheT3VWJNgFC2y7YN1WEWz/BJUv9OwmBWlYsLC/FFyU8L1r
 SsBxZl21qGxmxza9E1djMjQOdoMRXntuzCnfs747YYBPgsjVi9IC59Dhu75L24qYkA4x
 5fNg==
X-Gm-Message-State: AOAM531AefuqZC1uQgrJznB7ZaxEMJ/F+fTdTbGM4SRyavmPREbLb25v
 OD0OyOInYvnop/nTEKNrHmOW4RFPtY8=
X-Google-Smtp-Source: ABdhPJzo89VesGxfkNnO8lPr4EiK3lJtJP4TUOeP2XVvYui3X/3hYoQCnJeY3Cz1VbmzRG4QTIf0uw==
X-Received: by 2002:a5d:6c6c:: with SMTP id r12mr40473813wrz.706.1641244037057; 
 Mon, 03 Jan 2022 13:07:17 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id j14sm36686710wrn.88.2022.01.03.13.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 13:07:16 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jan 2022 22:07:13 +0100
Message-Id: <20220103210713.8642-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/terminology: bump to version 1.12.0
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

Requires efl 1.26.0 [1]

[1] https://git.enlightenment.org/apps/terminology.git/commit/?id=3e95d2ad9f59e01d498e90dcb4413dc886d49852

See:
https://www.enlightenment.org/news/2022-01-02-terminology-1.12.0

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/terminology/terminology.hash | 4 ++--
 package/terminology/terminology.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/terminology/terminology.hash b/package/terminology/terminology.hash
index be1d6f4269..7e9658482a 100644
--- a/package/terminology/terminology.hash
+++ b/package/terminology/terminology.hash
@@ -1,3 +1,3 @@
-# From https://download.enlightenment.org/rel/apps/terminology/terminology-1.9.0.tar.xz.sha256sum
-sha256  3f3bc327da5cc239d468570afed29a17e2fda3b1fee02b28f02ee7ed5141e46c  terminology-1.9.0.tar.xz
+# From https://download.enlightenment.org/rel/apps/terminology/terminology-1.12.0.tar.xz.sha256sum
+sha256  74d2d3b253a77bcb215fc36eedf0ccb59643452e2ef15c510430ffaa6034dcf0  terminology-1.12.0.tar.xz
 sha256  6863ee700fc82b9c3b82a1627136f6935a9eb68e6a64491f20e00b4023c33622  COPYING
diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index 29b59fb39e..787c9ad137 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TERMINOLOGY_VERSION = 1.9.0
+TERMINOLOGY_VERSION = 1.12.0
 TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
 TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
 TERMINOLOGY_LICENSE = BSD-2-Clause
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
