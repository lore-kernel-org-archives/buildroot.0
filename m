Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F81CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 16:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC28782FA5;
	Tue, 26 Apr 2022 16:40:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xp04dYnA_tlP; Tue, 26 Apr 2022 16:40:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBC3C82F84;
	Tue, 26 Apr 2022 16:40:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10AA31BF94D
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 16:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F30A382F84
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 16:39:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S-KCTuk-HwVi for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 16:39:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 115E382F80
 for <buildroot@busybox.net>; Tue, 26 Apr 2022 16:39:57 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id g6so14406720ejw.1
 for <buildroot@busybox.net>; Tue, 26 Apr 2022 09:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5lzpOetNba5ONWnL9M575bcIfalDcwazgjJWftTtcVM=;
 b=ZiPhvYtvI/gIbf6qFM6CH0DzLugLZcm+k9hJs4W5uXMf0dg0Wi7+Fq3X05owFEmHP+
 4Yhw2YQMsDjY/+q8TSReS/CVe+2oQtwMSfKaffnr45TnI2aLmgiS5HySEtM3VLzWpm7g
 DEqvmyYDN4pc76S36spgFy+WYuzjvsvfrfG+a7Vqhx0hgWRqDFfwLH2eQghfaFqZIiho
 zp7CLcMU4cnqkg4BanGmdqCHKP3wKS8f941HhkXfd3TxaPvBK879Js2gBMzgMuJewJOW
 7G1aVO3jIcLK81FJd2vx+5zg7uH4Y2TisTWCpdl6EkqwMmnPpA2PKLRX4OhM72C4/v3q
 8Xrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5lzpOetNba5ONWnL9M575bcIfalDcwazgjJWftTtcVM=;
 b=NzdWZTFgN6xOw1UkfMFgi+TWW+3GpQ6y9cZkeiY4i4nHlEx++D2BYBkAvbaaUH8gNg
 +8cIoNl7/fLqxzyn7srr4cjRT2LC9t1vfNEiIaccAxzEDUF+vLh3F+qXxbW9KniHp7oe
 +Uj8+D6N+m8RQIMPIoSvtr/hMqFB1ulWBai3hrNbLhaxmwIRc6VE3ba+h5oYF+hVT+qD
 Eq3iK/Ss4XwQy45naNhU3y64PcFVjknlYJCbZi1LJOBv73Y/k4qtcwQfedAnEkYA/L+B
 3HqGFgXN/F9wHKNWRzND6tjRDulcqIhM6bQuAOmuV4FaQQdYvkebUbQr+B+Jra12tYNs
 Vdqg==
X-Gm-Message-State: AOAM533sF6RxfyjH8aRZKghp9ffdqFbVNAUDZwtQQSURoct8I1Ql2mOl
 zpYs3qnv8exsSH977P/tcIClQ2OdSos=
X-Google-Smtp-Source: ABdhPJxQomBQjLYMNQcLMytNQsyP3a5dkpUe3cqtn7lgXjD08xV++eyYRoqebA/NGmz6k423H4DjBA==
X-Received: by 2002:a17:907:d26:b0:6f0:2a0:d3d5 with SMTP id
 gn38-20020a1709070d2600b006f002a0d3d5mr21000148ejc.608.1650991196222; 
 Tue, 26 Apr 2022 09:39:56 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 hb44-20020a170907162c00b006f3bd744275sm530486ejc.181.2022.04.26.09.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:39:55 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 26 Apr 2022 13:37:24 +0200
Message-Id: <20220426113724.3544523-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ethtool: bump to version 5.17
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
index 59c657e86..f317a1fb1 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  686fd6110389d49c2a120f00c3cd5dfe43debada8e021e4270d74bbe452a116d  ethtool-5.15.tar.xz
+sha256  64ab914b9c6b45047245d91f40b8760b2728992a9e5af22717c644238e889133  ethtool-5.17.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index c4bb9bdd9..10f0c802a 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 5.15
+ETHTOOL_VERSION = 5.17
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
