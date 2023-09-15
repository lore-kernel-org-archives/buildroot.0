Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFFBEED619
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 17:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2F0E613C2;
	Fri, 15 Sep 2023 17:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2F0E613C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_XMSLuazrPF; Fri, 15 Sep 2023 17:25:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14D5E613C6;
	Fri, 15 Sep 2023 17:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14D5E613C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB5BE1BF5A8
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 17:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B415061370
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 17:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B415061370
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yAy2zSJk-0YT for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 17:25:07 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D0546131D
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 17:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D0546131D
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-68fc292de9dso1772561b3a.0
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 10:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694798706; x=1695403506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cKu2h295ybqsld3Vwnwotjyd8SSxTul7Hqs8r9IK5XQ=;
 b=W5azNBI5c3B+h3h+vAFxywWTfLkzTiJs/u1I4+exEEF4h0Pq+Ph9x/NiJrCY8KeABh
 ja5peMfJGOFGB/uUuV66EjprwnxY6ryjL+K3sAzUN7mfvnaH7ZXThv7NRAt7xYPama4s
 WjG0BdfzSykBgqM9hLLfAD1RX7CPHb8xwnT74ngD3pL1DZTJY7x5GRZEkLD/x36cPQry
 l+YXqV9dE0I7HCxncQ/gkL8WnCDNNmwHabzcICFLdXIpTsel241eMaEYUcgPofW0RlXk
 i2zCHKuRfLZJlg23UMa9MaDsKkdsCavfJh2j+saJEOj/BvFqDKLL4hQbCarUIonybsJG
 tkVQ==
X-Gm-Message-State: AOJu0YwRD1NL8aiJ0rSLa+VCNOUnKhSUWLKNtHSzBlxtIOd7r5z6chXn
 wb8qQ0zAR8JP+rmhbs4PmmDVr+NfeCM=
X-Google-Smtp-Source: AGHT+IE2aRDnG9aM0L2u5W25A0ITDqSciEKYJGvIQDVSL1Vd1qg9uQawczLwHoCwhgSqNLjRo12ozA==
X-Received: by 2002:a05:6a00:2d1a:b0:68f:d6db:5d4b with SMTP id
 fa26-20020a056a002d1a00b0068fd6db5d4bmr2892206pfb.12.1694798706112; 
 Fri, 15 Sep 2023 10:25:06 -0700 (PDT)
Received: from localhost.localdomain (cpe-70-95-248-239.san.res.rr.com.
 [70.95.248.239]) by smtp.gmail.com with ESMTPSA id
 v6-20020a62a506000000b00687f845f41fsm3187702pfm.119.2023.09.15.10.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 10:25:05 -0700 (PDT)
From: Yanghao Cheng <yanghaobillcheng@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 10:24:58 -0700
Message-Id: <20230915172458.3388709-3-yanghaobillcheng@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915172458.3388709-1-yanghaobillcheng@gmail.com>
References: <20230914235043.2538981-1-yanghaobillcheng@gmail.com>
 <20230915172458.3388709-1-yanghaobillcheng@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694798706; x=1695403506; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cKu2h295ybqsld3Vwnwotjyd8SSxTul7Hqs8r9IK5XQ=;
 b=D7ph8lK3bbiA4FY42yDpKTrzjskUdZG6tkOR0AyieMJ7jdaM1C5y03S9T1gQY9m5Ha
 QvqNHmAP8rUbP2hWScg7tLsQoB8LxQzCIzvF1/Aeg2jj1Re9pgCLmFJooTEvbZuMbu7y
 hP1qUgsVi1hjU5pTemOJ9m/TueUr1VK3tjt7x2rHcUzfI8tau8MrZnX28IHLUlDcGWU0
 Mj9u1F4MN9GNhUje6ARqs03AL3A5p2Ys5D5Jov4pipuK9h4V54Hf4ssETvaOPY1CAyjA
 Fe2FUFuXoaH6AcBGJhn5ydz+xF9pN3VFvsWtdfEv9ycUB8nuZWxqiDfrh+Ztzghii19I
 AGhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=D7ph8lK3
Subject: [Buildroot] [PATCH v2 3/3] package/xserver_xorg-server: fix init
 script conflicts
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

Simplify the condition per Thomas's suggestion

Signed-off-by: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
---
Changes v1 -> v2:
    - Simplify the condition per Thomas's suggestion

 .../x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 7566541067..6be9eee099 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -177,9 +177,8 @@ XSERVER_XORG_SERVER_DEPENDENCIES += libsha1
 endif
 
 # Systemd unit conflicts with nodm and xdm
-ifneq ($(or $(BR2_PACKAGE_NODM), $(BR2_PACKAGE_XAPP_XDM)),)
-    # NODM or XDM is defined, do not define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
-else
+ifeq ($(BR2_PACKAGE_NODM)$(BR2_PACKAGE_XAPP_XDM),)
+# Install the systemd unit only when nodm nor xdm are enabled
 	define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
 		$(INSTALL) -D -m 0644 package/x11r7/xserver_xorg-server/xorg.service \
 			$(TARGET_DIR)/usr/lib/systemd/system/xorg.service
@@ -187,9 +186,8 @@ else
 endif
 
 # init script conflicts with S90nodm and S99xdm
-ifneq ($(or $(BR2_PACKAGE_NODM), $(BR2_PACKAGE_XAPP_XDM)),)
-    # NODM or XDM is defined, do not define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
-else
+ifeq ($(BR2_PACKAGE_NODM)$(BR2_PACKAGE_XAPP_XDM),)
+# Install the init script only when nodm nor xdm are enabled
     define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
         $(INSTALL) -D -m 755 package/x11r7/xserver_xorg-server/S40xorg \
             $(TARGET_DIR)/etc/init.d/S40xorg
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
