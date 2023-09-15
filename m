Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10D3EED61B
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 17:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 861B761370;
	Fri, 15 Sep 2023 17:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 861B761370
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TbqdHiIF_pbW; Fri, 15 Sep 2023 17:25:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AECB361355;
	Fri, 15 Sep 2023 17:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AECB361355
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8AE91BF5A8
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 17:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80CE6838F0
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 17:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80CE6838F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3zZdnQGjBALA for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 17:25:04 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B0E081ED7
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 17:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B0E081ED7
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-68fdd6011f2so1985122b3a.3
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 10:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694798703; x=1695403503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JIuTVgtZcnCOY+rY9pEXjQMpAtwRO5xPTQXIOlDpszw=;
 b=mr/+eEcJfOU5ppmyRotX5OqPY4atkzhgSROUEz+lLFvS9mSq/WcLs6ksAg8VFwr6KI
 Og6UgBws191pwUqzoHasTuUZGKC8pd9u9CXLLJIefwtvHwJ2d1tBMDMbTEVAGYBr4YCm
 lMZYPHBsXwlNWb5bYlfvPwO26FA15Qd5dV42VVmwhaxEzm0hCGBqzQ3HhOZj72bK9/8b
 Fr6nIXZURyMV3RgJkbdxjJW8X21gn1ULMqX/HZYmSR6eHs+mXn+ArPiYopsNABDaklFa
 sSFy/WSvHr94vYvyP9uyO3eors/1dsFcSoTROvt3zjnELKLLCYZKeigo/Ce4LkiFWT/R
 0/mQ==
X-Gm-Message-State: AOJu0Yxzw7imjmdUXSwYWw1rEzVbsSUX5GW3IqERdGcXmoGfNBV0bsCx
 33WPECCvNPz+GadiykajYlXp26o2/QQ=
X-Google-Smtp-Source: AGHT+IEUGHVrwThTo1pOKNoorNtk+cjFWMXWlyX6nEMqjeoIIMAN4fda4vx7wGVTIlXaaumUYPIPsw==
X-Received: by 2002:a05:6a20:d90b:b0:13b:a2c9:922e with SMTP id
 jd11-20020a056a20d90b00b0013ba2c9922emr2270099pzb.27.1694798703085; 
 Fri, 15 Sep 2023 10:25:03 -0700 (PDT)
Received: from localhost.localdomain (cpe-70-95-248-239.san.res.rr.com.
 [70.95.248.239]) by smtp.gmail.com with ESMTPSA id
 v6-20020a62a506000000b00687f845f41fsm3187702pfm.119.2023.09.15.10.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 10:25:02 -0700 (PDT)
From: Yanghao Cheng <yanghaobillcheng@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 10:24:56 -0700
Message-Id: <20230915172458.3388709-1-yanghaobillcheng@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230914235043.2538981-1-yanghaobillcheng@gmail.com>
References: <20230914235043.2538981-1-yanghaobillcheng@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694798703; x=1695403503; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JIuTVgtZcnCOY+rY9pEXjQMpAtwRO5xPTQXIOlDpszw=;
 b=VhU4swIb3/gWbaYWNfvfM/caHniqu9XU8E9t6vtRNvUKNOHCAziICWM/xjyW7jvl+o
 ZA5acxgeSLZp+Ku7iN68ZaPv76tton75TPvp/YCtGfG4Y/5WVpoXe1ZLHl3gSZF2Le/4
 HcYQ4rQ9Nic+wJH+ZJ8Zv+o/Yw4RH+ZrhtO+t9KBLp9FUgz+kAxCLsxDsDKDHdoZN4Ss
 qqQXxwnqYDLRnk+o0l9hrQR453AXTWMFOGUXin8JdUQ3pXRCwOoikeUCxV66zwf1UKYX
 swfyf2951r6aXZDQom4g+iHwvY+wkx3/147TJbL1661L8QdVd3cbM/wCx0eQNBU/hLWh
 VLvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VhU4swIb
Subject: [Buildroot] [PATCH v2 1/3] package/xserver_xorg-server: fix init
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

xdm package also installs a init script that utimately starts X server

Signed-off-by: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 593bbd4276..e5df7f7e93 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -181,12 +181,14 @@ define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/xorg.service
 endef
 
-# init script conflicts with S90nodm
-ifneq ($(BR2_PACKAGE_NODM),y)
-define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/x11r7/xserver_xorg-server/S40xorg \
-		$(TARGET_DIR)/etc/init.d/S40xorg
-endef
+# init script conflicts with S90nodm and S99xdm
+ifneq ($(or $(BR2_PACKAGE_NODM), $(BR2_PACKAGE_XAPP_XDM)),)
+    # NODM or XDM is defined, do not define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
+else
+    define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
+        $(INSTALL) -D -m 755 package/x11r7/xserver_xorg-server/S40xorg \
+            $(TARGET_DIR)/etc/init.d/S40xorg
+    endef
 endif
 
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
