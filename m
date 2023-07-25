Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF25C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F54A81F75;
	Tue, 25 Jul 2023 13:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F54A81F75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9BiG2Ao1Sce; Tue, 25 Jul 2023 13:53:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 488BC81FF6;
	Tue, 25 Jul 2023 13:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 488BC81FF6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFBB81BF84C
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9700D40B91
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9700D40B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YHYjh2iUhFjl for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:51:24 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 696364016F
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 696364016F
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31771bb4869so105906f8f.0
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690293082; x=1690897882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pVw6WYJkNdOST3COGbfot1xkPXG3CRqQObohebQU9xE=;
 b=ghur0zOIXPtNVVdmvva2cz300r3nZbqzpASRxIqtuVWWRTC2GaAR8GlZ+pP7xtd6Gr
 nNgNI16B7T01XrCwAi1KtXk7+fjT6qfh5TyxpkdfkhAk8jldR8bBE+esZ/mogh84JRKM
 Ck8WfKkdDbmn2rRFUvxcqgGgNtBJ1lKsRrfoDD1egHwZAkh14txPVyicnMdHSlbIGYO9
 OPhle6HwUkwt7vNYiw7MmhN55F1/8lUMmVgMzrpJSGAZ5Ujv0H12r0v1jwnRYCF5x/Zs
 W0B00QdbiTga1bl4+cloXacrZqU1kX8SRxzpmwCtTrxNy0I4/VFMrylw27yjF5njwuNy
 7d4g==
X-Gm-Message-State: ABy/qLY7kZVTcvgF4z+qqSsA1LWC73t+6YDxVq0kSXTbpDGEC81hQc84
 sXr24jtvAe9saX+9O/QPpOVQA+phSYt8nbgqYRw=
X-Google-Smtp-Source: APBJJlEULc9pbjeWBFPmCsn1wwqXUCVm/T4QRUO2cl4iBBjoJf+lYJDd9CtmF7YBcdKdbnmG0bLt3Q==
X-Received: by 2002:adf:f7cc:0:b0:314:a3f:9c08 with SMTP id
 a12-20020adff7cc000000b003140a3f9c08mr10501788wrq.39.1690293082359; 
 Tue, 25 Jul 2023 06:51:22 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a5d6150000000b00313e59cb371sm16604581wrt.12.2023.07.25.06.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:51:22 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 15:51:03 +0200
Message-Id: <20230725135105.536310-9-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725135105.536310-1-sebastian.weyer@smile.fr>
References: <20230725135105.536310-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690293082; x=1690897882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pVw6WYJkNdOST3COGbfot1xkPXG3CRqQObohebQU9xE=;
 b=VVuXWs5Jxmt6hiRxWKbQPV6IJj/dsV45r/m0BIWu+cdn907GMAcQ1DFnKUzfjyKz3Y
 z6BFX8bUPjU+3QTXTvdozD9vBINpIrP0L+fbcuy55eH83C91J01htgZzypF/3WZmY6OO
 ljE9UhzHdeVqS+6RaXsDv+nuw/mvvBzODxowCoVafkQa40JlOuOI2HLpACbLX9xPRZ+4
 wBH4x6ylJp24cQPrDGUlqMHi9XHiiIdPAjrSYdKAhDniaZhnwWNBxSOydvd1UFTJnxdS
 jC5BJRlibvTT8sHVv7NS+l+aYl2RxSvuQhUo8Gxp9w34xrcVD0R01+OUQmuQfuUblaYq
 X/nQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=VVuXWs5J
Subject: [Buildroot] [PATCH 8/9] package/opencl-icd-loader: new package
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: multipart/mixed; boundary="===============6087916549432576396=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6087916549432576396==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

With this package it is possible to have multiple implementations of
OpenCL at the same time. This package provides a libOpenCL.so file that
captures the OpenCL API calls and forwards it to the correct
implementation of OpenCL. OpenCL implementations can be manually
registered by creating a file containing its full file path in
/etc/OpenCL/vendors/<implementation>.icd[1]

This package is required by certain OpenCL implementations, for example
Mesa3D's implementation if it is not built in standalone mode.

[1] https://github.com/KhronosGroup/OpenCL-ICD-Loader#registering-icds

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
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
index 38f46b4ac3..6af31d447e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2604,6 +2604,7 @@ F:	package/ripgrep/
 
 N:	Sebastian Weyer <sebastian.weyer@smile.fr>
 F:	package/opencl-headers
+F:	package/opencl-icd-loader
 F:	package/rust-bindgen
 
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
diff --git a/package/Config.in b/package/Config.in
index fc73cd1727..2b7446386b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1639,6 +1639,7 @@ menu "Graphics"
 	source "package/menu-cache/Config.in"
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
index 0000000000..d028e3d856
--- /dev/null
+++ b/package/opencl-icd-loader/opencl-icd-loader.hash
@@ -0,0 +1,3 @@
+# locally generated
+sha256  173bdc4f321d550b6578ad2aafc2832f25fbb36041f095e6221025f74134b876  OpenCL-ICD-Loader-2023.04.17.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/opencl-icd-loader/opencl-icd-loader.mk b/package/opencl-icd-loader/opencl-icd-loader.mk
new file mode 100644
index 0000000000..d3d94b9cb5
--- /dev/null
+++ b/package/opencl-icd-loader/opencl-icd-loader.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# opencl-icd-loader
+#
+################################################################################
+
+OPENCL_ICD_LOADER_VERSION = 2023.04.17
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
2.34.1


--===============6087916549432576396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6087916549432576396==--
