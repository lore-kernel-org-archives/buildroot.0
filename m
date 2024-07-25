Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A300BC3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 11:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48C0740653;
	Thu, 25 Jul 2024 11:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6R7dkvgiy3wS; Thu, 25 Jul 2024 11:39:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1966440665
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1966440665;
	Thu, 25 Jul 2024 11:39:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 00A651BF2CD
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 11:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F04B940665
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 11:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UczAUYE3Okwa for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 11:39:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B78CE40653
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B78CE40653
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B78CE40653
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 11:39:51 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ef1c12ae23so751541fa.0
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 04:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721907589; x=1722512389;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E4nWWPV6ffl7YksjqLmcEaC2X+SA/F3tgYgCsbc6Xq0=;
 b=NNLWUawK3UJXpmR/Enmbk/Ka160H5MycFfe+Sxd39Yxld1sZFSGcBQywff9eTIPOao
 EYDFM0sQZTeUcvmz9dSleq5XtwGZ9RiAV3LSgzOrSfVcYggB9vgh98OjNOt/VDRLlZve
 jH0d7DtkAFjXc9RaiKtOOpd8RJwUsKkyHFN4g1LPLP79tXCZyXAvR7cBHaWjodHbvL2O
 FFCXo9b8Iwi1F/tyYTOZ3hIRq5E8vpXYTGyGwQff8y1UuabLhIvpDuDGeF33OJEe9VzQ
 3B+g703CTsxLV3qWcs3sWacA7nOkS9ZRAtSVsXNMCwcgN4NU3pRsHLG7wUZf23OytcXO
 WxZA==
X-Gm-Message-State: AOJu0Yz4WZd4uRFrKllkJyNANsok3xr5bzskn3SUrBjxTf76odhwU4GD
 wHhlSUR9mfaKegciaeYns6kWq4oOx4q837KaOZy1+9iK/27/fkSObhamiw==
X-Google-Smtp-Source: AGHT+IGKcg9jGO5tAnKpkINOBoXp/d3fgcm1xgM7UsRTvPkEO4l+822qBNC5DcM8eDNZXNujI1ScSQ==
X-Received: by 2002:a2e:b051:0:b0:2ef:2883:2746 with SMTP id
 38308e7fff4ca-2f039dd9935mr19750581fa.48.1721907588834; 
 Thu, 25 Jul 2024 04:39:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f940e62dsm74595965e9.39.2024.07.25.04.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 04:39:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 13:39:43 +0200
Message-ID: <20240725113943.1761962-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721907589; x=1722512389; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E4nWWPV6ffl7YksjqLmcEaC2X+SA/F3tgYgCsbc6Xq0=;
 b=jRBmqqyd8rXJzKgKOUUTMgvEAuggLESB99hliAv2xQ4qWigHu5ExLlwc3xcidrwqTP
 sMDrk0jAGnnoMM+tkAeYZicH5PjGbfw/PPLxRiDk26zXyWrhoIjxqIY3JBQgE3l8gBJM
 FMXuz5RG4/sQNzpNXKmpQCSBqA4M50bI/codOs4trxk1ziC4vQUWEwe3shPmVzNVuCKs
 6WuoYIF2ksCfv+xyOqCItqyO16UQDGeR3t/Kx3f1Ps9d70hJQTn6HLIUTToDKvgbpLjb
 9FkB2aCK7bRXyz3QXKvSW1rblLWTzaRuJAlqUEzeOBzM9R9NCuI4+NSZvQs+47jcz9ip
 7QCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jRBmqqyd
Subject: [Buildroot] [PATCH 1/1] package/libressl: fix mips64el build
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

Disable assembly with mips64el to avoid the following build failure
raised since bump to version 3.8.2 in commit
21eca49ed5110872407b76ab9337d2877c4cda24:

/home/autobuild/autobuild/instance-21/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-gnu/13.2.0/../../../../mips64el-buildroot-linux-gnu/bin/ld: ../../crypto/libcrypto.so.52.0.0: undefined reference to `bn_mul_words'

Fixes: 21eca49ed5110872407b76ab9337d2877c4cda24
 - http://autobuild.buildroot.org/results/09b86c95ea1054d5f54d4ef4a041eb105c3f4aa9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libressl/libressl.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 1d90aa853d..edf3ef9d0e 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -19,4 +19,10 @@ endef
 LIBRESSL_POST_INSTALL_TARGET_HOOKS += LIBRESSL_REMOVE_BIN
 endif
 
+ifeq ($(BR2_mips64el),)
+LIBRESSL_CONF_OPTS += -DENABLE_ASM=ON
+else
+LIBRESSL_CONF_OPTS += -DENABLE_ASM=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
