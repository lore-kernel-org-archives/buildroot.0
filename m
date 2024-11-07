Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9A4D5D683
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 19:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51424600B9;
	Thu,  7 Nov 2024 19:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVjayyTM4-zU; Thu,  7 Nov 2024 19:18:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D06D61160
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D06D61160;
	Thu,  7 Nov 2024 19:18:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BEC1C1
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 19:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4306784438
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 19:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id biK6B8X0sWSi for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 19:18:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5BD0D84380
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BD0D84380
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BD0D84380
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 19:18:11 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-83abcfb9f37so53764239f.1
 for <buildroot@buildroot.org>; Thu, 07 Nov 2024 11:18:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731007090; x=1731611890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TPNVsYLyvWsnyP8WQRbjP3pcB9qjXuKd213lkN5QZ9A=;
 b=FWQ7WxmiLvULgolLAu6NZ/+LdDUrQKN9IK468ocFbpn7DHLjf3JyuP3Qw7zcuaPAes
 1HbvqN5qb5C8HuB1UMWoalN8mStJuQMkOzP5UF2K6va+us/Wns4KAhXeEaOoyRc8+mCL
 bu2S7o+K2dkIYcrluHvHXqALAJElo8a0dNcN5VXZRYVwkEZdCK4V02xMmYrfU34tXRIh
 IusiqwC/OkxcWJHQ2j6NFvYXiPKp/SgOODSbpJH+FkBQowwtxqNn2aveZ9mqgOFZa01O
 eomU+6nN7nNAcVGy2CNlWXTJuuijfOfVK8wbNkS3uYfrS3hJxRfJ086FNP2Yqss8Dt/q
 3lHw==
X-Gm-Message-State: AOJu0Yy/9y6rdz/fq3n/JXOUG/XUyL3CfO0d8AzkoWnWHhuEWvMTJkFU
 CQ0RIdkZ84YA8yBsuMoLSe2fLlUBWPcngcIzVHaMgqnX5A/mjzaDk0ImcA==
X-Google-Smtp-Source: AGHT+IE3XeYrAthm+1gJXnQumhhBG0CptHWilYUQJWS+dG/fjKerStfcUeopTgpG2PyRlnfsRx043g==
X-Received: by 2002:a05:6602:6d86:b0:83a:b235:2d74 with SMTP id
 ca18e2360f4ac-83e032e0387mr1997739f.7.1731007090059; 
 Thu, 07 Nov 2024 11:18:10 -0800 (PST)
Received: from james-x399.localdomain (97-118-149-1.hlrn.qwest.net.
 [97.118.149.1]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de5f8cdd00sm441546173.108.2024.11.07.11.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 11:18:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Nov 2024 12:16:34 -0700
Message-Id: <20241107191634.378670-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107191634.378670-1-james.hilliard1@gmail.com>
References: <20241107191634.378670-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731007090; x=1731611890; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TPNVsYLyvWsnyP8WQRbjP3pcB9qjXuKd213lkN5QZ9A=;
 b=CGawTU8nX4FKLEgjEMf6gwUInhYRFu0Z9QFhsz+RYanzF+X+762H4eiH06uLkvB4Fu
 MEcTxaE/zJRwGze7NYXroORzW/uIyBDu9c0HPj0LWCi4WY1RJoNWZtkPegrXN+YcUPnU
 fWg0vwZO04AcLKQBUTegf6sJzDcy+bCNOYu1lmYeaCFG+vTmEW0BeeS/9o2msH3yVmcS
 oG9jPpj0PNnIbofEjA2Enz+XLLxMf559YHwNE5q9+qN+kt4P5cy0jAeqB4O143es/nar
 5Z1C9yqxMuPtnr002WyFrM4A/nHg74ntuea3e8zvRAFdA5PDrjlzOstV4hxS6E75mY7i
 OTZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CGawTU8n
Subject: [Buildroot] [PATCH v5 4/4] package/grpc: remove
 BR2_TOOLCHAIN_HAS_GCC_BUG_85180 dead code
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>,
 Robert Rose <robertroyrose@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This work-around was added in commit
716f8b34c526c702aa19e9a66a25df5d3a6ea663 ("package/grpc: work around
gcc bug 85180") to work around a bug on Microblaze. However, since
commit
ae0557403a3a4cbf5354f0ab1784a08623382e5e ("package/libabseil-cpp: add
BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS"), grpc depends on
libaseil-cpp, which isn't available on Microblaze, making the
GCC_BUG_85180 no longer needed, and effectively dead code. This commit
drops it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/grpc/grpc.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 47ebf1997c..39be4f583f 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -59,11 +59,6 @@ GRPC_CFLAGS += -DGPR_DISABLE_WRAPPED_MEMCPY
 GRPC_CXXFLAGS += -DGPR_DISABLE_WRAPPED_MEMCPY
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
-GRPC_CFLAGS += -O0
-GRPC_CXXFLAGS += -O0
-endif
-
 GRPC_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(GRPC_CFLAGS)" \
 	-DCMAKE_CXX_FLAGS="$(GRPC_CXXFLAGS)"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
