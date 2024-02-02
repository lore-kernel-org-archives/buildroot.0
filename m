Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4618C4828E
	for <buildroot@archiver.kernel.org>; Fri,  2 Feb 2024 09:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B79F6FA6B;
	Fri,  2 Feb 2024 09:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B79F6FA6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 89W2dQK5DTsR; Fri,  2 Feb 2024 09:37:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E06E6FA5D;
	Fri,  2 Feb 2024 09:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E06E6FA5D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95E251BF39D
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 09:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E37D42E60
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 09:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E37D42E60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rvmqdp6rtQFz for <buildroot@lists.busybox.net>;
 Fri,  2 Feb 2024 09:36:36 +0000 (UTC)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 420A142E4B
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 09:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 420A142E4B
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-40fc654a77dso4023065e9.2
 for <buildroot@buildroot.org>; Fri, 02 Feb 2024 01:36:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706866593; x=1707471393;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+MWWpNp1toXCaUAqWdem4ZQT0e3wF121TBFZgdbavOE=;
 b=PnBvM/jlV5sibEwtO/qFttI2F/BcKIxt/RI5626ByBvBvTb4UfhNE0jRGm0GA7m1dw
 /HKRi3Ocv7y9u1zUd0inrTgQrnCPgQtTZpP2M6PcSvFg1c2nQCE5wxRJw+yVGg1oAtLN
 HUWzBocySPudMOT7zmHmNibMswEZdY+5eIe9VOCSIUNITfeJLLlOIs6A9yK9Emq5qxvL
 gyMRkyvURwsdxGtdVhemxXEoJANkBdU+hnA8XqPaiM73mCLPmVpimRKPJIWqs8ywdp8w
 ooSpiJw3TCkfmKSe4LYVzIa8bdrsf8B4DnDCk3GwB4XpOtGGMHIKtGPdx+3CHE328Miv
 MOfA==
X-Gm-Message-State: AOJu0Yzpu8LnFOfKI3VxfUJ7jho9oE2uKm/wrZY0ymnehEu041Ho/9KS
 jz75Jyf/x9HVYfpCbpf4rtWQOfV6TseEz3Sv0g1lcu1NKm78sYSbybrkiIsTqPNrRRmZylk4awd
 oI/hGlA==
X-Google-Smtp-Source: AGHT+IFdKqebgIdl37p5Ona8hm5uKzKLHOP5OxSlM8KqeXuNmzhzTB9VPp0uQ/bUKvrZOpJ0UCDWWg==
X-Received: by 2002:a5d:4d81:0:b0:33a:e89f:1dc6 with SMTP id
 b1-20020a5d4d81000000b0033ae89f1dc6mr1191333wru.29.1706866593568; 
 Fri, 02 Feb 2024 01:36:33 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCX4NNStRkTCowNqGDKa2Atjye6vKS32c6UgaqpLk51sfYkb73NZG81vUztolGuSX/rSpVUOSFp1W9vjSXuiBewo1KbKGZ8cyL41z+EKQkIQPh3Ej5Ymrn+3nn4mWNo3qY4tM1QMknDS9GC7tlGT+VusAUb6B1kHPe5b
Received: from localhost.localdomain ([80.215.186.96])
 by smtp.gmail.com with ESMTPSA id
 m1-20020adfe941000000b0033ae6fa7f20sm1504615wrn.65.2024.02.02.01.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 01:36:33 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Fri,  2 Feb 2024 10:36:22 +0100
