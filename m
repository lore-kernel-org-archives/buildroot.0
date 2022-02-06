Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55B7C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70EE24011D;
	Sun,  6 Feb 2022 14:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PrdzKcrK2SQ9; Sun,  6 Feb 2022 14:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5BA040107;
	Sun,  6 Feb 2022 14:53:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC8681BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAC7E81464
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p-MUfZ3E0_Ns for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:53:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B37C48145E
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:53:17 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m14so20463993wrg.12
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 06:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w3GRNYLUacNJusJzVq7IMKId8CbE7P3vUaf65K2hBbs=;
 b=NvdCZrpAMKO78G6D7Q5LhrOaZ1dN9l1wlkCU7SzXv4g4M7Kozif48ucy6B1nvar7Uo
 jTOK63xjIfFvO9p8Y9ccz6uxt7ux0nT8NIwy5mUWUsfhNldb2NiUlIdGtz5fhuv23kEW
 srcly8FEDGftt3YJrn2ynMMkYwLNeZgIrg75C92e/4E9iOchQuxwHI7XsfxLMwB2VX5o
 7/Rj4Vl3KBJ7/wzPecviuaAnVELAEUnjKF2xUbkTfZoduqouGDSzsgTBvm0x/rqpgSRQ
 WN4+qwmROtKsq0IF/+x+LXF0jjp1g/aZ6bYioSy3SUsPRnWC8b1kWPnifHXvvJfp1Dqx
 TyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w3GRNYLUacNJusJzVq7IMKId8CbE7P3vUaf65K2hBbs=;
 b=b2fePxW48O5SoVRymYSRbdXjemy6c8C8stGbl0x0ocCf1La5XeWE/dyrdMJDjh/XKH
 ROjBpIrbAqZunkeeaOMhzZ8VHYayP3VcfxMdBPNcw+iJkA0Capr4ELBY2fz6jJsSw0DC
 wPb6wTXBxYdJBYvItqnA3S2QqO4982Je4GwlfS0ceOPwoXnXsA3tc9HH2XdO1BLp6q02
 IYgfgkAJXFmj7MMUCIalJODi1uGB8x3GCdJVYZADBnOeMaPHVnD7WFsdhDDt5Vg5Kla0
 +eBkt2Dqu1jnpZm2BrBOqJ3xsECEf4RuRZJVTD0VP6Efm3kHJrgcIq+QY0L3erNJkc1t
 dlbw==
X-Gm-Message-State: AOAM530i0z86ChJUedLiRMDRtuRVHL/96AQ9MFlbUGtvtXqwotmhk1Wx
 Ieh9Ad1Vc1YWuBJSjbMbWAfipZSk6gk=
X-Google-Smtp-Source: ABdhPJwZ2ctnvDGNFOMftkA7y5F2Kqs3c8aMY3Sbsqte0BZoZUho5m3S7k/v/uQl306U4X8Ka85rvg==
X-Received: by 2002:adf:dc90:: with SMTP id r16mr6517556wrj.532.1644159195863; 
 Sun, 06 Feb 2022 06:53:15 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id m2sm16400093wmq.35.2022.02.06.06.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 06:53:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 15:51:08 +0100
Message-Id: <20220206145108.1757971-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lm-sensors: update
 LM_SENSORS_VERSION
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update LM_SENSORS_VERSION to make it match what is returned by
https://release-monitoring.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lm-sensors/lm-sensors.hash | 2 +-
 package/lm-sensors/lm-sensors.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lm-sensors/lm-sensors.hash b/package/lm-sensors/lm-sensors.hash
index 0ca07b7e69..c941043343 100644
--- a/package/lm-sensors/lm-sensors.hash
+++ b/package/lm-sensors/lm-sensors.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  0591f9fa0339f0d15e75326d0365871c2d4e2ed8aa1ff759b3a55d3734b7d197  lm-sensors-3-6-0.tar.gz
+sha256  0591f9fa0339f0d15e75326d0365871c2d4e2ed8aa1ff759b3a55d3734b7d197  lm-sensors-3.6.0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 8975efaffa..1bf27fc25a 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LM_SENSORS_VERSION = 3-6-0
-LM_SENSORS_SITE = $(call github,lm-sensors,lm-sensors,V$(LM_SENSORS_VERSION))
+LM_SENSORS_VERSION = 3.6.0
+LM_SENSORS_SITE = \
+	$(call github,lm-sensors,lm-sensors,V$(subst .,-,$(LM_SENSORS_VERSION)))
 LM_SENSORS_INSTALL_STAGING = YES
 LM_SENSORS_DEPENDENCIES = host-bison host-flex
 LM_SENSORS_LICENSE = LGPL-2.1+ (libsensors), GPL-2.0+ (programs)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
