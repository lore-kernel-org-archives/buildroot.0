Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351FA606A334
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 12:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=n9qxE1mr;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=puM+KwS7
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 053E860819;
	Tue, 24 Nov 2026 12:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0O-6tOpq0Z2; Tue, 24 Nov 2026 12:04:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1451A607C7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795521891;
	b=CCztM2cfbyJ69vjZybEAQCaPqYP2BtUOPAew9dch7b7ywDpQhVb0fPuJeadP98t6cjFr
	 KXse16oniHM51RIfBXFXuiBUfU6G7BT7SBoWdP2zjXws6anXsfDiIIiuVKVWS/f83SBBg
	 tDFCGFbNDj971d2iQrUcwhROh33+J/m3XCkY9RVMLFs7o+jpbcs63RW6efVhyDy1t/Ddp
	 JrXTv22gHrXojrsFggN0Ta6Wr7yzuePnVL3hOdhsVT/mD3wvdJN+gqIVWMo0N7MQzX5ti
	 dXx4yiAOucTkt5B/fxsCoATs0XW9RqF7W7v4zWZaL/WCbf1IvHZh/sYfWYuZ3saYpJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795521891;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wNAaHlp6hr/BqFxXcs7c2gUXuU6oCmbIe0CVvwzP7Qo=;
	b=MpEpVcdcXjWy9iFtuug8fYJL08BrIbWgdhruQY0qQSCh05+AXF0ak1eX6LEFE9bACb/1
	 WXmqUmztQcBmO+Ai8JJNSF0Gm+S86dqM4Dp5JR4d+s9UFsJMoTzRGqyU8H78aYbf3vsOU
	 yfXdex75kFPPj5aCzuz8Sx9e+UkHRCLEUEpHySdCP2Q+v65yE/TOLIfKvPqixTJpSZgSN
	 2NB6h8X8PsqWzkoblqnwE87wd6934A7vXWhzI2NVXPo7Bf9hzurUuZs88bYUS82LQi3fG
	 w8M1WH+3W8QFId1PcfCJtA5boRzUy2XcnOyvi+Mgk+4JgVcZG7tHhiyOwTPnviseB7A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795521891;
	bh=wNAaHlp6hr/BqFxXcs7c2gUXuU6oCmbIe0CVvwzP7Qo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n9qxE1mr0KskH3ksVjDDmlDETnjVL5d3sc0/Ornbst10/Hy87dd73V7oDykEki59p
	 QEHTdyXKK80oH1d/XuhlKoXpNjXj3NRHzcZ2cek8IB7a6Yk3AHznymHo57dtpLK0ID
	 k88AKFegZn//Wlhujbc4BTxhIIP6oVdODPc3lafu4olAOu5T8HcG2syUUXANI4YoOg
	 A6Be5ikDqXiwzze4dzhLttT1J38EPjQ/JqL/eqwskRHTDDJd71Qv61Z4aqr1HqRJNn
	 JAkOt2bA7qqxSItcZNqYJRdIcM/W3wMCXeD3frFdu5VKGDP9fhHzuGkIs4aDmpV6ir
	 8icevfN+zz3xA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1451A607C7;
	Tue, 24 Nov 2026 12:04:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10669371
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA1D140243
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XmM3CGn3JDMJ for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 12:04:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5D17040116
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::629"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=puM+KwS7
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D17040116
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:47 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c3fae9338f0so57858266b.2
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 04:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795521886; x=1796126686;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=y8Ulkaoid5R4T9cocWdf7TLvF16RuwklBEmS/fixei0=;
 b=puM+KwS7aoZEvrhitEpzuE9hCN4cUMC3p3nyiPoAYgk9BxCPdNItR7cctrZlqajI2K
 UREy5qO83kh3gVvY+TbkifjToeDEFPTNwhpbpm2F2sfA5fzgHqRQxvt7LxQypsBXh456
 PCWsAvJ7m5Qk5YA2fOEJISeuQp26okSKZ+ncA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795521886; x=1796126686;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=y8Ulkaoid5R4T9cocWdf7TLvF16RuwklBEmS/fixei0=;
 b=EvJIwNZ1VYuY4L4c0YxrGc6SGqdQSCOIPOM7l2tbQqj0bp2Lbwwv8N0oVI7jR9AHTi
 hpmjjDJdrC/E/ub+9CS04+GrkPhkLoI8Ov6a+8LZYBZWHaEJry41gxT3wVQ1olsNH98W
 HX64I3efzdRB4435Vn7eG+5uco+9GcXK4imMfY+6gjiPAc5o/0Gijwot1hr0FXqe8Dtt
 ZktGfXVjOl5Z6OLmIbGvV4k4Ic74RF54r5zTLqJKNUrlYKjAO0Rn25U+Q5gdWV/lU8LO
 MunLiqfvo1MsbOKMfjrOop3oBhjqz8lv66vt2IttJPT5NV0bNllx5ti4rOtBO+nT439f
 d0Og==
