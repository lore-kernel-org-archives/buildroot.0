Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB391C001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B42681C0A;
	Tue, 25 Jul 2023 13:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B42681C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CtaGJ1HONq4k; Tue, 25 Jul 2023 13:52:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FF5E81FE4;
	Tue, 25 Jul 2023 13:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FF5E81FE4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0647E1BF84C
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD957418A7
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD957418A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hsx08ehxg1Dy for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:51:23 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 657BA418AD
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 657BA418AD
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fc04692e20so54934875e9.0
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690293081; x=1690897881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8PCb8wjZHk9QQ7WVW5VgiHE/91KqKDY8R0u4+Izz5VU=;
 b=i6Hdg0bMoS+TX9X57lfowf5CjxN9oc03JQU/eMn41Dyo87K+EBdLYu/a7eIX/baVdq
 l6MUtzcZjYqcoDiOlt3KZcqAa+S7etUNW55vwJYYP7sPN7aW733c8NfHZgVI1gKD+a6i
 Far8VM5lZAI5bj+al1RO9eD2tIEHFePx1xAEoluz/10zOlqGfFXMn2oo/I6sV+ZF/6Zq
 RKcu6SLNg87AZfet/1BVW8PUgXcnhW+b5SITcV+0jwK82o89HyVyfGeuEboW1ZJbWlax
 D51dZRGrMwbJKHt6Ca6I2PcUKg0bspB+0eLxkRmcJUrjFj86Zo8LHnxodcxxHI0/jc9E
 TvGw==
X-Gm-Message-State: ABy/qLYdYIhp5McLhdhuYeP0SrQp/fhg0/+zCbDves5Usl4KnOl6hUb2
 FuJ9i6sSq8pU4qKG9YuJITe7TFdVz7p5jN5ZNj0=
X-Google-Smtp-Source: APBJJlFyzA3hSXN1wpcv+5lnP06PeD1jyJmFmbtiLHpeWFMJEQ5A0IXyj4/wBPH/USdFqs7facySxA==
X-Received: by 2002:a5d:5088:0:b0:317:5a99:a696 with SMTP id
 a8-20020a5d5088000000b003175a99a696mr6184843wrt.68.1690293081192; 
 Tue, 25 Jul 2023 06:51:21 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a5d6150000000b00313e59cb371sm16604581wrt.12.2023.07.25.06.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:51:21 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 15:51:02 +0200
Message-Id: <20230725135105.536310-8-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725135105.536310-1-sebastian.weyer@smile.fr>
References: <20230725135105.536310-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690293081; x=1690897881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8PCb8wjZHk9QQ7WVW5VgiHE/91KqKDY8R0u4+Izz5VU=;
 b=AP7DuQXJ1Ke2NSl/qTwuf2KpcEaIsAk87/vGiSU/IU3N+SC8tOp4zAPXuOSvc7zO7q
 lrV2gCmXIrijW9c/HJnP3Ht0ZjUzijLUvln/mD7nlw6ttfAFeQaIpKyj9a687zzh33pA
 9OKOsEsZby3RVg0UnqnUw3dPf4jmUuCFwoHxy8jEjzng0Rtpv/zzyK40prqoleVbhHco
 tCcb1yCjL0qhCIrGtckt+0ZAZhwD6QAhs4DJLcy2TISKsE6NUM1r9a3TyFaXNrFDn7pP
 3XC8MqIYuOkyTJfKy9XwWmtxpBemO/yOJKPd5NzFO3zicGhxzYL607+6lCUXSnFZeTJZ
 wXyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=AP7DuQXJ
Subject: [Buildroot] [PATCH 7/9] package/opencl-headers: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============1224442163936826868=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1224442163936826868==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

These headers provide the C language API bindings. It is a complement to
the C++ bindings already available in opencl-clhpp. This package is
required to build opencl-icd-loader:

https://github.com/KhronosGroup/OpenCL-ICD-Loader#dependencies

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
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
index c9ac202de6..38f46b4ac3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2603,6 +2603,7 @@ N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
 N:	Sebastian Weyer <sebastian.weyer@smile.fr>
+F:	package/opencl-headers
 F:	package/rust-bindgen
 
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
diff --git a/package/Config.in b/package/Config.in
index f7b369b42a..fc73cd1727 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1638,6 +1638,7 @@ menu "Graphics"
 	source "package/libwpe/Config.in"
 	source "package/menu-cache/Config.in"
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
2.34.1


--===============1224442163936826868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1224442163936826868==--
