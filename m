Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62082C4828E
	for <buildroot@archiver.kernel.org>; Fri,  2 Feb 2024 09:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BD0A6FA5B;
	Fri,  2 Feb 2024 09:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BD0A6FA5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ldU7BvcM7PH; Fri,  2 Feb 2024 09:37:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F3BD6FA8D;
	Fri,  2 Feb 2024 09:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F3BD6FA8D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E95F71BF39D
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 09:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C292984D22
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 09:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C292984D22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XlIPvK5-CGla for <buildroot@lists.busybox.net>;
 Fri,  2 Feb 2024 09:36:37 +0000 (UTC)
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 881D984D1A
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 09:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 881D984D1A
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-337cc8e72f5so1214888f8f.1
 for <buildroot@buildroot.org>; Fri, 02 Feb 2024 01:36:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706866595; x=1707471395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PJyihcIBUVhtgfxiDDkH5H/4WwHBgDiRph++R4uFgL4=;
 b=kkXCquWz+13ABlNf7GVUzRduGdhiSyDCSZiKtCoizQZr7Lf2qu2o1crQ04mZvmN1rw
 3kS4tQB/eWoaBly5qOPVi+FpWewMhtryhM9UAXjEdVaIfTG2YPJ+2H6LZ+A1lMQl5frZ
 jikT1xgN3TZHVgGyirbTE0mqHS0LW3ky1OLS0WF78ToUj1PCETGeyMOHGjyn/55xdQrC
 j+6fuyozi8I3Pnvad7MCYnIKXr+jNQTArlCnqo6VfrEPSBWNoh1s37yGGNsq5ljE4Vys
 2AqbL8b7cEBJmMln08XkDtKqceRjxcwKmOhCX+vOHp9NRSgUrDZwA134Y5QcbdgxRuUv
 X2pw==
X-Gm-Message-State: AOJu0YwOq00MTwlJ/GD5LTkegS74t0wzC1YDqsW9JXhmytlGmggfj7/0
 SI95fqx2jEDmR1wDtNGVH9LKaVzFuuhnXBRLYUmowWhJyqwp2p9jULahn1Phs61gJgpzKCM+3BX
 3JpIUhg==
X-Google-Smtp-Source: AGHT+IEUXdGKc+LbmzKvhnfV0SKvcMtaKj4eYhoQU1XtRysNRecCy+KmmF9BSm/5WQuROKISqaIt2Q==
X-Received: by 2002:a5d:67d0:0:b0:33b:fe9:dba7 with SMTP id
 n16-20020a5d67d0000000b0033b0fe9dba7mr3314266wrw.28.1706866594843; 
 Fri, 02 Feb 2024 01:36:34 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWJLg4DshEkHlWuuryJU1+NX6yAVS4QYmnChmf9pzEk+1pU4Yk04mA1ikPj8cG1T32YULmdTgH+ZEr6HSQi+MTj6zoJOWLmxjFnfymFkqopSnE1XenIFbrjiC2T6iLEWjHBOdVdm4A/Q3BTzGjz05ysVwKxMr+n9lR/
Received: from localhost.localdomain ([80.215.186.96])
 by smtp.gmail.com with ESMTPSA id
 m1-20020adfe941000000b0033ae6fa7f20sm1504615wrn.65.2024.02.02.01.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 01:36:34 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Fri,  2 Feb 2024 10:36:23 +0100
Message-Id: <20240202093625.1409559-6-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240202093625.1409559-1-antoine.coutant@smile.fr>
References: <20240202093625.1409559-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706866595; x=1707471395;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PJyihcIBUVhtgfxiDDkH5H/4WwHBgDiRph++R4uFgL4=;
 b=RVeGoJyLhCii5OAAdNbiq10xbTdwwTLxPnbMbRRJOhl+KEW8O4i1jUSH2UWgDF/sAt
 HY2vIHDCBX08UGdRGF/x+vNv+VfV13dTvBh8FeFpIDbftMOm4iUcKnEOzPweojJ3OmfQ
 MoJlcb7OcQePq8j/NQEBhuGJakWGJ7QnAFqt/hJcCHmHz4QW8BtM30S/4/Gw6lV9PXn3
 +v1ZKRk0uB7q9Y2XYkZJ9pO5tdI0CE9TCJMdxvVLQJZhXNqL8uO6LKcG5NMN6R4+kT/s
 fMZlcRon6ZKor+3Rt+hYsNbTSmBvUMyu00IR/DE8T2gG06XiyLqyns4yQAhnQvrPQLHP
 gYjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=RVeGoJyL
Subject: [Buildroot] [PATCH v4 5/7] package/opencl-icd-loader: new package
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
Cc: sebastian.weyer@smile.fr, Antoine Coutant <antoine.coutant@smile.fr>,
 bernd@kuhls.net, romain.naour@smile.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Sebastian Weyer <sebastian.weyer@smile.fr>

