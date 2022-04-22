Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456BFC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 07:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E03F341A48;
	Fri, 22 Apr 2022 07:47:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oD_i1s1tzTSg; Fri, 22 Apr 2022 07:47:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0B2741A43;
	Fri, 22 Apr 2022 07:47:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DAB371BF3D9
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 07:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAC7941A43
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 07:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qp2Cns-onw7a for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 07:47:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B48941A2F
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 07:47:39 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id c10so9837768wrb.1
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 00:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ibyrUElT/rRn6DnYs/SdaAmRU1/sBqPwjT3KnhmD7Mw=;
 b=FW2YCOERgf4dUfTI1EuBS+GDxdbtX5WjSqS8zCuSrL69E6Tq2XCvX2fGuZ9JJ9V747
 0XLlT1V7jMNI/GP4kWOW3mA/1Sf2gk47Z6P5EUglzGw5kK4zDL780jIeFY3uTJRl/kDt
 aanNrbQUU9nHJvzgILbGwr3kZi1vleIG8g4Q2dAbhF5z63shAnO08V9dlRM8YQIrOT6g
 FTgJIVqQkhLzvsZRsSduwHf614vq61XaHv3dmURcDeOWa/G5eLhwU63S0Z2izGIbZPbl
 BZiBlW5g0RB6nBite3T0KPoO6OlrMBL3NlyOzHWnLP/JfgblAqH3lVFXtPcMf3dJa2MZ
 sqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ibyrUElT/rRn6DnYs/SdaAmRU1/sBqPwjT3KnhmD7Mw=;
 b=6JIJj4SodCdgBj5gkK5iGmYL45OH17GFFhbIfoTsepErrMmcg64UDR8dEpexvwzsUL
 3YZn72XKATf4drJl6h2kzQz6YFBCkMZuzVvXG5waO4KQqjtMSIaaTKvoX0WDNsZcBl07
 Jua+zX4MMmDBZ3xUswbpMacG7MiLEihTULqwGLvNKZJBZ/rN/GbRaBg2t8r7Q/Dw9a/Q
 KzY+QUMxkEScGzDbVsiZOa7KK5Pwqvhm1sKb+hgehxGZF22WOUpBcXaqch1zq+ABledo
 JuYJDz/mgJL4FmA/NpHujr84buz51ddH0UPsxipFUWt//CPSlgtzGp4UkFVVaQzgB9wS
 n87w==
X-Gm-Message-State: AOAM531o+bKYeG1gOEOVslPLh3WQrRRe4pltkQ1gytlnx3CkvF1PD6Wf
 YmNxEUaSDCi55d7RjqSwRFMytXYhFQ4=
X-Google-Smtp-Source: ABdhPJzUBar6wWsv6ovZrbiG1Ap1/6wNdG+8bKJhKwuhWuUpmv8xqPHx3M+k3eyYGuTB4p8QlZLCsw==
X-Received: by 2002:a5d:6201:0:b0:207:8d91:aaa9 with SMTP id
 y1-20020a5d6201000000b002078d91aaa9mr2621696wru.262.1650613657301; 
 Fri, 22 Apr 2022 00:47:37 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c3b1500b003928f20b7besm1008295wms.42.2022.04.22.00.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 00:47:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Apr 2022 09:44:56 +0200
Message-Id: <20220422074456.4104082-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/adwaita-icon-theme: needs host gcc
 >= 4.9
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of harfbuzz to version
3.1.2 in commit 6861933d22006fbe8c961a41506beac826881f33:

In file included from ../src/hb.hh:473:0,
                 from ../src/hb-buffer-verify.cc:27:
../src/hb-vector.hh:206:20: error: 'is_trivially_copy_assignable' is not a member of 'std'
      hb_enable_if (std::is_trivially_copy_assignable<T>::value)>
                    ^

Fixes:
 - http://autobuild.buildroot.org/results/bbc48cb5232c617d4ff1d0bafd63bb3c9c72d556

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/adwaita-icon-theme/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/adwaita-icon-theme/Config.in b/package/adwaita-icon-theme/Config.in
index d200570e76..71b839d996 100644
--- a/package/adwaita-icon-theme/Config.in
+++ b/package/adwaita-icon-theme/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_ADWAITA_ICON_THEME
 	bool "adwaita icon theme"
 	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
+	# host-libgtk3 -> host-librsvg -> host-pango -> host-harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_4_9
 	help
 	  Adwaita icon theme
+
+comment "adwaita icon theme needs host gcc >= 4.9"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
