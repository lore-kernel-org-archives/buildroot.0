Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CE9EE4996
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 01:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F7DA40B53;
	Tue, 22 Aug 2023 01:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F7DA40B53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JpRpaue8i7CU; Tue, 22 Aug 2023 01:33:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AD6A4063C;
	Tue, 22 Aug 2023 01:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AD6A4063C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BBAB1BF30A
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 01:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E737B81414
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 01:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E737B81414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ldpvZTGYdCp for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 01:33:41 +0000 (UTC)
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C5B081413
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 01:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C5B081413
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-579de633419so46336827b3.3
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 18:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692668019; x=1693272819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iT+ZXm1vbXyahpzFHYSL4gcGQJakv2pra/w/v6l5qBU=;
 b=gWP+GSWnhsDHHqu8Uj8Crj/y9/vgji3JIthOds/2WivX2SsNE0wHfl6rfLPHli7UH/
 /3oWQjzen+vCkMUPaeefltGimNP5JJ3Ufm77EZJrbiQJRGsUTVmdLWfyW0qCNHLmyuU3
 1rPUwE+mhpnvl9hrFwkQnLrx/PyOp/nGHAcMGfwnDoy8qYGsMMUAqEvqLbMKpiAiYpU9
 hIKCshICPc2dCGu9rmME72NQ/wxENzK9GA54y6WoVt/zyduW2GZ0rllj0bSC05h08pbu
 RiUIgpt//FmcU7Oum0V5HKyf5tyNHZRkLELV3am8ejzqVBjHBZ84rExWtY8f95fx+AT5
 eSGg==
X-Gm-Message-State: AOJu0YwOZQ6JSqhCavXu13abSDjp8vQ6gdfll9klgeWY6cd37xElWy6F
 Auaz0J6yL2RLFwaBghl6n+/ZB+d1vuMgRg==
X-Google-Smtp-Source: AGHT+IECaK0/7q6WllLl9N5CCXh6UcnXe83EN0H0mPLhT9mVqFW//mcuZTUn5PPjDSomB4HnmIke4w==
X-Received: by 2002:a0d:c844:0:b0:561:a123:1041 with SMTP id
 k65-20020a0dc844000000b00561a1231041mr7712644ywd.29.1692668019528; 
 Mon, 21 Aug 2023 18:33:39 -0700 (PDT)
Received: from purgatory.attlocal.net
 ([2600:1700:65a0:14f0:55db:9e25:2c0a:ecb3])
 by smtp.gmail.com with ESMTPSA id
 n127-20020a0de485000000b0058451c12076sm2550229ywe.14.2023.08.21.18.33.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 21 Aug 2023 18:33:39 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 18:33:31 -0700
Message-Id: <20230822013333.47036-2-ckhardin@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230822013333.47036-1-ckhardin@gmail.com>
References: <20230821175828.42827-1-ckhardin@gmail.com>
 <20230822013333.47036-1-ckhardin@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692668019; x=1693272819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iT+ZXm1vbXyahpzFHYSL4gcGQJakv2pra/w/v6l5qBU=;
 b=CF8PQer1AJ3Y+D4Rdy/O0YgY+NADz4zf4TUTlwOURGumqeLOOlsjr7eTR2Y1iEzSpT
 u5N5pV1gEAd7t48/tasdKwaXRVM7T2zB1GOK9I2cHnXIrInMiUv3l2PEKX3f9ZiSkDf/
 Rf8JxtL21wNnkAohMkhbCvQfRuZ19YaBOyKVqiN+3xkvwqyNbhwBSH74W+9J4/dbeiOK
 LKGe+92HVsADK6rDRHo5NPuE/wnx2kqItQHi/WH6N86tRP0ZmJkHceWrnLR+6xF8cfzG
 UB7kdmle5iSPeHeArqHDk68dNLf4QflzJgLK88KsnjqKuZIFKjAAgxgpB7r9QpK3C1V6
 O5Xw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=CF8PQer1
Subject: [Buildroot] [PATCH v2 2/4] package/python-docopt: add host python
 package for dependencies
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A host package like pykwalify needs the docopt module for buid
support and so enable the dependency.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/python-docopt/python-docopt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-docopt/python-docopt.mk b/package/python-docopt/python-docopt.mk
index f87d2f85a6..d326f4f0aa 100644
--- a/package/python-docopt/python-docopt.mk
+++ b/package/python-docopt/python-docopt.mk
@@ -11,3 +11,4 @@ PYTHON_DOCOPT_LICENSE_FILES = LICENSE-MIT
 PYTHON_DOCOPT_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.39.2 (Apple Git-143)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
