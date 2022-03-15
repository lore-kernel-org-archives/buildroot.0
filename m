Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438A2C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 14:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B59B74168A;
	Tue, 15 Mar 2022 14:27:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HDUcrcfWOGfW; Tue, 15 Mar 2022 14:27:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71A4541688;
	Tue, 15 Mar 2022 14:27:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 849151BF48D
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 14:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C68040A11
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 14:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wBucKbcDoFlE for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 14:27:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94547400C9
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:27:24 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id dr20so40764744ejc.6
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 07:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tgZgSB00TyIf/gdeBCPk2ooncvoQxOrHHr2T4eyN9iA=;
 b=QaUJ/53kRfK/DjtLWEnM1CMYhqIyZ6M6L38fcFDx3bW8k3yd28NcupBFOHCnMrzucs
 wvM7jIbjn1M6E019ovJFlCsdVW0H1OCa4dGJScLor+RLbtkviNiFqJ/S2Y/3QnX8uJHK
 BswWwDnqHII40MRVwu9gZJ8iKPLK4J6LJxZpwRwQU0UrHBK+jiP0wbOdBnutCw021QDg
 kHstoVaK7V4VvCxZej7F3nkjFnWqsu7uKHGSNOrBW8Ql/2K9vWST+RVS3QTaqAVyBlGr
 Kw2aVdRAwA2lnfpAmtDS9N2nApiigI9IWVcuUArJuyutQ37Z9E4xlf8YvD5kqvMTls/2
 RNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tgZgSB00TyIf/gdeBCPk2ooncvoQxOrHHr2T4eyN9iA=;
 b=hJpF15Pi5ezBCoDqvCGL6Hh5Ka0db8b68tP7fFRstwRrkHkHWfPSjsSEwhCbzuF6U5
 cmACLUGEVGXYiIH9Ts5HWje97bdwTbuSqj3AW9fVYmDTRzWgH+LD0IlOrnsSuNWYrzEV
 OO2DJ/3rgnJ4niza0fu/cCh2+NPXugFgoMazRJQwxWpTAu6DoXPuhTgzd+opMbY3X5L7
 D12a7/dyuEtKzTmWFyteVELnXeBsd5QGeeilIHDhQ8JWjdk6NARJWZ0APeQ/Vv6XQFnw
 9zVGCTb/dW9BFRBFjuFTl2Vou2vAaqME13z26NlaukfjuWH+3MGjAVOH7uSTFFAu2VCj
 W9vA==
X-Gm-Message-State: AOAM531K/+ak5LDVk3Kb4XaIVaPXV3PBvbnO5TT0QMEyrHq2g+3H2KK8
 bDyLG699lKpRfDk8cMyKyYkyQcN6Z9g3dvuw
X-Google-Smtp-Source: ABdhPJx3kBPhmfM7K6J+RzF/7C/B7mlRrpc0xuWseEmMnMMCl6rVggvMkcsBzT9K63E9U9eLaAhLsA==
X-Received: by 2002:a17:906:b155:b0:6c9:ea2d:3363 with SMTP id
 bt21-20020a170906b15500b006c9ea2d3363mr22329676ejb.729.1647354433946; 
 Tue, 15 Mar 2022 07:27:13 -0700 (PDT)
Received: from localhost.localdomain ([130.185.131.37])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a056402280d00b00416d2f2b8a1sm7506263ede.79.2022.03.15.07.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 07:27:13 -0700 (PDT)
From: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 15:26:40 +0100
Message-Id: <20220315142640.2268645-1-mirza.kapetanovic@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-rpi-gpio: enable package on
 aarch64
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
Cc: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>,
 Ian Haylock <haylocki@yahoo.co.uk>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable the python-rpi-gpio package on 64-bit ARM architectures. I've tested
this with a Raspberry Pi 4 64-bit and Python 3 build and it works as expected.

Signed-off-by: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>
---
 package/python-rpi-gpio/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-rpi-gpio/Config.in b/package/python-rpi-gpio/Config.in
index 4f59ebdb06..f3c0928c62 100644
--- a/package/python-rpi-gpio/Config.in
+++ b/package/python-rpi-gpio/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_RPI_GPIO
 	bool "python-rpi-gpio"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	help
 	  A Python module to control the GPIO on a Raspberry Pi.
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
