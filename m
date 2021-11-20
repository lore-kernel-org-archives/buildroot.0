Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACF4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 11:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46900409B2;
	Sat, 20 Nov 2021 11:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TkC6siOf-Ido; Sat, 20 Nov 2021 11:25:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97F8141BE4;
	Sat, 20 Nov 2021 11:25:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 053A71BF28D
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 11:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 003A7401C4
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 11:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H1w_ITAooa5S for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 11:25:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EC0A400D3
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 11:25:10 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t30so22782010wra.10
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 03:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N/O6z8j43EtR5rzFChQayNJxRrxUcalAnfLQhCp+3Cs=;
 b=qIrZMy0ryf9wxFUT0Ogq5MF8CxrSxApC6/A2S3C73wA5xSYkywehlX9JH/EU6OPiUR
 R36q3SAMcp/TnVppyHDcpCAjVIHB1OXbS+4KJmPUN1vAJBTUSFTtmOso2Z9Z46poYLiR
 CBr2zNRbFDwa+GWf0ZFXBwvnM7Rtt+lLmZU9TKPOGEEB1byPK1ZcZAof1ZXRdobuTKKK
 WnGdlo9SuZRqWwDaOi8Ffz6DEap9EaTDFqze8eIG6HX/kCkWphC4k3EK1519l5B7Yw2/
 4XqIh7+FyiXjXAK26WhA3ORKd5bW4mTcve9J1/FVogrnoNvpzfOreubEYMHldOu0QL3W
 3Iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N/O6z8j43EtR5rzFChQayNJxRrxUcalAnfLQhCp+3Cs=;
 b=tgJ/EVAoOqQOZJ0eIM1C490xhWyc5Y3qp6LQ8ZfFtu36Bq5hiGw99Z25fA3lNo3tNJ
 YvclIb6IL5MStOXpIstiRq5/TP+8FgLt6dLKRRRS37PfK+VAO7efozQjOHhQc5Q5q1PO
 EwsUM6/zkLHhoNy7lPVquXysbPZLd8d1SJbpYBg5tJdFvHpUrdOXwWyQCjjNpc+PfyS2
 P0kjcvWjv/l16cQz8wlUFJ1rmcJf/c1hrtUk+I6mLDlNrxA77Q+UyjIYypsH/fHZ4/Fx
 DPBzX5iiKVgbVc9Rgu2w1YuaJGfNAECmNNnoa61glpgOZXmlxpLPIFRtfGxYRlK2phnz
 sFIw==
X-Gm-Message-State: AOAM531X4aDShfo6WYrlQl1kSd15JrTTVCeiEpzDDb5qE/M20cHceG2M
 wPUj3SleHOw4zQgIUJA32fmQcLC1rgk=
X-Google-Smtp-Source: ABdhPJwnY5ZY0dL4Bs36CEyB3RlYtLDfeAc4tn97sO86ZpZaNY4nzqrjFQUJRyKsHZy+5Gfw0iQoRw==
X-Received: by 2002:a5d:47aa:: with SMTP id 10mr17596097wrb.50.1637407509037; 
 Sat, 20 Nov 2021 03:25:09 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id s13sm15536504wmc.47.2021.11.20.03.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Nov 2021 03:25:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 12:22:53 +0100
Message-Id: <20211120112253.2885766-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qdecoder: set license to
 BSD-2-Clause
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

Set license to BSD-2-Clause instead of BSD-2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qdecoder/qdecoder.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qdecoder/qdecoder.mk b/package/qdecoder/qdecoder.mk
index 12784fc451..8cb5d3bc97 100644
--- a/package/qdecoder/qdecoder.mk
+++ b/package/qdecoder/qdecoder.mk
@@ -6,7 +6,7 @@
 
 QDECODER_VERSION = 12.0.8
 QDECODER_SITE = $(call github,wolkykim,qdecoder,v$(QDECODER_VERSION))
-QDECODER_LICENSE = BSD-2
+QDECODER_LICENSE = BSD-2-Clause
 QDECODER_LICENSE_FILES = COPYING
 QDECODER_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
