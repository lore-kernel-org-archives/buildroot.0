Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F4AC25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 14:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF79E400C6;
	Tue, 21 May 2024 14:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZX9r4xwhnhQD; Tue, 21 May 2024 14:36:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7B194012F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7B194012F;
	Tue, 21 May 2024 14:36:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F03E91C532F
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 14:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA4114012F
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 14:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXA-hnch61Mp for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 14:36:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.45;
 helo=mail-wm1-f45.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59229400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59229400C6
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59229400C6
 for <buildroot@buildroot.org>; Tue, 21 May 2024 14:36:21 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-41dc9c83e57so20008565e9.0
 for <buildroot@buildroot.org>; Tue, 21 May 2024 07:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716302179; x=1716906979;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AZ6eo+760ZIWlrFAU5GWV+lyL0Df365EZdkmuNi4RSQ=;
 b=Q1koOic7UmgMR13b3uf7u6iwtjF0HC/3ClQSv5JDbhSZ60nboglcGG/ECpOZCiXc3t
 5wt2EkuGmKh8KEdB2EJEkjMt5Kl8OcV4pdNDtlEe5zvTBOOAAl9PfKwweleRnp3Ohpvo
 /k0XyxjrRIdsrgkal+plMAoWDp+B0oqrWfm54AAGwb/yb3kpz9jLYpjZIvnZv15BH3mB
 P+jbskPWUV3vOpwlQl/CSakZt3PTPOemWB/ZjN29DNMQEJVEl2d0vtfXfa8FaFPb5xp9
 t/KuAMjiTE9K/bwoUg/2a1Rdty0r+LJncUretrEkPbGfmjwa+Dytd9Sd/SYmHMTS+6xP
 lAUg==
X-Gm-Message-State: AOJu0Yx+qeJLLYKCECYeEbY1ldF4bmvolBTVAPuce3bbAX0ZeqBZovul
 tOTEi0K33T/Hr18EGvT1oXHzFLycA8kWOtIeKwr6ICAbSosIEZBevA7TLg==
X-Google-Smtp-Source: AGHT+IGxhA5Cnv1xnxtK7JOAssJLxV5omWppmPrgfbSS33kottj+uKpFfZJYMNU30eIkJpr7SMqtIw==
X-Received: by 2002:adf:ed0c:0:b0:351:c05e:3c12 with SMTP id
 ffacd0b85a97d-354b8e24573mr8341833f8f.25.1716302178624; 
 Tue, 21 May 2024 07:36:18 -0700 (PDT)
Received: from thomas-Precision-7670.barco.com (d528f5fdd.static.telenet.be.
 [82.143.95.221]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-352501a1f11sm13002611f8f.75.2024.05.21.07.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 07:36:17 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 16:36:15 +0200
Message-Id: <20240521143615.5157-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/fluent-bit: bump to v3.0.4
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes:
- https://fluentbit.io/announcements/v3.0.4

Fixes:
- CVE-2024-4323 (https://www.tenable.com/security/research/tra-2024-17)

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/fluent-bit/fluent-bit.hash | 2 +-
 package/fluent-bit/fluent-bit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index a53f6dba51..6fcf4fac3e 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2f3b82e8b7802fe92625009531592f12d500ff61a02ecf4cd27e0f138a6dc566  fluent-bit-3.0.3.tar.gz
+sha256  b439f89e879e538849e9106fe450bcf58da5034dfc316af4d2a837423786ed11  fluent-bit-3.0.4.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index b235c3abf4..13bd4ddecb 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 3.0.3
+FLUENT_BIT_VERSION = 3.0.4
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
