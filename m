Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7D0C4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 15:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C060A82849;
	Sun,  4 Feb 2024 15:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C060A82849
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cg-72985z7fX; Sun,  4 Feb 2024 15:23:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21F9382862;
	Sun,  4 Feb 2024 15:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21F9382862
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 603241BF47A
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 15:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 466D24174D
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 15:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 466D24174D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ho-ablRRkiy for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 15:22:56 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBBBF41737
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 15:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBBBF41737
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33b0ecb1965so2006872f8f.1
 for <buildroot@buildroot.org>; Sun, 04 Feb 2024 07:22:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707060174; x=1707664974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H2PODZx++LnuF8NukFPP2zQOtEhvZw403i7C0Z5AR1I=;
 b=UbhndfEnz8lCd3DSAVx/eSb3dEeATQwaeGzKrGYGsK9dw0jSAtkZaex79CKAHmNvjv
 Iz6G6EY3n8838TfX4iwRTQ6rmaiDcMcaIWj2iMJBysHNm2VKHwDnCcSOkcoC81+o7h1n
 DqJQN713qekd3dicsGGA2yTSWG8SE1GTsD6P0/tsDIoRBQmpfk2wTl/BRc6dz/Q7tv6l
 9BNv1tUQwLaPWq+a2RD32GZp/bU/djTYPC616vDD9linsvD6D0proIKCVEzBPuXmyT4u
 Zg6r4c3mpH/8rKr5KsqHhoAZvos2APkOdwXJ3dAZDY8lFu/L4y2XYyk3f/RN6v5bkfCI
 O3MA==
X-Gm-Message-State: AOJu0YzWxHlO9Cy5/53zQUNYf1BCOI5opJgowdq0+V3/S/n2wO3ALwkc
 CDN9Aai8LKp5EAMvM4G2eFDpqTjJjh+4YrOCS7MTscZTt5bw4AO+0IKdacejkoo=
X-Google-Smtp-Source: AGHT+IE06S2qULo7VVhf5gwjQg1vzRH6gpihy3ICMCSZsRx7hwx6NZPMDvPcXP3cDZyYK9qjGck8jg==
X-Received: by 2002:a05:6000:18a6:b0:33b:3559:2815 with SMTP id
 b6-20020a05600018a600b0033b35592815mr1638259wri.0.1707060173801; 
 Sun, 04 Feb 2024 07:22:53 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW9oTtxK2HXB1LBbQl5MM9F+2A2jtuEC5F0I7wQgf6S8GpSGSlksmo4WVHaqBJb/jnI7J9K817AEsZz9c8blFC/7h62ryHIqSjYFg==
Received: from landeda.fosdem.net ([2001:67c:1810:f051:9566:1ebe:e5dc:dd49])
 by smtp.gmail.com with ESMTPSA id
 v23-20020aa7d657000000b0056020849adfsm1557363edr.26.2024.02.04.07.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 07:22:53 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 16:22:50 +0100
Message-ID: <1bfeb8d9649b7bb7fcd44cab8b5bd811bf389c0f.1707060159.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707060159.git.yann.morin.1998@free.fr>
References: <cover.1707060159.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707060174; x=1707664974; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H2PODZx++LnuF8NukFPP2zQOtEhvZw403i7C0Z5AR1I=;
 b=AQIiFC/FEND5HHMt/Ugcfg6N35RHxfUgqm+aFs7jNZd+PiNUlDNz6o4/JCNgH267Br
 CG+WYWp/vxBfBXrd5irbXhbiFtefnUPpmUk6g7+H0Qp+kZ2aQ8W2ZHxUUVQ783bW7zaF
 wOi8yzq2njLKCcxJa3iGq3c+XfzkoHzuXgU7unMHkkI62BSzkJrzzmcQe/sTdVlqiByz
 2Ha6jIVxobAXerLFBqxbJVS5D2SG7pnEdVGMG9nYucDbQ/B9NsoxesSAhDkvHiKtBjSz
 pMScoQELNuzbovLisJoNVLvFw4sX+z6ZY/NwnTzUREH/pQAzrGW1KeoChtbVhMJLrmUu
 Xv1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AQIiFC/F
Subject: [Buildroot] [PATCH 3/4] package/v4l2loopback: drop _CPE_ID_VENDOR
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 1edb9d691dec (package/v4l2loopback: add
V4L2LOOPBACK_CPE_ID_VENDOR) added that variable, but set to its default
value.

This is however not required to define a valid CPE ID, as it also
defines a non-default CPE_ID_PREFIX.

Drop V4L2LOOPBACK_CPE_ID_VENDOR now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/v4l2loopback/v4l2loopback.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index 84e1927ce3..50a168fcab 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -8,7 +8,6 @@ V4L2LOOPBACK_VERSION = 0.12.7
 V4L2LOOPBACK_SITE = $(call github,umlaeute,v4l2loopback,v$(V4L2LOOPBACK_VERSION))
 V4L2LOOPBACK_LICENSE = GPL-2.0+
 V4L2LOOPBACK_LICENSE_FILES = COPYING
-V4L2LOOPBACK_CPE_ID_VENDOR = v4l2loopback_project
 V4L2LOOPBACK_CPE_ID_PREFIX = cpe:2.3:o
 
 ifeq ($(BR2_PACKAGE_V4L2LOOPBACK_UTILS),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
