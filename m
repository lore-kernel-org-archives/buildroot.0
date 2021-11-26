Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A12C433F5
	for <buildroot@archiver.kernel.org>; Fri, 26 Nov 2021 22:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EA1640333;
	Fri, 26 Nov 2021 22:34:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zTDUrlRqrthT; Fri, 26 Nov 2021 22:34:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A40240423;
	Fri, 26 Nov 2021 22:34:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 342001BF584
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 22:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2412380DE7
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 22:34:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id odplBMYrixlp for <buildroot@lists.busybox.net>;
 Fri, 26 Nov 2021 22:34:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 454BE80DE1
 for <buildroot@buildroot.org>; Fri, 26 Nov 2021 22:34:31 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso7660594wmr.5
 for <buildroot@buildroot.org>; Fri, 26 Nov 2021 14:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ec6RayNumYf27JPlweh6z8DpptaZ7EQaxnbIp6gI7fk=;
 b=NMsrToMfmGDuGNfni2zjy3NYGDx+4uhORMyQX+2S5KAO7L7NINVq4t7WiH4f8gMrMf
 LwUJR1Lp5TYREKj8+XDBChN/XgUK34drimTYkNWYxJuG3FnN8NazHMUJ8x+5o7ff1/kR
 1iPgzX8AyeGIlucSMY9cwoOG7C2jztert4PF5Qm7WUr4QcSbehYiSRotk0j3ZVwk5cqr
 vxJM0ZVIrbb+8g6ltu5k4x+Mo++kWiJhLKoTglcjj8GI5d9aAQPqZI8eo4bRwygC7fke
 Q/9NyD/jR9mAEMSYuxqfXKL6sOXOCXM+S1PBiK+OtFuSz9NZxEwbkrORngN0fy4/fssR
 PqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ec6RayNumYf27JPlweh6z8DpptaZ7EQaxnbIp6gI7fk=;
 b=g3w2I90kc2URLJOIfrcoxm5HHhfS3y2zizZ618w4LvyvbtG91HbLDPO3zjjP6iTb9z
 G/PZpJ1Aa4FxksZtE4aDjOBrpO6u9hvH8LYxdFtWcd8LB1AN+3u1VnUgo1y71W4zN0QW
 WabN6i4HaieOiFtioMPxsGO6QCo80IyRSP2QojIP3Qz7nmkvP6uxF4c/jCC6i6L6zis5
 F7UXrdiXH+GEXnqlk2nHjmMn7NGz1JKUGY8lCPO1v1DzGKq6rkUor5iQwvaE58+7qFlS
 1qZIxVtgV7pQYcOUVVzUL8uiCbA9b0JPlkdgKR44g0mZD4WqWmjiFDs/Kx1p48kPb1DA
 dUMg==
X-Gm-Message-State: AOAM533sBITimLDpFMW/iwbBtHaHjBml7/8YUu75W/Sp/fmMO0uB6USY
 yTq8N2/90VCb0inr42DjeDyVl5+OZgo=
X-Google-Smtp-Source: ABdhPJyaIBY24wtOrznzmVh6Pl9JaF7L7cL9z07W8bQ1jIXqB7uTrfIIYS40YqfP35GklNO994yVeg==
X-Received: by 2002:a1c:f416:: with SMTP id z22mr19218063wma.121.1637966069283; 
 Fri, 26 Nov 2021 14:34:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id l21sm6797389wrb.38.2021.11.26.14.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 14:34:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Nov 2021 23:31:53 +0100
Message-Id: <20211126223153.953998-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/poco: requires DES support in
 openssl
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

Fix the following build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359:

src/EVPPKey.cpp:161:52: error: 'EVP_des_ede3_cbc' was not declared in this scope; did you mean 'SN_des_ede3_cbc'?
  161 |      rc = PEM_write_bio_PrivateKey(bio, _pEVPPKey, EVP_des_ede3_cbc(),
      |                                                    ^~~~~~~~~~~~~~~~
      |                                                    SN_des_ede3_cbc

Fixes:
 - http://autobuild.buildroot.org/results/eddcba8e74c23ea041f2d95de57196107f5af8a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/poco/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index 24514a3714..dd87ee36bb 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -45,6 +45,7 @@ config BR2_PACKAGE_POCO_NET
 config BR2_PACKAGE_POCO_CRYPTO
 	bool "crypto"
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 
 config BR2_PACKAGE_POCO_NETSSL_OPENSSL
 	bool "netssl_openssl"
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
