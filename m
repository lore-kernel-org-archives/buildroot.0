Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B81CD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 13:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0155A40B88;
	Mon,  1 Apr 2024 13:13:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_3DS6IRU3AD; Mon,  1 Apr 2024 13:13:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7888440B45
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7888440B45;
	Mon,  1 Apr 2024 13:13:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C0131BF232
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DEAF81EB7
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bWrz5gllF4tt for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 13:13:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 271EC81815
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 271EC81815
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 271EC81815
 for <buildroot@busybox.net>; Mon,  1 Apr 2024 13:13:13 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a46ea03c2a5so731287966b.1
 for <buildroot@busybox.net>; Mon, 01 Apr 2024 06:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711977192; x=1712581992;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QiTrRObMdVefrjPaPp1oNSOARpS2DyMCBEBQpTZbzhE=;
 b=o1McAqbp464qWPzmUgdynJ0/cQzaqMo6ejvBIBA3DBbxuscTX+sQa5rzIDwypSocrJ
 JrNF1Ip55mYjCim5bn+cujEfaLi94PUfPeD7RrjI8Bj3AI6gmXSEpXv6nKp2PEuVrtRR
 ta0Ix7NydsmY/rYc4itNsLP55xbhstjF2LOMr6oBCEZPnvu/1U0oZfFNiLIsrI2KgaPJ
 RH/02V0Kjx4rAkd5RmtInm8//kTb+Xdv04+yjzISkLAO2XLvjy1R5qiddr8xQBbyg1SN
 mI/TrAA1SgFuA7GCl5walIHN1meeYIRah5WhO2eoge4ppIKvHMpwevXGX3W7e/nLPYfg
 jLMg==
X-Gm-Message-State: AOJu0YxDL+yu8RphtuLfB1+QQBCSKS/dR0GdvPU+PkmQNw8vVH94PPu3
 pDJaDE07Q9AZ6oJhvA5ByV2Ya/rbS/4WQ/gwdWpcqK8uoJFwnw2ieFBjb9Z2
X-Google-Smtp-Source: AGHT+IGf0aVUvmr4k9DqYptkuRnWRRjPR9RA+IjysrJkc8VYshvuFaOvxaNsXO2ArEZhHxTvVqS62g==
X-Received: by 2002:a17:907:7f87:b0:a4e:539d:217f with SMTP id
 qk7-20020a1709077f8700b00a4e539d217fmr5467842ejc.33.1711977191705; 
 Mon, 01 Apr 2024 06:13:11 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 p6-20020a170906a00600b00a46d04b6117sm5308984ejy.64.2024.04.01.06.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 06:13:11 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  1 Apr 2024 15:12:56 +0200
Message-Id: <20240401131300.511245-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711977192; x=1712581992; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QiTrRObMdVefrjPaPp1oNSOARpS2DyMCBEBQpTZbzhE=;
 b=M8vbrJgBOvgkglaFh02p91Yrvc10s3+P7UUWZSVfdGSOSKcJHsFdsl5w14sSfnAdDs
 4478aQdBky2OwQRj7qzvLTs1eViOvjPQMWipkUPLJwPmLImSr8VvFGCgPPzT3VNg94qk
 QZt4/wIoK8Lv7At+rxhzB6YXqrdMgzpN+XRRc+URYLUQoHVHUJKXB1Bquign6YjSHea9
 kk42opfPVZPFoUcJiMWimfq33GlbD6ZPqYiEbYpbxBD6by+bFDSldvG9FtifEuXNJB/Q
 qvOjzpafS9WT1AnhO8X1yYVSKxwnSxZjRz+eMWgk+DgPETX+v5Voy0asKrgzYXfBCEYo
 9bFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M8vbrJgB
Subject: [Buildroot] [PATCH 1/5] package/gnupg2: bump to version 2.4.5
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
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index c821afb55..8bb64c9ed 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  228b3984325fdeebc5e3f2d165c6419a5ebc28de  gnupg-2.4.4.tar.bz2
-sha256  67ebe016ca90fa7688ce67a387ebd82c6261e95897db7b23df24ff335be85bc6  gnupg-2.4.4.tar.bz2
+sha1  ae0935ead29a2dfa34d6b48d70808652bc3ca73b  gnupg-2.4.5.tar.bz2
+sha256  f68f7d75d06cb1635c336d34d844af97436c3f64ea14bcb7c869782f96f44277  gnupg-2.4.5.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 986da4790..39b0a066f 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.4.4
+GNUPG2_VERSION = 2.4.5
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
