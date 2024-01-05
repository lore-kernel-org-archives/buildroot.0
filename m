Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F5CC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 17:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1348583EBB;
	Fri,  5 Jan 2024 17:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1348583EBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SBwZzLOi1TpZ; Fri,  5 Jan 2024 17:47:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AEBB83EA5;
	Fri,  5 Jan 2024 17:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AEBB83EA5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E73AF1BF2CD
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 17:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEE8683EA5
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 17:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEE8683EA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aMyxIURvPKEg for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 17:47:19 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3FC483EA3
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 17:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3FC483EA3
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d6b4e2945so19292075e9.0
 for <buildroot@buildroot.org>; Fri, 05 Jan 2024 09:47:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704476836; x=1705081636;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qA6LoXxkEb1ofh5Qk0+YylRwPsP6rdJodBO+m5SZTcQ=;
 b=dWQHtPJKs5PFCZUjEhyyE8Ri68hu//8ajp03E6qfShZNmW69LMI9Z8DJeDA5Xrm7MH
 PibEuAagk+jQGVt0Un/u/Y54Wr7iWKCyQqRG9cMpdE8vF25iPQ+iGQzCnbgYFC60O6YU
 nNaQ9bmDQ2WN/OKNJAo8dM7cJIl9uAmIQODZJX428LvKaUfBe19GCiGED+/iSobYiIho
 nP8Klof5aUcEn/X4o84zcWFOZwotErfGVCxRaXTcWaxAcZT5IUHrMZnE2KNxVaGJ7G4R
 qpqJZNyUXHpYEVvtreFuCM61WpEU8f8jmwtjNmFElfVKofpBlnyQaN7CPuNHDrJ2pUdk
 KpdA==
X-Gm-Message-State: AOJu0Yw42c+laMk7m0w9++ZQBu2+CgmPtnr6eQgPh2gPUGTCE0S5YJb7
 ia2dz64JXrgLox9vVSbYKfY+cEI9qYI=
X-Google-Smtp-Source: AGHT+IGVUBN4yhoA4olaFShCTfsAD0fuL0aHGfyryCqOo5WoB6xaPf0bv3MAZc7Cqar66LnQQvpHsA==
X-Received: by 2002:a05:600c:4f50:b0:40d:6582:4738 with SMTP id
 m16-20020a05600c4f5000b0040d65824738mr912520wmq.87.1704476835791; 
 Fri, 05 Jan 2024 09:47:15 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a8-20020a05600c348800b0040d90536582sm2263444wmq.21.2024.01.05.09.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 09:47:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jan 2024 18:47:13 +0100
Message-ID: <20240105174713.733452-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704476836; x=1705081636; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qA6LoXxkEb1ofh5Qk0+YylRwPsP6rdJodBO+m5SZTcQ=;
 b=c2Kgs2z8N+2DXfJNmPp3b5/HMSy01fUxWgK4R8yvyNhfYkHO0nLDy3Dn8JhJo8NWQM
 z/GqAi5K97P7Cklgme3BWKTsjeAWKqMej9s69wACT653mPQcIiuVs439u8UeUUi3zUHp
 xhI8Xm9SYkzXh55C4klPHSdW0bmcj1ni8Qn9eFrCeqLETkoUY3xo9TPjhN/3iRfQ8baP
 sDwtN1axUBaOe3zUFhkTC7dMCJFRTL2L/vHBYYBwZS57ZL+wWMRr9oy/T3Aa24oYCK9d
 5m2OM3hqDilfhnrTPvbmRov6NMBx6T8rZtvnQ4DUjEoetmQ/KE4wgw1sL6N+zGjlGWAy
 MrOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c2Kgs2z8
Subject: [Buildroot] [PATCH 1/1] package/avahi: fix libavahi-client handling
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libavahi-client is built without daemon since bump to version 0.6.32 in
commit 61c056d40bc51f99f8be19b7e77894a5e6565fd6 and
https://github.com/avahi/avahi/commit/54086a11033194e629b6ad7039bcb4fb1628e052

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/avahi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index 2484d8ce5c..728bc4fdd1 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -38,7 +38,7 @@ config BR2_PACKAGE_AVAHI_DAEMON
 # more easily determine if it's available or not.
 config BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT
 	bool
-	default y if BR2_PACKAGE_AVAHI_DAEMON && BR2_PACKAGE_DBUS
+	default y if BR2_PACKAGE_DBUS
 
 config BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
 	bool "libdns_sd compatibility (Bonjour)"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
