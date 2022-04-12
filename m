Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437E9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA0A583F99;
	Tue, 12 Apr 2022 18:31:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IIRxmx94llEp; Tue, 12 Apr 2022 18:31:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A241B83F97;
	Tue, 12 Apr 2022 18:31:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71BAE1BF95D
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60130605B3
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:31:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GxR8WojApSIW for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:31:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37F0F60595
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 18:31:18 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ks6so14397591ejb.1
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 11:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QRmyGRQXyccZENvi5nwGxxWrDTKa4oItkZ7FUt97atA=;
 b=Vsm/8TdrwWG/24TC3ntMyVVTH6psC0fxoPKaloo0iT5vJQ5zo+KNSIeCcSqWhHXke6
 aB/9YWoYNdEN5yO2k0uvFIEcZ+3y5xL/T7bZgp0R2GHzKfWldvhSEeVcaczXaMeClZyP
 WGpAitosf77xWRPOmAmXB3J85qORcm6uNrDVvwQ9WbBypo0oA/m6l2HsqdH2+I3BKlqi
 +ygXk9MGdcNVZ39DCdk6usoQOUyxLyzbH6Eb8L43eo9/N/aExAlAeMnMtZeq6Yrb/OWa
 t07RjxT5fS2ElvwDxXZsP+gj1+mfBCfFtXE0cRyMgHLtyINxM02ldfoPwfj+KLhCw6R9
 W5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QRmyGRQXyccZENvi5nwGxxWrDTKa4oItkZ7FUt97atA=;
 b=VvsMy/rUHatvEKrrtZaY4hz+uDg6lANz2UlOsg1LPGyWlf+2MjY06OFckh1jhZ1kSF
 dMI5sSI95T0KcQeQ1oTHkoOFE75U0uDewYyFvPNwkaXPVL/ypsTXZPzN3EEkIse9/t81
 B31s4wW1ipnvK+7D+SouEFSa2pS3Ut9VdIRKW0dlfMD5YUMM94CKZI0RKY/88DJapB2h
 /mhnkGQNuzYRZOI5NPOu+kMjiQ6Qu78qjj7rtBhQDErJhrFRFenIQ0gscjxR/K1p6rR1
 eeVV9fvy9Kb5bUwCGtoMYRBT4dedHd+GHuhWq+4xAcXck+G0qY3hB84+f9V94nq51L83
 YHIg==
X-Gm-Message-State: AOAM532M3uHeIPT1BgVktvYRLiUzFrBmUC+CY8Nb0j41fpIDRYkSImh5
 rbK9H1oea5jzfaKrK4e+UyzitLR/ckk=
X-Google-Smtp-Source: ABdhPJyoQo032I2UmsEr3QydvB+oHw/U0u61nTbB8pMzBf37EE2Z0LodP3E+dkuwEu2dGtNU8z/DtA==
X-Received: by 2002:a17:906:4408:b0:6da:bec1:2808 with SMTP id
 x8-20020a170906440800b006dabec12808mr35402366ejo.543.1649788276286; 
 Tue, 12 Apr 2022 11:31:16 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 jt8-20020a170906ca0800b006df9b29eaf1sm13251146ejb.8.2022.04.12.11.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 11:31:15 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 20:30:53 +0200
Message-Id: <20220412183053.142926-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/links: bump version to 2.26
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Tested:
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK

 package/links/links.hash | 2 +-
 package/links/links.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/links/links.hash b/package/links/links.hash
index 0f8cd32937..83b27aeb9d 100644
--- a/package/links/links.hash
+++ b/package/links/links.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2dd78508698e8279ef4f09a3a2a21e9595040113402da6c553974414fb49dd2c  links-2.25.tar.bz2
+sha256  f05b3577f25dbe63e491c424f0ecb31f7bfadce9b2bc2f111dfed049c004c9cb  links-2.26.tar.bz2
 sha256  92deeb70791366630095d4e0714fe37d6e2bd5db0e6ef498ebb8de328f45b253  COPYING
diff --git a/package/links/links.mk b/package/links/links.mk
index 1f1a7a9189..a861fd657a 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINKS_VERSION = 2.25
+LINKS_VERSION = 2.26
 LINKS_SOURCE = links-$(LINKS_VERSION).tar.bz2
 LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
