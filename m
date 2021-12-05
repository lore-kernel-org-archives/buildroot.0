Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C1FC433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 10:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 254F8827AF;
	Sun,  5 Dec 2021 10:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bomDLWYp7DcL; Sun,  5 Dec 2021 10:29:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9063381ABA;
	Sun,  5 Dec 2021 10:29:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82EA61BF283
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 736F38176F
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fic10SAufKgf for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 10:29:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A739181064
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 10:29:22 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id c32so18006144lfv.4
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 02:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sr+kMCYr8eZ5P0YMsQzkIca1BT2SBPxzwzF6xlSDJiM=;
 b=DHErg8RXoVUhWDxN4eMyzuwkIwrPi1ZGdBLVERGuoCoq0ydmIMlD9u/Zlu55JfiqIa
 TWt9am+utJCuUNcerV1amFFbXpvG/HeCZP1cXKvEuPIwPLkQlNI29LbhJ5N2A0ssdqBy
 2w2gG1Zlw2ASl3PBYzala5EJ7TkhJH1NO+/oGss0Csk06EGo3b6OpCcRj3GEKOVYox6M
 fNdJ7aR+IKCdP5oaGP6BZJrkbghYRxsx62js6baM3wnEflwlXsJ1PIVAC6/PcEreMU0Z
 lQEf21Ryn1kLY8CwJL8ZjOjYy5JxJVLJwQNAogeq4QywgMwMzuEdS3D0S5mF7r3QogaD
 Qvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sr+kMCYr8eZ5P0YMsQzkIca1BT2SBPxzwzF6xlSDJiM=;
 b=2+qIYSbcnVvPnIm4EoQKnl5m+ZIvSQWUHa7D40H3r6Zv6VIbOVsEDlxfvVIUiFWM0M
 lOrj9y9ZODw627AF+hg65G7M37hBW4BGEkT9ImsNAloFmvLPoY1mJiWt0JgXiKOUqKbx
 0c4EYylgdLMitOoPW1nUCZeoQVchJuIW692/7AI4WgPbo/YlwSa6wagq2oQtV35rbVHG
 vRMmDUPBjQ0tky9e3UndWiWXSae4r8y48CAl8lrncwQn89gnwhDXB1skTRXRrZp1IPDF
 iiaqiTHd+aL6BTz3sBK0WJNC5Bt5+xwjIZrr5Q/qujGEbk2oC4LmFf77bcW7kKpIC+rT
 jo0A==
X-Gm-Message-State: AOAM533sIhecr/i8UKMmcVCFZmRaNFVP/j8bUlLmlX6GVc5Es2hbQZ48
 eg8lQoMzOpetk7hIY5sFv+bHhwGys2I=
X-Google-Smtp-Source: ABdhPJxqKo4NGwaFC9Er41dZ4zj7K/i+0s55NOD6TfIpSWy5NZimr8HJo6l77AqovVoyMTq4/rUS5A==
X-Received: by 2002:a05:6512:1151:: with SMTP id
 m17mr29288173lfg.414.1638700160215; 
 Sun, 05 Dec 2021 02:29:20 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.198])
 by smtp.gmail.com with ESMTPSA id k22sm1047191lfu.95.2021.12.05.02.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 02:29:19 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Dec 2021 11:29:04 +0100
Message-Id: <20211205102907.2836980-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205102907.2836980-1-troglobit@gmail.com>
References: <20211205102907.2836980-1-troglobit@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH next 1/3] package/inadyn: replace local systemd
 unit file with upstream
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
Cc: Joachim Wiberg <troglobit@gmail.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If systemd is available at configure time, the inadyn configure script
detects it and generates the unit file.

Also, the local unit file had the wrong absolute path to the binary.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/inadyn/inadyn.mk      |  2 +-
 package/inadyn/inadyn.service | 10 ----------
 2 files changed, 1 insertion(+), 11 deletions(-)
 delete mode 100644 package/inadyn/inadyn.service

diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index fc04fd5f25..9ccb16ddfe 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -31,7 +31,7 @@ define INADYN_INSTALL_INIT_SYSV
 endef
 
 define INADYN_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/inadyn/inadyn.service \
+	$(INSTALL) -D -m 644 $(@D)/inadyn.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/inadyn.service
 endef
 
diff --git a/package/inadyn/inadyn.service b/package/inadyn/inadyn.service
deleted file mode 100644
index abc0a1e401..0000000000
--- a/package/inadyn/inadyn.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=DDNS client
-After=syslog.target network.target
-
-[Service]
-ExecStart=/usr/bin/inadyn
-Restart=always
-
-[Install]
-WantedBy=multi-user.target
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
