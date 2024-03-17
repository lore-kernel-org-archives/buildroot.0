Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054E0C54E67
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 10:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84E214016D;
	Sun, 17 Mar 2024 10:53:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mkN0yE0xBliM; Sun, 17 Mar 2024 10:53:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D85D4035D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D85D4035D;
	Sun, 17 Mar 2024 10:53:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC9EA1BF424
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 10:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B806540683
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 10:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LQqtq8DN99U4 for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 10:53:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1F99740681
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F99740681
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F99740681
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 10:53:31 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4140fbdfc2fso451365e9.0
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 03:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710672809; x=1711277609;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5n2uFS5LaFZhb/146BPZzhuyz82jzGA3cnCYyUNUGfY=;
 b=NCEN8x/okAFbdmC1vQM+NDicggdnv0RBJKuxdRE9tYU2hAsehF9HJu7dS4gnMZx4fy
 B5jLW30iQV2j8lqjgr/9ZnT/ET21Zaj6tz0ymFIlRSn/yjqddXGw/1dCm0BT2IHyoUCT
 BTGL3q/LHI0Wyrkj3f3BwC5SlFiIHDKAbA6K4HZoWj8uafwswkLQRhumCitn860WaC1u
 6meGwJG52aUe2xqMry90Jq/hK8N+vLb29iKm300U2eFim9z/qNgeLE1P0bxODXTucHbv
 7BhSEDg0xW6XPONSGNVxPIVqctSt8YXWQJ/poHY/vVYdT6yr1bnqsJTQDMKzJ1s2es/B
 0Nzw==
X-Gm-Message-State: AOJu0YxVWjW15GZfL2upyC8eHQu9lEVYNUxJX0fc0AMj+blikP32xaEQ
 09RzgPVAHCgQzNoKAbFjXWWJ1HXs9tV+Ed8lR8aX+QlhLEv64wLAN+V0FfKf
X-Google-Smtp-Source: AGHT+IEd7Vl9bp8HBputxpZg/vjv6h20mmG9c6VAVgHscPHTdjHzcmGOcnBYt9BhKTI+nObBxf6OYQ==
X-Received: by 2002:a05:600c:3585:b0:412:f67b:bed8 with SMTP id
 p5-20020a05600c358500b00412f67bbed8mr7534500wmq.37.1710672809150; 
 Sun, 17 Mar 2024 03:53:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a13-20020a05600c348d00b004140ae9664csm2259361wmq.5.2024.03.17.03.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 03:53:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 11:53:26 +0100
Message-ID: <20240317105326.237292-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710672809; x=1711277609; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5n2uFS5LaFZhb/146BPZzhuyz82jzGA3cnCYyUNUGfY=;
 b=ibH5q7tV8ihgxnBukHwbKb112aiF4HtgwmV6SK0cy3BPn+kLdZPypKKpOgYbDnUA7Y
 nhv3Z3E5ZldgcVWGwNlsrmujwNlyHjHnWKokofiz8u0kZSmgOilxe+ABPTgWFAMdekHl
 5n09son4hiaEWAWxykiv3Nb/kwjaA0g4PztQzAFU3bUVyLAiRZR/AV1YDL54tJrxwAs2
 L3IRX6huKgXJa+DrqiU4v2yyA5d6aijrpR4mh2bTwKVMF7A6TP0j4Zs8SuhPli9kMJFE
 UIy79o2D8rpv5Tpt1MOru9Paf+3t+z6CIqpN4/aInSbVv1Yw/qTpYYMbMa1024QZrWVv
 yw4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ibH5q7tV
Subject: [Buildroot] [PATCH 1/1] package/libunwind: drop autoreconf
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

Commit 67d87bf7d255cd05f84fab3e3625e073b5bfccf8 forgot to drop autoreconf

Fixes: 67d87bf7d255cd05f84fab3e3625e073b5bfccf8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libunwind/libunwind.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index d7ddb8f179..15c4e4863f 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -10,7 +10,6 @@ LIBUNWIND_INSTALL_STAGING = YES
 LIBUNWIND_LICENSE_FILES = COPYING
 LIBUNWIND_LICENSE = MIT
 LIBUNWIND_CPE_ID_VALID = YES
-LIBUNWIND_AUTORECONF = YES
 
 LIBUNWIND_CONF_OPTS = \
 	--disable-tests \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
