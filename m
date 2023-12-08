Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6EDC4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 13:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A2A9813C2;
	Fri,  8 Dec 2023 13:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A2A9813C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Le_eTuNkZNhe; Fri,  8 Dec 2023 13:54:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6200D83E3F;
	Fri,  8 Dec 2023 13:54:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6200D83E3F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED9211BF83C
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 13:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C612040386
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 13:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C612040386
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o2owO_AyU8dX for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 13:53:56 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E11F400CB
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 13:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E11F400CB
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-333630e9e43so2140708f8f.2
 for <buildroot@buildroot.org>; Fri, 08 Dec 2023 05:53:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702043634; x=1702648434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kYQpSe7YYBgFS1ia9GDXDdUz+DVSelYZJa4a5clVrFA=;
 b=jzApF3vd/BuYk5HNh/OUj5dD32YjaJWYZwpvsr0Yc43QRStmrJ0lzq07zSMUnrEfME
 HcLaXjPx3Q7c7w/KRFTu21MLw7tL6Rho013K+2fUuw7VxkHu+oC+QP3lW2Io3YYv5HJe
 rAxgy3FoX8enQa4+FvryQp4DN8HkZoKtQyGlCm986H7az43k+N01h0/9wSX/Jr0mtLQo
 ZzpiYhRUuQm2XDNwFFoW9TAiq+g8BKSTPL2pmIPVLM1GHmXWfdOiqnOFrBCWsZ/c8tNj
 MuaYWUt4dg2gmEmahymZ72aHVPmdIEXml0sEJY4bAFS41cEQgUPpjBzGB2wnps4JkCuY
 3XSg==
X-Gm-Message-State: AOJu0YxIPYFnzkDavYblRmpAB8fxE5srTDQhl4I/5q4HPox/finexSz/
 eB4l3Xilh1If+NAv613O72t+23gBJSIJYc0Am3U=
X-Google-Smtp-Source: AGHT+IEoIDQJufJWBh2UWieu0HwN+xlfssya0YCbjOYyWcCHeJ3UkLyQir/8UUeV+6f5Q2hJlxeDCQ==
X-Received: by 2002:a05:600c:5026:b0:40c:36fb:f3 with SMTP id
 n38-20020a05600c502600b0040c36fb00f3mr153128wmr.281.1702043634348; 
 Fri, 08 Dec 2023 05:53:54 -0800 (PST)
Received: from P-NAN-KHNOUM.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c459400b0040b349c91acsm5227705wmo.16.2023.12.08.05.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 05:53:53 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Fri,  8 Dec 2023 14:53:29 +0100
Message-Id: <20231208135329.1352567-3-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231208135329.1352567-1-antoine.coutant@smile.fr>
References: <20231208135329.1352567-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1702043634; x=1702648434;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kYQpSe7YYBgFS1ia9GDXDdUz+DVSelYZJa4a5clVrFA=;
 b=ZjdounoJqS0O+ZdUuS3DxQfVyBqS1zWOcv4iunnkWK40Dg5ErLCQmJp5f6T9lnphPP
 isg393/o0B7Q2SopYNLjxyXsqOSoyBpb6PTEoe8mS14hiK2qZbPkTplO5/mYEoMJ7RQU
 GOHilMqiU7GPMRyyfVeh75OqzQype6D1Jk/zP/o/dPw1bmzNSfJ2fxABwVJdv8HRJqzL
 dpL9OboP0L7DZ7ab67oslmOhJMwx9oxqRUhz6g+bz5byi1Fs9fFVslfTBg+IDkgGudy/
 hNy19PUBUHk6Knao94sM6V8Zui0+hFIAdpnXQflTyit+AhqqwomUQpJ4WrMrH+S3mlkF
 4Y5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ZjdounoJ
Subject: [Buildroot] [PATCH 3/3]
 toolchain/toolchain-external/toolchain-external-arm-aarch64-be: bump to
 version 13.2-rel1
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated to gcc 13.2, gdb 13, binutils 2.41, glibc 2.38.

The x86_64 host variant prebuilt toolchain is built on RHEL7
(glibc 2.17) and is likely also be useable on OS versions like
RHEL8, Ubuntu 18.04 or later.

The AArch64 host variant prebuilt toolchain is built on Ubuntu 18.04
(glibc 2.27) is likely also be useable on OS versions like RHEL8,
Ubuntu 18.04 or later.

Release note:
https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 .../toolchain-external-arm-aarch64-be/Config.in               | 4 ++--
 .../toolchain-external-arm-aarch64-be.hash                    | 4 ++--
 .../toolchain-external-arm-aarch64-be.mk                      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index 466b1587c3..1cee601a89 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
-	bool "Arm AArch64 BE 12.2.rel1"
+	bool "Arm AArch64 BE 13.2.rel1"
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -7,7 +7,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
index f148d6326d..a9830c43c3 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
@@ -1,2 +1,2 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz.sha256asc
-sha256  47632b5594ed6c3efda92a55c4c330263fc22f5d845d9e1c7d969ce24fcedeea  arm-gnu-toolchain-12.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz.sha256asc
+sha256  fe864b2b15127f58867a171cfcd639318609e734fbc8b78bb40258312a21a097  arm-gnu-toolchain-13.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
index d35b945b04..7771269b0d 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 12.2.rel1
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 13.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
 
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-none-linux-gnu.tar.xz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
