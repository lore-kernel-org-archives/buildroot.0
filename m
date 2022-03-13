Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2420BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 09:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF749825BF;
	Sun, 13 Mar 2022 09:23:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6X6P3KJdHb0c; Sun, 13 Mar 2022 09:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DF8682572;
	Sun, 13 Mar 2022 09:23:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 991ED1BF2A6
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87FB740997
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mywVl3J-Ibnb for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 09:22:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9648040993
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 09:22:50 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id l10so7644061wmb.0
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 01:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y24MGNHjbLwvT6X3+1RGipleAXlLJtRngZ3a18KZX3E=;
 b=QqC6n5Q11g152JgZQQzUst7gvhYGzZ+cbUkPby720x3/+iwhWu6Jz+B2yBlwuF16vG
 e1vZoY3gx30tZmvgEo7YSCsXJbi2bhS7i2t1eZ2HvST15vqjeXhsFvUZlGgE1zu7taEL
 uCoQQq8iOcpJbM0TyYXq4RZ1LTukMk9yc64YeOrcgGI92AOxlfk/xYkIrxfeigJsp3uK
 TBNbL884AIc0we/BQr2vy5P01irCWQmaehkIFDf2XZb9ME63bRPnYKaHKFr4rWNGHddX
 jeVCvj9zoa1GamQTM6wdHpkUtMar6iuHM0klLttpzRjUq0TRoztR97k+ew5vEoiE3kQ1
 y6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y24MGNHjbLwvT6X3+1RGipleAXlLJtRngZ3a18KZX3E=;
 b=lsiQ0EDbCobcp+cjBPhTSXYMhdAqO+YGR3sOFUMs8HwRchXPE04tOFVLlzSqj/pTSm
 Em19aPPDr3zUFG+x26fw6wXi2SLuB6EA1dTpgmgb5vghsabav4nNhrtzxJtBox+XoV99
 7vqHUrPE6buQ2I7UoIyiqjunrK6k5ea00Fl5BIdYrpX8cxLuPqggm97ustBzIJc3oh4J
 FM0dHV6eWSjKaeAmoRU5SokBgmAguplxMHBOTvbnCPzrn58Evq07g1kXu7dxkTiP++Ha
 IQfLbUwJEUHD4dzmxR2CHBSxFTBve5PFDXqxxnOeuSk+YgMsD9HSqmng6kYmFoeg+FLB
 ffaA==
X-Gm-Message-State: AOAM532GFtJTS7LDRpfchhgOfvyKjmI4TRwNUPv7pROwYpiV432Bpvkw
 pOvPSxk5pWv/F1idIAoREPcp3yx/fDM=
X-Google-Smtp-Source: ABdhPJxcYYNgNVyT9FiFF6lKNC7Fg8p8tmKOkWxeUNOGYezOifdaLdn/g56YmrOb2MQH6H0vJ1VhOA==
X-Received: by 2002:a05:600c:5125:b0:389:cf43:eaf4 with SMTP id
 o37-20020a05600c512500b00389cf43eaf4mr13356065wms.197.1647163368635; 
 Sun, 13 Mar 2022 01:22:48 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p18-20020adfba92000000b001e4ae791663sm11107401wrg.62.2022.03.13.01.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 01:22:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 10:21:48 +0100
Message-Id: <20220313092148.353432-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220313092148.353432-1-fontaine.fabrice@gmail.com>
References: <20220313092148.353432-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/bind: fix libxml2 build
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

Fix the following build failure with libxml2 raised since bump to
version 9.16.26 in commit 8adeaec8afacbc680edebae91524f6144926ac92:

configure: error: Specifying libxml2 installation path is not supported, adjust PKG_CONFIG_PATH instead

Fixes:
 - http://autobuild.buildroot.org/results/648d29e4cfa6a40bb6e54793c044e9c834f03a1b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bind/bind.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index e0c81152e1..63cc948c73 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -74,7 +74,7 @@ BIND_CONF_OPTS += --with-gssapi=no
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-BIND_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr
+BIND_CONF_OPTS += --with-libxml2
 BIND_DEPENDENCIES += libxml2
 else
 BIND_CONF_OPTS += --with-libxml2=no
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
