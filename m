Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C107AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 22:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4925A410C6;
	Mon, 11 Apr 2022 22:14:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M2hwXtUEYEQq; Mon, 11 Apr 2022 22:14:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16942410C2;
	Mon, 11 Apr 2022 22:14:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6344A1BF2B4
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 22:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B69E60E2D
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 22:14:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NOgyTbnh-KjZ for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 22:14:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65ACF60DFA
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 22:14:47 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id k22so6531136wrd.2
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 15:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N/otAzoZpD1FHr6plgI3t3fsb6SRMTN9uUhM9pKDo58=;
 b=mc4I6TZXrafOu+KP/7mOh45wnQhpY7Envw31CjL1Orkm66KwpCiv8yVKUx+rmEWkxZ
 b8AsNMP9suXzJABn912fAh7SquC1qpDXEMaTRO+Oz1Q1X7j7NfBbEpydaCAHkyurnonq
 ZTuGwwvQQ1rhP1LSyxPgJgtccaxKENKR8Dkhulekp8ErE8TQJhn39/DIEYTJ4V1aAWWS
 v0L5uZvrj4GVl3NtU8NNcNKo53ge/Scek4QYDnJK+2BnPUZ6JkT0FdbN2zCNY4/ewTBR
 cdNyM5QAeU7UJtga7QulS+rKKIUXzjOfuAzGUx68oB1kmnsH29kH/6PF441UefGWDGf3
 faog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N/otAzoZpD1FHr6plgI3t3fsb6SRMTN9uUhM9pKDo58=;
 b=HxK8SQG0hlqDIF5bRGfkJJ+FaL+gsykTQL6ylW1EsO9JkdphAV6Hzsl9i9d8YugW8o
 87uW0QMjyc8yI04MX13AoADDE5eFgKG2RtrouNdJiGaUEPD8SHawoQms3pB7p4W9UWBf
 cUJefV4n/Lcn7WTdKIANDqzNyBUfnGyaOuu54zJRGxcz/lPxw1T7JVEceEdD9HNtlGJU
 AY9+ZU8xgEBIE7XktGwiXmLm+wKVmviKy78pjYpVkA2AgJfV40XX+YrKFJZcFeXjiKwm
 hajT7eR9/jH440cUlGDkC7cgW5SPM2RKb8mWD3KMJRsh3ptVdZL785mrrLvQaPXmJVhI
 19Og==
X-Gm-Message-State: AOAM5301HsyUaNjE4+MkvyMiMlc56r8PqBjHvVzROqDIXkjFbuo5CfJe
 L1g6qf4M6aWG+qGqnYtVDB6Q2xOFrNU=
X-Google-Smtp-Source: ABdhPJzyXtMj/1CLs6LlxzDxby2UKbBtJjCEhMm1ETEfRTnHIa+H5CjPAxFn8Jg0V4aILMx4DDZveg==
X-Received: by 2002:a5d:64ad:0:b0:204:2f7:b904 with SMTP id
 m13-20020a5d64ad000000b0020402f7b904mr26416112wrp.458.1649715285490; 
 Mon, 11 Apr 2022 15:14:45 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l28-20020a05600c1d1c00b0038e72a95ec4sm747038wms.13.2022.04.11.15.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 15:14:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 00:12:48 +0200
Message-Id: <20220411221248.609465-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/avrdude: spi needs headers >= 4.8
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SPI unconditionally uses GPIOHANDLE_SET_LINE_VALUES_IOCTL which is only
available since kernel 4.8 and
https://github.com/torvalds/linux/commit/d7c51b47ac11e66f547b55640405c1c474642d72
resulting in the following build failure since switch to upstream in
commit 03fa36df7e6aca0f4a1c8ae2fe691c0cda6ddc7a:

linuxspi.c: In function 'linuxspi_reset_mcu':
linuxspi.c:102:28: error: storage size of 'data' isn't known
     struct gpiohandle_data data;
                            ^~~~
linuxspi.c:110:32: error: 'GPIOHANDLE_SET_LINE_VALUES_IOCTL' undeclared (first use in this function)
     ret = ioctl(fd_linehandle, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &data);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/769021040e5e9293584734e4f461baeaa6dd91cd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/avrdude/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
index 89558a5ff5..cbbd076667 100644
--- a/package/avrdude/Config.in
+++ b/package/avrdude/Config.in
@@ -20,10 +20,10 @@ if BR2_PACKAGE_AVRDUDE
 config BR2_PACKAGE_AVRDUDE_SPI
 	bool "SPI support"
 	default y # Backward compatibility
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
 
-comment "SPI support needs a toolchain w/ linux headers >= 4.6"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
+comment "SPI support needs a toolchain w/ linux headers >= 4.8"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
 
 endif
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
