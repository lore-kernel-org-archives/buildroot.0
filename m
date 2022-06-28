Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96409C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 20:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BE60403F8;
	Tue, 28 Jun 2022 20:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BE60403F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Mip9GFSMiCx; Tue, 28 Jun 2022 20:44:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27521404FE;
	Tue, 28 Jun 2022 20:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27521404FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 369E91BF2A5
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 20:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D64A4018A
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 20:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D64A4018A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qyHF1de0ikz3 for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 20:44:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCC61400F3
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DCC61400F3
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 20:44:37 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 o19-20020a05600c4fd300b003a0489f414cso4763434wmq.4
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 13:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LVyP59wYFLbiU/lVGMmBYoQpDXQzOWcEt9X7fAawkq4=;
 b=ONpyEAUracNBpuDzOvhQnI/Az49R3RPdmOFFuILeG6GCVg1zo9gbdvgqqMeM3Yi1iw
 Dp6nC7yHdmI96CWI3fGBuXrFbvDSas8MS4e3d04OCJG9LCtD3wOJRrRuZ+QLKVliQUkI
 mResr1zhNZGGVfsQkK9WXTqicmtmwGEhBnBU29EydLIWK9Ru75xFLRW5c7S3Du67Wvyy
 3lHXyOMHIX6NN2BZ+/DOXXPkz2Oox7V4EL1+WVwLzb2nBdtq9LQ1J74JA2Wde9AcV2oh
 RIHFfr/ZE4dBBbbs0z5Z61Ot/XnBsAT2M+ucvZcLYQbWLgTLDIUkf5IxQg3rRz+StQ1U
 MAOw==
X-Gm-Message-State: AJIora+XzEH9UY+lp5rKSBCeYKCrwNgzqaPWMBvR8mHNHE2a3UR9IlzV
 MhCF0yF63z8C0445UQSmvAQFh1r8AOY=
X-Google-Smtp-Source: AGRyM1seaXpw7EnsedL5y+nUpv0cJ4fpsHY+LP7EqcDoufPz78+S9ZLHd4ySpyfwCr6GM9caREEvRw==
X-Received: by 2002:a05:600c:1907:b0:3a0:ac8a:7c35 with SMTP id
 j7-20020a05600c190700b003a0ac8a7c35mr1020823wmq.5.1656449076011; 
 Tue, 28 Jun 2022 13:44:36 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a05600c0b4900b003a03be171b1sm610399wmr.43.2022.06.28.13.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 13:44:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 22:41:47 +0200
Message-Id: <20220628204147.2855318-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LVyP59wYFLbiU/lVGMmBYoQpDXQzOWcEt9X7fAawkq4=;
 b=OtKf/S0sliHX2ssEKNoAbxwfGHEmF93Z9buJN4Nhp5HWGjYOMWIzm1xdlKLiuk8e5P
 MXZqntNrhc/vQD7E1QqN5OgR571T+3asiAruLYrr/NffheOg/WfgdJFqXqltUIXt0dh9
 2zTcfrpmSYlEItUL5PzMNbUUiKcMZb1Hgrv9z52cVmKRjnfxOZJrT//lIMJfmUyHSk15
 /HLUOgrpqJzK6IQvLO0BHYgA2c4lS+LvmQCWakl8Vhr2EyD0uVyzOgo12qs/hwpj8+mV
 s4PIpOMMJI4TKU1Pbdf8GKf2wY1I2cRcb8PemF32eLzaGTevMj2FG06PpUt+ifyGXUOm
 KUUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OtKf/S0s
Subject: [Buildroot] [PATCH 1/1] package/libdvdread: bump to version 6.1.3
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://code.videolan.org/videolan/libdvdread/-/blob/6.1.3/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdvdread/libdvdread.hash | 8 ++++----
 package/libdvdread/libdvdread.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libdvdread/libdvdread.hash b/package/libdvdread/libdvdread.hash
index de9afcfa30..7fe0210727 100644
--- a/package/libdvdread/libdvdread.hash
+++ b/package/libdvdread/libdvdread.hash
@@ -1,7 +1,7 @@
-# From http://download.videolan.org/pub/videolan/libdvdread/6.1.2/libdvdread-6.1.2.tar.bz2.sha1
-sha1  789d0780fbdcd7d6dadf0fda3d4a4b6198c16393  libdvdread-6.1.2.tar.bz2
-# From http://download.videolan.org/pub/videolan/libdvdread/6.1.2/libdvdread-6.1.2.tar.bz2.sha256
-sha256  cc190f553758ced7571859e301f802cb4821f164d02bfacfd320c14a4e0da763  libdvdread-6.1.2.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdread/6.1.3/libdvdread-6.1.3.tar.bz2.sha1
+sha1  5e5721ff6ed01a9af9214be0d6563303e8bf2bed  libdvdread-6.1.3.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdread/6.1.3/libdvdread-6.1.3.tar.bz2.sha256
+sha256  ce35454997a208cbe50e91232f0e73fb1ac3471965813a13b8730a8f18a15369  libdvdread-6.1.3.tar.bz2
 
 # Hash for license file:
 sha256  d6cb0e9e560f51085556949a84af12b79a00f10ab8b66c752537faf7cd665572  COPYING
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index 9ddb6721c7..bc486891ce 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVDREAD_VERSION = 6.1.2
+LIBDVDREAD_VERSION = 6.1.3
 LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.bz2
 LIBDVDREAD_SITE = http://www.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_VERSION)
 LIBDVDREAD_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
