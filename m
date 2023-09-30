Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A795E748EA
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 22:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE09783C89;
	Sat, 30 Sep 2023 22:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE09783C89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pPUKbFKKSRcG; Sat, 30 Sep 2023 22:18:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E922C83CD5;
	Sat, 30 Sep 2023 22:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E922C83CD5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBBB11BF5F5
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9096161096
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9096161096
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JdD41khTWUEx for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 22:17:37 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 876E861089
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 22:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 876E861089
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-325e9cd483eso1545041f8f.2
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696112255; x=1696717055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z2LnfGGL1lzst98eVcFRvgbrVptQRqVkzPjS6u/mHa8=;
 b=ZU6v7GcY7/o90jtIIMZ5e5QLaFRi8yvuRvJor0bNf3oiq8F1ZjAA+c7sVs+8OIl87y
 zvfBGC98us2GNuULRvrEBAkb3sB43jgQYb5gh5eQqD8pzisntrWA3le4TdxGIVe1nY9A
 zmslLGuejB87wK6rkGZes8+1l0jKIipjO95t1HHNevdo/CCdQWntUnOCMXB/qcpB9eVd
 i0o88tJVOKtBzrhlNCF5YzFG6jmVYBrX5wktE47dILQvwM426A3mJX4L+/E/Nljel5q4
 hBPlMBm236twoiHoNQkXU+fO8uZayBmMdBIKkrCtPBHhYikfnwj3Ogo50dHFlzPFf4iY
 BQYg==
X-Gm-Message-State: AOJu0YxunewsEzfc5BJb7az8STVxay9QxyrMIjeWf7p+NKjM9S7QLAGG
 P4YX/JNA+d8QzkQJdGzpvaOk+zFGqBdRBDJG/yU/BQ==
X-Google-Smtp-Source: AGHT+IEndOYSUXmDfmBezwdmiJ8w5LLa+94eChW5fui2e5N97i0CiIaJBYLOWZJLiu7tkYSPNMoheA==
X-Received: by 2002:a5d:6188:0:b0:321:707a:8ca5 with SMTP id
 j8-20020a5d6188000000b00321707a8ca5mr6729158wru.38.1696112255168; 
 Sat, 30 Sep 2023 15:17:35 -0700 (PDT)
Received: from arnoutx1.home
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a5d4d0f000000b00324ae863ac1sm5681274wrt.35.2023.09.30.15.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 15:17:34 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 00:16:26 +0200
Message-ID: <20230930221727.1458825-3-arnout@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230930221727.1458825-1-arnout@mind.be>
References: <20230930221727.1458825-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696112255; x=1696717055; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z2LnfGGL1lzst98eVcFRvgbrVptQRqVkzPjS6u/mHa8=;
 b=FwilTuwpH3kBnL9Rgy2UuzTH/qgvdXEIb0pt5ceQlqnf3ID/ZznQ61KV1gy0F6zhlG
 rG8OkCC5Yrh2ClT2hiD3D7zOkCmUiLFOkKt15C0KMN9LcqSKehZEq1FzqM2cA3LtJz3v
 +vClAMR/2lJ6T47jRFvpC24JzK5uZ4S/Y83JMAiyypFb3yXuyABTrYmse7y+P/+bi9Xy
 ZCrzu228G2EgP/XpGgpW8LLADZnzX6GXQgEfdj6iORygAPYaCVKj7k1o39GJvMTuEJ7a
 gTL2LRnNp6/TfmdziODeDtRrWe3kmmwYLxUB2orEmicxmtBDBG+jZQ6w5jVTw0JcoNwJ
 QqCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FwilTuwp
Subject: [Buildroot] [PATCH 02/10] package/pkg-python.mk: remove
 _BASE_BUILD_OPTS variable
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Signed-off-by : Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This variable can just as well be merged into _BASE_BUILD_CMD. This is
how it's done for the install opts. And anyway it's only used by
distutils and nowhere else.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-python.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 1fc096efb3..eacf75c165 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -198,8 +198,7 @@ endif
 ifeq ($$($(2)_SETUP_TYPE),distutils)
 ifeq ($(4),target)
 $(2)_BASE_ENV = $$(PKG_PYTHON_DISTUTILS_ENV)
-$(2)_BASE_BUILD_CMD = setup.py build
-$(2)_BASE_BUILD_OPTS = $$(PKG_PYTHON_DISTUTILS_BUILD_OPTS)
+$(2)_BASE_BUILD_CMD = setup.py build $$(PKG_PYTHON_DISTUTILS_BUILD_OPTS)
 $(2)_BASE_INSTALL_TARGET_CMD  = setup.py install --no-compile $$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS)
 else
@@ -335,7 +334,7 @@ define $(2)_BUILD_CMDS
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_BUILD_CMD) \
-		$$($$(PKG)_BASE_BUILD_OPTS) $$($$(PKG)_BUILD_OPTS))
+		$$($$(PKG)_BUILD_OPTS))
 endef
 endif
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
