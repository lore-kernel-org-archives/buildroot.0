Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62775CDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 11:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06CFC4192D;
	Tue, 17 Oct 2023 11:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06CFC4192D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4CR1vw4krVtj; Tue, 17 Oct 2023 11:09:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C45A41B9B;
	Tue, 17 Oct 2023 11:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C45A41B9B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A98E1BF215
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 11:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7F1F82027
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 11:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7F1F82027
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tkgQKyctOOrW for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 11:08:24 +0000 (UTC)
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1072382026
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 11:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1072382026
Received: by mail-lf1-x141.google.com with SMTP id
 2adb3069b0e04-50308217223so6578385e87.3
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 04:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697540901; x=1698145701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BxPi3EFdWL3Mq4Q93Ng/VVNHBHA68BSpdHGVIbVo1Mk=;
 b=ZG9LGiHaD27fmRZuAgTpWhuGhY/r0AsMGjaj/BppkjXStsK26TI5ZGhCbVIftFpB3L
 RWYO9qO6FpdBDwL3T/ZTlfm1k91DzV8GAImWOMNw4qlFCR352DxRm8RNEklGnBvgyROY
 lm+DUtchDibazqs05YpoyS33jhVphB4L5jkbjXlCP7S2VngAMhGh8h34acOqs4Mjvta0
 wCuCqjoa39VGsFcjkE/inP84c7IFpAiFjHjjLad5UaUTvySo8vrcJVX027H7gBR4UhhP
 3jHJmrv/plXQQcN80LXvHLSkvcDoWXWyVrYr618p8mTaXuYFqn8yiPgLo1CS6Tbn7jCX
 7aaQ==
X-Gm-Message-State: AOJu0Yx1IH+aYWsT+Q1MqeMttgf+YzPv5iRs52V48P9wU60rCnT8FWMw
 NUeHzP0NpxALVHi2kih+Gyu5CKgGu7BF0A6BZgKFVb//xi7ZiA==
X-Google-Smtp-Source: AGHT+IEDQpIMM8kfg4a+j65QwE+IHrn8yozXvicjJaNhX2fmVLZUUp0Abpgq7bbrDXWpCnAnwA5FVg==
X-Received: by 2002:ac2:4c16:0:b0:503:653:5711 with SMTP id
 t22-20020ac24c16000000b0050306535711mr1388481lfq.9.1697540901535; 
 Tue, 17 Oct 2023 04:08:21 -0700 (PDT)
Received: from localhost.localdomain (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 j17-20020adfb311000000b0032d9382e6e0sm1458840wrd.45.2023.10.17.04.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 04:08:20 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 13:08:09 +0200
Message-ID: <20231017110809.1766057-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017110809.1766057-1-adam.duskett@amarulasolutions.com>
References: <20231017110809.1766057-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697540901; x=1698145701;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BxPi3EFdWL3Mq4Q93Ng/VVNHBHA68BSpdHGVIbVo1Mk=;
 b=pA6wRU5bLKvE31X8WuWpcfHzE2EbLzbyhfPDoOGuBGPi6wvN656HPTuXu8RyD8DrpN
 f/ynVKP63pyriBwCi4jFHkkA62kVxkQvf8YLl7T8vLzI9aCs1lhH4cSV5FaOqO6IfSZH
 PquoqoQnSfjSZXqriVgEc5G2W6OR4XBmTqBBM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=pA6wRU5b
Subject: [Buildroot] [PATCH v5 4/4] package/openrc: add split-user support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also, introduce a new test in support/testing/tests/init/test_openrc.py that
ensures split-user support works properly.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
V2 -> V3: Fixed inverse logic [Yann.]
V3 -> V4: Add missing test

 package/openrc/openrc.mk                  |  6 ++++++
 support/testing/tests/init/test_openrc.py | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index e3f51d45d1..63aec7615e 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -40,6 +40,12 @@ else
 OPENRC_CONF_OPTS += -Dpam=false
 endif
 
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+OPENRC_CONF_OPTS += -Dsplit-usr=false
+else
+OPENRC_CONF_OPTS += -Dsplit-usr=true
+endif
+
 define OPENRC_INSTALL_SYSV_RCS_SCRIPT
 	$(INSTALL) -D -m 0755 $(OPENRC_PKGDIR)/sysv-rcs \
 		$(TARGET_DIR)/etc/init.d/sysv-rcs
diff --git a/support/testing/tests/init/test_openrc.py b/support/testing/tests/init/test_openrc.py
index c6ade7676d..c60e079bfa 100644
--- a/support/testing/tests/init/test_openrc.py
+++ b/support/testing/tests/init/test_openrc.py
@@ -44,3 +44,15 @@ class TestInitSystemOpenrcRwFull(InitSystemOpenrcBase):
     def test_run(self):
         self.start_emulator("ext2")
         self.check_init()
+
+class TestInitSystemOpenrcMergedUsrFull(InitSystemOpenrcBase):
+    config = InitSystemOpenrcBase.config + \
+        """
+        BR2_ROOTFS_MERGED_USR=y
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_TARGET_ROOTFS_EXT2=y
+        """
+
+    def test_run(self):
+        self.start_emulator("ext2")
+        self.check_init()
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
