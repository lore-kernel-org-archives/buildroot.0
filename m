Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B43C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 22:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0B184033B;
	Tue, 14 Dec 2021 22:09:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lYoEUBqrMx-q; Tue, 14 Dec 2021 22:09:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3EE0409BA;
	Tue, 14 Dec 2021 22:09:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F8811BF681
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 22:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 007FE60D62
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 22:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ll0h9KGrRLKI for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 22:08:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BB5D60C2B
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 22:08:59 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u17so34860950wrt.3
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 14:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ULG1hTMxQpyPANXY2z5RMt+n4Yaf9PuBgn29q/AqFdo=;
 b=qP4MtbqSQ7A4HhnT1D8n2KO8iFluR+lBoA4kVy2s45X6VhejoIlem2PdqrQiWIFULL
 1N8qmMvVMpdpraPunAZBLsjr5JIfd/z9fiVCxS67E0DF53hrWXHhaM3qyfgF3KiR5nsl
 slOde0NPnMIr6vvFftGQBwa73SLsfJJpVB6BPY9hrEbexzST28heCYXrBIQFXiIIwUDQ
 gGX1zXDqudkuTycyuwyczUMUMSMgCXdEvHRJbO2dM86ydyrYuIbqeoC+iA2hxjlfO/kL
 kr+NYzGsrYurA3N9va5Ohukg8KLs/DNdIASOPJS3Qc3CdICq9k8aNk+zWXCqceOsJm6Y
 a8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ULG1hTMxQpyPANXY2z5RMt+n4Yaf9PuBgn29q/AqFdo=;
 b=jW9a3GmBwGoWoW6FHTghCbDaDz6JMIcWrSuxoBM5YjuLzTrD0xMVM8lmoJZl2S1xaN
 GG7Ix6q00BYz6VSMUcPVy6ISSS7g00NgYmdd6R/QjjmuFG1NlQg9XDsVKomKs5UXs6kE
 VEI+RPvr10Hse1BOcloZbyYkiwDNvbVoP8UtKIBusKVBTY1Hu4VaMG/wPlbMTMyxOeFO
 8GGZJi92yog9/vrgndalB4s5+B6WA0O77yc65HM1lTb9LLoMqUeA0Zqck1uhICDPEP4b
 KvKn3BYLyVeC+6btLmRgiiI/CqCG3udrRz6V+AgLhjccEOBpuk7lV+2GFVOyM1rkjGdN
 EEjA==
X-Gm-Message-State: AOAM531djvU8gG/KePUXnBT89Ory1RxqOt79Yq3mW33Vlh95Uh0PNOdw
 pplzqT6elEvk1whRvj7KulslnAK1cIkSqg==
X-Google-Smtp-Source: ABdhPJxS3yupkoYML7N85VwkzrQz9sxPBopXL02Xgd6T8wV/hC8fMKwfnpMuFg7qT6mRmbOaWrD1yA==
X-Received: by 2002:a05:6000:1048:: with SMTP id
 c8mr1689984wrx.352.1639519737511; 
 Tue, 14 Dec 2021 14:08:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id v9sm101221wrb.107.2021.12.14.14.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 14:08:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 23:08:27 +0100
Message-Id: <20211214220827.2625100-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pppd: always enable DES support in
 openssl
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

Fix commit 075b01f2f7b5a9241b4bfe76db8f14af0284060c which forgot to
always enable DES support in openssl resulting in the following build
failure with musl:

pppcrypt.c:65:22: error: 'DES_cblock' undeclared (first use in this function)
   65 |  DES_set_odd_parity((DES_cblock *)des_key);
      |                      ^~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/3a7358de6199bb069bd38139747e2d50f9416fd0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pppd/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index ca139a50e9..898d95f0ee 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -3,8 +3,7 @@ config BR2_PACKAGE_PPPD
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_OPENSSL if BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL \
-						 && BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  An implementation of the Point-to-point protocol.
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
