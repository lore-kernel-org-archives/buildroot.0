Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB19FC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 12:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EB0D40022;
	Sat,  8 Jan 2022 12:49:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3V_6GLgVBAfi; Sat,  8 Jan 2022 12:49:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FD63400CF;
	Sat,  8 Jan 2022 12:49:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 98A1E1BF957
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 12:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B38B400CF
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 12:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id df9_A-HQFFoO for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 12:49:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0400A40022
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 12:49:27 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id c66so5659551wma.5
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 04:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yXhy3XO8ZaKkdOI7xvu2L/wEiotVctvApbshIJXXtbc=;
 b=EkTaPxsvSMjXj+t4O+InLSFjIuuHL6KBHPVTrJk9DQrvoZhFRy28kabzztL0xeva0l
 y/a2HjY6N0yuoI5++AIDn6nt+WWkuWvQ8EZSvYNshyw8iNOag3IZJfLMm8ygGYRV3qTj
 Jv1hO41K2SX0QNBnmfnUFQcJN8G2X1H3k4dIisyOyAOWgBrPgSmYIrttroiX+yG06aOO
 H7hjuhucgNA15CM0Z4YEL+VDkWXoAzEhW0CtQaq3+dCGV/m1gNhdecdPh0qk59kdsKUm
 CV4BEyS9R0hvb/wrYWNXbE+hBOmMiBrsrlu7bksdf1wltxPAnBxbxHgHLH5g8HXWOZPr
 yy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yXhy3XO8ZaKkdOI7xvu2L/wEiotVctvApbshIJXXtbc=;
 b=BwP3Hf3OHmbPPKYRscOPSXXFc5wBY+PBI2eJrQXI/aE68vJdtuM42Se2QN/EQUT0uF
 ozxGW/WRCWHDakT/RpuYwRm4zHWXa+Klu37VaKlHy4jPQP/r89EfMI7gkab6N4xlEvsy
 DplcrZsR2KzTIod4XxPzScsyYrFBigPgd9JiBM4GvQd7vw8K/lpOlJVfGk8Fl7/Uzxmu
 fmfv55R4qGoyEMXwS5yfihOLGmE6mShUm84WvV3SevXdp2G4d/YnzlkF4W1xy8TKAe/g
 B1xwhyyy2fFpu5jEmCiSdLsf98u5dQxYbNf/vmQx8PQhxPpknSx/4zNMRvpdtwaZeih4
 RpRQ==
X-Gm-Message-State: AOAM5307gpC+DA+X3BqCLPxi34ZtKljJ3DDWMNrvFtVF3vltB1Xwu926
 CkWx7Brhe6LnQTO6xQtVLxjT1LEiyUp8SA==
X-Google-Smtp-Source: ABdhPJxUWSNDOt/JNtasmhyk/rz437vyBc49uQsAUWmqwnZlkJEjDFn/+PQvAvddzEl4IIh1G7E+4g==
X-Received: by 2002:a1c:2b42:: with SMTP id r63mr14318136wmr.80.1641646166060; 
 Sat, 08 Jan 2022 04:49:26 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id l12sm1596841wmq.2.2022.01.08.04.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 04:49:25 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 13:49:22 +0100
Message-Id: <20220108124922.157020-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/terminology: bump to version 1.12.1
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See:
https://www.enlightenment.org/news/2022-01-03-terminology-1.12.1

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/terminology/terminology.hash | 4 ++--
 package/terminology/terminology.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/terminology/terminology.hash b/package/terminology/terminology.hash
index 7e9658482a..2ad10af76f 100644
--- a/package/terminology/terminology.hash
+++ b/package/terminology/terminology.hash
@@ -1,3 +1,3 @@
-# From https://download.enlightenment.org/rel/apps/terminology/terminology-1.12.0.tar.xz.sha256sum
-sha256  74d2d3b253a77bcb215fc36eedf0ccb59643452e2ef15c510430ffaa6034dcf0  terminology-1.12.0.tar.xz
+# From https://download.enlightenment.org/rel/apps/terminology/terminology-1.12.1.tar.xz.sha256sum
+sha256  f8ced9584c2e9ae87452ce7425fd25b2d3e122c7489785d2917890215c6b5aa9  terminology-1.12.1.tar.xz
 sha256  6863ee700fc82b9c3b82a1627136f6935a9eb68e6a64491f20e00b4023c33622  COPYING
diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index 787c9ad137..c3125c71ec 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TERMINOLOGY_VERSION = 1.12.0
+TERMINOLOGY_VERSION = 1.12.1
 TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
 TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
 TERMINOLOGY_LICENSE = BSD-2-Clause
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
