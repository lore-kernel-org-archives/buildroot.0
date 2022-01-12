Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACACC433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 21:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C98A5415D2;
	Wed, 12 Jan 2022 21:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H_aKIusgIurh; Wed, 12 Jan 2022 21:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 142E240986;
	Wed, 12 Jan 2022 21:03:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DD7D1BF578
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 21:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46C7A84C55
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 21:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WAaygYaeCj7a for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 21:03:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 544E984C53
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 21:03:54 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k30so6457783wrd.9
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 13:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ioz9VZkP2mE8KBxNXEoB0i3i0Xr1ccfcRdjPUEIIJHk=;
 b=JlUVkciZhLueslMylwnq435yY7yZcsix5TZGB/RZrO7WgllPp/xm/9NRKzmnEINQtB
 jyJ0ZOwFlRrTRoaw1aWlPNsJqxBVz8SfEN4sbdjjgtCmvbXpFznY+dIuYMXwDuBYMqZI
 00LGcL2eNVpCVpCLvzEUYnHc50YBA2DCPgdyEGxOh71PjN2r1B1Yhz4qulu3yhxBDeVl
 Sersp0GDIfF/zGwCg2UZqHwhYYaJJobkU8tB2BkI0EQ8UkQPoQAazdaDIP9jhWvAkbde
 q6hcXV8dqcJZjJGYInt1/2m5ZzrsNEdOK3MaB1cccDKSj9PFImrM34nfAc+1QrHFChdS
 UFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ioz9VZkP2mE8KBxNXEoB0i3i0Xr1ccfcRdjPUEIIJHk=;
 b=thR198E8mlCTu7FcYX1PG5LyNf9G6VXPc6MoNK+da90JLYEJGG4gDOYCFKylNuqfA0
 mZ4JT3HlXSzzzj5IThgH9Q5wiOGCaGFumund7FFgpJtLeZ08YdadGZJtO0lgXkg5sGZa
 M5Nrwu3gc5ghX0yyDJaRS/m4h7HOsS4hI1Tp1L0E+FOZOMsvgYIN7tOSbUElnLGU6EBk
 BbklhsPo2m28qb81/OskrM7xa5QvNQVt8yx1uQfai0o9OCa1QuxgL8MBlL7yjyRnaMIW
 hgkfm9yDXPIZm8eI4uHPEsxXAQ9MGiyQUT/Th+vSPtFFsU8sxK3fckv0w2byC3gPDAf5
 kpog==
X-Gm-Message-State: AOAM532SDwgpRPP9SLAxsSoJ/e7/xMTiVpA39Man2//XYbLOE2YdS0wS
 BatyiEPsSMvuMU2OSAbaRPDyAULf65Y=
X-Google-Smtp-Source: ABdhPJyCtMb4JGi1SmvI9xq+DOoT/9LvG9XyGDSjS9tfeDZSLFzJUsH2f3Y9rh9rXVe/ngdKRr3waA==
X-Received: by 2002:adf:e78e:: with SMTP id n14mr1289930wrm.631.1642021432505; 
 Wed, 12 Jan 2022 13:03:52 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id l6sm1315878wry.18.2022.01.12.13.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 13:03:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 22:02:19 +0100
Message-Id: <20220112210219.3160627-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/omniorb: bump to version 4.3.0
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/omniorb/omniorb.hash | 12 ++++++------
 package/omniorb/omniorb.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/omniorb/omniorb.hash b/package/omniorb/omniorb.hash
index 5ac8614689..f522c1ef67 100644
--- a/package/omniorb/omniorb.hash
+++ b/package/omniorb/omniorb.hash
@@ -1,8 +1,8 @@
-# From https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.2.4/
-sha1 a6f3c8e96fc09c4ef8d75bd495bbc5256a4773ee  omniORB-4.2.4.tar.bz2
-md5 de961e8aa29f3eed95ea40a94c1cccdf  omniORB-4.2.4.tar.bz2
+# From https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.3.0/
+sha1  c3f12c2278f8c4603910c02c8fe892c1dde7217e  omniORB-4.3.0.tar.bz2
+md5  8889ab13b444b495ca2c2b48ea6a6bd7  omniORB-4.3.0.tar.bz2
 
 # Locally generated
-sha256	28c01cd0df76c1e81524ca369dc9e6e75f57dc70f30688c99c67926e4bdc7a6f  omniORB-4.2.4.tar.bz2
-sha256	126647a6ee062fe46f8f3766965dc62e031c0a31238a347e4bc07aab2ac1e2a7  COPYING
-sha256	eaf5b13ffd5355da7c0b83074e4b798152ff7086c95c4f3045122a06e2673eb9  COPYING.LIB
+sha256  976045a2341f4e9a85068b21f4bd928993292933eeecefea372db09e0219eadd  omniORB-4.3.0.tar.bz2
+sha256  126647a6ee062fe46f8f3766965dc62e031c0a31238a347e4bc07aab2ac1e2a7  COPYING
+sha256  eaf5b13ffd5355da7c0b83074e4b798152ff7086c95c4f3045122a06e2673eb9  COPYING.LIB
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index 4ecbb9d2c9..a1943968f1 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OMNIORB_VERSION = 4.2.4
+OMNIORB_VERSION = 4.3.0
 OMNIORB_SITE = http://downloads.sourceforge.net/project/omniorb/omniORB/omniORB-$(OMNIORB_VERSION)
 OMNIORB_SOURCE = omniORB-$(OMNIORB_VERSION).tar.bz2
 OMNIORB_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