Message-Id: <20240202093625.1409559-5-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240202093625.1409559-1-antoine.coutant@smile.fr>
References: <20240202093625.1409559-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706866593; x=1707471393;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+MWWpNp1toXCaUAqWdem4ZQT0e3wF121TBFZgdbavOE=;
 b=KJvKLzULzMWMasMLPHYTa+Fd3RggbgXJqMI8kfZRLWzv4qNP2AohdpvfMZnSCm1QT4
 7+N+reCZzgKgX5sVeHUouQjNs40NkTVkizJVWaV8uNfQ1BXvp55nCF6wbw827nxQ7i6b
 gO3S9dib3JClawdsG5Fz4CnDoTAmBW0hgFQFFHJ4cL5Erxpc7nQEqhEMsb/C5LbeIkbC
 +Dr8IqLSYgyKIorVEBtWHt00k8xmsT3aPz3crQHE7JLK0Q1jPnq9qhGVJKB3jR+B2n6B
 sV3jGp6iNZfLO7PxNkEVIHYWsjHcuBs1nXdXLKdgnoC0sGeevIfiyiEgwKlyOIbKsDa6
 4D/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=KJvKLzUL
Subject: [Buildroot] [PATCH v4 4/7] package/opencl-headers: new package
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

These headers provide the C language API bindings. It is a complement to
the C++ bindings already available in opencl-clhpp. This package is
required to build opencl-icd-loader:

https://github.com/KhronosGroup/OpenCL-ICD-Loader#dependencies

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
Changes v2 -> v3:
	- resolution of the conflict created by adding opencl-headers
	under Sebastian Weyer in DEVELOPERS
	- resolution of the conflict created by adding opencl-headers
	to package/Config.in

Changes v3 -> v4:
	- bump version from v2023.04.17 to v2023.12.14:
	add cl_function_types.h to the header files to keep
	this header added in commit e049b16b5f157e2f28e7b5c301e71e1ccb3fe288
	- remove the list of headers to install as it is exhaustive.
	Instead, select all files with "*".

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/opencl-headers/Config.in           |  7 +++++++
 package/opencl-headers/opencl-headers.hash |  3 +++
 package/opencl-headers/opencl-headers.mk   | 22 ++++++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/opencl-headers/Config.in
 create mode 100644 package/opencl-headers/opencl-headers.hash
 create mode 100644 package/opencl-headers/opencl-headers.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cc9bc5b5cc..79c46c3539 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2693,6 +2693,7 @@ F:	package/ripgrep/
 N:	Sebastian Weyer <sebastian.weyer@smile.fr>
 F:      package/amlogic-boot-fip/
 F:	package/nushell/
+F:	package/opencl-headers
 F:	package/rust-bindgen/
 F:	package/spirv-headers/
 F:	support/testing/tests/package/sample_nu.nu
diff --git a/package/Config.in b/package/Config.in
index 9324d1e4c8..dfbd20e889 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1696,6 +1696,7 @@ menu "Graphics"
 	source "package/menu-cache/Config.in"
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
index 0000000000..802ed05450
--- /dev/null
+++ b/package/opencl-headers/opencl-headers.hash
@@ -0,0 +1,3 @@
+#Locally generated
+sha256  407d5e109a70ec1b6cd3380ce357c21e3d3651a91caae6d0d8e1719c69a1791d  OpenCL-Headers-2023.12.14.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencl-headers/opencl-headers.mk b/package/opencl-headers/opencl-headers.mk
new file mode 100644
index 0000000000..7aa0e0d168
--- /dev/null
+++ b/package/opencl-headers/opencl-headers.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# opencl-headers
+#
+################################################################################
+
+OPENCL_HEADERS_VERSION = 2023.12.14
+OPENCL_HEADERS_SOURCE = OpenCL-Headers-$(OPENCL_HEADERS_VERSION).tar.gz
+OPENCL_HEADERS_SITE = $(call github,KhronosGroup,OpenCL-Headers,v$(OPENCL_HEADERS_VERSION))
+OPENCL_HEADERS_LICENSE = Apache-2.0
+OPENCL_HEADERS_LICENSE_FILES = LICENSE
+OPENCL_HEADERS_INSTALL_STAGING = YES
+
+OPENCL_HEADERS_INSTALL_TARGET = NO
+
+define OPENCL_HEADERS_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/CL
+	$(INSTALL) -D -m 0644 $(@D)/CL/* \
+		$(STAGING_DIR)/usr/include/CL
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
