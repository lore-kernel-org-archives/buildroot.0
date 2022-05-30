Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195ADC433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC9E661186;
	Mon, 30 May 2022 20:50:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KUWs_L4qnaB7; Mon, 30 May 2022 20:50:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6B6960E26;
	Mon, 30 May 2022 20:50:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FF581BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C87160F81
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:49:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vM1J4Ey3q6Uc for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:49:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 878CB60AF6
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:49:55 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id z17so7013069wmf.1
 for <buildroot@buildroot.org>; Mon, 30 May 2022 13:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tMO7zpFBjJ4ZPG3G99Lv1cPejkOA4eMfcsPISYtJLTA=;
 b=BJfstGM+dPONsYNAcet4zgwlAd0LbVLGV9YR0NECy1Cy5Z5l0A4rEFH6jfwo8tR8Lo
 kKPAVvx+mBsq8bKq6+AoDcay0fue5qy9Ttzs9frg8a2qqn3YyjEAcj5Iew0R2qQAvH1j
 a1kU6ikum8c5i/MqEffzqodUw6Rh+OrJWJTzJ0qsB4+OOORjlvnTquFzYrpksgNQZp71
 pxz3/Jw6eWDb/LhkX+y1hdKJhl33UlwBi7XeBZa5HAHuejq5drT30BvarLH8v0BeRaug
 UC0iZG21EMJiOdVkpZ2Ekm8zwp6DrRN1tx5Hv0F/tA5AYIl/hmHiulpdD+uQRLF8p8qs
 hCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tMO7zpFBjJ4ZPG3G99Lv1cPejkOA4eMfcsPISYtJLTA=;
 b=WClUE50HSYlQwHzv+qNGC7ubxCTahZ9wCCLxKCNO7WDG5XKvDn3xZM15FQDqB430kr
 PZ0vVvtyPUXXgYIw0czcP+HTQQMGvQgyAwoUBDm7Jj5fm/B27X54UsVLx8xgShPx2Kd8
 AKUqmQl18fqlZFFbyECHpLtInphAuDzIaBvx/nQEmaNBT47Z6mBrfgMU6kaWgmdQ71Vr
 CW7Mi7pAzDDIy+PQUx71BM1CnfX1A9cUFc6lNiGDCct4Ayfu8ed3NRaST9sqBTvLqpXE
 90xyAJ24kEeJB1yAL5Yk+MnZJu3K5ASsK42N5WPQ2HuxeVGTK65w7gL/VwG5vRh1PNxd
 onaw==
X-Gm-Message-State: AOAM532ojlzfTTEdP2wzD5usucoeNzyDCEqcOqzUrzoSd9zeCmJxRvQG
 9FIr1fiRV/h1pHS7BzxkZtUMlm1aqK4=
X-Google-Smtp-Source: ABdhPJwgAcTqPLOEvqfM+KMWWOu8Q4yGIP52X1wGmq4KtDtiuBoJj0bvZ+lnkY+HqXsyHIyyXh+SwQ==
X-Received: by 2002:a05:600c:358e:b0:397:7042:17a with SMTP id
 p14-20020a05600c358e00b003977042017amr21172382wmq.4.1653943793492; 
 Mon, 30 May 2022 13:49:53 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 x10-20020adfdcca000000b002102baa2370sm6052404wrm.100.2022.05.30.13.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 13:49:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 22:47:16 +0200
Message-Id: <20220530204716.3054785-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530204716.3054785-1-fontaine.fabrice@gmail.com>
References: <20220530204716.3054785-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/gtest: merge
 BR2_PACKAGE_GTEST_GMOCK blocks
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
Cc: Stephan Hoffmann <sho@relinux.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit 6a9c6311f8fd4464b5555773589f587338f694a0, two
BR2_PACKAGE_GTEST_GMOCK blocks are used instead of one which is a little
bit unusual

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gtest/gtest.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index e7ce89a3f4..8ec5e9c535 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -13,10 +13,6 @@ GTEST_LICENSE_FILES = LICENSE
 GTEST_CPE_ID_VENDOR = google
 GTEST_CPE_ID_PRODUCT = google_test
 
-ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
-GTEST_DEPENDENCIES += host-gtest
-endif
-
 HOST_GTEST_LICENSE = Apache-2.0
 HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
 HOST_GTEST_DEPENDENCIES = host-python3
@@ -38,6 +34,7 @@ GTEST_CONF_OPTS += -DCMAKE_POSITION_INDEPENDENT_CODE=ON
 endif
 
 ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
+GTEST_DEPENDENCIES += host-gtest
 GTEST_CONF_OPTS += -DBUILD_GMOCK=ON
 else
 GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
