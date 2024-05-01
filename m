Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD8FC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B705982120;
	Wed,  1 May 2024 21:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9w4qx5oZg-0p; Wed,  1 May 2024 21:26:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C853382127
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C853382127;
	Wed,  1 May 2024 21:26:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 131E11BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CE2582127
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_JRzviiaWnT for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:26:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E41582120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E41582120
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E41582120
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:26:36 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41ba1ba5591so40111615e9.1
 for <buildroot@buildroot.org>; Wed, 01 May 2024 14:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714598794; x=1715203594;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IoDfkH9bnHkSXFKbfu5wlRFAvqbfLArPyqKMD8xSl5o=;
 b=gBQDokCtwx+MIEltFZxkHZtrDG6yH8ZQlRCwVJc+PdF19AhX8mayjCv4E3l9Nbl6XR
 b8ZskaVpftHL9HcQ33f301CusT+9XkRop4c+eHXkjopZDcbHrzr1msrjwFiCQIrmYagZ
 8xuD9Qflc0hf2Fus43J2TKm10JUDQ8KWYB0rgNvjFtWhmscFpi9tGcm2BO0kf13rQM30
 dl34V2V0xQckHDee2CtqFN8vR+oTu9Qac1EOtpNf1Wun6A8ss1COniKrGpX3X2XCWJ5u
 IWxMawJidLkh8sCkyHt6uMe7vGQgdDnX1/nIXZjiP5wTbKhixPuUTePNPu6TX9fFX9pQ
 AAAg==
X-Gm-Message-State: AOJu0Ywgc6IJEtMFoFYcpkkMPL72fEvH7Z1pX7042bUhPjcsiEIQIhZa
 HLz8wRASGV/Ojm3Kw17qpQLW45MkshpkQqv230PWSGuH1Z51u/8dK6mjOg==
X-Google-Smtp-Source: AGHT+IF8C01SIOrk0aXLXY2BktuX4ziMLTeLavYzFYwhRuDJiQVVvSJHDE1Tj1GCmIVleSVjhZEMFw==
X-Received: by 2002:a05:600c:444d:b0:418:ed23:a9f0 with SMTP id
 v13-20020a05600c444d00b00418ed23a9f0mr2503144wmn.18.1714598793513; 
 Wed, 01 May 2024 14:26:33 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 p18-20020a7bcc92000000b0041bfa2171efsm3329471wma.40.2024.05.01.14.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 14:26:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 May 2024 23:26:27 +0200
Message-ID: <20240501212627.17988-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714598794; x=1715203594; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IoDfkH9bnHkSXFKbfu5wlRFAvqbfLArPyqKMD8xSl5o=;
 b=Zpl2SaDmzjOoyFH9kxWVV/Ul1xVn8Ge0GY2VJDwmhFJ/Nc1FGTtZrpf8QQTen18dVm
 rcMh0SB9vJxOniK/GxZLprICkPLu5MG+ppknqk2gRsaLSNeAnuQZBe2a7DekoaQi1qp5
 32TNjJY7nIhT70GERQ4kxN+FxRdqtGYv7HM1FPlwWPvM1CO+fi9Ecom/GtIIh6PZqyhh
 bS1Vma2ucRuIJNxjQw2ub8ZnnG91nq5DSQsNHmNMdQcYzOHUYV7katbpszIzvs8uo2VF
 ITgFGXxCkoqVPUX//H/ULJnE5x+kjDZHEtaGFumeCoikENqcW7WQC1PNdSr5P+6/cc07
 3FXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Zpl2SaDm
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: fix legal info
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit dfaa34ddd3398f22718f7361d617d98d53b51630 forgot to update hash of
LICENSE file:

ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: e706384c6f299d1b6fa782ae657740b372b4bd7938a1a318bf94ac249114758a
ERROR: got     : cf234c27a3f275f5a050f4df3946f8855704226fe4e7ca8b33928cbcecbced37

LICENSE file has been updated to clean up authors and contributors:
https://github.com/python-pillow/Pillow/commit/4197263dff19a79f13cd86f6cdc9a0ec6c06da92

Fixes: dfaa34ddd3398f22718f7361d617d98d53b51630
 - http://autobuild.buildroot.org/results/5a35d83c73367e1b20534b1bc7f2f564cf653a38

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pillow/python-pillow.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 073b758dfe..352536a035 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -3,4 +3,4 @@ md5  6c21a12849ae42f93881f614d8f6f651  pillow-10.3.0.tar.gz
 sha256  9d2455fbf44c914840c793e89aa82d0e1763a14253a000743719ae5946814b2d  pillow-10.3.0.tar.gz
 
 # Locally computed sha256 checksums
-sha256  e706384c6f299d1b6fa782ae657740b372b4bd7938a1a318bf94ac249114758a  LICENSE
+sha256  cf234c27a3f275f5a050f4df3946f8855704226fe4e7ca8b33928cbcecbced37  LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
