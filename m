Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3C0C433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 02:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB45140574;
	Mon, 28 Feb 2022 02:29:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xxz0qog5m7Mq; Mon, 28 Feb 2022 02:29:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99BCB40573;
	Mon, 28 Feb 2022 02:28:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7EA11BF387
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 02:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD17C60DE5
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 02:28:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U-kFwoH6SgCg for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 02:28:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3155460DB2
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 02:28:57 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id h17so3895125plc.5
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 18:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=skR8sp5RHdk6U6OtnvQqBZ+rQAaZT6l9qCewAivaNMU=;
 b=SS9cvBL4Q08D46grVfR+59u7x8n18sIwXuItiJEkcFqgSFRpk8E5G7FBV0O1LKWOF4
 V1s7qwr9ManI0wfsdq140B+FEEmyYrQZsgIB33KFpf7L5ioXYehKDtV8vmq6ws0chA7Y
 fYMkN91hXyS4g4CXeFO7dDe8qyeNyyy55nUYcZh1FplYBH7VvvuWbU5SGxs2UD+0LkKx
 r7hc/CIBN3H4HWmF1g765r1YxvB+Tqj26JpMmvn476lLn52CF8cj5lGpcXel2D2o299r
 naLk6LUvY4ZRb3NGP3ivl83Dz0TpdYBThQiWUrqcxkqbq7oTZZaF9MeLRcUAPax7xvBz
 gyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=skR8sp5RHdk6U6OtnvQqBZ+rQAaZT6l9qCewAivaNMU=;
 b=pKTWpXehjWzfVdV+iB7xCVUX9R6UWL7W2MtR+qXTVmSrupFL+Pb0m1k/7rUFXC9tMc
 NinWfSf5TX2RrvP/annFcZ7rxD2M5qfU6vwu1IRL7bbsDzIJ/hNGukhAo/geRCStxrhR
 ngcJ8k1+dGHJ/lyGb8VY8YjXOlzWLhlax3wLggAw0LYJIyjI8TDPxvLr3nxm8dC7tqz/
 Aoorq4MWWciXrOUDiY9NcueZxmHh37U5BZ9Usdy0xxJEVPT/hUHlXKS82m7fpEkucW4W
 TDRXsW8AKMDjQkGbIPMvMpWPAXkKpYizPOMGdgEugKKyHcjkycghB5xwUaciQiTARAZA
 /1ew==
X-Gm-Message-State: AOAM5329ietNb0oTqz9l5qYC05ZKf1GYds5vqbWnAuYKfeRwmpWVKr4A
 rC/znDsqhC6u1z/dyARLg0bZUtnwySQ=
X-Google-Smtp-Source: ABdhPJxvUcNUvCa999p53/0hNxCyakuDOPAZyrfTOzAT57Oar91UrN0FqdqIb/n778q1BCUpBFJN8A==
X-Received: by 2002:a17:90a:c386:b0:1bc:274a:c202 with SMTP id
 h6-20020a17090ac38600b001bc274ac202mr14402601pjt.185.1646015336395; 
 Sun, 27 Feb 2022 18:28:56 -0800 (PST)
Received: from lxb-server.lan ([2605:52c0:2:32c::])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a056a0026ca00b004e17b1da847sm11101476pfw.167.2022.02.27.18.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 18:28:55 -0800 (PST)
From: Yunhao Tian <t123yh.xyz@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 10:28:40 +0800
Message-Id: <20220228022840.2140908-1-t123yh.xyz@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/shairport-sync: install dbus policy
 file to target
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
Cc: Yunhao Tian <t123yh.xyz@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds two extra commands to install dbus policy config
to target if dbus option is enabled.

Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
---
 package/shairport-sync/shairport-sync.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 487e0c05e5..ab67da3964 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -59,6 +59,14 @@ endif
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_DBUS),y)
 SHAIRPORT_SYNC_DEPENDENCIES += libglib2
 SHAIRPORT_SYNC_CONF_OPTS += --with-dbus-interface --with-mpris-interface
+define SHAIRPORT_SYNC_INSTALL_DBUS
+	$(INSTALL) -m 0644 -D \
+		$(@D)/scripts/shairport-sync-dbus-policy.conf \
+		$(TARGET_DIR)/etc/dbus-1/system.d/shairport-sync-dbus.conf
+	$(INSTALL) -m 0644 -D \
+		$(@D)/scripts/shairport-sync-mpris-policy.conf \
+		$(TARGET_DIR)/etc/dbus-1/system.d/shairport-sync-mpris.conf
+endef
 else
 SHAIRPORT_SYNC_CONF_OPTS += --without-dbus-interface --without-mpris-interface
 endif
@@ -77,11 +85,13 @@ else
 SHAIRPORT_SYNC_CONF_OPTS += --without-mqtt-client
 endif
 
+
 define SHAIRPORT_SYNC_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/shairport-sync \
 		$(TARGET_DIR)/usr/bin/shairport-sync
 	$(INSTALL) -D -m 0644 $(@D)/scripts/shairport-sync.conf \
 		$(TARGET_DIR)/etc/shairport-sync.conf
+	$(SHAIRPORT_SYNC_INSTALL_DBUS)
 endef
 
 define SHAIRPORT_SYNC_INSTALL_INIT_SYSV
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
