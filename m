Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD38EC54E41
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 11:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 391B240363;
	Tue,  5 Mar 2024 11:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ahgy4TwytuQ2; Tue,  5 Mar 2024 11:11:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AC7141597
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AC7141597;
	Tue,  5 Mar 2024 11:11:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E41F1BF489
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 11:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B3A440363
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 11:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cb5lRHzRjhfr for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 11:11:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3FF2740106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FF2740106
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FF2740106
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 11:11:39 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-412e1b52934so13143985e9.1
 for <buildroot@buildroot.org>; Tue, 05 Mar 2024 03:11:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709637097; x=1710241897;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o7pZ03+VRWFr5+y030M1XxkEygevdCi1CnwtBRU5njY=;
 b=byjC1og4zkxnrLEGJynrpZM7UMuNVMSZQDRs4tEHKXrY42AZ2DnxWDdR1mNHMrzk/D
 J2JuAgUm9/AzHsKmcSZz1Q9Vvv+EmEOjilm8NdbjgfLRVcdypIHg8AN+e8valfx63bzZ
 wXXmohblRBh2JnSVd09qlhwr79CiHElIWlZHhfg0meboTT1Vu60Sg8D2ptjkIXZuDA4L
 7EiR6qhJ8g7/IfXK3YYx0iygr12pm6PZtoJ/IgTgDxL0jUQ8IA1uFQkfZTH3zKQP66iL
 escTYV9aRyIjyUaZ6kqcMEQzPj99Br3tC8zw/tXt0Zeg/0Dc8x6Mp9GfuSSkXVz26UYg
 CULg==
X-Gm-Message-State: AOJu0Yxlnt9Y4q2f0cCjhdwaxOZo297QZ6zrTegRIdJSpFLic1P9KMgd
 nvFMG9zcRpF4/B/kRdXxEnors6lYF4zNnLW+V6kZXz+BBQriEx2aUcE+riLS
X-Google-Smtp-Source: AGHT+IEjw0XL9GY/HK+Doc+6/gRKDJX93IxAYqcHTKbj12zgfJdORejkT2RTivo08YZJCKSWpU/9lA==
X-Received: by 2002:a05:600c:1c06:b0:412:e4aa:f11e with SMTP id
 j6-20020a05600c1c0600b00412e4aaf11emr2107527wms.4.1709637096608; 
 Tue, 05 Mar 2024 03:11:36 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c468f00b00412b0e51ef9sm17716849wmo.31.2024.03.05.03.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 03:11:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Mar 2024 12:11:34 +0100
Message-ID: <20240305111134.298279-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709637097; x=1710241897; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o7pZ03+VRWFr5+y030M1XxkEygevdCi1CnwtBRU5njY=;
 b=Tk+2IDzah1SduuxXYVb20QHODDYVLy7deYLWDPOubNh3p/1bYqEczBSF7/eoPzMykk
 z3+5U0ItjHBh1etXGJVREZSHOOeL6dP2z7A5aQisZjK6TR0IijAamMuXwOXwLMc4ZpAB
 Pv0JEXR/9xYNuIhVtNVl9YFNqokwtAfeJSFFEFGCRuqAy7khfKhmvE4o+mUwBWgm8B9o
 5Id2S0SKRJ08/esdHlz+8GmEEoiRZUaYGrLz8+S/5B+6279WqFcSf1fxQoxLUKG1EZfJ
 HiDPY1u5zC5ZkHrJeU5cqxQeJc5LjnIsPRAfG7bqwVDjY2bXNzSG31LI1a2SE2Wl8Mli
 70iQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Tk+2IDza
Subject: [Buildroot] [PATCH 1/1] package/dmenu-wayland: fix uclibc build
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set -std=gnu99 to fix the following uclibc build failure raised since
the addition of the package in commit
2f6b1b8e6893003efcc72185cd468dcb0b088b2d:

../draw.c:37:23: error: 'CLOCK_REALTIME' undeclared (first use in this function)
   37 |         clock_gettime(CLOCK_REALTIME, &ts);
      |                       ^~~~~~~~~~~~~~

Fixes: 2f6b1b8e6893003efcc72185cd468dcb0b088b2d
 - http://autobuild.buildroot.org/results/4b9db67fb444ec35d741e5d3e74263ac0c4d4a7d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dmenu-wayland/dmenu-wayland.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dmenu-wayland/dmenu-wayland.mk b/package/dmenu-wayland/dmenu-wayland.mk
index 33a73c0153..fec984194c 100644
--- a/package/dmenu-wayland/dmenu-wayland.mk
+++ b/package/dmenu-wayland/dmenu-wayland.mk
@@ -8,6 +8,7 @@ DMENU_WAYLAND_VERSION = a380201dff5bfac2dace553d7eaedb6cea6855f9
 DMENU_WAYLAND_SITE = $(call github,nyyManni,dmenu-wayland,$(DMENU_WAYLAND_VERSION))
 DMENU_WAYLAND_LICENSE = MIT
 DMENU_WAYLAND_LICENSE_FILES = LICENSE
+DMENU_WAYLAND_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 
 # host-wayland is for wayland-scanner
 DMENU_WAYLAND_DEPENDENCIES = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