X-Gm-Message-State: APuU4Z8Z3ZMEdFV3lbGVlr4Q7J6/OP7/yJXQ9OZklbTZTC3AcT1VWxHz
 +QzbeGFolCB8G7Rg49kJCGCpE8fp/kiB+XIXWMv0p+XS8deezfVjqi3KoYvvIaYj1UO8/DMUHsK
 zo8Fis/E=
X-Gm-Gg: AZFdTZflm/mOetEtUutEAKH8KpcNgOPm2LpcT5/lXkmjM0kt4xstLjKO0YhAX2WlhWh
 hNCGihbjvCZYA4tEwNlFu+T3YVhxDEHBKW2HVLIqhcZ2M2A+V+wmfrecnFquvt6ELiZAxy6ZmtC
 lYcOoMyjPYOA5qCoQ5HoS6YQTDAMhSMZGtPRCY8/5ckZ9Zbv4cu6Lg50QMZ/lXvbLuWc5g/NRvs
 QMGtSolZnWfMKFewmVvEPeFQ/qfljgnjNCczKIVD3yLu7TVxM1eRGLlsEeIoPSRNdxTvwRBFBna
 EilG2w84ZvJtZ1jRQ8/ZI7sWb1OmRPEZVOOSU1zycpE75HfS+2jBizFukaAfDRXhVSBe7XlvAvO
 rNiaSQ6reJzA9gh/ipZGeoLmuia5duGZaEg3DCyGVtNEKoVKgHqbKw2evzMPYHL5P/XyCpEpm9l
 7rlBZhzSYj3wbOhb08GJmoqd+9J/RX37KYb86QOBExfQIbQLeJfGYfBfYSzA6x6/67YZFa8j2Ah
 Kp6Lgi0t1+JYJ1MoGbPb8ikXOkcjfq1I41s+eP0RNjZxuF8GYCnotQAQH6rmm3G8a9fsexBYLlG
 dzrJPJnvYmN8GDCqp4VvIcMPDSPz54n7Y2g8ZS8n8O6Hpy4B6X+UJvK53Y5thHIbFp1fCBLrj9K
 9uY8kE1QOrz72E4l0odNRIriCC2k9h0E87gHq/bXW4GehuL++Iig1GPJMaa4wWfjqlTdwh7AwXR
 ak8wB+Cd3nXeftbG0M+8B6cYmXD/zFdJN9IvtG7kb9SRTQ2sfOpfwrM3LIK5d5eTpKzyXU4gbCz
 1cdlSD+JU7cffWE+9mCJw==
X-Received: by 2002:a17:907:2494:b0:c50:850d:7317 with SMTP id
 a640c23a62f3a-c513a531115mr1034136866b.2.1795521885794; 
 Tue, 24 Nov 2026 04:04:45 -0800 (PST)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-dc0e-c162-ac5f-4bbe.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:dc0e:c162:ac5f:4bbe])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513ae67bd3sm499466766b.27.2026.11.24.04.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 04:04:45 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Nov 2026 13:04:35 +0100
Message-ID: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/9] package/flutter-engine: never build the
 GLFW shell
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When BR2_PACKAGE_LIBGLFW is enabled, --build-glfw-shell is passed to
flutter/tools/gn. On Linux, the GLFW shell adds the
//flutter/shell/platform/linux/config:x11 config, which is removed by
0002-remove-explicit-x11-dependency.patch. When the desktop embeddings
are also enabled (i.e. with libgtk3), gn then fails:

  ERROR Unresolved dependencies.
  //flutter/shell/platform/glfw:flutter_glfw(//build/toolchain/custom:custom)
    needs //flutter/shell/platform/linux/config:x11(//build/toolchain/custom:custom)

The GLFW shell is just an example desktop embedder which isn't installed
by the flutter package.

Always pass --no-build-glfw-shell and drop the optional libglfw dependency.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-engine/flutter-engine.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index e1c56ee62b..8c0bdad667 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -75,6 +75,7 @@ FLUTTER_ENGINE_CONF_OPTS = \
 	--embedder-for-target \
 	--linux-cpu $(FLUTTER_ENGINE_TARGET_ARCH) \
 	--no-build-embedder-examples \
+	--no-build-glfw-shell \
 	--no-clang-static-analyzer \
 	--no-enable-unittests \
 	--no-goma \
@@ -130,13 +131,6 @@ FLUTTER_ENGINE_DEPENDENCIES += libgles
 FLUTTER_ENGINE_CONF_OPTS += --enable-impeller-3d
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGLFW),y)
-FLUTTER_ENGINE_DEPENDENCIES += libglfw
-FLUTTER_ENGINE_CONF_OPTS += --build-glfw-shell
-else
-FLUTTER_ENGINE_CONF_OPTS += --no-build-glfw-shell
-endif
-
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 FLUTTER_ENGINE_DEPENDENCIES += libgtk3
 FLUTTER_ENGINE_INSTALL_FILES += libflutter_linux_gtk.so
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
