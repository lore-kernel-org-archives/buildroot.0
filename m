Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A402DC83F15
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 13:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D80B40328;
	Thu, 29 Aug 2024 13:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id edNftFAHcBbl; Thu, 29 Aug 2024 13:12:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC12940359
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC12940359;
	Thu, 29 Aug 2024 13:12:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C2251BF8B4
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 13:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59B3C60663
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 13:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQHLy6yHNuqi for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 13:12:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.52;
 helo=mail-wr1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D0DC60639
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D0DC60639
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D0DC60639
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 13:12:42 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-371afae614aso397750f8f.0
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 06:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724937161; x=1725541961;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+kgt1EclLRllKZVNsddgcVl1fRqlbKr1Nt7sUpeOWsw=;
 b=iNiApk2jqOUoaaBQo6i3xKAYyiNMdnp3570YPFf+yCmah+th8ik1i+M7BbfdNvVD1o
 f1YIbW7Z3dLYngw+Oqxwd09YRKwGMHxe9X5MqaBj6oEEagSRJBOStfXxy2l10X97ZxgK
 v6vi24Jizc0DFgRKgikdamAwL3yOmElWi26FiddtJFbdwFq6FwadhdTOaPW7WiPQTd7Y
 rX8Gcr9W5/J9FF4ane0ugrAiwLj6WN4X6hY/QEzEDQ3HBOQN95QbLFQX1kHqpVMTw/3i
 Ho3VhX6Fy8VBkcA2M4cM4372SRUmZuPhfUDKngPy/lL1z3DUZRKSjPRnr7H4yvRvZ3NT
 VTTw==
X-Gm-Message-State: AOJu0YxAPdl1xnaA1UBxMxpTz+GldIv1/4kOA+xL/aeQS7mz0D3dIrjR
 aQMqr5KQxwegmjN82FVhNrwft+z+QKmTf3I/gpJwjpHRgvgB5ioP9eeR5I+9
X-Google-Smtp-Source: AGHT+IHQlOmZLMspXvIG12RUwdquFoJncPztI3KkbXqLmcZQftqP3zFhEuRmgYfWJ3iYn8OpMFwyvw==
X-Received: by 2002:a5d:6144:0:b0:367:9881:7d5e with SMTP id
 ffacd0b85a97d-3749b52e5a5mr1904493f8f.8.1724937160205; 
 Thu, 29 Aug 2024 06:12:40 -0700 (PDT)
Received: from thomas-Precision-7670.barco.com (d528f5fdd.static.telenet.be.
 [82.143.95.221]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e273bcsm17119455e9.31.2024.08.29.06.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 06:12:39 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 15:12:28 +0200
Message-ID: <20240829131232.2132854-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/libsoup3: bump to 3.6.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

News:
 - https://download.gnome.org/sources/libsoup/3.5/libsoup-3.5.2.news
 - https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.0.news

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/libsoup3/libsoup3.hash | 4 ++--
 package/libsoup3/libsoup3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsoup3/libsoup3.hash b/package/libsoup3/libsoup3.hash
index 139771a11e..37ecd2db84 100644
--- a/package/libsoup3/libsoup3.hash
+++ b/package/libsoup3/libsoup3.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libsoup/3.5/libsoup-3.5.1.sha256sum
-sha256  c1d7cfb89832d35c271f37d544f2cfe21fa60ae9faad4a7ac58996ae4031f7ba  libsoup-3.5.1.tar.xz
+# From https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.0.sha256sum
+sha256  62959f791e8e8442f8c13cedac8c4919d78f9120d5bb5301be67a5e53318b4a3  libsoup-3.6.0.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
index bc3ae4d0cb..f8a7e26159 100644
--- a/package/libsoup3/libsoup3.mk
+++ b/package/libsoup3/libsoup3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSOUP3_VERSION_MAJOR = 3.5
-LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).1
+LIBSOUP3_VERSION_MAJOR = 3.6
+LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).0
 LIBSOUP3_SOURCE = libsoup-$(LIBSOUP3_VERSION).tar.xz
 LIBSOUP3_SITE = https://download.gnome.org/sources/libsoup/$(LIBSOUP3_VERSION_MAJOR)
 LIBSOUP3_LICENSE = LGPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
