Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CE5C48291
	for <buildroot@archiver.kernel.org>; Fri,  2 Feb 2024 09:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEC806FA5D;
	Fri,  2 Feb 2024 09:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEC806FA5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EH5j_29y4TVJ; Fri,  2 Feb 2024 09:37:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEE5B6FAA9;
	Fri,  2 Feb 2024 09:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEE5B6FAA9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0B1D1BF39D
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 09:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9996A84D1A
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 09:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9996A84D1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ItAkInm3J7D for <buildroot@lists.busybox.net>;
 Fri,  2 Feb 2024 09:36:35 +0000 (UTC)
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 547B284D1C
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 09:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 547B284D1C
Received: by mail-lf1-x143.google.com with SMTP id
 2adb3069b0e04-5113a97a565so51427e87.3
 for <buildroot@buildroot.org>; Fri, 02 Feb 2024 01:36:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706866593; x=1707471393;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mTcbUbs6Zr+IEc5Wem2ZtycDN0WrRkPzMy4gB1WpuAY=;
 b=WISO8TMC/mYgvVtMsoZU7WIzIBEtOcI6CvTRqIZA19dmbIBCaPgA4JnPVxH+nsGpYY
 SBJbwBKeQCcHHPVjTEGgbWag4+EYY944VR0vFxdb1t6GeY3lkvhPjsgV6dhNWD32SFIR
 eJKJdbhcY1ZCMjquzbLO2qV3RnnKV63nheQhMasKjIqqwPX8kR5W/zfIl90W9zo8OKwb
 UjOBJhLdjM8VUuZnsz+hwIJEYFrxg4E1lE/4a6n9vz7nlGswDahHt5KpQ3JMQysmjwgv
 MGeHAeCmToDZ7S/T7lgDtS7w8d+G2LXw866twfyztXQ9ylvpymqPzx6qUAZL+hljv1pF
 NZmg==
X-Gm-Message-State: AOJu0Yxsc5xmPwsQtl/lHBwX211b21RfH+DJ0ykzGEsveGFem8v7A7mB
 8oJyAnE+nxhr5rY/Z3GbK4XfjWjdi+CFpvzAkXQEC+aYD7WCc5G30QXR6AKYBtdWxHE2OvxYBl0
 oYgZ1YQ==
X-Google-Smtp-Source: AGHT+IF61wqV/MLmbzos3FFIAQ3V+EWLb5N4xIT6ANNu5TnUC4fI5+S+jfGTX1Yun/6rcL/kIb5aaA==
X-Received: by 2002:a05:6512:281d:b0:50e:9a16:fb with SMTP id
 cf29-20020a056512281d00b0050e9a1600fbmr3973985lfb.6.1706866592751; 
 Fri, 02 Feb 2024 01:36:32 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVPrklZpvbqfdNAmSSjCb3P+wsenl47tepnX/dlx+RXWx8lr3+Cz+DQfOIHIs1PFiJiNq0Y5Ata/h+Kd3RLfPsVhgN/0sGS1/UAu2ji9f6XxwbvBbHFs4mL94819mgIOSZmqk/SjKXdnF/3lvYIQPCpY6k9NDEXOWlg
Received: from localhost.localdomain ([80.215.186.96])
 by smtp.gmail.com with ESMTPSA id
 m1-20020adfe941000000b0033ae6fa7f20sm1504615wrn.65.2024.02.02.01.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 01:36:32 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Fri,  2 Feb 2024 10:36:21 +0100
Message-Id: <20240202093625.1409559-4-antoine.coutant@smile.fr>
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
 bh=mTcbUbs6Zr+IEc5Wem2ZtycDN0WrRkPzMy4gB1WpuAY=;
 b=OCBM8uAbgj8RAw1nbbk/FCZTKhyuvsQdFSU7XaQaHK4XiqdYJTgPHL3LA/FOVra59s
 xCr8WDy2gcs+WRYRQupPRN5+TKE5Zy6XfjzQryVZJQkHd97VNrH29dpLZQTjLs50hLB5
 btBySQZopWBrT/ACgxkcvV9vV4cf5vT1o6m5cJGorzUllwSf65HBkaJRUMxetnba2iRy
 1zDJYSs5sdcQoZLmT0tGOKVXLSFa+GWoDfylPK+ASTFl2TTcziFBT63enHkdNp0Ax0YM
 W+A+BkbSSFZWd/aM+5yNkxmmHCeaW8XB5scnR/uLlfmWXKuN0kgnzKz3NqhpMr+mVdkK
 MNCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=OCBM8uAb
