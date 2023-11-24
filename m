Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EC9C61DF4
	for <buildroot@archiver.kernel.org>; Fri, 24 Nov 2023 16:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B528421D1;
	Fri, 24 Nov 2023 16:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B528421D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1HIzENcUtjq1; Fri, 24 Nov 2023 16:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A44C421D6;
	Fri, 24 Nov 2023 16:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A44C421D6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07A411BF29A
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 16:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0B1541A79
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 16:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0B1541A79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3oQvb9QrgFYA for <buildroot@lists.busybox.net>;
 Fri, 24 Nov 2023 16:16:13 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B52241A7E
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 16:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B52241A7E
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-409299277bbso14185545e9.2
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 08:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700842570; x=1701447370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2qqoxISX0QB0pq3Te89y/Uxmt8QXIaXIJLpzM8HNfbU=;
 b=AkYBRli2NUAikr6vcTyz1MTPjNE2ww90X43yLXiANpjRV69uc+ochPjbxuv2fg1vT0
 7bht6kqQA6te0AwhF7HEt6853MEpYF7k65myL+oDRxK9JZbqgTJjYnS7tUG97Y7t0IzT
 GO6O8hd1BATQSa784yx8uoX0SrzRgg3/TKR0JqRTaH5huuksbz0hUmTFpX1RXOXPxslK
 WRijs1UhBtP3hT1G35n44nqzuGAlngBXFveAOe9UjBXkhBflpVB/6risdOfX+QwkMkGB
 aJHjZHKcAKQZV1NojfXpJzLXRkVxCc5x156LVMlN8Iv1VXM+TAUBqyiU6vWc2292CoGs
 r7MQ==
X-Gm-Message-State: AOJu0YxYS8xmZPK8BfQUOOh3Iwf4WCvxj+2j9lKhtBEE/hov3CEf2uCN
 x6CceMATk6cPTY0ssqo1bcbMOOHlcbtDZqw0H6o56w==
X-Google-Smtp-Source: AGHT+IHKzCoKN1QGwfAwiWxliazh0ACOeqceQFP+7ZVg+iQqiHMfAy7OpjYvG23tZz5+jj3nDHQowQ==
X-Received: by 2002:a05:600c:3b83:b0:40b:2a53:7913 with SMTP id
 n3-20020a05600c3b8300b0040b2a537913mr2961266wms.13.1700842570605; 
 Fri, 24 Nov 2023 08:16:10 -0800 (PST)
Received: from P-NAN-KHNOUM.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 fm20-20020a05600c0c1400b0040b297fce5fsm6147325wmb.10.2023.11.24.08.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 08:16:10 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 17:15:20 +0100
Message-Id: <20231124161523.215078-5-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231124161523.215078-1-antoine.coutant@smile.fr>
References: <20231124161523.215078-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700842570; x=1701447370;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2qqoxISX0QB0pq3Te89y/Uxmt8QXIaXIJLpzM8HNfbU=;
 b=Uv6DzZkAsDsYAtyBNKF+gnZ8xxVc+QJ7UAO/HL0WCN1mtbQdzQGyuEKgC6pvGHBbGU
 3wYYNRsGo8FUhEf10MEUxLIwyEupfzMB5ivXdVqIw4bQE+wlHBp0ViSIIkhniIXwWeXp
 s8ifuvGDnWm1n3BbrXVmoCEGafiv8+6usAFrF7vwlvzA1/ge9/K78ewPDcTZmN0zNR1t
 M7DiOJMBdZ9PVCF3gx2sOzx2vAYJs38eXzKkUxJkyq7fgtmFCL94ee+1SrkZQrcO0/y1
 e9lzweOBSCIm31NZkAHGEhjYC5547ew7y7uAVpm14YwI9OrAHA9H3z9T58eGg+uBXjjf
 Blrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Uv6DzZkA
Subject: [Buildroot] [[DO NOT MERGE] v3 4/7] package/opencl-headers: new
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

These headers provide the C language API bindings. It is a complement to
the C++ bindings already available in opencl-clhpp. This package is
required to build opencl-icd-loader:

