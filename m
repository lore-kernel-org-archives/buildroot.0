Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B68CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 12:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F5966069A;
	Sun,  7 Apr 2024 12:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGnVKkF-KlkG; Sun,  7 Apr 2024 12:36:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91EEE608A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91EEE608A3;
	Sun,  7 Apr 2024 12:36:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55EC71BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F3564075C
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oEd7hnCmThiK for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 12:35:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 19ECE4072E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19ECE4072E
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19ECE4072E
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 12:35:57 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4163de295f9so3365775e9.2
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 05:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712493356; x=1713098156;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mfPDEX8hiHDOs6ZRyxe6Wt2FBwjPu5Adx0agz/xE4TU=;
 b=saMAWc1Nrp71sA6rZ7+1c3GGWhI/ZeMCyu3sUmk83LakS4Svg0WjyXlKu3zS5XY5a3
 MJ+vBVLRDEowfzsVnnbtX7v9gw/6gvpvDwIpGWocAilJRHhpDwVvfSiU3af9ZXhZxYQ5
 7zuTsDPp8Kds6bcg50PRRqA5K7DyWXwEEF9TKenjWWYhI7DrAwqxA0cnEcnKMC1SB8s3
 W/lsr7xWY+VCW1QIBZk6NSNWt0Rp2yZF8yknNCGLfP8BKl2YXJt4CNx8Ip/UD2o4eZOg
 mz1hTm2r7B/JT7Axyriv1Pzj60DdRoNjnjJKaedc5ZV+dwXWGXGNIR2m0vqueiEfqfzK
 KJ+g==
X-Gm-Message-State: AOJu0YzSKQ9bUD5oqbboXiKbEhHiP+e6ZMFMDNRTL7dedTX6tmDXI4pG
 rY67wb7JsWC2nL02eJI1RcwmdPT8WCILnU6aLENNqJBAljtsXNfbjzGaAmDt
X-Google-Smtp-Source: AGHT+IF+CHvF+fziFF5o3WSfQ1VjhUozsirDnWxkNtb5JxRxaOCqV7IMyqVY4X9+hWI/yutYtQNDCA==
X-Received: by 2002:a05:600c:4f14:b0:416:6a36:147d with SMTP id
 l20-20020a05600c4f1400b004166a36147dmr408002wmq.6.1712493355653; 
 Sun, 07 Apr 2024 05:35:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ay4-20020a05600c1e0400b0041646c5fc21sm3846836wmb.42.2024.04.07.05.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 05:35:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 14:35:50 +0200
Message-ID: <20240407123550.1197187-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712493356; x=1713098156; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mfPDEX8hiHDOs6ZRyxe6Wt2FBwjPu5Adx0agz/xE4TU=;
 b=KmXGD8NPfIEyAUSkXcMtxvy5kXO052560R1Eg3QpKdXVqpYHzQcqAnZuewq0KE/qy0
 EvVKYK+JsStQA+sgBI0PwH87oyjkWp9NXtZoC8ow08QveztysQA7heE+iR0C18XLbrkc
 YM+nbAu0wl2FNEtWrYzbLkeI5wa5x0oal699B7r1QrI9LcJKmqEc2l3eEPpN+VQ1GzTy
 hvcFd8TcWDEykDO3lguvZ1jPIgcPA8U0gw/qlN9giby/vLik9LNGBpcnaFnZZiKv+YQn
 yInnNGkE+c4Sl+2XoCV+qrCVIMPjX5fSObW8Cmpvx3JcV9KvTQgirEs76Zd3tc7LC8a9
 0xgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KmXGD8NP
Subject: [Buildroot] [PATCH 1/1] package/rtty: add libxcrypt optional
 dependency
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-14/output-1/host/lib/gcc/i686-buildroot-linux-gnu/12.3.0/../../../../i686-buildroot-linux-gnu/bin/ld: cannot find -lcrypt: No such file or directory

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/0fd5a118f6173233fc3e9ebc9477948031355dd7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rtty/Config.in | 1 +
 package/rtty/rtty.mk   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/rtty/Config.in b/package/rtty/Config.in
index 198d465713..da5afb8364 100644
--- a/package/rtty/Config.in
+++ b/package/rtty/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_RTTY
 	bool "rtty"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Access your device's terminal from anywhere via the web.
 
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index 8a40f584de..b2fac14432 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -10,6 +10,10 @@ RTTY_LICENSE = MIT
 RTTY_LICENSE_FILES = LICENSE
 RTTY_DEPENDENCIES = libev
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+RTTY_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 RTTY_DEPENDENCIES += mbedtls
 RTTY_CONF_OPTS += \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
