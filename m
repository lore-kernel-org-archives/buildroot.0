Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADA8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 20:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D823A60F09;
	Mon, 14 Mar 2022 20:32:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMUBJ66YuVPY; Mon, 14 Mar 2022 20:32:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11F5D60EFD;
	Mon, 14 Mar 2022 20:32:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D82BC1BF30F
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 20:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D52CC8271D
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 20:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4wafFqa2quWP for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 20:32:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 458A0825FE
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 20:32:38 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id g20so21576037edw.6
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 13:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t5Gb8Dza0XTHZ2FW/tk92zsYjzylqyJ4JSvOSKykhCA=;
 b=Pi+1Yri3VLn6MV83dTvmR7BwpEg7xyspMahxG28f5b1c0JE4Nm3ASKqjwMI3/9QOA+
 seT36uEsQ+ofNhiePGlfCAz2KOStwy5pS52yg2cjXCcKxzC2riIJBEILybW0TktwCMfr
 TAv08vl8tfjR+LwXycZ+QU3TmRIRvNSIKwOrFe0f7vZlJgoYoiWKvw8KmkStFWOyw+sJ
 YY5kqupQOyrqPyrk/KJNMU7y3kftgUWt5pxRRPEpzJ7+vcQMuubPKmROff6O8Z+JFnr9
 OlodRvT9ojDWXz8HhCfM+fuw9yjJV3beI95vqawioaTIcC9lU9Qo5JNb8VsIpZw+vvnC
 MG0w==
X-Gm-Message-State: AOAM533/nF7pH6bzWl08EJ3eF/PxHwuxvYyBlITWgHD1rpt01Tl+EeJ9
 2SJDRNXiI5RO3Rsidy9VkC8rHgFtb00=
X-Google-Smtp-Source: ABdhPJwTVMo8Rihwap5l7Ez1vCcAlaisiGjbuMGhXgoK4dY5TqSQ97L2CHmqMWbUahlLEP+z7Lfi4g==
X-Received: by 2002:a05:6402:354d:b0:418:2c17:90a7 with SMTP id
 f13-20020a056402354d00b004182c1790a7mr15263146edd.91.1647289956526; 
 Mon, 14 Mar 2022 13:32:36 -0700 (PDT)
Received: from localhost.localdomain (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 da19-20020a056402177300b00413583e0996sm8563753edb.14.2022.03.14.13.32.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 13:32:35 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 21:32:26 +0100
Message-Id: <20220314203226.4481-1-huth@tuxfamily.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] DEVELOPERS: Add some more entries for Thomas
 Huth
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I'm involved in the upstream kvm-unit-tests and the mcf5208 QEMU
machine, so I could help to have a look on these files, too.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 70d71186ed..4083e87d30 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2753,8 +2753,11 @@ F:	utils/size-stats-compare
 F:	toolchain/
 
 N:	Thomas Huth <huth@tuxfamily.org>
+F:	board/qemu/m68k-mcf5208/
+F:	configs/qemu_m68k_mcf5208_defconfig
 F:	package/ascii-invaders/
 F:	package/frotz/
+F:	package/kvm-unit-tests/
 F:	package/xorcurses/
 
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
