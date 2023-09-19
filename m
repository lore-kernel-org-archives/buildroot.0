Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8460BCE79A8
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 19:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D59F041E60;
	Tue, 19 Sep 2023 19:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D59F041E60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cd3IMqyZwmNC; Tue, 19 Sep 2023 19:35:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B02FD41E61;
	Tue, 19 Sep 2023 19:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B02FD41E61
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F353F1BF853
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 19:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9FDF4174A
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 19:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9FDF4174A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wbtAJIo1SZs0 for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 19:35:39 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8E3641761
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 19:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8E3641761
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso765786466b.1
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 12:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695152137; x=1695756937;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8LZM/d23bZRgrxeWaaQktaR2Zjjc3Tp5J87nv5x7c1A=;
 b=c7ilVbmjO6dWGC0Pknpy7NkUkln6+4+O/gzKYx1uaEJ43aFycDkXkwXRUPyYnpJwKk
 Suki1TxT2dw5A+fxrsh8UNJRYu6xwhkU8oryyL7KuMLOJN/l+OnkJMjF8LpEx8IUS5Cz
 fWrBXnIBSUmkMIYDa6yYBeRItjm/9yxMlmyIAeaCFPbL2xIId6+sziqCj0tZ4c5k0MOy
 mejzqbvvgo0n4OKGpA+uRerinVtOuAjRByd/F1VOeB7DwklvKqamN5Re0/zYXlEDs8Rr
 bsprHEXergaBBMl+KWJIOw56tRKwYr02zw1xx13hCIY0QVnpRnEcfVCUd34q3saafNod
 BqAQ==
X-Gm-Message-State: AOJu0YxD64M0dtfJWaD6+wwLm4R2XhCxFbxHHB3kvMjlQtiwGXkh3nHx
 tnMY6Ap7VR4DF5G1UJ/kbEcMYplNowI1bQ==
X-Google-Smtp-Source: AGHT+IGz51YOLGIW5igvw9EUnmg4MZlm21kxIUMTgRIyXFCvfdSYA/07E411GutF6Y1v2ld4+kcHAQ==
X-Received: by 2002:a17:907:75f6:b0:9ad:f87c:57a2 with SMTP id
 jz22-20020a17090775f600b009adf87c57a2mr302565ejc.12.1695152136366; 
 Tue, 19 Sep 2023 12:35:36 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-a46f-1ab1-1-97f-1365-4b31-c06d.fixed6.kpn.net.
 [2a02:a46f:1ab1:1:97f:1365:4b31:c06d])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a170906495a00b0099d45ed589csm8131156ejt.125.2023.09.19.12.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 12:35:35 -0700 (PDT)
From: kazemi.ms@gmail.com
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 21:35:14 +0200
Message-Id: <20230919193514.18212-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695152137; x=1695756937; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8LZM/d23bZRgrxeWaaQktaR2Zjjc3Tp5J87nv5x7c1A=;
 b=WExgoac/9kOwbOytG5w6zV5fTaw75DYb++4tn+WJttLCONhWRKLPlJNCm3IaWcPRTw
 qXmtKPUEK3cB7hhc8mrVW4/eeLFq1zZeisqRsDhhUT3FCmv1XJ018Djc1+Snzz8Wvsii
 WBW1RceFQ9AmgPijdYSWEPj25Yh7hudpWcXp7a89pOLggBxtCyZlVCC3Vzlm/8T+xa6y
 Wf/huQQFy7xQpqv1dAcqP0YD33Kdpip/vPApDjf5yKXsy681r3ViWwEi2KJ+UMQjQXvU
 VrZIV57PK3RVn5c+ow6uq83dlo8nATlhnv3bCWw+hf3u/CQIV8kSF3LqMDmI7WCiA9la
 hD4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WExgoac/
Subject: [Buildroot] [PATCH 1/1] package/mxt-app: new package
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
Cc: Saeed Kazemi <kazemi.ms@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Saeed Kazemi <kazemi.ms@gmail.com>

mxt-app is a utility for managing Atmel maXTouch touch controllers
and other devices that support Atmel Object Based Protocol.

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/mxt-app/Config.in    | 20 ++++++++++++++++++++
 package/mxt-app/mxt-app.hash |  3 +++
 package/mxt-app/mxt-app.mk   | 19 +++++++++++++++++++
 5 files changed, 46 insertions(+)
 create mode 100644 package/mxt-app/Config.in
 create mode 100644 package/mxt-app/mxt-app.hash
 create mode 100644 package/mxt-app/mxt-app.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e8b78a8d46..19d637d847 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2604,6 +2604,9 @@ F:	package/agent-proxy/
 N:	Ryan Wilkins <ryan@deadfrog.net>
 F:	package/biosdevname/
 
+N:	Saeed Kazemi <kazemi.ms@gmail.com>
+F:	package/mxt-app/
+
 N:	Sam Lancia <sam@gpsm.co.uk>
 F:	package/lrzip/
 
diff --git a/package/Config.in b/package/Config.in
index e8dbadadf3..e8d39b74b8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -556,6 +556,7 @@ endmenu
 	source "package/mhz/Config.in"
 	source "package/minicom/Config.in"
 	source "package/msr-tools/Config.in"
+	source "package/mxt-app/Config.in"
 	source "package/nanocom/Config.in"
 	source "package/neard/Config.in"
 	source "package/nvidia-driver/Config.in"
diff --git a/package/mxt-app/Config.in b/package/mxt-app/Config.in
new file mode 100644
index 0000000000..2b153901de
--- /dev/null
+++ b/package/mxt-app/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_MXT_APP
+	bool "mxt-app"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	select BR2_PACKAGE_LIBUSB
+	help
+	  mxt-app is a utility for managing Atmel maXTouch touch
+	  controllers and other devices that support Atmel Object Based
+	  Protocol.
+
+	  https://github.com/atmel-maxtouch/mxt-app/
+
+config BR2_PACKAGE_MXT_APP_DEBUG
+	bool "mxt-app debugging"
+	help
+	  Compile mxt-app with debug enabled
+
+comment "mxt-app needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/mxt-app/mxt-app.hash b/package/mxt-app/mxt-app.hash
new file mode 100644
index 0000000000..b7851cea37
--- /dev/null
+++ b/package/mxt-app/mxt-app.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  3639720ae1ea033bd982d68c5cab84432ce046fe14a66d9b2de07f115b642722  mxt-app-1.36.tar.gz
+sha256  3682b125a40a4da00b6ab69bdbd38c25ed4beae69b3fe32458d2e32638477c4c  LICENSE
diff --git a/package/mxt-app/mxt-app.mk b/package/mxt-app/mxt-app.mk
new file mode 100644
index 0000000000..da0aa65328
--- /dev/null
+++ b/package/mxt-app/mxt-app.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# mxt-app
+#
+################################################################################
+
+MXT_APP_VERSION = 1.36
+MXT_APP_SITE = $(call github,atmel-maxtouch,mxt-app,v$(MXT_APP_VERSION))
+MXT_APP_LICENSE = BSD-2-Clause
+MXT_APP_LICENSE_FILES = LICENSE
+MXT_APP_DEPENDENCIES = libusb
+MXT_APP_INSTALL_STAGING = YES
+MXT_APP_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_MXT_APP_DEBUG),y)
+MXT_APP_CONF_OPTS += --enable-debug
+endif
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
