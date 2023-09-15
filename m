Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B85EED61D
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 17:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E7B9613C9;
	Fri, 15 Sep 2023 17:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E7B9613C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DasDQbqweDsI; Fri, 15 Sep 2023 17:25:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5A5A613C3;
	Fri, 15 Sep 2023 17:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5A5A613C3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5BF41BF5A8
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 17:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BEE34038E
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 17:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BEE34038E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bVA4pNWxSmjX for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 17:25:05 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B6574012E
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 17:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B6574012E
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-68fb6fd2836so2177879b3a.0
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 10:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694798704; x=1695403504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LoShTiCN8TifE25cr6fyeWsVSPsFjoLKbJO3l/ka/5s=;
 b=uR/bYxPXRUhWjDr5bFf8u8PekkF9aAV5SfXbo+pmEE/iwEh9uXT/w7tfM7QPkJGnbv
 V1aAkYSS/da/ferXOSNQj5C9NjZWJADeBfJm/4biLH29BLH6GgdzAMcHnCR8AwEVxYZv
 flRbJSJ+ww9EZFfPvDcheg9XtqDpS1M/CoX9fmWaC33VX11D2v2B66Qc9VW+3WM4v3mG
 tf3LNzjKDd6duGTAKRuElNiVwPyO/CC7x6nUfGCeg5mh3f0MfGZDB0O8Kur057Ibw7n9
 DAS+puoAUr1mhxup0DVvbPirU3XzBIr3WoBAN0QX0G762Ckby++6FTQr4MRefvdY5n1W
 pFCQ==
X-Gm-Message-State: AOJu0YxXkEdl6/gsGzmM9unPDtuk04Ee89HVFt7pcMBKsp9wlo0M9K6z
 03/kf6/GcpVEBo0VKW8wxUA11aN1mZI=
X-Google-Smtp-Source: AGHT+IGEYJGo57eQAUmYDMb4F2cRcHCSI4PHLPRWEVgal7TOs8DhXMJZk7Rx4eSJpvKZmwCC0URP8g==
X-Received: by 2002:a05:6a00:23d1:b0:68a:3b39:a486 with SMTP id
 g17-20020a056a0023d100b0068a3b39a486mr2503081pfc.24.1694798704266; 
 Fri, 15 Sep 2023 10:25:04 -0700 (PDT)
Received: from localhost.localdomain (cpe-70-95-248-239.san.res.rr.com.
 [70.95.248.239]) by smtp.gmail.com with ESMTPSA id
 v6-20020a62a506000000b00687f845f41fsm3187702pfm.119.2023.09.15.10.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 10:25:03 -0700 (PDT)
From: Yanghao Cheng <yanghaobillcheng@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 10:24:57 -0700
Message-Id: <20230915172458.3388709-2-yanghaobillcheng@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915172458.3388709-1-yanghaobillcheng@gmail.com>
References: <20230914235043.2538981-1-yanghaobillcheng@gmail.com>
 <20230915172458.3388709-1-yanghaobillcheng@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694798704; x=1695403504; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LoShTiCN8TifE25cr6fyeWsVSPsFjoLKbJO3l/ka/5s=;
 b=Zx00cZH86GM1LX8xtzGUfXwS5/v2DavNTToy6L7tttM5D+Bhyah4Qr2KtVJSswhenb
 IVOwAvwsIBtB7e2r2s1+yyT8EVEciY/mDeGOpFTxSYtFqkWCpETQ+YEpLB2nVPiPHAfC
 CHqXyZv1gfaAwvvZw+1M6RnKkg7CGVdBUvi+Rig0o9XFXh+CpuZWppdGFTqGFy8wdCYr
 1hbL8ZsKpmqPj56hH6sF2XX7YaHC85zvPN2YziYPAEUu8YeK7YCwdd+CAnQJ7Kgas4od
 3KTf6PF8c6BQk+X1zUbtthMCztVqGoMQmNWeFckTa5gl7/LO/tsA3/g3INQaJwB5/WWV
 RJbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Zx00cZH8
Subject: [Buildroot] [PATCH v2 2/3] package/xserver_xorg-server: Add
 condition in xserver_xorg-server.mk,
 and not install systemd unit if nodm or xdm is enabled.
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
Cc: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yanghao Cheng <yanghao.cheng@aioi-atg.com>

Signed-off-by: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk      | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index e5df7f7e93..7566541067 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -176,10 +176,15 @@ XSERVER_XORG_SERVER_CONF_OPTS += --with-sha1=libsha1
 XSERVER_XORG_SERVER_DEPENDENCIES += libsha1
 endif
 
-define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 package/x11r7/xserver_xorg-server/xorg.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/xorg.service
-endef
+# Systemd unit conflicts with nodm and xdm
+ifneq ($(or $(BR2_PACKAGE_NODM), $(BR2_PACKAGE_XAPP_XDM)),)
+    # NODM or XDM is defined, do not define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
+else
+	define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
+		$(INSTALL) -D -m 0644 package/x11r7/xserver_xorg-server/xorg.service \
+			$(TARGET_DIR)/usr/lib/systemd/system/xorg.service
+	endef
+endif
 
 # init script conflicts with S90nodm and S99xdm
 ifneq ($(or $(BR2_PACKAGE_NODM), $(BR2_PACKAGE_XAPP_XDM)),)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
