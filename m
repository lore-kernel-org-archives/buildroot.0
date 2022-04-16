Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FA9C433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 21:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 201E260C33;
	Sat, 16 Apr 2022 21:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q2Pivy16WKzw; Sat, 16 Apr 2022 21:10:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35DAB60B86;
	Sat, 16 Apr 2022 21:10:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECE401BF341
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 21:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB151818DC
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 21:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BdtDoL_8-OtL for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 21:10:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F6448188B
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 21:10:03 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t1so14407365wra.4
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 14:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gwxnGB916duOuke3Fkf1EHj86pHgQ7uT7pDhVictZDQ=;
 b=hBVQKCOMIXXSTAuM+4ApbFYIz+JPU0pHwXXX7VBtLLXCDr252hFHbtqwMjwJFMYKNH
 xQPuSqKUNhEVkNtzYhase4n9iEXennmiQx9WEenO30HEKpbw45Ik0EchOjlEMoa7j8mv
 nZIfYL6W9TH+Qgd4+PcqWn28Z9zwMid1HMptBxSkDr7am64haN9OJwm6Oj3yukkpN8dD
 5dmB89MH5vwPoZ4Lw3l4EjH5JcC7F3y6YwmcliF1HSA2M6ftBdJWXpJTMHPZ9N+P14EF
 4HFEpW1IO1ewvxIe2nbICnKVKrb77g6eWwgMj257BDw4iYnO0mLKF1bGlNXOi9jiqF9v
 m9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gwxnGB916duOuke3Fkf1EHj86pHgQ7uT7pDhVictZDQ=;
 b=AkiQDaE5mdHOUof/5VoKO9cxv8Lq08jmk5WkOQmyWd9fZYxVdt0Jcuc60iri0+cYqy
 Cw1e/1MVxeLNkY1R5icO89Px0mUks/FtYnHgi0uI1m/wxq485v9wawkn8dHy/J7cZjX+
 pjyZ/49uu/NAeZlrU6ZJJ2iPh2aa12Zeg/nJmt8nDc+dEDICqMbBMdYOaIIyCeZBZrNj
 YJjVdUutd9tyDe6BsVE/fS9XNTXPYDb8UPfof1tVk1cHTMIc0ux8XwPkiW7gIjzKhtNr
 ndq0kLmr9LxQd9Q1PogWhLm8LYsBqntF9O4xk+5r0q8zEHoFH5kb66/NxvSyO3t6uG5o
 t8pg==
X-Gm-Message-State: AOAM532Yb7ieTyY/Qev3pncnYqD0IcX9jz5C9q57ZtowGnFJ8onQimcD
 I0zLAiiUYiPWKj4/ZZk/EYUnpuTEFyw=
X-Google-Smtp-Source: ABdhPJxarrzGgV9BsCkVxe1nqAiU3Z7JlDRkm1VLzBmiQZAObsaS4SeWMJBEyA4o92Iq+XVegQXvBA==
X-Received: by 2002:adf:fa09:0:b0:207:9af2:d7b4 with SMTP id
 m9-20020adffa09000000b002079af2d7b4mr3452892wrr.544.1650143401500; 
 Sat, 16 Apr 2022 14:10:01 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 2-20020a056000154200b00203ee1fd1desm7003298wry.64.2022.04.16.14.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Apr 2022 14:10:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Apr 2022 23:07:50 +0200
Message-Id: <20220416210750.3065016-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220416210750.3065016-1-fontaine.fabrice@gmail.com>
References: <20220416210750.3065016-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/opencv4: add tbb support
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv4/Config.in  | 14 ++++++++++++++
 package/opencv4/opencv4.mk | 10 ++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index 31c32385da..23d34a9d22 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -309,6 +309,20 @@ config BR2_PACKAGE_OPENCV4_WITH_PROTOBUF
 	help
 	  Use shared protobuf from the target system.
 
+config BR2_PACKAGE_OPENCV4_WITH_TBB
+	bool "tbb support"
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # tbb
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # tbb
+	select BR2_PACKAGE_TBB
+	help
+	  Use shared tbb from the target system.
+
+comment "tbb needs a glibc or musl toolchain"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
+
+comment "tbb needs exception_ptr"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 config BR2_PACKAGE_OPENCV4_WITH_TIFF
 	bool "tiff support"
 	select BR2_PACKAGE_TIFF
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index e75f7144de..0563026b18 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -155,8 +155,7 @@ OPENCV4_CONF_OPTS += \
 	-DBUILD_WITH_DYNAMIC_IPP=OFF \
 	-DWITH_INTELPERC=OFF \
 	-DWITH_IPP=OFF \
-	-DWITH_IPP_A=OFF \
-	-DWITH_TBB=OFF
+	-DWITH_IPP_A=OFF
 
 # Smartek stuff
 OPENCV4_CONF_OPTS += -DWITH_GIGEAPI=OFF
@@ -313,6 +312,13 @@ else
 OPENCV4_CONF_OPTS += -DWITH_QT=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV4_WITH_TBB),y)
+OPENCV4_CONF_OPTS += -DWITH_TBB=ON
+OPENCV4_DEPENDENCIES += tbb
+else
+OPENCV4_CONF_OPTS += -DWITH_TBB=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENCV4_WITH_TIFF),y)
 OPENCV4_CONF_OPTS += -DWITH_TIFF=ON
 OPENCV4_DEPENDENCIES += tiff
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
