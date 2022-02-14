Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CFAC433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 21:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFC5540903;
	Mon, 14 Feb 2022 21:32:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPTHBWhmB8Sw; Mon, 14 Feb 2022 21:32:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECD94408FB;
	Mon, 14 Feb 2022 21:32:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0CAE1BF97D
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAD78401B2
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:32:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WyocfaQIOY1d for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 21:32:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B32CD401D2
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 21:32:08 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso249584wmj.2
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 13:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cinh9BB31s+3wgWwLSFoONBPBddo7JFAHvfv/r3dBVs=;
 b=nz/WSWZ2VfNNep2cCVVIPgjKoPtR74PFREuXuzRuX7zhsy4dul/5ZwVtg8kMnn2FrA
 gpi7tq6kJxg1vGURHh8DR5kF1/BXElziJGbvQPm+dU2S59sZB0T+EQ0OqpOq3N/ykzss
 Gh9PK0LrhoVMpl9nBJ2GebrIp7RQJj30nqSk4qoELvY+RNWKCRsUrXeG/CSGAfOiEg5s
 aNFMxo7vTWWeoVxmeUpC2n+J6Ir++VgSDT2GyZuoPqeqwzjkc9lfust7smngw073II1c
 FptZWvIyJsbrZWhvV5C7x4hKWzlUhLs5W9my1X+QleWIp0xc4CPFabk1i2U8ZHZ/LU1b
 Pd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cinh9BB31s+3wgWwLSFoONBPBddo7JFAHvfv/r3dBVs=;
 b=qd15KvX40JUn/YAMPqORIZT0VlwlthERQBs9WdvOBOhf83O7nQ0msnIjnWwVhBZQp0
 OWurc4kdyIZMoM34FXXJ8LeMapsqV8GoQwHbx0p90L2oIDyDll3Xl3nn4lZdpUb7LV80
 S8qgUJIEwJuMJ1rw0vYT7TpIwYOH2yuFyuF6vME1ege4DKMoKwxg8ReA5jyxgVD2ukWY
 E5fqnFqG+AjOho54X/VzeDXSYraHmlb5oHSuf2UL+xv6lkLGWFwCA2lYbabHIulM+KPW
 Cs3eqr71zyorcCL3Ta7DKAF/eAczELg9NTvkvemp0aqOIEEzGICfBm9TBPxCnZ8KW7IP
 RxSw==
X-Gm-Message-State: AOAM531vp/ntmAXgcFQyLWrnGzg1HaJftY+xgKB+9XldJSkdkvn9Np/r
 +29zP3BNcglgHfh/M12JMhFTeiaii+Y=
X-Google-Smtp-Source: ABdhPJzi/P9+WN9Wu8aRoR3q2aBgPB5bymP9p37+qQ07m4Bh0ZotPpMrLkFGKIe+7rDvoFcf6SDS8w==
X-Received: by 2002:a05:600c:4fcf:: with SMTP id
 o15mr550180wmq.145.1644874326602; 
 Mon, 14 Feb 2022 13:32:06 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id n16sm1153966wrm.19.2022.02.14.13.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:32:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 22:32:26 +0100
Message-Id: <20220214213226.4143188-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5webkit: needs execinfo.h
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

qt5webkit needs execinfo.h since bump to version 5.212.0-alpha4 in
commit df0b0fe6919c0d0f3750f439a3cfa765232bd569:

/tmp/instance-1/output-1/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/inspector/JSGlobalObjectInspectorController.cpp:54:10: fatal error: execinfo.h: No such file or directory
   54 | #include <execinfo.h>
      |          ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/351529f7d928e28fa2db22c6297dc70d21db562b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt5/qt5webkit/Config.in    | 1 +
 package/qt5/qt5webkit/qt5webkit.mk | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 68b679dfcd..ed87efca95 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -21,6 +21,7 @@ config BR2_PACKAGE_QT5WEBKIT
 	select BR2_PACKAGE_QT5LOCATION
 	select BR2_PACKAGE_QT5SENSORS
 	select BR2_PACKAGE_QT5WEBCHANNEL
+	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_SQLITE
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 565c57e813..2084f3af52 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -10,7 +10,8 @@ QT5WEBKIT_SOURCE = qtwebkit-$(QT5WEBKIT_VERSION).tar.xz
 QT5WEBKIT_DEPENDENCIES = \
 	host-bison host-flex host-gperf host-python3 host-ruby gstreamer1 \
 	gst1-plugins-base icu leveldb jpeg libpng libxml2 libxslt qt5location \
-	qt5sensors qt5webchannel sqlite webp woff2
+	qt5sensors qt5webchannel sqlite webp woff2 \
+	$(if $(BR2_PACKAGE_LIBEXECINFO),libexecinfo)
 QT5WEBKIT_INSTALL_STAGING = YES
 
 QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