https://github.com/KhronosGroup/OpenCL-ICD-Loader#dependencies

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
Changes v2 -> v3:
	-resolution of the conflict created by adding opencl-headers
	under Sebastian Weyer in DEVELOPERS
	- resolution of the conflict created by adding opencl-headers
	to package/Config.in
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/opencl-headers/Config.in           |  7 ++++
 package/opencl-headers/opencl-headers.hash |  3 ++
 package/opencl-headers/opencl-headers.mk   | 42 ++++++++++++++++++++++
 5 files changed, 54 insertions(+)
 create mode 100644 package/opencl-headers/Config.in
 create mode 100644 package/opencl-headers/opencl-headers.hash
 create mode 100644 package/opencl-headers/opencl-headers.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f26e9bc81..b7052238d9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2671,6 +2671,7 @@ F:	package/ripgrep/
 N:	Sebastian Weyer <sebastian.weyer@smile.fr>
 F:      package/amlogic-boot-fip/
 F:	package/nushell/
+F:	package/opencl-headers
 F:	package/rust-bindgen/
 F:	package/spirv-headers/
 F:	support/testing/tests/package/sample_nu.nu
diff --git a/package/Config.in b/package/Config.in
index 2097a21408..8fd86123c3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1667,6 +1667,7 @@ menu "Graphics"
 	source "package/onevpl/Config.in"
 	source "package/onevpl-intel-gpu/Config.in"
 	source "package/opencl-clhpp/Config.in"
+	source "package/opencl-headers/Config.in"
 	source "package/opencv3/Config.in"
 	source "package/opencv4/Config.in"
 	source "package/opencv4-contrib/Config.in"
diff --git a/package/opencl-headers/Config.in b/package/opencl-headers/Config.in
new file mode 100644
index 0000000000..092d8a2a4d
--- /dev/null
+++ b/package/opencl-headers/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_OPENCL_HEADERS
+	bool "opencl-headers"
+	depends on BR2_PACKAGE_HAS_LIBOPENCL
+	help
+	  C language headers for the OpenCL API
+
+	  https://github.com/KhronosGroup/OpenCL-Headers
diff --git a/package/opencl-headers/opencl-headers.hash b/package/opencl-headers/opencl-headers.hash
new file mode 100644
index 0000000000..f3d7ef8411
--- /dev/null
+++ b/package/opencl-headers/opencl-headers.hash
@@ -0,0 +1,3 @@
+#Locally generated
+sha256  0ce992f4167f958f68a37918dec6325be18f848dee29a4521c633aae3304915d  OpenCL-Headers-2023.04.17.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencl-headers/opencl-headers.mk b/package/opencl-headers/opencl-headers.mk
new file mode 100644
index 0000000000..1cad98a3d0
--- /dev/null
+++ b/package/opencl-headers/opencl-headers.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# opencl-headers
+#
+################################################################################
+
+OPENCL_HEADERS_VERSION = 2023.04.17
+OPENCL_HEADERS_SOURCE = OpenCL-Headers-$(OPENCL_HEADERS_VERSION).tar.gz
+OPENCL_HEADERS_SITE = $(call github,KhronosGroup,OpenCL-Headers,v$(OPENCL_HEADERS_VERSION))
+OPENCL_HEADERS_LICENSE = Apache-2.0
+OPENCL_HEADERS_LICENSE_FILES = LICENSE
+OPENCL_HEADERS_INSTALL_STAGING = YES
+
+OPENCL_HEADERS_INSTALL_TARGET = NO
+
+OPENCL_HEADERS_FILES = cl_d3d10.h \
+					   cl_d3d11.h \
+					   cl_dx9_media_sharing.h \
+					   cl_dx9_media_sharing_intel.h \
+					   cl_egl.h \
+					   cl_ext.h \
+					   cl_ext_intel.h \
+					   cl_gl_ext.h \
+					   cl_gl.h \
+					   cl.h \
+					   cl_half.h \
+					   cl_icd.h \
+					   cl_layer.h \
+					   cl_platform.h \
+					   cl_va_api_media_sharing_intel.h \
+					   cl_version.h \
+					   opencl.h
+
+
+define OPENCL_HEADERS_INSTALL_STAGING_CMDS
+	$(foreach header,$(OPENCL_HEADERS_FILES), \
+		$(INSTALL) -D -m 0644 $(@D)/CL/$(header) \
+			$(STAGING_DIR)/usr/include/CL/$(header)
+	)
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
