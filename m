Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B93CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 287CC608B0;
	Sun,  7 Apr 2024 14:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4Hl5Nm6p3Ke; Sun,  7 Apr 2024 14:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BB94608BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BB94608BD;
	Sun,  7 Apr 2024 14:16:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6C451BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0A6281DFE
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YtbgbQchodPo for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:16:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 398CD81DE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 398CD81DE4
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 398CD81DE4
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 14:16:13 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41673509e8eso104685e9.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 07:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712499371; x=1713104171;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W/ojM2vuoN/1Fw7quzSsG/ElqJSPIzjShR9wA1wOTmo=;
 b=X9eJlpIU7Syktus82XeoEVTYQQhacGW4J0mFcJG3dNndJU7+h0hde9Rww9Gen2X2li
 8Zy+dF+RyBzkN7pM3IOpBlxEr1ywLPkXmaBAENmyrCBR4kBDwzdN+2rEMpLn7blgErKh
 cXSeRsSrB5VNASAU511tYCl7BI16QuD6JKpmkm8XCm8dHFttA5IMEqQabZtmepwS4VNV
 YoiRXZgRG8TRV550xVCHGa5fX4QYylJdRkexwsbsvYYK68VH9dupId/myyms7Sj1nKJJ
 8rcNdNhVM2l6n3XcBS0nFjPo1XTaQycp48dwqheZmiLBLws3q5ddSumLhgArayjvmdfe
 FdKQ==
X-Gm-Message-State: AOJu0YyMYUHRt3XZk1xzZY8W7+l0ba7E8HTYW0Hz8yKjFQDX1DBV9tNM
 xMNQNMZLZkyRebOFxRiVvR7iyCAfCtdnrKZly939oEL2ngIDpkXI7D50exmn
X-Google-Smtp-Source: AGHT+IEFWX/GgzdqGNI/yetsIxO1lz+3/pJML1p4M2DdmR2JFFRAPQ7hQFovlutovLNuoX4KXlznkA==
X-Received: by 2002:a5d:64a2:0:b0:345:b238:534d with SMTP id
 m2-20020a5d64a2000000b00345b238534dmr445761wrp.28.1712499370843; 
 Sun, 07 Apr 2024 07:16:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z11-20020a5d654b000000b003437fec702dsm6715613wrv.21.2024.04.07.07.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 07:16:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 16:16:08 +0200
Message-ID: <20240407141608.1877716-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712499371; x=1713104171; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W/ojM2vuoN/1Fw7quzSsG/ElqJSPIzjShR9wA1wOTmo=;
 b=j+vujeMepXragMWqXfc192YnkoCO/QoHOLDA6yYgkKKGxQcfKWOmlgE/HKbwDbtunI
 EgIWEmLczMMxvJw5GKPmDJbCnYiuRzlmix1OrHNP4VuKhfoz1xSL8kH5uYcNfF2LxG3g
 VaaWUWQNRRXaIWSmzhItUAQYajihrqAf6yldEA9Rk+sQGis002YKQz1W5gvXh3HAkkvH
 RMG2PhfmozS3ONPXjZfLLEHmqS/ksN/neMM669RM6yOuqoJ+nckQ3Nvl5eAH3850QQhy
 Vj6AV1V17XqmxU+1klPc3wnr4K5yiurx3CcfWJPJQLDzSohiAT54uxd23PcnkJuXMaQY
 UJaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j+vujeMe
Subject: [Buildroot] [PATCH 1/1] package/openrc: add libxcrypt optional
 dependency
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
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

../output-1/build/openrc-0.52.1/meson.build:129:21: ERROR: C shared or static library 'crypt' not found

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/52187a593d3da39051e635a9cb5a19d5bfe2bef6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openrc/Config.in | 1 +
 package/openrc/openrc.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/openrc/Config.in b/package/openrc/Config.in
index adc61d2546..42d7347b0e 100644
--- a/package/openrc/Config.in
+++ b/package/openrc/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_OPENRC
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod tools
 	select BR2_PACKAGE_KMOD # runtime
 	select BR2_PACKAGE_KMOD_TOOLS # runtime
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_NCURSES
 	help
 	  Init that works on top of pid 1 (for example
diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index f8e51f6720..69f5b3a121 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -33,6 +33,10 @@ else
 OPENRC_CONF_OPTS += -Dselinux=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+OPENRC_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 OPENRC_CONF_OPTS += -Dpam=true
 OPENRC_DEPENDENCIES += linux-pam
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
