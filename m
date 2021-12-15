Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC55CC433FE
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 21:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4032403B4;
	Wed, 15 Dec 2021 21:50:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9B_7uNTmafs; Wed, 15 Dec 2021 21:50:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22795400BE;
	Wed, 15 Dec 2021 21:50:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EBDB1BF39F
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 21:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AF17813F2
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 21:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xS0Pmu7zQOFE for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 21:50:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70EC6813C9
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 21:50:30 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so16936810wmb.0
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 13:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fnQ5DZXCyIDCHF7BWd1PH6EGMky9BCIDVdFYN/7lN5Q=;
 b=T08Z+nggtWEhf5FanKZfegwlR6ahX1emRA0BSLZ3TEJ6NpOyeJ4du98E2aFJ2Ln/5p
 la70E6Xi+S3cmY/fur5eBk5NhEOoJJ6/VBQzaLz3ZRqlG0VJkGzP3lalw8v8KxXQ0DWf
 8wqrOrSeUc2xOGS8zHtuzP1OAacd7L9YNWQFAPbPS5txUdb8kGA7GXoVIUPnskwXFg10
 e1mptMPeZdqFkDPdDtkqwt0G3ProCmeQ4EfWftzQHMn1JJzgPx3oFHLDO76OeA0DOs6G
 GaXtd3sgl8MZfv35CCeve/K2CUkflDoWA/p6RmSdvSIzRonn7HM5kOw4EJPC7zg3WAQ4
 cPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fnQ5DZXCyIDCHF7BWd1PH6EGMky9BCIDVdFYN/7lN5Q=;
 b=3wsooQT1xhsq9M5xF/rchsDEyZg6I1wviXKVhtx3omSDmj8YnsXdvKUyS6TSvpsZYH
 roQIUSl6bUnqISftRuW3qm+rVyLRYZsD6JUIHYzkoXx2NDGQvvkE9wtg8188vuqAxVq9
 5YcigSgkhQI+JO4OXrZ6bfkIsmbUUynIVVqCnaSG360Hz2MwZfRLBx9+1VKMC5sppdBq
 PnS61XWehdbGHDOY83/hG/kpior421fnN0asza/0sO5VsZmSctVQhC59p6y6bg1B2Hjb
 mH7X28z0/KqZKtjycnvyZXrmp0i0aXKE0nijsdR6VmuOkaHvkJlUon/1LtACtjLxMQLb
 ooXA==
X-Gm-Message-State: AOAM530OX6GR/T7YUW2fcwE1kJpUT98m/w5y4J0U+Ey3lCWTSnL3Nnw6
 138HpBWGPGFezPPEx5DNhMku/kuf5wWHmw==
X-Google-Smtp-Source: ABdhPJzEMIcPsFdkm9Q/q9vDcOhyU/gAOSPHaZCQ+PfDLk2i/lSK/+wHoUCVMS+KBjlE6PoCuj+wDA==
X-Received: by 2002:a05:600c:1d97:: with SMTP id
 p23mr2059736wms.144.1639605028396; 
 Wed, 15 Dec 2021 13:50:28 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id g18sm3031941wrv.42.2021.12.15.13.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 13:50:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Dec 2021 22:50:07 +0100
Message-Id: <20211215215007.3983784-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/civetweb: fix
 BR2_STATIC_SHARED_LIBS typo
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

Fix typo BR2_STATIC_SHARED_LIBS -> BR2_SHARED_STATIC_LIBS added by
commit db47bc99976c2d4ffb509620a76cfdd369b30559

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/civetweb/civetweb.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 33c3bfdf33..22618fb443 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -54,12 +54,12 @@ ifeq ($(BR2_PACKAGE_CIVETWEB_LIB),y)
 CIVETWEB_INSTALL_STAGING = YES
 CIVETWEB_INSTALL_TARGETS += install-headers
 
-ifeq ($(BR2_STATIC_LIBS)$(BR2_STATIC_SHARED_LIBS),y)
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 CIVETWEB_BUILD_TARGETS += lib
 CIVETWEB_INSTALL_TARGETS += install-lib
 endif
 
-ifeq ($(BR2_SHARED_LIBS)$(BR2_STATIC_SHARED_LIBS),y)
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 CIVETWEB_BUILD_TARGETS += slib
 CIVETWEB_INSTALL_TARGETS += install-slib
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
