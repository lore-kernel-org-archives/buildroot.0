Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48C9C7EE25
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 13:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 531AF418C5;
	Thu,  8 Jun 2023 13:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 531AF418C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4WU0SCDVoWRo; Thu,  8 Jun 2023 13:55:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8634A418DA;
	Thu,  8 Jun 2023 13:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8634A418DA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D90D1BF3A4
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 13:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82D7B4205F
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 13:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82D7B4205F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fwptJYvA0JOG for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 13:55:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F341F400F9
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F341F400F9
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 13:55:06 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f61530506aso5912765e9.1
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 06:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686232504; x=1688824504;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yeBnMnHJltMOwVbCPjGNk66IOcwXHlvgKnlPGMwRMYU=;
 b=P3duQ095mf+tMLIJ6qZHJ2AohKgO5hjsxd5wOsei1ozTEtDmPD+VhilLynZ2v7Piyh
 TNAj8PUcOSUNyUPLS60ZT7LPkcJNrjxPjPk9cf5gRrHDJz0SqiyW9JaRr7EMcblhGnH0
 a4na1TQAU1h47P1rW183iofcOpOmyRvbaXNlSX93wgwG+1aoAaMjRshbnKxzxwOR4VOI
 gPkuHjEImCC/fMANyUa0V/sS670+6ZX2yTN1MpUQTHi0UBLlKT/sqVuG0MfK2/oCPKud
 iUK3rrg6JowLgclXxgASW7aqXqY+JkRBwfDEbK2D3AO1jMDOIbZaGZyGE3aYPOEVrJCS
 LC6Q==
X-Gm-Message-State: AC+VfDzhTBJthHiPCrgmv0J8HG3VZV/eHuXUYa8DLAG+qDvCkemPH0LM
 zXASxJXn59E3rrfxakAzLC1lVFxt+KkImMpPjPM=
X-Google-Smtp-Source: ACHHUZ7vOBv3dG/TwdH9NDckE2ppytZbVregm8ZwOBqdtpE/y3J3fzby4KjuL/WkOELLlIxxzf9FNQ==
X-Received: by 2002:a05:600c:b58:b0:3f7:8fd5:567 with SMTP id
 k24-20020a05600c0b5800b003f78fd50567mr1614936wmr.2.1686232504606; 
 Thu, 08 Jun 2023 06:55:04 -0700 (PDT)
Received: from P-NAN-LIMA.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a7bc406000000b003f604793989sm5335131wmi.18.2023.06.08.06.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 06:55:04 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 15:54:24 +0200
Message-Id: <20230608135425.1812345-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1686232504; x=1688824504;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yeBnMnHJltMOwVbCPjGNk66IOcwXHlvgKnlPGMwRMYU=;
 b=b9fB2XhVxYICG+FBo0X9oMM5Hme4CWqAen6O0kLgrEqlrUBq3R51/gygoWFGWbvsTM
 Y3vn2UrGN6qNeRWxF7IErpZ35SD7Hx2b9/c4/sj9PNwWAkVeHqQ8PujDOzvT3Nd/vju6
 5WWCLDRpBDMdLXhLodAhQMobqZCDzz5Jpm8bdw5uOOjCCBPCCrKXpYXIWwT1SyKaNE6A
 7Sjr0Juv7p3v0Md0vsfMxQF7I/OW/UVsxRmorHXytfthAxfU4A4ylnG0gtLtvGP6PvRl
 HRgJ1QXcjvfD2r2JesRCG0gVDRCfzL7tXn0O6yGe5WZD2zjfZbersxIocas5eR8xms2y
 sVJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=b9fB2XhV
Subject: [Buildroot] [PATCH 1/1] package/python-make: add missing
 dependencies
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Sebastian Weyer <sebastian.weyer@smile.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Mako imports pygments and markupsafe so it needs to be selected when
selecting BR2_PACKAGE_PYTHON_MAKO

Fixes:
- https://bugs.busybox.net/show_bug.cgi?id=15628

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 package/python-mako/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-mako/Config.in b/package/python-mako/Config.in
index 442e290efa..500137854f 100644
--- a/package/python-mako/Config.in
+++ b/package/python-mako/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_MAKO
 	bool "python-mako"
+	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
+	select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
 	help
 	  Mako is a template library written in Python. It provides a
 	  familiar, non-XML syntax which compiles into Python modules
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
