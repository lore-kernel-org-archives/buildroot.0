Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C00C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 20:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D93E84B19;
	Fri, 27 May 2022 20:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BZxxq97QdNvJ; Fri, 27 May 2022 20:57:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7F44846DC;
	Fri, 27 May 2022 20:57:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D37B71BF834
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 20:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C228141706
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 20:57:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ppveVItEqiP3 for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 20:57:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 883A1415B6
 for <buildroot@buildroot.org>; Fri, 27 May 2022 20:57:34 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 c5-20020a1c3505000000b0038e37907b5bso5274742wma.0
 for <buildroot@buildroot.org>; Fri, 27 May 2022 13:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FHtT5scfa7kutqnoE2Loz80ErmvRMGW+ZwkIzQkpD14=;
 b=Yy2soomJZNazQBtXWSWCQs4Dg/SYNPf6ToS7Z4FrUDiOIx3I5/wC3ir9/I7aQ75ewG
 04+fp119JJwjBizyySLla4zs+P1vDKjn+0mu8Zq+4eB1On7Wej/7GhjzEU4j0tuidJm3
 VR/SA9rk/0ztG7kbvomhIdOYoC/SxLKZ42qnPicDNTeDeYAquhkn9OeJYWi0+7wA5CKW
 qkLspCYlQbxLNRJxez9G7RIELzvXQU7xoTlCC2MVm+RwJkaeftkQPBZrRLb7oQtp03rr
 sOfMbYbUcra/hC4kuUgKuWHvAkMvPcZJ8GELc2ulTENCYlmst5bjFZmcaPSCDIYBQGOL
 abKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FHtT5scfa7kutqnoE2Loz80ErmvRMGW+ZwkIzQkpD14=;
 b=EmLKw6XJ4P7aYBSg2N/GHBO2m1Y/rxH1Bci7q5lOKXsYs5lbMHLbchWnNscoPrZmr3
 7AxULQxjg9EiI4iWeHst40UbIZCK4uHLfvJQv6K9fAokzl5dNLfXsbwrlJ0da1fxOdFY
 OwvKB9M0mRHKjf8BDPTC2kBTKEKRR2RfQ1WvA7pVbMyKh3YhQnctDGr5XGqL/JPH8tWK
 YWck5oaE0/C5kvfh5gYfi42baLA2So6Nr53jRHfVwIIXHMUv/SjpFNXk3hYQWN5mQX6y
 rF655HPgpqpq98ij2yHUGl1P2UhErZCw9HUDtUfDGi/nIT/eyHN+j0DVildBR6QQZhUV
 +LiA==
X-Gm-Message-State: AOAM533ue0dfxQbo2Yz2IjhPkDsW8V4JOWptPzd5jDh97MHnsfqflcCg
 gfwy7OfoKWrdaS1q6WgqaXSl4QVwlUI=
X-Google-Smtp-Source: ABdhPJzhggi9K6JLQeYFnnTxSdfo7EilcNJ3iIuZkA6B0FQhqIgaHaDTFU79ygJhTzBjk/xBQIH71Q==
X-Received: by 2002:a05:600c:1d28:b0:397:65ef:fb9e with SMTP id
 l40-20020a05600c1d2800b0039765effb9emr8427545wms.136.1653685052284; 
 Fri, 27 May 2022 13:57:32 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a05600c3acb00b003942a244ecbsm2978159wms.16.2022.05.27.13.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 13:57:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 22:55:05 +0200
Message-Id: <20220527205505.1749320-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ola: stageprofi and usbdmx needs
 gcc >= 4.9
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since re-introduction of the
package in commit 16ff948444c3978d63f483344a3d92d994c64312:

configure: error: compiler with C11 support is required to build libusb

Fixes:
 - http://autobuild.buildroot.org/results/7b15e23392805f5109c136a5aa870ddf49f48814

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ola/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/ola/Config.in b/package/ola/Config.in
index 399f7702fc..cfca09a936 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -153,10 +153,14 @@ config BR2_PACKAGE_OLA_PLUGIN_SPI
 
 config BR2_PACKAGE_OLA_PLUGIN_STAGEPROFI
 	bool "stageprofi"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Build StageProfi plugin for OLA.
 
+comment "stageprofi needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_OLA_PLUGIN_UARTDMX
 	bool "uartdmx"
 	help
@@ -164,10 +168,14 @@ config BR2_PACKAGE_OLA_PLUGIN_UARTDMX
 
 config BR2_PACKAGE_OLA_PLUGIN_USBDMX
 	bool "usbdmx"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Build USB DMX plugin for OLA.
 
+comment "usbdmx needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_OLA_PLUGIN_USBPRO
 	bool "usbpro"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
