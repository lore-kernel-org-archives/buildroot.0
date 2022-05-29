Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616A2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 21:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D187940B64;
	Sun, 29 May 2022 21:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wdsq840GGkza; Sun, 29 May 2022 21:15:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEC1C40570;
	Sun, 29 May 2022 21:15:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C875A1BF336
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B726C60E1B
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wKEc7jRVf5KG for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 21:15:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF82B60AB3
 for <buildroot@buildroot.org>; Sun, 29 May 2022 21:15:39 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e2so12324616wrc.1
 for <buildroot@buildroot.org>; Sun, 29 May 2022 14:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IhjBq4I9VI4adTZ09QA3MHjtL511PUBEv8dnhqIjniA=;
 b=mSqk3h2fJJwII1eXfVLxRdldtozYCwd6a+nfJS/oPtWxBn6RotLPVxw6AffMkBq+VO
 U+xQIagV2bboEtY5v2+LwgmTscjobV5nj+/SqLLpwMrC1av6eM0SZsCTDCKXP1qWM3Zn
 jbQHsOjKQL5g2AwOsbdafkjDVjefZ5gkII54GpaKeBzo24N3xwUOnlNkpe5Fm3XTbdtV
 Ox+2g+4Yad9zLyCbdQGzdyGU2zydNIz3+fF3zwgxZgEmHk6SbmTPj/ZTHgMnfigF25Ws
 CMt6/hkOtfM0Hu/5wvO4mvIou4Jl38Safe0MDdtDiI1BPsTdAbr+flQBkw9qqyPDm9Hf
 VS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IhjBq4I9VI4adTZ09QA3MHjtL511PUBEv8dnhqIjniA=;
 b=3C1GrWAntwsvzNLybM12wFTV2xC7jmLMC44Ut2ELJaEsSdhLaMaB2N/x/pvY6VZG/D
 ms5mcUqUBaF08D2XpCcX3ficNMMs//WpFh0cJIw+sQfWFtYN2YkF9nHT9FxCqCmw/67X
 1C70Mv6Sn/0LwbfCEj1dbxIuXFhzlCXQWc3hxsNP5M5VfGaUoQRkKgTPY9yCzQ3UkPS4
 NwCck9rZo0edAi/kr2Pkc2bt7SEPNMp2gM0AQuZyfDNNLL7Hf459zhFMyAIrcfYOAX5T
 MXOVQQpzrLQ8k6y3sp/gwzX/IK+6rTvj2xw/IKw3DZoZhwVj2Ya3ccxcbyT2UvCyBjRZ
 Vcaw==
X-Gm-Message-State: AOAM53382aCznW6V3S6lTHCw4J7VedOXP1WWv1uRx/y08CJjawPxixWt
 GtZEHeF1i5jDihwUu76BOleJJ1Hoa74=
X-Google-Smtp-Source: ABdhPJwc4hVVsXTHQZUYeF3i3POeFXENiymHtaUEo8hAdZp4Ox7/ltCOYCrrVT3y0SCbxPf80QXgvQ==
X-Received: by 2002:adf:ecc9:0:b0:210:28d4:96a0 with SMTP id
 s9-20020adfecc9000000b0021028d496a0mr6433982wro.380.1653858937543; 
 Sun, 29 May 2022 14:15:37 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a7bc082000000b00397402ae674sm8490934wmh.11.2022.05.29.14.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 14:15:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 23:13:14 +0200
Message-Id: <20220529211314.2953343-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mutt: bump to version 2.2.5
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

Mutt 2.2.5 was released on May 16, 2022: this is a bug-fix release,
fixing two issues with libgsasl authentication.

Mutt 2.2.4 was released on April 30, 2022: this is a bug-fix release,
fixing some regressions with Maildir/mh mailbox path normalization that
were added in 2.2.0. Please see the UPDATING file for more details.

https://gitlab.com/muttmua/mutt/-/blob/mutt-2-2-5-rel/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 952e0b7bc0..1f6082ee35 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  978addcdab454f447ed7d1de84b5767e714c30714285bf82e4a1745071d18d89  mutt-2.2.3.tar.gz
+sha256  ff8b781159794adcca126b551d5e419174b7b38a582a159bfe4e13451a757e47  mutt-2.2.5.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 45ae36530a..2c6b087b92 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.2.3
+MUTT_VERSION = 2.2.5
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
