Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A95EEAA7D
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 23:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4492840497;
	Thu, 14 Sep 2023 23:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4492840497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UmDTFxMDQqIW; Thu, 14 Sep 2023 23:50:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F1F140B2F;
	Thu, 14 Sep 2023 23:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F1F140B2F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EDC41BF83A
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 23:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 208E040472
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 23:50:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 208E040472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jsLNiypQuRjT for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 23:50:55 +0000 (UTC)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9440C402E6
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 23:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9440C402E6
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5778fe9d183so1276852a12.3
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 16:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694735454; x=1695340254;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fzyMIbfzwdHM2ynZFEKdXVBMuiz3B3PWEvB3YUWtN58=;
 b=rhtl015w5pLioQf4IZsOopBvkYTDXuWw9zm0+Sc+cLZfuUH/5xJQVeG1UX2slNUnt5
 lfsIdiVr89hK9K0BCDWZbyFlHZfSIg+IRp+RkDAR+FsXm5VWCfFKDyarbKHYsdNra7UQ
 xkvCOakGfDHGJ8UCBFiR3D4aTD2gy5UfFZoqUOp8C1k9X/+wKl0eTKu4b4dH01KWezWT
 A7uCrKAb+WOODjSv6eEuHE3lIW3/iEXaZJRzUawm4DWgPr7DkclCg0P7jGZmfYdx6/K7
 kJkQgeSVEC8ndkGlu84gA8kstWWG1NsG3vRiqvAUZmbP0LOClvJWs8McGITgU6FFt7WJ
 zJWQ==
X-Gm-Message-State: AOJu0Yy9Y2vH1YNJhoo9rUP9P3Veti/Y5pkpBlAD8hQc7SO/5bpR5WQC
 GoxXh6gtz77zU8s3K3uhKCM9RgO3v/k=
X-Google-Smtp-Source: AGHT+IHPzpDzfF1wvHjTW33PPDBxMQO9+kbIFlzcTeQ6fivxXA6RVFSEYvTc7UswwLvKDvHCaAOSgw==
X-Received: by 2002:a05:6a20:2583:b0:13d:6c5a:1887 with SMTP id
 k3-20020a056a20258300b0013d6c5a1887mr299781pzd.20.1694735454147; 
 Thu, 14 Sep 2023 16:50:54 -0700 (PDT)
Received: from localhost.localdomain (cpe-70-95-248-239.san.res.rr.com.
 [70.95.248.239]) by smtp.gmail.com with ESMTPSA id
 b13-20020a63714d000000b0055387ffef10sm1646969pgn.24.2023.09.14.16.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 16:50:53 -0700 (PDT)
From: Yanghao Cheng <yanghaobillcheng@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 16:50:43 -0700
Message-Id: <20230914235043.2538981-1-yanghaobillcheng@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694735454; x=1695340254; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fzyMIbfzwdHM2ynZFEKdXVBMuiz3B3PWEvB3YUWtN58=;
 b=jmr1iCNbLNM8GuU12D5hgahYc2LTtRgHV0lx9wwg/OXxENNDGefiwQFD7xY74ihZBY
 41OEKxQrRwavG1k6IQG5kBJnvOc+S06jveVGEYUsZVHlSxHuFM0Tr04+hKMqZZazl5Lp
 Ds6wgoHVXSYf5P+GrXnDlVDGFWjD857mt9iSjdUgNmHe3JESc8XKL/fYWqhSLi8qYZWw
 MaGfjcQkCcoC9LiImwE4zm8va/yOpeUtI5T1DQ+mw0RRyy2q/AR1hndIIFPuWStWabl1
 6lG1RKvrEiW8ysLjBbStIPdNhlVlNY2r9Im6cN9gVy/FcMnMUH3FwYdngZ4/CZT7+5t6
 b+Hw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=jmr1iCNb
Subject: [Buildroot] [PATCH 1/2] package/xserver_xorg-server: fix init
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
Backport to: 2023.02.x
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