With this package it is possible to have multiple implementations of
OpenCL at the same time. This package provides a libOpenCL.so file that
captures the OpenCL API calls and forwards them to the correct
implementation of OpenCL. OpenCL implementations can be manually
registered by creating a file containing its full file path in
/etc/OpenCL/vendors/<implementation>.icd[1]

This package is required by certain OpenCL implementations, for example
Mesa3D's Clover implementation if it is not built in standalone mode.

[1] https://github.com/KhronosGroup/OpenCL-ICD-Loader#registering-icds

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
Changes v2 -> v3:
	-resolution of the conflict created by adding opencl-icd-loader
	under Sebastian Weyer in DEVELOPERS
	- resolution of the conflict created by adding opencl-icd-loader
	to package/Config.in

Changes v3 -> v4:
	- bump version from v2023.04.17 to v2023.12.14

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/opencl-icd-loader/Config.in           | 12 ++++++++++++
 .../opencl-icd-loader/opencl-icd-loader.hash  |  3 +++
 .../opencl-icd-loader/opencl-icd-loader.mk    | 19 +++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/opencl-icd-loader/Config.in
 create mode 100644 package/opencl-icd-loader/opencl-icd-loader.hash
 create mode 100644 package/opencl-icd-loader/opencl-icd-loader.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 79c46c3539..907a29f53b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2694,6 +2694,7 @@ N:	Sebastian Weyer <sebastian.weyer@smile.fr>
 F:      package/amlogic-boot-fip/
 F:	package/nushell/
 F:	package/opencl-headers
+F:	package/opencl-icd-loader
 F:	package/rust-bindgen/
 F:	package/spirv-headers/
 F:	support/testing/tests/package/sample_nu.nu
diff --git a/package/Config.in b/package/Config.in
index dfbd20e889..7b1324306c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1697,6 +1697,7 @@ menu "Graphics"
 	source "package/onevpl-intel-gpu/Config.in"
 	source "package/opencl-clhpp/Config.in"
 	source "package/opencl-headers/Config.in"
+	source "package/opencl-icd-loader/Config.in"
 	source "package/opencv3/Config.in"
 	source "package/opencv4/Config.in"
 	source "package/opencv4-contrib/Config.in"
diff --git a/package/opencl-icd-loader/Config.in b/package/opencl-icd-loader/Config.in
new file mode 100644
index 0000000000..405dc5401a
--- /dev/null
+++ b/package/opencl-icd-loader/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_OPENCL_ICD_LOADER
+	bool "OpenCL-ICD-Loader"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_LIBOPENCL
+	select BR2_PACKAGE_OPENCL_HEADERS
+	help
+	  OpenCL defines an Installable Client Driver (ICD) mechanism to
+	  allow developers to build applications against an Installable
+	  Client Driver loader (ICD loader) rather than linking their
+	  applications against a specific OpenCL implementation.
+
+	  https://github.com/KhronosGroup/OpenCL-ICD-Loader
diff --git a/package/opencl-icd-loader/opencl-icd-loader.hash b/package/opencl-icd-loader/opencl-icd-loader.hash
new file mode 100644
index 0000000000..1c894f1293
--- /dev/null
+++ b/package/opencl-icd-loader/opencl-icd-loader.hash
@@ -0,0 +1,3 @@
+# locally generated
+sha256  af8df96f1e1030329e8d4892ba3aa761b923838d4c689ef52d97822ab0bd8917  OpenCL-ICD-Loader-2023.12.14.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/opencl-icd-loader/opencl-icd-loader.mk b/package/opencl-icd-loader/opencl-icd-loader.mk
new file mode 100644
index 0000000000..04f6fb4b85
--- /dev/null
+++ b/package/opencl-icd-loader/opencl-icd-loader.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# opencl-icd-loader
+#
+################################################################################
+
+OPENCL_ICD_LOADER_VERSION = 2023.12.14
+OPENCL_ICD_LOADER_SOURCE = OpenCL-ICD-Loader-$(OPENCL_ICD_LOADER_VERSION).tar.gz
+OPENCL_ICD_LOADER_SITE = $(call github,KhronosGroup,OpenCL-ICD-Loader,v$(OPENCL_ICD_LOADER_VERSION))
+OPENCL_ICD_LOADER_LICENSE = Apache-2.0
+OPENCL_ICD_LOADER_LICENSE_FILES = LICENSE
+OPENCL_ICD_LOADER_INSTALL_STAGING = YES
+
+OPENCL_ICD_LOADER_DEPENDENCIES = opencl-headers
+
+OPENCL_ICD_LOADER_CONF_OPTS += -DOPENCL_ICD_LOADER_HEADERS_DIR=$(STAGING_DIR)/usr/include
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
