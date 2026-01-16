Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C21BD47CDA
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 11:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2112985A88;
	Fri, 16 Jan 2026 11:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gA4nl0kwudoc; Fri, 16 Jan 2026 11:05:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4868A85A8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768561554;
	bh=4re7Aifb90rVhCzJ2pZ9SBl0Sj9vZGbL6IdGJxWCobM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IpGPL1PggADztIQvAP9K/33tvRreQnh6oR+BYOEfdqspNH0QyZI3I8jbtauplZPGv
	 FhxaIph6TKSNYoiE9J1f1W4jQE1CUPrsmgF1AX9+PftdQJdBKOEzpaHPMY17W/trz6
	 7MLTA8VNgbDwpzhQA1Mj4EMIkw+V498Ekljqv3rmJSP97MhHdDmSDLBCsDZRSvjm/O
	 vkpwA5WZ6V3QeF02MYFPwJhEguth/16gbVK7BvaPRqTvYRFmKpDjk9cUSSHHWGShWm
	 ejTiyrzwpS6MUJp2kNkJ38hUqW5NijtU9CIsmuHzJkvn5jXfq85u0wMm+XX9Z/48yV
	 s1hSRJwABW9aA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4868A85A8C;
	Fri, 16 Jan 2026 11:05:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C32821C3
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 11:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A95F485A8C
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 11:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3saI6PREbWyc for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 11:05:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8DEC785A88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DEC785A88
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DEC785A88
 for <buildroot@busybox.net>; Fri, 16 Jan 2026 11:05:51 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4801d7c72a5so6766225e9.0
 for <buildroot@busybox.net>; Fri, 16 Jan 2026 03:05:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768561550; x=1769166350;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AUVVrh2qSMiY0H33TmZuyHiEXRhjWXF9I7qLMxSI+cg=;
 b=wZf8ecQFy9Dh1djqh512CLLbLZLGBBn48mPIiVevn6vGE+NhpEj+4YLoTl5fwHfowu
 yvmeKcPOWlzszBY7mRCRg33hzFRfXWVqAEV5oBBoBLH8pGZnqqHjT44VFz3FBiZXoZ44
 +XaL2JX26Y9mYpDigTG9vXL6bWo3MpMmhnXFyyJicZ/dEWKQG3OcVIAtoTwXrIM2ZJny
 13Gz/qj49pv++D/BvfE5SmlzanFSUOU+ShoIvAsqFe38GZ811vGkkP2JEE/WzLYxmz2e
 AapRYk1TEvzPyf1ggGkf1QygtkaIDMSi49KV1eEXjjVKlvcXHdHQ/Tfg/Iv5hPdhtGUa
 KLKw==
X-Gm-Message-State: AOJu0YyfhqAVQrS0q4Le2IOdbMNS12oxxntdfmuhrLmgo4cjXNWK4zxL
 yXUMs1wDryJHIsbVPPZfVMVdkJRoUW0DCVgbaiW9Aq80ohAM+20WAVT+ZbWqL1dpW72sbHQG1B+
 AQc2Q9w==
X-Gm-Gg: AY/fxX4d4tFBo7tpdEiNnMKpTf90D3aAjJziuQ6e+yXAm39CR8T3Gp32bSQggeKLtH7
 5E3pTTAe2sp1J/gR47TJMjET5m31OhUu8pmgzFY8coUD8RQnZfElydbfhKovAUV09KaK+aZNDh5
 la5lAPbOlN0cWLzqNNjAXzhMWkFoXdEG8x8mBtTg/nGrT2o5c81ok8+IlCxAjEnRN9Y5Vrf0O3R
 S8fbqPmDjfQG7QUsvksxLJFcWP5CzPwPUNkQuCWQcHtlx5myNP7WvMQ/MXkcwbyPphytOk1fck/
 24sUt4LOwHoutzU3Jr9I1pgfHYrPpnCNurjefvnuHJ4J0JjbExYr+mp3u08dR7giGNrQKiKycAF
 8K8E1R5jccnztaGSGTL1axc5mRbbbUoxmTtKzLz8HwEtGKH9dwgdOFDz87JKEATtV+lCW+8pTdw
 lJ9jdNm5GxLvo8FHW4YQP2+W2QZCpQMeleeVekVA==
X-Received: by 2002:a05:600c:45d1:b0:477:7ae0:cd6e with SMTP id
 5b1f17b1804b1-4801eab5602mr23464145e9.5.1768561549360; 
 Fri, 16 Jan 2026 03:05:49 -0800 (PST)
Received: from vm-2404.. (249.184.66.37.rev.sfr.net. [37.66.184.249])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801e8d77besm38894615e9.14.2026.01.16.03.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 03:05:49 -0800 (PST)
To: buildroot@busybox.net
Date: Fri, 16 Jan 2026 12:05:29 +0100
Message-ID: <20260116110529.809038-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1768561550; x=1769166350; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AUVVrh2qSMiY0H33TmZuyHiEXRhjWXF9I7qLMxSI+cg=;
 b=LnsNaxkQzG1pKqagGhIAeVNIG7onnwVLGkob4bXEmN8LmHSsuZqCQmSUR59xCF3Tsh
 R6Wk5GfwDu36sicCIjR+yWtAkbsTjiJYZgc2e7eTzr5zCWJGFvO7dd8KezniJjgmSqVg
 6mjyKtSk+DqNMb3E98BiE/WhmLCjAt/SVZYNjAW8xKR6buB46r1t21NHKfrAoktV2k4x
 dnuDoHz8kulUqm0ur5MS42LJmyFVZSheLGgXBRwmugc0My7NNE3gHbcTW3ibVXPWIZJe
 U+vyGJNJb7Xyh58AUnzQy7AgqsKe3D00fyxo5z3d68b32PijLIcboGUgSzzeLkEeeFTi
 SaVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=LnsNaxkQ
Subject: [Buildroot] [PATCH] package/lua-lsdbus: bump to version
 6f80930248110927d1f898966544eec202ea3550
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-lsdbus/lua-lsdbus.hash | 2 +-
 package/lua-lsdbus/lua-lsdbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-lsdbus/lua-lsdbus.hash b/package/lua-lsdbus/lua-lsdbus.hash
index d6f30c052..128481427 100644
--- a/package/lua-lsdbus/lua-lsdbus.hash
+++ b/package/lua-lsdbus/lua-lsdbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fce5db789b18663c5c48010eaa0b3411f63a7f0b3c70c761535c0d5e3f9f5e11  lua-lsdbus-3704232a634d1c866275b9a138b860421fd1c8ac.tar.gz
+sha256  ef5c5b83e7aad57e2e0d761f7b72da99441c286eeb2c41da8ae7c919eea5f155  lua-lsdbus-6f80930248110927d1f898966544eec202ea3550.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/lua-lsdbus/lua-lsdbus.mk b/package/lua-lsdbus/lua-lsdbus.mk
index d398af029..1c9fb48a3 100644
--- a/package/lua-lsdbus/lua-lsdbus.mk
+++ b/package/lua-lsdbus/lua-lsdbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LSDBUS_VERSION = 3704232a634d1c866275b9a138b860421fd1c8ac
+LUA_LSDBUS_VERSION = 6f80930248110927d1f898966544eec202ea3550
 LUA_LSDBUS_SITE = $(call github,kmarkus,lsdbus,$(LUA_LSDBUS_VERSION))
 LUA_LSDBUS_DEPENDENCIES = luainterpreter mxml systemd
 LUA_LSDBUS_LICENSE = LGPL-2.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
