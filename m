Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEB4EB64D7
	for <buildroot@archiver.kernel.org>; Wed, 21 Jun 2023 09:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCB37417F2;
	Wed, 21 Jun 2023 09:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCB37417F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0y0y0uhb_jRF; Wed, 21 Jun 2023 09:08:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA28640636;
	Wed, 21 Jun 2023 09:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA28640636
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D23DA1BF4E5
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 09:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A850641D9B
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 09:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A850641D9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dhwGrBLAlxJj for <buildroot@lists.busybox.net>;
 Wed, 21 Jun 2023 09:08:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80A97401D4
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80A97401D4
 for <buildroot@buildroot.org>; Wed, 21 Jun 2023 09:07:59 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id D1C165FD6F;
 Wed, 21 Jun 2023 12:07:56 +0300 (MSK)
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Wed, 21 Jun 2023 12:07:55 +0300 (MSK)
To: <etienne.carriere@linaro.org>
Date: Wed, 21 Jun 2023 12:07:47 +0300
Message-ID: <20230621090747.74080-1-avromanov@sberdevices.ru>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/06/21 06:08:00 #21543483
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1687338476;
 bh=8cpYMt2Uj1v1d7NN9IIse3O8ag6SWkl0lASlUZ61QbI=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=FhkbJb2nZ7inUaEjQue3ZtL/NIYeXlqRkghiNsLC2dhKDGBchE34zKTzBL2/lQOji
 BMBicQbMc6LRgSN6/0O+3XwDGUC9x6QIac/dGcwK294/lPsqDVyUBYHi0c0rgK6lh8
 dANymfWOAV/jKtCPYWO+jHbr8CJzEKKfAOWgpdAHbR0xgwPM+jVrpJh0ran/kzODe+
 M8yJN1OCjpvzlsAYoV2II03ws8GEaDYk3H77hNGNjHmWe7jK93LFjMH0w3+/LM/QgV
 Y5TEuwh9xD/Vrimf8gHbAi59Hb6wMRxon9JDEbTCfayq+pN2fNVJSn54xFUrTOsqWs
 TfuiLXiof2OtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=FhkbJb2n
Subject: [Buildroot] [PATCH v1] optee-client: add option to set
 tee-supplicant startup priority
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
From: Alexey Romanov via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Romanov <avromanov@sberdevices.ru>
Cc: kernel@sberdevices.ru, Alexey Romanov <avromanov@sberdevices.ru>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In some cases, it is necessary to explicitly specify the startup
priority of the tee-supplicant script in init.d.

In most cases of system operation, the S30 priority is acceptable.
However, there are cases when the user needs to choose the startup
priority of the tee-supplicant.

For example, for encryption/decryption of the user's file system,
OPTEE is usually required, i.e. the tee-supplicant daemon needs to
be running. Usually, such a script runs on the earliest priorities
in the system, for example, S01.

By default, the priority remains at 30, but for specific scenarios,
the user can specify their own priority.

Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
---
 package/optee-client/Config.in       | 7 +++++++
 package/optee-client/optee-client.mk | 4 +++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index cc7f176c77..d074a36b08 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -37,6 +37,13 @@ config BR2_PACKAGE_OPTEE_CLIENT_SUPP_PLUGINS
 	help
 	  Enable TEE supplicant plugin support.
 
+config BR2_PACKAGE_OPTEE_CLIENT_TEE_SUPPLICANT_INITD_PRIORITY
+	string "Priority startup for tee-supplicant init.d script"
+	default "30"
+	help
+	  Use this option in cases when you clearly need to specify
+	  the priority of launching tee-supplicant init.d script.
+
 endif
 
 comment "optee-client needs a toolchain w/ threads, headers >= 4.3"
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 13a9eb6b20..bd977909f8 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -26,9 +26,11 @@ else
 OPTEE_CLIENT_CONF_OPTS += -DCFG_TEE_SUPP_PLUGINS=OFF
 endif
 
+TEE_SUPPLICANT_PRIORITY=$(call qstrip,$(BR2_PACKAGE_OPTEE_CLIENT_TEE_SUPPLICANT_INITD_PRIORITY))
+
 define OPTEE_CLIENT_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30tee-supplicant \
-		$(TARGET_DIR)/etc/init.d/S30tee-supplicant
+		$(TARGET_DIR)/etc/init.d/S$(TEE_SUPPLICANT_PRIORITY)tee-supplicant
 endef
 
 $(eval $(cmake-package))
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
