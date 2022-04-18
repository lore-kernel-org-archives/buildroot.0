Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7765C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 21:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FEB040BF6;
	Mon, 18 Apr 2022 21:01:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lRzTO-hF5sq7; Mon, 18 Apr 2022 21:01:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C23741020;
	Mon, 18 Apr 2022 21:01:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDBA01BF28C
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 21:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C975B6126C
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 21:01:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RshMulQFyg5r for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 21:01:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E89D61264
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 21:01:48 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id v12so13326332plv.4
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 14:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FXxyDt9LcFjxoakPVz22bep0uC3i3GNu58aW4bHmhh8=;
 b=QAc0Fb+E0/2es3E4Ti39K1glIZr+bb1czPiXYdIosFxDNvbxKooy8pvN9kszztwFSr
 zZAmjPd7JK4wIMkWzuuRRycSy8wDMruJKFFrFY5raAcgtNot2Xc8OcurSgp4kJfBhlDa
 9xLzA1G/Djq4pgGKwtYHyRerfzQNnou9Uhvh44Ig99iWUcPTCmSfiVawlSxoS4FwzRSZ
 Jz0LqaBd4MqhLo1mL7lrZvPdG7KwOeiCbTSqkPrt2Dj+ZVySgIfmJcXRFWOmSvwxva3X
 d31Juha9+G013ii+VuiPbqeIYLXgx/8f6WS/wRPN/6WsNNwlJYlXGLiiLz3suqSiOMrC
 mmOw==
X-Gm-Message-State: AOAM533rWDwMPBp+NdcUiPRNN0OqpuQG/JaIUXQHv3FDf9JtTN1v14Gr
 Z9QhYlMMhdySgaWOgmHL/hq9gvX9hpDQnw==
X-Google-Smtp-Source: ABdhPJyiuf0aW4YennH103emCV+insZRDjnxI9vyRhqpttHhu5wDJhZMBH6ZaFhwLcobT67z9IsNEg==
X-Received: by 2002:a17:90b:4b84:b0:1d2:add6:804c with SMTP id
 lr4-20020a17090b4b8400b001d2add6804cmr4770755pjb.107.1650315707399; 
 Mon, 18 Apr 2022 14:01:47 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a17090a00cd00b001d297df6725sm4071841pjd.22.2022.04.18.14.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 14:01:46 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 18 Apr 2022 14:01:44 -0700
Message-Id: <20220418210144.3062100-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] boot/sun20i-d1-spl: update to mainline
 4da9c5
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to latest (as of April 14, 2022).

Signed-off-by: Christian Stewart <christian@paral.in>
---
 boot/sun20i-d1-spl/sun20i-d1-spl.hash | 2 +-
 boot/sun20i-d1-spl/sun20i-d1-spl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/sun20i-d1-spl/sun20i-d1-spl.hash b/boot/sun20i-d1-spl/sun20i-d1-spl.hash
index 6ca60e5278..bb2fd66c28 100644
--- a/boot/sun20i-d1-spl/sun20i-d1-spl.hash
+++ b/boot/sun20i-d1-spl/sun20i-d1-spl.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  69063601239a7254fb72e486b138d88a6f2b5c645b24cdfe9792123f975d4a8f  sun20i-d1-spl-771192d0b3737798d7feca87263c8fa74a449787.tar.gz
+sha256  3ef28affd35a37675d91d3ac50b85e3dfa356420005f69713df73c85798ff1d8  sun20i-d1-spl-4da9c518c124d6f6123bf274e449514863df3646.tar.gz
diff --git a/boot/sun20i-d1-spl/sun20i-d1-spl.mk b/boot/sun20i-d1-spl/sun20i-d1-spl.mk
index 2462ce2322..3580ea4c25 100644
--- a/boot/sun20i-d1-spl/sun20i-d1-spl.mk
+++ b/boot/sun20i-d1-spl/sun20i-d1-spl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Commit on the 'mainline' branch
-SUN20I_D1_SPL_VERSION = 771192d0b3737798d7feca87263c8fa74a449787
+SUN20I_D1_SPL_VERSION = 4da9c518c124d6f6123bf274e449514863df3646
 SUN20I_D1_SPL_SITE = $(call github,smaeul,sun20i_d1_spl,$(SUN20I_D1_SPL_VERSION))
 SUN20I_D1_SPL_INSTALL_TARGET = NO
 SUN20I_D1_SPL_INSTALL_IMAGES = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
