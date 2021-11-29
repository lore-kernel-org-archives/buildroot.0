Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF32C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 06:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48A9E40366;
	Mon, 29 Nov 2021 06:52:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fZdOK3LgyRPy; Mon, 29 Nov 2021 06:52:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 537794018D;
	Mon, 29 Nov 2021 06:52:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C2511BF405
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 06:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B2A46080C
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 06:52:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1UhUN0HxKSCw for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 06:52:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 704BE60610
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 06:52:49 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v11so34375856wrw.10
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 22:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tL9gL2pGgFv3i+tintM1XkP1r7JH8iPiTX74swjycZY=;
 b=L7Y+PThQQ5jphetAgXkBfoj+kXbjtqQTTfB3VeIt4yFhZleX4xabTHgPmokiWePsSb
 wMijzkA1qS+Q8U0fLZPRUg07bgYp3jlHJ09HaIXFYqK7Rw6YUXPxLeG9dLKM54iRh2k3
 y22uh4WcxbwtWqRLnmKbQjn1YctqP8E4KlzYFSqvhwVNe0TmDLXHm2JkTJyyBr4RngV/
 dPDaY7d5a97YXJVLorpWgj4QJS2M6JuLQVVnS+IdTWQDvMIr2WzKC4xODMBeZn301kdX
 t4fVrQknS+wbNmeaWRf1l3zXv+PUyOklkHf85N0mxssc8t4wAzZ78MHKUKXBMElQLH5P
 SHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tL9gL2pGgFv3i+tintM1XkP1r7JH8iPiTX74swjycZY=;
 b=jhXTTeQp0zYQKnLJVJoVJt2QuE8afL0D2mCkWJbW0tZLoZ6Fpjk0sR/qlWLbP7ko80
 W/aNwdEhZKlT0ReqHscRqK8YIUPi0ES4YoUlgHrIwjgCL8wBleICytHKbwyn766fKuuF
 qX6LeSUuyVQh+5dXeU6PwMCfnGKOcCk0q48Xsn2U4GsLJQmygb8cF//vLZtzqqyqjDN9
 Q5h2Y8a1nFz2106cKocc1Cm1CVJW1+OJ1XmLRGCO8LjYz29y25R/SvvHXDzgzwiiU80R
 dhtpN1E5w2yQdwh+xRlg7h0lH18/LTe0YornCUiBlcxtLCm7FgkQ4yAVqXDzx8uJYK8i
 rHtw==
X-Gm-Message-State: AOAM5300gbg9me2wuvTJQt3Z+bEpzNPBgroLpqEfF8jTGAHT7Gds1HZl
 eBd1eWoQ+9nqPuPp1Zh2qMc0Kz20KbE=
X-Google-Smtp-Source: ABdhPJy6eEDZF3hlck9cX0tcWKw+rofW9fuUS3DTXCeJCH5KWaRlcjhX8z/W/zz/brfMgnsjbk+7gA==
X-Received: by 2002:adf:e9c5:: with SMTP id l5mr31084335wrn.218.1638168767526; 
 Sun, 28 Nov 2021 22:52:47 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id m125sm18266724wmm.39.2021.11.28.22.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 22:52:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 07:50:13 +0100
Message-Id: <20211129065013.2175181-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/asterisk: drop spurious space
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious space added by commit
4f1c340311768fa3a94605086e5c99cb1733ce93

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/asterisk/asterisk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index a8f9127c94..0a26fb38ea 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -243,7 +243,7 @@ ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
 ASTERISK_DEPENDENCIES += speex
 ASTERISK_CONF_OPTS += --with-speex --with-speexdsp
 else
-ASTERISK_CONF_OPTS += --without-speex  --without-speexdsp
+ASTERISK_CONF_OPTS += --without-speex --without-speexdsp
 endif
 
 # asterisk needs an openssl-enabled libsrtp
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
