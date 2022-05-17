Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18ACFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 10:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C342040BDC;
	Tue, 17 May 2022 10:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ymlJ9_1xcvTa; Tue, 17 May 2022 10:20:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E524640474;
	Tue, 17 May 2022 10:20:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74EA51BF28A
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 10:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70DEF419AF
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 10:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q1rQWXxDWN7i for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 10:20:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E995419AE
 for <buildroot@buildroot.org>; Tue, 17 May 2022 10:20:19 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 202so16521601pgc.9
 for <buildroot@buildroot.org>; Tue, 17 May 2022 03:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RI2og08fyAGor0yfNeDB8r5BNulcDFljo2Dwjr5Dlu8=;
 b=ELjnl2KKjb5bje2e7/PC9HgdLggoDNIM6T1ig+34EhH1tJz1Kwmo0SKf2yKe+OGqY6
 CHLQU3qtcdyXtmRLA9KmXVILZzgAvYNd+TFe2H10BPVsieHIrC/ZVAmBg9abb7SjRuOV
 47hd7eruXgYmtaOXqw5ieqDjolhBVGHKS7zBycGX+c9fxU3VDdzfEnMcCBbmDoCXVd0R
 Xx+Dr7GTjdmqRUF8w5qmwK6ZoaUEznoe7vCoI7tsiRMwvTl1GyBJ3bY+LnEgcGnN30GN
 dRz9G+IkegArheS9Mu9luFv4OrMp2RT9vAw9miBON7GV7yF+CfllRe+0QjKAiX0zn5b2
 WKSQ==
X-Gm-Message-State: AOAM533U9pPKGPEEq1YHnj4y9WmuHbIahrjGpYTesOy+0uosM5Stn2vu
 J1hS54VuET0wyHtwqCgloenbVTe1NY2vkA==
X-Google-Smtp-Source: ABdhPJz+gRpHCPrFENoTTJT9Y7v9D7GimNzuTmz0CRmajLcJZ7Imhoh5dga1m/SDyNB4Nxduqg4UEg==
X-Received: by 2002:a63:85c8:0:b0:3da:eb5d:6def with SMTP id
 u191-20020a6385c8000000b003daeb5d6defmr18673583pgd.96.1652782818331; 
 Tue, 17 May 2022 03:20:18 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 r2-20020a170903410200b001618fee3900sm2990189pld.196.2022.05.17.03.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 03:20:17 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 03:20:15 -0700
Message-Id: <20220517102015.3243417-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/xr819-xradio: enable on riscv
 architecture
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/xr819-xradio/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/xr819-xradio/Config.in b/package/xr819-xradio/Config.in
index 3d2dedf29e..b8acd71bfc 100644
--- a/package/xr819-xradio/Config.in
+++ b/package/xr819-xradio/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_XR819_XRADIO
 	bool "xr819-xradio"
 	depends on BR2_LINUX_KERNEL
-	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be
+	depends on BR2_arm || BR2_armeb || BR2_aarch64 || \
+		BR2_aarch64_be || BR2_riscv
 	help
 	  Wireless driver for SDIO WiFi chip XR819
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
