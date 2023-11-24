Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEEEC61DF4
	for <buildroot@archiver.kernel.org>; Fri, 24 Nov 2023 16:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48B07421E5;
	Fri, 24 Nov 2023 16:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48B07421E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PoGIqmt0z3-o; Fri, 24 Nov 2023 16:17:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A770421FE;
	Fri, 24 Nov 2023 16:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A770421FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44C541BF29A
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 16:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B47161595
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 16:16:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B47161595
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n0plcjL62bEz for <buildroot@lists.busybox.net>;
 Fri, 24 Nov 2023 16:16:15 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9134B60ACA
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 16:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9134B60ACA
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c87adce180so25861341fa.0
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 08:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700842572; x=1701447372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PHlcqHGeso2fHER9ENZrc++IBQSiapK6pMGgPv+/eQQ=;
 b=PZjuUz5TusixpY6s3DyGyNfUqgbvA9x42EsNoFVcmy/BGH+JLXuxEi242Y6B/4HKWv
 Ym9dfHB8kkixL+/VdX9R3pvrrv6NRZP63C6rwTtC6/mdy0X933r2TwaEpwJY65E2t062
 rZJYRKmFyRyTx5XMiFhySmAS/YIkftV+U87h7tLoAOre84gxty8JSmbICduFPlKleNSG
 WEwZr5USX2HOaD9TG43pX1+IQV1UMK5ntsPLbWRYtjDK8PL23od9SUyjw9mBGCzHQrE1
 tVFHgP0Qm5/zRzdVanZmcONwKM7Zyt8Zel7eqI92ug2v4MN6oAWIdvE0ElXOqlArAhJ3
 tIFw==
X-Gm-Message-State: AOJu0YwJvXVwfXV2OoA3e3+/a73HX8aqfK2h4NWEidWmF4UyN4Ad+tom
 7sdQgSiBwWQgHyEPSwclftlccGCXJRcByI0GalnloA==
X-Google-Smtp-Source: AGHT+IHgsxt2ZRP053u7iW9ik0RIomE2vkBfpY40D3/6BlCMyeq9zgWakYN6GfH+iDBsZqBf3ifA1Q==
X-Received: by 2002:a2e:9796:0:b0:2c8:84ff:4a25 with SMTP id
 y22-20020a2e9796000000b002c884ff4a25mr2506018lji.5.1700842572194; 
 Fri, 24 Nov 2023 08:16:12 -0800 (PST)
Received: from P-NAN-KHNOUM.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 fm20-20020a05600c0c1400b0040b297fce5fsm6147325wmb.10.2023.11.24.08.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 08:16:11 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 17:15:21 +0100
Message-Id: <20231124161523.215078-6-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231124161523.215078-1-antoine.coutant@smile.fr>
References: <20231124161523.215078-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700842572; x=1701447372;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PHlcqHGeso2fHER9ENZrc++IBQSiapK6pMGgPv+/eQQ=;
 b=JJZ7Qx22bPHc5HJOhQFvdw3yZHIVG3TfaepFdjiSUV49bVrlWdTXY2UtvroR/YxMpU
 zH9cP1ENdqeNwen/Rn04Mte4ZWhxsHGALncrqY+Y1R+dmir5snDYmvsijeHxzLlC5wpW
 SFk5Hp/lwBkD7J8YpyjNGARqQH7nS8JWvqFZeo431s4Wzwo9NOE+rxwgXe4NbrTjuOxL
 fB6saqeP1nHtcSjWojlDPt/bjRK8LhFufW4sdA5Qo4scFZ0fiP3kXSQznDOWaFzPnsnp
 cETMYnSJg3msnS1p7K4N4ilKIvCCGEAEVBwbbGGI36hky+WS7j6WqcWu9EaAmEHsSsvS
 Ec9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=JJZ7Qx22
Subject: [Buildroot] [[DO NOT MERGE] v3 5/7] package/opencl-icd-loader: new
 package
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
 Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr,
 bernd@kuhls.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Sebastian Weyer <sebastian.weyer@smile.fr>

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
Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
Changes v2 -> v3:
	-resolution of the conflict created by adding opencl-icd-loader
	under Sebastian Weyer in DEVELOPERS
	- resolution of the conflict created by adding opencl-icd-loader
	to package/Config.in
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
index b7052238d9..4a90bad7ee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2672,6 +2672,7 @@ N:	Sebastian Weyer <sebastian.weyer@smile.fr>
 F:      package/amlogic-boot-fip/
 F:	package/nushell/
 F:	package/opencl-headers
+F:	package/opencl-icd-loader
 F:	package/rust-bindgen/
 F:	package/spirv-headers/
 F:	support/testing/tests/package/sample_nu.nu
diff --git a/package/Config.in b/package/Config.in
index 8fd86123c3..70c9970723 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1668,6 +1668,7 @@ menu "Graphics"
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
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
