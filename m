Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D14C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 17:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2329540BAC;
	Wed, 15 Mar 2023 17:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2329540BAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a4PzBeLsWvZH; Wed, 15 Mar 2023 17:05:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55FE940BA8;
	Wed, 15 Mar 2023 17:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55FE940BA8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABFCB1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 17:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85E6181E47
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 17:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85E6181E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANtKQD0qfrUQ for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 17:05:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 164C181E4C
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 164C181E4C
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 17:05:22 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so1500423wmb.5
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 10:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678899921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ko94p/OBg5AjscAnI+AfsyWyW9B/PepRkpF0fpQE1lE=;
 b=W9r+2E9njY80NI4jkjj6VKv1GF62I3Iljn+btxozWuTBP+LyVbJMcH6BgJKVkshW6f
 FI1F0+t76LhlvuaXsevCkJ4GVWkTI6Duxnd5gamP6mbsnMKNUZNuZzy8Sef/oVJ9T8xZ
 ThE81CzsKC1GQ2Sz5Locutug2UAI3IaxQLgZabeQodlwR/6C0dVdIIvxTQ7yAvQPgimD
 oV2tc0sx2baqJXRSglO+pDup9cbsPWfaC014bCkBjKvAmFvXKbHgHsmEhUIt49gwYbks
 FLYZ4FK2s4UdbRMYriYExYxOaEpN/F46imz6E3jJ543cWeu2JaNQjfdxcBT8X+dUlm0Z
 Al4w==
X-Gm-Message-State: AO0yUKUkywNhlTAUfrq/M/Y3lnkn3SLqy6K0fZjQAvQQ9lccCfqlHGE2
 9n36oh+EcYZnCrVjjAe5QlmQCpWxE9L0oJ5TcpQ=
X-Google-Smtp-Source: AK7set8MN5ISVS1asMP6t0yARUi8W6iusGH8osxjvnDFnj+kZu9CRU7y7cywphvqJJ2TzIpS7CdSpA==
X-Received: by 2002:a05:600c:3b95:b0:3ed:1f7f:bbbd with SMTP id
 n21-20020a05600c3b9500b003ed1f7fbbbdmr5663027wms.9.1678899921077; 
 Wed, 15 Mar 2023 10:05:21 -0700 (PDT)
Received: from P-NTS-Evian.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b003ed29899dfdsm2666448wmq.21.2023.03.15.10.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:05:20 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 18:05:18 +0100
Message-Id: <20230315170518.884906-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678899921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ko94p/OBg5AjscAnI+AfsyWyW9B/PepRkpF0fpQE1lE=;
 b=uSg9igiOXTS+J0/Y3Ox7g0KluTydStGcZ1ARe1Lg+j3SGTC//V2+NP/s8rKC6bMMzf
 xjfj14gRNZToFvHvRUzghAs5rTETRq50g/ruFCCJgT9vmEfUr73PtoHpTTLlYVIxg/U5
 7j7jUENm+BP6V6sPV0NZW198PWjXRT5RHs2I67QSyfLgE4737wi46WDvhCNClCOBKgw+
 k6KGBSieA45BUdt1lBc7BL1LCve5bKzJ3kdPJ6kwz9hTeIF9+9CeElNMXEYSZsIMM0HC
 1kbHBQIHKeAUaculznxAed+/Qzg5yz3YUDr32quuOVtp9PfywHZTnr1eMcO8sx1scP0l
 Hxbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=uSg9igiO
Subject: [Buildroot] [PATCH] package/xenomai: fix testsuite install
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
Cc: Pierre Ficheux <pierre.ficheux@smile.fr>,
 Romain Naour <romain.naour@smile.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Pierre Ficheux <pierre.ficheux@smile.fr>

Since commit [1], the testsuite build is unconditionally disabled
although we have the option BR2_PACKAGE_XENOMAI_TESTSUITE to
install Xenomai testsuite on the target.

Handle --disable-testsuite option with BR2_PACKAGE_XENOMAI_TESTSUITE.

[1] 74196b7d059684e555a87e5409c21c56c727066b

Signed-off-by: Pierre Ficheux <pierre.ficheux@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xenomai/xenomai.mk | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index c1ad0c5df6..9356919259 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -41,7 +41,6 @@ XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-user
 
 XENOMAI_CONF_OPTS += \
 	--disable-demo \
-	--disable-testsuite \
 	--includedir=/usr/include/xenomai/
 
 ifeq ($(BR2_PACKAGE_XENOMAI_MERCURY),y)
@@ -87,17 +86,10 @@ endef
 
 XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_UNNEEDED_FILES
 
-ifeq ($(BR2_PACKAGE_XENOMAI_TESTSUITE),)
-define XENOMAI_REMOVE_TESTSUITE
-	rm -rf $(TARGET_DIR)/usr/share/xenomai/
-	for i in clocktest gpiotest latency smokey spitest switchtest \
-		xeno-test-run-wrapper dohell xeno-test-run xeno-test ; do \
-		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
-	done
-	rm -rf $(TARGET_DIR)/usr/demo/
-endef
-
-XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_TESTSUITE
+ifeq ($(BR2_PACKAGE_XENOMAI_TESTSUITE),y)
+XENOMAI_CONF_OPTS += --enable-testsuite
+else
+XENOMAI_CONF_OPTS += --disable-testsuite
 endif
 
 ifeq ($(BR2_PACKAGE_XENOMAI_RTCAN),)
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
