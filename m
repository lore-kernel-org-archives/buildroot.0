Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E05C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 10:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0989B425DE;
	Fri, 27 May 2022 10:34:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZqB6p9XPeKwn; Fri, 27 May 2022 10:34:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9A13425D6;
	Fri, 27 May 2022 10:34:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A95C1BF841
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 10:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 684FE84AD7
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 10:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9QLvVZqseUzm for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 10:33:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 357A784AD4
 for <buildroot@buildroot.org>; Fri, 27 May 2022 10:33:55 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id jx22so7832755ejb.12
 for <buildroot@buildroot.org>; Fri, 27 May 2022 03:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TMHWYZ/TXrj+RLB8uKaxad4z53EGLe5MFoK/g84NfAQ=;
 b=JHcDXndYnHR2zqPSywv3uFZJbLcWRWT7BswtIDd8uT5PmRTbeaKt4rYpr2m6rsIcWB
 J+W6zTQ6xdlBetDhjEwNUFEEz6NRWb5MuATvg2gBapBBzd+SI1V89rEOsaBVz1o60TPx
 r/TVLp8bVqWkMPXhjI9XMZNVjQ78ZNsv8wPik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TMHWYZ/TXrj+RLB8uKaxad4z53EGLe5MFoK/g84NfAQ=;
 b=2hHLbenCOihQKbp9DVA0aI2aOtZQCMp80ToQaEvOtn7bDr8TCdA0zoie+dvhiz8qTU
 634S+fDuI0VSlIQ0gt5S50GUkEZ51IMLx2lVRRUoNdZTkXyiSsHjddnMR3L3N+MxksFp
 1pOc0LSpOS2WNv31YXbOfHzjdcQQWUcHPZO7PuIrRVRHtU8r8UstCzEpFFGIla7Cp4vV
 ZhkJD1ro4He2mgwg/tHxSl+c3snJh7IhIWvyL+9yXO64JJ4p2Smz47p3GdVIxmrdEexk
 P51/uoEDp2180v1Ua0qgW/eUxUJKH4CSMZQ0CJlpH79fi3dqxupHg8+bWq5glT3Ryem7
 O6rw==
X-Gm-Message-State: AOAM531NMYEaOkjTMsFqPHpmY95AKO1C3xKKeKYh44Y62sq5rQySaaTk
 nubm11qp4F9gWIzbX4EGXdXAaAzc045/Sw==
X-Google-Smtp-Source: ABdhPJwuphzH1h/wUwTqShF5LgYhbJUhUhFu6fxfWyYCPxc/0UrcFix9a2atO85rfkreXyQOJ5T2Og==
X-Received: by 2002:a17:907:6daa:b0:6fe:b530:8f4e with SMTP id
 sb42-20020a1709076daa00b006feb5308f4emr29868161ejc.423.1653647633436; 
 Fri, 27 May 2022 03:33:53 -0700 (PDT)
Received: from localhost.localdomain (host185251138155.static.fidoka.tech.
 [185.251.138.155]) by smtp.gmail.com with ESMTPSA id
 e8-20020a1709061e8800b006f3ef214e34sm1313306ejj.154.2022.05.27.03.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 03:33:53 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 12:33:35 +0200
Message-Id: <20220527103335.1968203-5-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220527103335.1968203-1-angelo@amarulasolutions.com>
References: <20220527103335.1968203-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] package/rtl8723ds: new package
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
Cc: jagan@amarulasolutions.com,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package adds a driver for Realtek RTL8723DS wifi chip.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/Config.in              |  1 +
 package/rtl8723ds/Config.in    | 10 ++++++++++
 package/rtl8723ds/rtl8723ds.mk | 23 +++++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/rtl8723ds/Config.in
 create mode 100644 package/rtl8723ds/rtl8723ds.mk

diff --git a/package/Config.in b/package/Config.in
index 8892134133..52671dbf89 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -565,6 +565,7 @@ endmenu
 	source "package/rtl8189es/Config.in"
 	source "package/rtl8189fs/Config.in"
 	source "package/rtl8723bs/Config.in"
+	source "package/rtl8723ds/Config.in"
 	source "package/rtl8723bu/Config.in"
 	source "package/rtl8812au-aircrack-ng/Config.in"
 	source "package/rtl8821au/Config.in"
diff --git a/package/rtl8723ds/Config.in b/package/rtl8723ds/Config.in
new file mode 100644
index 0000000000..ef7dd39a68
--- /dev/null
+++ b/package/rtl8723ds/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_RTL8723DS
+	bool "rtl8723ds"
+	depends on BR2_LINUX_KERNEL
+	help
+	  rtl8723bs wifi driver
+
+	  https://github.com/lwfinger/rtl8723ds
+
+comment "rtl8723ds needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
new file mode 100644
index 0000000000..dea403c8d6
--- /dev/null
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# rtl8723ds
+#
+################################################################################
+
+RTL8723DS_VERSION = 76146e85847beb2427b1d4958fa275822f2b04ab
+RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
+RTL8723DS_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
+
+RTL8723DS_MODULE_MAKE_OPTS = \
+	CONFIG_RTL8723DS=m \
+	KVER=$(LINUX_VERSION_PROBED) \
+	KSRC=$(LINUX_DIR)
+
+define RTL8723DS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
