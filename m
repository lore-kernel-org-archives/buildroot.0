Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC89CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6DE640AE6;
	Sun,  7 Apr 2024 19:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EkUfp98SnQ8P; Sun,  7 Apr 2024 19:14:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2D7540AED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2D7540AED;
	Sun,  7 Apr 2024 19:14:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FEE91BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CE7A60AAD
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQHrej9xSwF8 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:14:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F39860AA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F39860AA5
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F39860AA5
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:14:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41673509e8eso1427005e9.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712517293; x=1713122093;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4P6UsgYJektDuvEMUu1ebR0eu3HY2yOuDL64TDHCGvc=;
 b=mr0bgGxn9VRbgLzg42bBPibNRgT7hBSqNScnUbPuPvf8503ZehP+602p/ZFlhv302R
 /X1rSv4SC8jwj4oIYCbyi9wZaD5xZDDMbGNJPIekjZnSvIpPKq3uJtBJlkq2lSJ97Omh
 NnimZh9+xWHa+42+u4JAFkD5dqb8nNTi4IFiDiNgNUUaRULa0AnipQTybUMAsAllHPmY
 qM73WOKzmEzTHn/BmyhqAX/d5Obq4H9TDoHnslwy2CtyXRA6bUxYwpnHXcKjQJH3Nu5i
 uCWBeBNOnQngtGlTqMaWAe2J3X4d+ZDvsqVPgGYs7cTg0ENucaYPNazYb/JtQGIHwur2
 5cLA==
X-Gm-Message-State: AOJu0YyoFsnYPXqv9qBu7NvBQcLxdzXJft5HFR3wbEJkJKI2byKy/smx
 bf6N7eMb8nFT4316S6znrS/vtYVVDBH1Ii1rLiNNd7MpYgVR4hrpVRZDS0bV
X-Google-Smtp-Source: AGHT+IEKayQpzeWFRqFLqx31oaUIdhPcNBWsb/cumt914gFnrdK+msLnvYUO/b+2di6+lWMkEgR57Q==
X-Received: by 2002:a5d:6090:0:b0:33d:a944:54c0 with SMTP id
 w16-20020a5d6090000000b0033da94454c0mr4956117wrt.22.1712517292527; 
 Sun, 07 Apr 2024 12:14:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u22-20020a05600c139600b004162b4c6366sm10725454wmf.20.2024.04.07.12.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 12:14:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 21:14:48 +0200
Message-ID: <20240407191448.3267678-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712517293; x=1713122093; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4P6UsgYJektDuvEMUu1ebR0eu3HY2yOuDL64TDHCGvc=;
 b=AbryflHW5wSdqKrL5WxlsMZuEagL71okagz9GYu72tSmqdd6KWyfInp4GPX7uPK8Er
 dioqJW8MVqyupBSAnFFrS/8dHJPfYbooiLp7njeTPyLFsy55x7ikHkMgXvTEUASKjBlF
 vvSY1SdGJSdl1aEqbcUQWghyqHR2jnW8OPmjVrA1Ap4+jmoV9gP1lJHRYW+CoXAq6JMW
 AHzldyPd1oYRD4bcPu0MfhVMoKtCZLNbqlGqqugtuQWlgVgCI/wtB9Tk0+cygeuplx7r
 klw0P9Lb9HoZ+28Gfi9ET/F5urVRx/P6X6PDbBK2F3qiaWshjh2hACleYXqjuGT5MJRT
 IeEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AbryflHW
Subject: [Buildroot] [PATCH 1/1] package/links: bump to version 2.29
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

http://links.twibright.com/download/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/links/links.hash | 2 +-
 package/links/links.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/links/links.hash b/package/links/links.hash
index 83b27aeb9d..36a4b90592 100644
--- a/package/links/links.hash
+++ b/package/links/links.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f05b3577f25dbe63e491c424f0ecb31f7bfadce9b2bc2f111dfed049c004c9cb  links-2.26.tar.bz2
+sha256  22aa96c0b38e1a6f8f7ed9d7a4167a47fc37246097759ef6059ecf8f9ead7998  links-2.29.tar.bz2
 sha256  92deeb70791366630095d4e0714fe37d6e2bd5db0e6ef498ebb8de328f45b253  COPYING
diff --git a/package/links/links.mk b/package/links/links.mk
index a861fd657a..30a26b2740 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINKS_VERSION = 2.26
+LINKS_VERSION = 2.29
 LINKS_SOURCE = links-$(LINKS_VERSION).tar.bz2
 LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
