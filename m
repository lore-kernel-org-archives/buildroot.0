Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52D2C433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 02:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8200D81842;
	Mon, 22 Nov 2021 02:09:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TfPdobziULMZ; Mon, 22 Nov 2021 02:09:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D675180E46;
	Mon, 22 Nov 2021 02:09:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A3ADB1BF83E
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 02:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FBD5400C1
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 02:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dmzk6M7MqiNO for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 02:08:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7543940233
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 02:08:17 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id f18so73539501lfv.6
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 18:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sr+kMCYr8eZ5P0YMsQzkIca1BT2SBPxzwzF6xlSDJiM=;
 b=FqlJDNPGdwje8K6sd1g8q/7l2LYiFopEWI96xeeL0SiyHKHFjpEj7MpsFlIizBUVQH
 En+ZIo/tfWktyFJcItMlWPBFpXzsEgWuJnIwuSHEku7oz/XqFUaLQ1LDIs5L8Eb9/mEd
 3CcsbIWNfHhTsbC4J3Oiq4L+y+2ZYTkJVdMzli9LAS3MZnrMWFuCdFk0tVlAKF8uPk8T
 Is9hlAZXm9eq6nZLWzOZ/EJDeE4QY0OVgfV9TYO6BgHahlE5N6Uw5pRoEk+6lVZO+YlA
 emUpoTp5DQQWqMa7cuLTzc5FyiIKT4YeJcdsdPMMvLr5G2Qgzg/0LjFLiSxeGD3LfPKc
 u8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sr+kMCYr8eZ5P0YMsQzkIca1BT2SBPxzwzF6xlSDJiM=;
 b=C8Z97vvSsG/Am01RIdpfAmdohSBCECftnNAvFIJJakAB+CkLccCN7oH6xqnPfDydaV
 wDxLz5KSb4wffQu3I4Sx+AkfE64zVpMEE8VlaksWPCETQoIDga9R8XakqKM0AEiXycZz
 i39CGu1+M1bk4Oifi7H7WR4CiAFxq4u4H4jzm9jqOy5+NwymgQ2fr5AdKGXuMU4Fy6/s
 PV1loKJIty2j3lJFjW6neiKw1AO2XGDD4BY1uDUGP9xAbs/PnW6Y10/dEyfAXbwNX6tD
 H08L4khdQzcwdn7hzCn0GnD2mZCP7h9oEfuxjCajnCDeF2qrQbhO/aKfSI8HTcfHGLRq
 vdOA==
X-Gm-Message-State: AOAM530L20oM1y0ETO6dIraW3XtrHAqfczSk+VtudeAcAIuXpXDRgzzw
 tuX4neaCTScWA5n5DQ1JVQLSSzy2YN0=
X-Google-Smtp-Source: ABdhPJyqmsLMe9e2aVbqYSZMipNFA0fUwmOfY+RyHBwPNZSwcptUozmhlfvXaqb71p0IWAdCmCvdOg==
X-Received: by 2002:a2e:4a0a:: with SMTP id x10mr49068693lja.322.1637546895286; 
 Sun, 21 Nov 2021 18:08:15 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.197])
 by smtp.gmail.com with ESMTPSA id h19sm788120lja.71.2021.11.21.18.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 18:08:14 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 03:08:02 +0100
Message-Id: <20211122020804.535891-4-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122020804.535891-1-troglobit@gmail.com>
References: <20211122020804.535891-1-troglobit@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/5] package/inadyn: replace local systemd unit
 file with upstream
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
Cc: Joachim Wiberg <troglobit@gmail.com>
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
