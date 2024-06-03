Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A488C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 11:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D751841579;
	Mon,  3 Jun 2024 11:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-EeMPyfM87B; Mon,  3 Jun 2024 11:53:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36B534157A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36B534157A;
	Mon,  3 Jun 2024 11:53:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 977EB1BF383
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82C52406AA
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RmCrvKkmCXCb for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 11:52:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B91F406AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B91F406AB
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B91F406AB
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 11:52:38 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52b82d57963so4336177e87.2
 for <buildroot@buildroot.org>; Mon, 03 Jun 2024 04:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717415556; x=1718020356;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=21UFWOVnYW8FI4pO+T6CqSbeOWzlIFQSkCQzYFe8WgY=;
 b=RB6Ane5jlxUj3PUNkANxSaOyhGLbiQdzTx951Ms+AcTKVUWOXw5RdNdSTRO4tzZdaT
 vkD1AyEpacjksG3Bx4TIuCiQIFwGCBz+kWTyYNgfbrUd3r0GN6fbWYdIpztMcer4/egr
 6BPqYkruJ36b1MVeNc4e6JrQNk9xpg0a7S8bWJ2DuWN4Wa4M5IH0zCHjFJ98b2O+fyBE
 cYHEgwBvZWEEpN92kzBTDdCArs9ppPrx6H594K02jaSujwv7kMDyotzaIJG7m6cbzib6
 S925lYSo2QrwbrAAU/NdR5YuP2oX2DSUMH0u++UmKyFXPkqPm/1FjM4Z/MINj+EneWkO
 xN6A==
X-Gm-Message-State: AOJu0YxPRgadgVTDGdTlyL2vI3Ee1LTeW89DWwAcPGubcARuq+Drk5WV
 pGqjOA6CG5CxJquRH8qN3dYU390nScrIu50nN3IHxHwhb0IyTRA9QpZMydJR
X-Google-Smtp-Source: AGHT+IE+KPui7aCfGTXtD8A+64UYczF+BSYdCqKDAQnPxizfbBVhHseLNZVorklmogHcLuUoP6ItQA==
X-Received: by 2002:ac2:5209:0:b0:52b:8343:619a with SMTP id
 2adb3069b0e04-52b896aa823mr5383111e87.30.1717415556196; 
 Mon, 03 Jun 2024 04:52:36 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b96035a33sm529058e87.294.2024.06.03.04.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 04:52:35 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 13:51:50 +0200
Message-ID: <20240603115206.3583474-7-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240603115206.3583474-1-roy.kollen.svendsen@akersolutions.com>
References: <20240531151325.2443323-9-roy.kollen.svendsen@akersolutions.com>
 <20240603115206.3583474-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717415556; x=1718020356; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=21UFWOVnYW8FI4pO+T6CqSbeOWzlIFQSkCQzYFe8WgY=;
 b=Ro+7Bh6wz4LvbiHzRu+U24wm7B1bXcTaDep/yHS8Rs0W/XKUyi+I4pQz0CXk9Wd1YN
 1yjav02KUnDSCjwMt5LKVz7teWkw3xJnnHl7N5HnmAoF8C5bm3xupqZuKgGyIejTqExs
 uOMmRSQcCZr8HkBEi47dv4+rTP6zeeS6BuW2X/ELj7Owhy7ViDjvH0p4inLs/Fvp6zGI
 zK+CP9bc1DQ4JQESZQBNgwRBt/WdURnuIBgeG430KC9f9/bTwI3KtlvlIREYkNiAgtN+
 j6/ZxaQdeyL6aAvEUDcW9QzRBE7dHl2QEj9qoP1BhcyNZs0a+8kasD2iWhhtzbQ9ttlv
 g3pA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ro+7Bh6w
Subject: [Buildroot] [PATCH v6 07/14] package/qt6/qt6svg: allow building for
 host
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
 package/qt6/qt6svg/qt6svg.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index 25e87dd208..a9d7eaef51 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -37,3 +37,4 @@ QT6SVG_DEPENDENCIES = \
 	qt6base
 
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
