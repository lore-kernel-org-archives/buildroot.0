Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37344C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB2F840276;
	Sat,  4 Dec 2021 22:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y7V4ZBkFErca; Sat,  4 Dec 2021 22:41:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBF71401AF;
	Sat,  4 Dec 2021 22:41:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9451A1BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 842A082FD5
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:41:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Su_FmMow-RIn for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:41:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7731782451
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:41:21 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v11so13749750wrw.10
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 14:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZK8Nxr24Am0ah/Ov/ox6W2uN59dDAB99pjLoawP1BNE=;
 b=DrTe4sPA22N3tRwR75JsgZ7VzwpMdgQdXp4i60wOdUIf865TFRHuzd8FDAhwr90xy/
 Gb3molf1PiYU1HBqHP/s53f/o1twRRMFUvK3FnPma8SjWIisDtBEYgQQEaXC86M49Fg5
 +hDbZUATxVLzEZuS2Q6LnjimauWmlzTwpPbXnG6WkmuJ4M5CCdvO6D/9MUZsCTUtjZof
 /7otqyljGbILRNBvjg3YgBOwzNRBCXL1Bcw9JaiuX7f9SPbzviZhQXgUf2UV8cEtwpB+
 2p2+Q9O3x4mrrNge4ZS/fzCnyG/rW+okH+BXlr5cix1Yj0m1oun2J6NSa7nMe8oW4u/U
 2f9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZK8Nxr24Am0ah/Ov/ox6W2uN59dDAB99pjLoawP1BNE=;
 b=dG+SRme0oDkSlQ2J4AYnuekOxTaR77Qy+KZmdJ7Mltvayl/n1dRspBLY0l5aKHK589
 q18lIoYpICBwMoQZfuEzlEl8ZDc8B355jh5A877Cs9nJ/t/9S87OW5ftl+ycargWj4kl
 GOmQKqlHQa6YN2b86scAdWiiVd6fUs3EuyKV6C9yrvL80863GIq5WLqd2ntDj7I8VCPI
 LdhuyoOVJX5Lz2Ok4V4iG6oQsRbhhl6VCVL8CvjyOPvus3d4hgkczcrOsffT1obBtKgC
 ZiknwcPfA5kOW/EdIFgvMjcKKzcbhHu+NNIcKZY0oXefUQ0wOsKXvp5X2VHi5wcyxEAG
 zXtQ==
X-Gm-Message-State: AOAM5337OH+xlD6ubjaJlZ6EW1pGSxYOQWwpdofmwHwEJnt65e1FsR++
 cHjGylroZ60x705PN0wVLJhG9jySl08VMw==
X-Google-Smtp-Source: ABdhPJwR4rYkpuSUbFEzOqPk+RBRrv7CdT2zPrekqkSQu+MLji8T/dAWN5ZfqFk8X+h2KbAH/KXKBg==
X-Received: by 2002:a5d:40c8:: with SMTP id b8mr31385575wrq.610.1638657679536; 
 Sat, 04 Dec 2021 14:41:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id d15sm9240544wri.50.2021.12.04.14.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 14:41:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 23:41:23 +0100
Message-Id: <20211204224123.2022812-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/hiawatha: add HIAWATHA_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:hiawatha-webserver:hiawatha is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ahiawatha-webserver%3Ahiawatha

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hiawatha/hiawatha.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 126cb71105..a917adc9a4 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -9,6 +9,7 @@ HIAWATHA_SITE = https://www.hiawatha-webserver.org/files
 HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPL-2.0
 HIAWATHA_LICENSE_FILES = LICENSE
+HIAWATHA_CPE_ID_VENDOR = hiawatha-webserver
 
 HIAWATHA_CONF_OPTS = \
 	-DENABLE_TOOLKIT=OFF \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
