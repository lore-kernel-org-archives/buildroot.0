Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077B3C46CD4
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 15:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A136C40289;
	Tue, 26 Dec 2023 15:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A136C40289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 43RaQISatvWx; Tue, 26 Dec 2023 15:37:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B77E408D1;
	Tue, 26 Dec 2023 15:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B77E408D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EEA41BF2C5
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 15:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5447F60D52
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 15:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5447F60D52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GBk7wD_Rcd34 for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 15:37:33 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7020D60C15
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 15:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7020D60C15
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d4f5d902dso30721905e9.2
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 07:37:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703605050; x=1704209850;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q+XAN+0RImBWwPhPsBesWpx4tXwNbxiqIjQQmdd5wzo=;
 b=uQ55wQ3t/VehMS3Agd0FkQmPWMXUO8LqCu6SJvUO6KUS3MLWu3Skxl8m+ZeVmBmSgF
 4mw12wTc+pgmPy8dYuDlEeM/w1zQAETXJL9te4/25a6Rjwelp9/DQaXLmMUe24upM0hJ
 IWUB/cgBY/XoGFAnRG2qbIqXMGtIonwKmumwJtGw/Edk3k/JpIiUC6X/YaECTTy2N22X
 +vPr64PEWR1pAfcU9QIsTLfdFyQzOGn5r2j7kSNnccHOvaMG4Hv8vP1lxpc2XehqF0k7
 /aGghJSoY93DRTcUxhlE1kvJKgOHbIp6ZCF6q94r4G6/cORs/lthEJrWf/pfmvL/wRRk
 Y8zg==
X-Gm-Message-State: AOJu0YxO8o1d1ypM36KFnxdf/ZYiaa+CMnL3x7HyG6MBHNTxiQW89LkA
 o3rT/z465g7FfsC175lfmq9FiqOtY1g=
X-Google-Smtp-Source: AGHT+IE910dF9gq5T8b/3fei7KNKxN74LhHKUKJMSf1vxPl7BhBFy7nafoNQdsXTDCHEOw4gbkO2gw==
X-Received: by 2002:a05:600c:695:b0:40d:2376:d4e6 with SMTP id
 a21-20020a05600c069500b0040d2376d4e6mr3970078wmn.101.1703605050364; 
 Tue, 26 Dec 2023 07:37:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 je17-20020a05600c1f9100b0040d1450ca7esm28862392wmb.7.2023.12.26.07.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 07:37:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 16:37:28 +0100
Message-ID: <20231226153728.538814-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703605050; x=1704209850; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q+XAN+0RImBWwPhPsBesWpx4tXwNbxiqIjQQmdd5wzo=;
 b=eGd9pgWrM4RXKxufOxYeCewuROh5BdiKBNG4/x8JaxeRh5JoBmJbdoZXtK4GSK429B
 66CeMMPgf8C5P0PoTyf1u7Ub9rcUB9Z9gxIHH90ScoU4g+DTVQpFKtoTmYZAwvacefdN
 IOQRe9m+batEApnDFEp7oApM5ZUvbJVhbxwXAv+J+YU/+S3xq6IZa5eI0fVk2t5xTCBA
 iD79ALWnluudJvSU90MgcgId3c8p/PVXb+iwAsLurLxMKL7/o5tnEfHEZV7nEy2YWbB7
 RO5oFH8VjBJz5udSMqAAvrGhvlM8N37/05gZgs5JW1PIBMwNyvH/zvIa38jP5r7W9N08
 7EbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eGd9pgWr
Subject: [Buildroot] [PATCH 1/1] package/libraw: bump to version 0.21.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://github.com/LibRaw/LibRaw/blob/0.21.2/Changelog.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...shrink-flag-for-3-4-component-images.patch | 24 -------------------
 package/libraw/libraw.hash                    |  2 +-
 package/libraw/libraw.mk                      |  5 +---
 3 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch

diff --git a/package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch b/package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch
deleted file mode 100644
index ef93e0901b..0000000000
--- a/package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 477e0719ffc07190c89b4f3d12d51b1292e75828 Mon Sep 17 00:00:00 2001
-From: Alex Tutubalin <lexa@lexa.ru>
-Date: Sat, 14 Jan 2023 18:32:59 +0300
-Subject: [PATCH] do not set shrink flag for 3/4 component images
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/LibRaw/LibRaw/commit/477e0719ffc07190c89b4f3d12d51b1292e75828
----
- src/preprocessing/raw2image.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/preprocessing/raw2image.cpp b/src/preprocessing/raw2image.cpp
-index e65e2ad7..702cf290 100644
---- a/src/preprocessing/raw2image.cpp
-+++ b/src/preprocessing/raw2image.cpp
-@@ -43,6 +43,8 @@ void LibRaw::raw2image_start()
- 
-   // adjust for half mode!
-   IO.shrink =
-+	  !imgdata.rawdata.color4_image && !imgdata.rawdata.color3_image &&
-+	  !imgdata.rawdata.float4_image && !imgdata.rawdata.float3_image &&
-       P1.filters &&
-       (O.half_size || ((O.threshold || O.aber[0] != 1 || O.aber[2] != 1)));
- 
diff --git a/package/libraw/libraw.hash b/package/libraw/libraw.hash
index 58bb1b4753..838c598d78 100644
--- a/package/libraw/libraw.hash
+++ b/package/libraw/libraw.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  630a6bcf5e65d1b1b40cdb8608bdb922316759bfb981c65091fec8682d1543cd  LibRaw-0.21.1.tar.gz
+sha256  fe7288013206854baf6e4417d0fb63ba4ed7227bf36fff021992671c2dd34b03  LibRaw-0.21.2.tar.gz
 sha256  eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449  LICENSE.LGPL
 sha256  0e3098d2d54a12434715f6679ea408d57da5e8d613c385c58ecc6fe5d30cc81f  LICENSE.CDDL
 sha256  7d6650cef6cf892abe95e55a6bda1e1c42f221fd411b807deb2fc0b805b868d4  README.md
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 63b50e340d..211b67f935 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRAW_VERSION = 0.21.1
+LIBRAW_VERSION = 0.21.2
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 LIBRAW_SITE = http://www.libraw.org/data
 LIBRAW_INSTALL_STAGING = YES
@@ -18,9 +18,6 @@ LIBRAW_DEPENDENCIES = host-pkgconf
 LIBRAW_CXXFLAGS = $(TARGET_CXXFLAGS)
 LIBRAW_CONF_ENV = CXXFLAGS="$(LIBRAW_CXXFLAGS)"
 
-# 0001-do-not-set-shrink-flag-for-3-4-component-images.patch
-LIBRAW_IGNORE_CVES += CVE-2023-1729
-
 ifeq ($(BR2_PACKAGE_JASPER),y)
 LIBRAW_CONF_OPTS += --enable-jasper
 LIBRAW_DEPENDENCIES += jasper
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
