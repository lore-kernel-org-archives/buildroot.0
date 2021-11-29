Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68633C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 07:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11261410A7;
	Mon, 29 Nov 2021 07:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xR-AUXCa6vyl; Mon, 29 Nov 2021 07:05:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42E5F409FE;
	Mon, 29 Nov 2021 07:05:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 68F721BF3FF
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 07:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57D4B830E6
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 07:05:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R054Rd5W3VzZ for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 07:05:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85241830E2
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 07:05:42 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a18so34484155wrn.6
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 23:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G+HKY7AwrT7wmPGO8daReCP0hfu8hF2oifCtFn1KUj8=;
 b=j2flj3SL1TWqHUE6OxPPktukubWBwi4PNJ7VphFkmnG3vPDQaegG/XKU77sHQlxbFV
 uW42K627WIwcfiPu5sz24jwWvLJkqYYvw8ysh6Q6t/T+DAhPsZsDmp+N0QbvzAIwPKdp
 MWwTI8kcltPBrvBlK6CL58Ht1diV+9JtdXrRZt06QKBtHJ0DpOXAflqiMCh6cpcWEWMQ
 IFYf4l8aNvN4nDCpDK4FauYg4Q0O30rvcS/InxVDywdcAA6B/3vx0YRamJ4W5KXEagAO
 9ZKFJFiwqYjImLbzL9JLvvFu9rCGG5K1i9jXMrtFHl21g5ikst/+hrTHeZNM1mKEfE7B
 je+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G+HKY7AwrT7wmPGO8daReCP0hfu8hF2oifCtFn1KUj8=;
 b=fLknkQcCGhid3qFW7fKHi+NoGHvsieVUI7bZfX2f4eHJPPWCvZ1uMjGv7Vge8vjuon
 hywzrzV1OVMLJ6wxjWAU5D2yixUTE0p9xtLSCAq2HvrIUrKgbhpfU0IXm26++0tpXydr
 JuqY7fPJ4ibNHgMiUC2cBkieakpBOdSuGejUvlD3ienEZQ30P5MBwTzClOYsOPecPy2I
 By9ZtE4gT38QXlqtbtaDEO+xHuqguwRD7pV8vFKLqJnnkINO01BaN+qXMZfZZT4SZKoE
 uqaIyk/w4syVrX8UHMUqb/z/ifOV4xaAqpDxv6QFDxuS9LfAHNrCqFL9B6JpadLpmLbZ
 xh2w==
X-Gm-Message-State: AOAM5326aDNJh5OL8wJdMENRkKnZCQw44n78h0NoWECNMf/KEzK7ZmM8
 G2Aqj+1JNyCaRteOk2Zo/D9KMLb/+xI=
X-Google-Smtp-Source: ABdhPJxD2c2u/Uricnx0YV/cmm0FLNDPeNb6gUnWACA6sHpBlYDTUVANs52VHnQ+agQX+UdiqE2d3w==
X-Received: by 2002:adf:eb05:: with SMTP id s5mr30229360wrn.448.1638169540433; 
 Sun, 28 Nov 2021 23:05:40 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id q24sm18017491wmj.21.2021.11.28.23.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 23:05:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 08:03:07 +0100
Message-Id: <20211129070307.2176169-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/brltty: drop spurious spaces
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
Cc: Mario Lang <mlang@blind.guru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious spaces added by commit
679585bd6185c57dc20fc460dd476aa30eb3c5e9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/brltty/brltty.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 9e21018c0a..600bf596df 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -129,12 +129,12 @@ BRLTTY_POST_INSTALL_TARGET_HOOKS += BRLTTY_INSTALL_CONF
 
 define BRLTTY_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/brltty/S10brltty \
-		   $(TARGET_DIR)/etc/init.d/S10brltty
+		$(TARGET_DIR)/etc/init.d/S10brltty
 endef
 
 define BRLTTY_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/brltty/brltty.service \
-		   $(TARGET_DIR)/usr/lib/systemd/system/brltty.service
+		$(TARGET_DIR)/usr/lib/systemd/system/brltty.service
 endef
 
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
