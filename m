Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6000C433EF
	for <buildroot@archiver.kernel.org>; Sat,  7 May 2022 20:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 650F260EBE;
	Sat,  7 May 2022 20:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KES7Fy-ZRbwR; Sat,  7 May 2022 20:29:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 717EB60EB8;
	Sat,  7 May 2022 20:29:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD8AD1BF599
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 20:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CA5B60EC2
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 20:29:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G_w2rNmgRZ2X for <buildroot@lists.busybox.net>;
 Sat,  7 May 2022 20:29:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DA5160EB7
 for <buildroot@buildroot.org>; Sat,  7 May 2022 20:29:11 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id bu29so17791687lfb.0
 for <buildroot@buildroot.org>; Sat, 07 May 2022 13:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5SMeU/djECw8UM3N1Scx4UZhXyv9acE8lT2NTgXK/9k=;
 b=Bw4omu7b62hASeWqnaeTVb5dPDDsN/a9ZWmn4eJ2vdlFIJiTPsS3cy9ojJpUfZAIC0
 LaQeIfAl4bQIQKSlUgm1jg1NkAchcduWqV0ehjRaRddZU0y9lYg7/WLmNy4vru84xFKX
 jPgaosclg/9iuibJRTDuw8h6RBfo3xooht+VnS1jvQ3k69XChj+VUodgO+RaVVFQZ0ky
 n+I7wgBpDXp0tpdkBMMnTC1bKtOgp5K1jRvqGUU0q//mVAanQBZIgTOxCUdHPdEdM6tP
 ShYu/9+/h93XwU+F6vzZVu1nY/IB6f1rYiWviSq8+lN1CKt14VfZvDmF7rOSV/gBFULP
 uMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5SMeU/djECw8UM3N1Scx4UZhXyv9acE8lT2NTgXK/9k=;
 b=VquMjLzh6Wprfj5sFyIsSiyb56qRvSt44I876nQyW873Kduz3806i3iqXRkZOj9ACz
 HSBrdT8oHKUF6qnRzPzcHIMA+61xqJOhnfAo48PO+N/v63DygCEfhJyZEQjNss7Z9jH+
 /YL2W/y03OgJykDOnUh/xlCCFkEMMoNJW9FIpssZ+pms+xUPWnPk8Gkx4zaPrNwdB+VC
 DFxjhDAr6PbNPtZSU8jErnUx/UTJn45LRiiBiuuAW/YlUonja6tQM4cpehIuFTqwME3o
 xexg1cL2EykGLbZre2o2VRJc0YWqAj0jCMIzwtboLuP5wKLERP5E5ldLDlQYfwV2OUIF
 pe7w==
X-Gm-Message-State: AOAM531ykvISfiggMl+/rctG7AJyI9VxgXZIF7BsLfWS9CKPsB0HhuU4
 ALL8N0zdb9A9KQkNAS+HizdGmk0Lylo=
X-Google-Smtp-Source: ABdhPJwht4j58w9vhq3TCCZYUM/YVFJr5sd/6UagHMfxOFlCw5R1lM7GGnCF6j3psJ0XhVbXZgZ4lw==
X-Received: by 2002:a05:6512:1111:b0:473:a4c3:f98e with SMTP id
 l17-20020a056512111100b00473a4c3f98emr7276839lfg.389.1651955349207; 
 Sat, 07 May 2022 13:29:09 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 a17-20020a05651c031100b0024f3d1daea3sm1150028ljp.43.2022.05.07.13.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 13:29:08 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 May 2022 23:29:04 +0300
Message-Id: <20220507202905.397732-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507202905.397732-1-geomatsi@gmail.com>
References: <20220507202905.397732-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/xr819-xradio: enable required
 kernel options
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable Linux kernel configuration options required by xradio driver.
Those are wireless networking support, sdio support, and power
management core functions.

Fixes:
- http://autobuild.buildroot.net/results/7ad4a4b6b1612460427e667d98efc6df7b4a2153/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/xr819-xradio/xr819-xradio.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index d4b9826f64..835e229347 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -9,5 +9,13 @@ XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
 
+define XR819_XRADIO_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MAC80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PM)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
