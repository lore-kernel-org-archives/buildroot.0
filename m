Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A189C433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 14:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA8ED60774;
	Sat, 19 Feb 2022 14:20:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHJuv_NZ0yxP; Sat, 19 Feb 2022 14:20:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEE8760745;
	Sat, 19 Feb 2022 14:20:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B7121BF86C
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 14:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A528409BA
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 14:20:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hm4bKWNjhJzB for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 14:20:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B30F409B6
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 14:20:20 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id i19so6925306wmq.5
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 06:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kVcyhWBiMvpq0SEk/gJWENhpVjyE+OUOV4VebHswsbE=;
 b=ofFmkm9oX3URvCREQU3/Y07n2TTTQYDipiES3Q3DBkQBnakDSX+jkI/bcvHuknEQfg
 +fyDrAhgNgmG8jL1zHaLdDtbNeSNZRmvh1npVVSkxWKisWhZIwKxX/yKcuw1yQF75Tjv
 ThzbKWFhGSV/hzlbYsiKwnyFmU80OJT9ChdUXn4VIBACbwAep6/jsGUlQWhO1vKGspig
 B9VqdsDrrWe95KfHOpjUOo3USJp1igujiUZE6tCjWXnLD5Hhk7USZgB6jFtyky0WcqAN
 BU8jkHJ6lFxUnS5TJtYG4QHfKjwigyZH65Ct1fCiaD2bZSKu8LJVt4N3w/+1iDU0Vqo4
 mw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kVcyhWBiMvpq0SEk/gJWENhpVjyE+OUOV4VebHswsbE=;
 b=0M/x/AbgzRyuARXUPXI2n0m65tsJXUJYfZPVlECmO1EPOforc+Qy91TXd1kJeTcS33
 o/1l/OfA4AUUs09U1zL3YRTXaC6FICFyo1TBBOEGxsqckYDUeyMZFpr7/08/eKVPVKhy
 3Y/kEI/lQG9Urxw94st71l05Nel4O++FipPOcK+9k8vm2tC72rSHkjg5YGsqTU5Wp9bi
 GEu8hPlVm6sg7yCHr6s4lkb/wBRQ5Utz3IdxKpHXOVdt/0r7MrJFTdg8qYqGUwyKUXhQ
 g1b7Ya7xnWcgTP2nQEbSooz97i2ntyj9x5hHOSKyWzXIhBYFBtKiz3lLr60SH8yaPvkp
 fQSw==
X-Gm-Message-State: AOAM532bBdZqfSBuBytMWJBdVJEDSkqa3dhvv7sV2F229Mk5uGQETvNC
 DeG/GBLur89DpbihFasrCBZ0psivDB0=
X-Google-Smtp-Source: ABdhPJwqKCtFqjgB3psuZgxxQ3HQenV5wVvomFUjXfhr/XveG9CFffoo6kQsv9tkCG+NHka0GG2e7w==
X-Received: by 2002:a1c:544d:0:b0:37d:1bdf:d26b with SMTP id
 p13-20020a1c544d000000b0037d1bdfd26bmr14452419wmi.79.1645280418520; 
 Sat, 19 Feb 2022 06:20:18 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c355600b0037bee3a4e00sm2521739wmq.47.2022.02.19.06.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 06:20:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 19 Feb 2022 15:20:27 +0100
Message-Id: <20220219142027.3753330-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/apache: drop
 APACHE_FIXUP_APR_LIBTOOL
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

Drop APACHE_FIXUP_APR_LIBTOOL which was added by commit
b747c29c4e8eb89b7b99658dfd34f4a6b6b0744d but is not needed since the
addition of PPD_FIXUP_PATHS in commit
b06294e9897e90862656416e8b67fdace15488d7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apache/apache.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 5fcb887fbc..b280d4dc3a 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -19,14 +19,6 @@ APACHE_INSTALL_STAGING = YES
 APACHE_AUTORECONF = YES
 APACHE_DEPENDENCIES = apr apr-util pcre
 
-ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
-define APACHE_FIXUP_APR_LIBTOOL
-	$(SED) "s@$(PER_PACKAGE_DIR)/[^/]\+/@$(PER_PACKAGE_DIR)/apache/@g" \
-		$(STAGING_DIR)/usr/build-1/libtool
-endef
-APACHE_POST_PREPARE_HOOKS += APACHE_FIXUP_APR_LIBTOOL
-endif
-
 APACHE_CONF_ENV= \
 	ap_cv_void_ptr_lt_long=no \
 	PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre-config
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
