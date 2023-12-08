Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808BFC4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 13:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E30B383E7E;
	Fri,  8 Dec 2023 13:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E30B383E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZN-uVue0K-Ka; Fri,  8 Dec 2023 13:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BC8C83B94;
	Fri,  8 Dec 2023 13:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BC8C83B94
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 151F11BF83C
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 13:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7D40421A0
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 13:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7D40421A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HTg1Tr_CduXl for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 13:13:14 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69A6A41969
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 13:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69A6A41969
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33339d843b9so2199034f8f.0
 for <buildroot@buildroot.org>; Fri, 08 Dec 2023 05:13:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702041192; x=1702645992;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X5qrv1Nkkmlydrw8ytkTXfi5a5kIiFQkJ0re4r9JpeQ=;
 b=BPdu7RhbWKGvx+Eg092Vs12buolEGwUcnzLWw5IOMDjzFspuUAS5afZP2p4PjpfiHG
 3Xl89pCVPAh7vyOQ0rnb+4yGzXQu6h919SZROjGWq5Hu/hRHgvo9ZzRJN8HH1RbvZGFj
 o6a/6MtK7UEAqUhESkgALz69ZJsoQZz4ST+YcZC+VZ7FV8R06NQjqLvK3VCD/qpgoA5/
 g59655t/Rk31yvybuVS4oGALnKwpMLBZUxVWsHWAbTfOO/5U++HiXTEOto6DCrJ+kZ3R
 JsQZ25A2rR9bG/nJaAyp4pZhgOtCH4nH6AYbCJQr9HPGBnGPnni7hPOBp4S5Oc9peTwy
 gcdQ==
X-Gm-Message-State: AOJu0YxZb5dPE8YyRyc29ENGP6shyjlkJtbAINO7V0uKgWYpsao0HhZm
 GI43rTYbXKcy2eOdesZqnI5Q4G9TggjyD19/2wA=
X-Google-Smtp-Source: AGHT+IEHI4kT4tPa4oUxVEU9txBW54UMYNY1lKdIiZLvF7TM/jqm0aPY1Mo/F+WI6kDsZ51iX6vUyg==
X-Received: by 2002:a5d:4c44:0:b0:333:48a2:b051 with SMTP id
 n4-20020a5d4c44000000b0033348a2b051mr2788583wrt.121.1702041192534; 
 Fri, 08 Dec 2023 05:13:12 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a5d4291000000b0033335d9dcc5sm2021501wrq.64.2023.12.08.05.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 05:13:12 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Fri,  8 Dec 2023 14:13:09 +0100
Message-ID: <20231208131309.1036690-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1702041192; x=1702645992;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X5qrv1Nkkmlydrw8ytkTXfi5a5kIiFQkJ0re4r9JpeQ=;
 b=TdUBlnTB/E4edqGz5avghZUIfkdfNucAls38CriGjUmdeimYztHDy102NOEpwcUxyo
 JbyrYomyp8my5Ds1U5AmV8ODBpPa9+vv2pUrBZofJw32QbnLbtyufYX7SZCsAYDWNrZT
 HL+rtPylEPjwAv2dQLG7IT61QEA0Li1ePNZJNJHbSWxzbEiMdM3EdubV2Bn9GVjW41fq
 vgi4CJyAKyRHXnoxMxEQtlq7y6DVl6Jdd17ymMiSyT7/LkFXho+U7ClIetb/TG9191SJ
 DnqBG8ene0CZJzm5qMbCfMgT8T2v77BGId/BdgWw9jPgnHWAMbWkKLfP80+gE9VM3G0k
 nBIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=TdUBlnTB
Subject: [Buildroot] [PATCH] package/pkg-python.mk: fix typo
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit [1] introduced PKG_PYTHON_MATURIN_INSTALL_CMD while
it should be HOST_PKG_PYTHON_MATURIN_INSTALL_CMD.

Adding any new host python package using maturin setup type will
fail during the install step.

[1] 6b915358babe37a721b4f6e032ec884174bd6e0b

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/pkg-python.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index bda79116c8..4bed5a1835 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -258,8 +258,8 @@ HOST_PKG_PYTHON_MATURIN_ENV = \
 HOST_PKG_PYTHON_MATURIN_BUILD_CMD = \
 	$(HOST_PKG_PYTHON_PEP517_BUILD_CMD)
 
-PKG_PYTHON_MATURIN_INSTALL_CMD = \
-	$(PKG_PYTHON_PEP517_INSTALL_CMD)
+HOST_PKG_PYTHON_MATURIN_INSTALL_CMD = \
+	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
 
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
