Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4F5C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 18:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BBF260EFB;
	Sat, 30 Dec 2023 18:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BBF260EFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FkJc6dcHLvOu; Sat, 30 Dec 2023 18:13:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 841A160EED;
	Sat, 30 Dec 2023 18:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 841A160EED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B83F1BF29F
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B6416073E
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:13:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B6416073E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CVVwT9EEckSI for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 18:13:38 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF4E860A69
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 18:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF4E860A69
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-336c8ab0b20so4371188f8f.1
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 10:13:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703960015; x=1704564815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bq9x5iyg7Bd/kzx7mVkXaVMzLeSsaNQ2IxnShmuLVk4=;
 b=VinLHdGiNTucKa4a1JwRTn8QZ5dfA6JOWoGrxafBP/qJXpxTNqBWzhd9F3cBdxE0uv
 M4Z7EKWfYNNvRpllaT9NyqTF3Kg3nh5xqtVH2JJ6hCUeWM6wPcyLKV2yf4XU4/fYctu9
 f41OoWl2hxJST4hDz5axfL2X1yfQ3E9AeqYltgyvvI8+0Cl8ZJ69T7o7t/zP43bH30ba
 l9N9+Yb644pc7UuW4aQ/Qt1cfybVTJFM948Fw+hxlKg2h1O3t9efOmaQbK4Wkvkw3gzo
 xDt65kcVm0HpZI/fL/NYzdpinOJUvMEL3DJUOaax/UyD0N+yETtyw43rUmaYTi3jWiJ0
 2KpA==
X-Gm-Message-State: AOJu0YyCLkybIwBUocaRG3205aMkhcBZ9r/RNn3weEGT9JvVh4x9r/gM
 vONHENySnQL5uxEH5Pzf7/O+GKPovQ8=
X-Google-Smtp-Source: AGHT+IF3eDcYeaQdH+XBazY8L5yw7MlzM3ngzOYRJ89oNhHJOrz0mg+48iHD9H3kB7P4virucfeC3Q==
X-Received: by 2002:a5d:5081:0:b0:336:7745:f63b with SMTP id
 a1-20020a5d5081000000b003367745f63bmr7445620wrt.101.1703960015166; 
 Sat, 30 Dec 2023 10:13:35 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e17-20020a5d5311000000b0033672cfca96sm21930828wrv.89.2023.12.30.10.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 10:13:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 19:13:20 +0100
Message-ID: <20231230181320.982102-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231230181320.982102-1-fontaine.fabrice@gmail.com>
References: <20231230181320.982102-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703960015; x=1704564815; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bq9x5iyg7Bd/kzx7mVkXaVMzLeSsaNQ2IxnShmuLVk4=;
 b=hCniHe3bILsEe0HbqA73gyO5aSaVZ/JniNnvNHW4ToIg2R8+o9q2nB3iG6VNWFTC1T
 bU2R3rHvNd85WXz828pL/4kYSg/mj3VMhltFMUo+g2cxbPQm2M9nTpdEtUhPtdhsDVho
 Jqxx5g0Y5F5rg4z8yTZqvTpDKmG0pylORA3D0nUfJ4yhugeXT0Tc6j87aPpMSXl7ZcbJ
 JNg53BB56Ro2uUy/5qIRryk0f+W2RUbxLPhAYeiOW1c+gIc2ptn8HpK59YhZCGyVuNV2
 B6zx94GorSteEve6pfaY46S4uVvYj2Ekcvp+B8kxoQaL3scDXFS5YQEVP3FjXSdJ0GLi
 vC0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hCniHe3b
Subject: [Buildroot] [PATCH 2/2] package/libiec61850: bump to version 1.5.3
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch site to github to get latest release
- Drop LIBIEC61850_IGNORE_CVES as CVE-2023-27772 only affects version
  1.5.1

https://github.com/mz-automation/libiec61850/blob/v1.5.3/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libiec61850/libiec61850.hash | 2 +-
 package/libiec61850/libiec61850.mk   | 7 ++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/libiec61850/libiec61850.hash b/package/libiec61850/libiec61850.hash
index a416ecdb4d..be662bebaf 100644
--- a/package/libiec61850/libiec61850.hash
+++ b/package/libiec61850/libiec61850.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b6d7ffac831e7d9aec3470e45e2f1734071859c95cab4cfe99ffd1091776b3cc  libiec61850-1.5.1.tar.gz
+sha256  a0f396a5e2249398f2432bb9698e3aecdb9de11b28e5af68f7fb8b14bc3b2f44  libiec61850-1.5.3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index a3cfb74b03..276acce1a8 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-LIBIEC61850_VERSION = 1.5.1
-LIBIEC61850_SITE = https://libiec61850.com/wp-content/uploads/2022/03
+LIBIEC61850_VERSION = 1.5.3
+LIBIEC61850_SITE = $(call github,mz-automation,libiec61850,v$(LIBIEC61850_VERSION))
 LIBIEC61850_INSTALL_STAGING = YES
 LIBIEC61850_LICENSE = GPL-3.0+
 LIBIEC61850_LICENSE_FILES = COPYING
 LIBIEC61850_CPE_ID_VENDOR = mz-automation
 LIBIEC61850_CONF_OPTS = -DBUILD_PYTHON_BINDINGS=OFF
-# Examples aren't build
-# https://github.com/mz-automation/libiec61850/issues/442
-LIBIEC61850_IGNORE_CVES += CVE-2023-27772
 
 ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 LIBIEC61850_DEPENDENCIES += mbedtls
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
