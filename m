Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03086C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 12:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 039CE41953;
	Fri,  1 Mar 2024 12:18:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3gDRX5YxmlPD; Fri,  1 Mar 2024 12:18:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 548A341980
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 548A341980;
	Fri,  1 Mar 2024 12:18:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE2B81BF2EC
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 12:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7DF841954
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 12:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 35e35vO90jYs for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 12:18:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.43;
 helo=mail-wr1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 795F1404AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 795F1404AE
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 795F1404AE
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 12:18:09 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-33e151a1434so512445f8f.2
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 04:18:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709295487; x=1709900287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=876JGuEiIgY114HCgeindGztamBSBGPz4VYKHzWaI2w=;
 b=ThJkkQH96T2dEIwXnz+qaDwlOqRBXr3pKxBqJMjABrK+7Yal8oLwR6RQTCbINwRLus
 1g9ZrCD2/IrLYBtY3hd7W3LUdzl9u0b1U7Kj0IxlerrUDg37ffiS5hlaSrsRh5vJK1sG
 DKzDePfCL21aep9jQFLbm2Ka2OWC7EVvDt1DZ8Rg8s3Fui7Klxnh6jR+uqWQgKO/7c7V
 5c8ndLyNqXkfgIx6doGhj50xbSBwC6jaCikfaiSicfl7rXDBAnaz/JVJMHJlelErh7cf
 K7MRoqCDVEYqik1yAsD52AWZH30RJ5zAGW2Ah6qZKdF3XjjIaKgumjt9n3sA1pv+2Vss
 hrNg==
X-Gm-Message-State: AOJu0Yzq8LLuKrvvz8hseik6gXyztqbUJuRZdBpGjNN9AJZLx0IFaN89
 W/1DBtXaQ4PKSpG6J6rHX/rtOaCKro2IkLFWgkRVfdVPpONfotZh7dSwx9N/
X-Google-Smtp-Source: AGHT+IFv0FvWDDc7zyvjnGhd39SlA/z3wgd0GBNsY5OfYM2inE6jJ5Fuj1HAWxwuRvXKs0ZXW1PcKg==
X-Received: by 2002:adf:e0d1:0:b0:33d:8029:b136 with SMTP id
 m17-20020adfe0d1000000b0033d8029b136mr1087558wri.55.1709295486999; 
 Fri, 01 Mar 2024 04:18:06 -0800 (PST)
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:21b0:b5e5:77b3:1dae])
 by smtp.gmail.com with ESMTPSA id
 r18-20020adfca92000000b0033dcc0d1399sm4457802wrh.25.2024.03.01.04.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 04:18:05 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 13:17:57 +0100
Message-Id: <20240301121757.52642-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301121757.52642-1-thomas@devoogdt.com>
References: <20240301121757.52642-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2 2/2] package/sdl2: bump to 2.30.0
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
Cc: Michael Fischer <mf@go-sys.de>, Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
https://github.com/libsdl-org/SDL/releases/tag/release-2.30.0

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: fix git message, accidentally took the message from a 2023.02.x branch
---
 package/sdl2/sdl2.hash | 4 ++--
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 7a28d5efc8..95d2cf959f 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.28.5.tar.gz.sig
-sha256  332cb37d0be20cb9541739c61f79bae5a477427d79ae85e352089afdaf6666e4  SDL2-2.28.5.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.30.0.tar.gz.sig
+sha256  36e2e41557e0fa4a1519315c0f5958a87ccb27e25c51776beb6f1239526447b0  SDL2-2.30.0.tar.gz
 # Locally calculated
 sha256  9928507f684c1965d07f2b6ef4b4723d5efc2f6b4ab731f743a413c51c319927  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index eb5042e3cd..91f6585761 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.28.5
+SDL2_VERSION = 2.30.0
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