Subject: [Buildroot] [PATCH v4 3/7] package/spirv-llvm-translator: add
 target variant to provide LLVMSPIRVLib
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

From: Romain Naour <romain.naour@smile.fr>

This target version is needed for Rusticl which is an LLVM based OpenCL
framework[1]. Rusticl allow programs to compile OpenCL C/C++ code
at runtime with Clang. Clang generates LLVM IR which is translated into
SPIR-V by spirv-llvm-translator. Finally, mesa can use its internal
tools to manage SPIR-V.

[1]: https://docs.mesa3d.org/rusticl.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
Changes v2 -> v3:
	- resolution of the conflict created by adding spirv-llvm-translator
	to package/Config.in
	- resolution of the conflict created by adding spirv-headers and zlib
	to spirv-llvm-translator dependencies

Changes v3 -> v4:
	- explain why the target version is needed in the commit log.

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 package/Config.in                             |  1 +
 package/spirv-llvm-translator/Config.in       | 22 +++++++++++++++++++
 .../spirv-llvm-translator.mk                  | 12 +++++++++-
 3 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 package/spirv-llvm-translator/Config.in

diff --git a/package/Config.in b/package/Config.in
index 426bd7d090..9324d1e4c8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -334,6 +334,7 @@ comment "Graphic applications"
 	source "package/pngquant/Config.in"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
+	source "package/spirv-llvm-translator/Config.in"
 	source "package/spirv-tools/Config.in"
 	source "package/stellarium/Config.in"
 	source "package/sway/Config.in"
diff --git a/package/spirv-llvm-translator/Config.in b/package/spirv-llvm-translator/Config.in
new file mode 100644
index 0000000000..73ca787d8a
--- /dev/null
+++ b/package/spirv-llvm-translator/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
+	bool "spirv-translator"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
+	select BR2_PACKAGE_LLVM
+	select BR2_PACKAGE_SPIRV_HEADERS
+	select BR2_PACKAGE_ZLIB
+	help
+	  LLVM/SPIR-V Bi-Directional Translator is a library and tool
+	  for translation between LLVM IR and SPIR-V.
+
+	  https://github.com/khronosGroup/SPIRV-LLVM-Translator
+
+comment "spirv-translator needs a toolchain w/ threads, C++, gcc >= 7, dynamic library, host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
+		|| BR2_STATIC_LIBS || !BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 523890a986..8361a74c59 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -10,7 +10,7 @@ SPIRV_LLVM_TRANSLATOR_VERSION = v15.0.0-46-ge82ecc2bd7295604fcf1824e47c95fa6a09c
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
-HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm host-spirv-headers
+HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm host-spirv-headers spirv-headers zlib
 HOST_SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
 	-DLLVM_BUILD_TOOLS=ON \
 	-DLLVM_DIR=$(HOST_DIR)/lib/cmake/llvm \
@@ -19,4 +19,14 @@ HOST_SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
 	-DLLVM_EXTERNAL_PROJECTS="SPIRV-Headers" \
 	-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=$(HOST_DIR)/include
 
+SPIRV_LLVM_TRANSLATOR_INSTALL_STAGING = YES
+SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm llvm
+SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
+	-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${STAGING_DIR}/usr \
+	-DLLVM_BUILD_TOOLS=ON \
+	-DLLVM_DIR=$(STAGING_DIR)/lib/cmake/llvm \
+	-DLLVM_SPIRV_BUILD_EXTERNAL=YES \
+	-DLLVM_SPIRV_INCLUDE_TESTS=OFF
+
+$(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
