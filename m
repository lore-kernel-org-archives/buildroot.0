Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FA8C433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 10:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8375404F9;
	Mon,  3 Jan 2022 10:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T7m4SaWDaQ7C; Mon,  3 Jan 2022 10:43:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E81B340128;
	Mon,  3 Jan 2022 10:43:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E60D1BF95E
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 10:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CD1F8130D
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 10:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZhNVRZckdGia for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 10:43:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 464D381310
 for <buildroot@busybox.net>; Mon,  3 Jan 2022 10:43:52 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y22so134331499edq.2
 for <buildroot@busybox.net>; Mon, 03 Jan 2022 02:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IdsKxxol6CTcpM0iA6s00BCSXrrlgDQkCQG9yMBtJrY=;
 b=nzCBc6RTOmzvToLsrak/CXnF7M2CJm80543NM/c6JJa88VSZkeWFdQuRKkSanm1cpM
 m5SIi1VIVtacauiIVZFsfOKJM4u7SiMLtvO4D54Y/MhZYjaFOpmv8KTDL4GFQ/TjGoYn
 H0LX4xxki54pK8baTkwhEEL3en/1p4VOVWWBGSA4rzlJde4QZAYqZkEBp4c52NPJk9VW
 bSXmsgbg/hT6FFg4tYCqqhjHPfrnqiWlekWvF5e3JBPaD6YXdKJkF/TYp9F8YZJvybSh
 krt1x+67XPkK+jwW1RNqK9QJO/hv5C4aBvbgAEBIse1QWFhncKEhHgoRPKvPuK7kSL+N
 /pqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IdsKxxol6CTcpM0iA6s00BCSXrrlgDQkCQG9yMBtJrY=;
 b=gQZHMqknj0YSxTL/GyS28Uxr9Qkj7HNxFJ3qsS4Cc44QuQnMnUPUV6VUFtUz3GKjOF
 q61LUOB7BINYRh4Tra4Ukjk7ocYhifVLwxflTFAZL0HTB/kxHP6FRdoIApMLuOtEsgBU
 y/nLjkdBArJBsc2DRBMIA8l97OuCuKAFWlomA1Z4WWfBtz9GA4qWawbVofX6q+za9vdE
 RT2DBieyi598t5PXr4zZc9lWrpH3K3guE2KwfQSrLWiMKHLaRUK2QC80AjFn5R3bSbwc
 rVrv9+7ewQbSBxYvyubCgNtbnwo0JN6M2uAH9Ixrj36aiYLXBF8If2NMCrz4f8tWfYfA
 XwpA==
X-Gm-Message-State: AOAM532+ipSKWngmyppU4MQp3XlVZzVY6S/t8bZu21jHNPlQIDYRBOyw
 +3KcZxgARgwFanmqhedjGKqSdkYZZxA=
X-Google-Smtp-Source: ABdhPJxo6XoERYMW2NYy7RKP8g5nVW5m5an6AhMZSXWvHIDvwo5kivi9o4S9hy5tiD/6v5ZEpckajg==
X-Received: by 2002:a05:6402:50ca:: with SMTP id
 h10mr33689206edb.331.1641206631333; 
 Mon, 03 Jan 2022 02:43:51 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id gs14sm10524155ejc.183.2022.01.03.02.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 02:43:50 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  3 Jan 2022 11:43:43 +0100
Message-Id: <20220103104343.15975-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ethtool: bump to version 5.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 536579670..59c657e86 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  f5ddfa9c75053d8011b8c8c99ec4e2d3c83cd1972f638692d62e37fa3ef36f07  ethtool-5.12.tar.xz
+sha256  686fd6110389d49c2a120f00c3cd5dfe43debada8e021e4270d74bbe452a116d  ethtool-5.15.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index f3e950f21..c4bb9bdd9 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 5.12
+ETHTOOL_VERSION = 5.15
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
