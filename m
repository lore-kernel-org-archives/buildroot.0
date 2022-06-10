Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C69C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Jun 2022 16:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D14B942539;
	Fri, 10 Jun 2022 16:57:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TOsxK7wmOcW3; Fri, 10 Jun 2022 16:57:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67C7C41A26;
	Fri, 10 Jun 2022 16:57:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A9511BF358
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 16:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A2008443D
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 16:56:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qnYA72Gf_1sZ for <buildroot@lists.busybox.net>;
 Fri, 10 Jun 2022 16:56:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40E7A84422
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 16:56:55 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 l126-20020a1c2584000000b0039c1a10507fso1347045wml.1
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 09:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HnnPqifuxvqSx87gnWrg3oDtoWRkw7rkPvpSRq3QCHI=;
 b=MQqtul9fd91Fhpb/kFMy0TVSnBrN74ofkQcZhQW3cywnnNn3esMLw9dbuJrE0EN+t/
 9g87T1bIOn1M0d4DNB6AGZohRHROy9Cbqqh5h+3GtIvuAnnQtM4a3+UZvPlzOGnGe6/0
 ZMTPfwP8nLaoOJeHSx33YsRbOlV3QTeQIDCcKEoGb/NpzqzPWnUBF/fiPGwAGJJdmEQF
 gHYK9BVATGNQpPBGiPJoLdy+J3BZ3vWI6ngVGyygKZhdM2SjUGQDgYaPoxQyIuRmLwG/
 lKx9d70HWB6hJg6P2eyhiE54TB3ecUUgSpleVJHgNv+M1PElFB9kNU7b2TYAoVE56XT+
 nz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HnnPqifuxvqSx87gnWrg3oDtoWRkw7rkPvpSRq3QCHI=;
 b=ELp+49wSXez9gitG5Sy2lkgnyO8PPDKK2w0mEkrLthftWS797t5eBxwrTZAPUQ+HuQ
 kTo6C3vxqaF2myMnigoMIuHF4SKby1oTwaqRFLYxTSJXGM7RBunta7KmMBDrhjropL/3
 jRgRPnC4o5OcWSMgMDOHaRR5nBT8AECE+djvar24BYSySrErXJLMQBMYJB4dau6xm1aP
 wxaeUxZpcMoyvWNxv1Q2TGd0XHm1W0LVapwdOkzrU7yN2mdbBg147n6b7Yh+pjQUmq3o
 YmeBX+0gPkZPXgCwLIbb6U2UghIvMcYrWKTy4cBP8Js4VATQILy2TP9jCpSOGqwAhmNQ
 qGug==
X-Gm-Message-State: AOAM531OfNs5/440yzNR/e+M7b8hlXinHHfTlHwVtJL9/oX4SN3SsJ00
 2cpjw34Ehe6NMxNSKMSJteQqBpnBU60=
X-Google-Smtp-Source: ABdhPJyvzXFb9YIvLp/msZUGTbHQ9AWlDLkev91z8oMN3Mj/U9HV+tCDx5SYaM8pfph1EO/2o5PwJQ==
X-Received: by 2002:a05:600c:34d2:b0:397:7209:c1f0 with SMTP id
 d18-20020a05600c34d200b003977209c1f0mr679388wmq.132.1654880212958; 
 Fri, 10 Jun 2022 09:56:52 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c4e8600b0039c6ce32a2dsm4157941wmq.33.2022.06.10.09.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:56:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Jun 2022 18:54:12 +0200
Message-Id: <20220610165412.3605141-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gtest: needs gcc >= 5
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Stephan Hoffmann <sho@relinux.de>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Francis Laniel <flaniel@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit be38432532b23275869a3a914c0ad0031323259c wrongly assumed that
is_trivially_copy_constructible was available since gcc 4.9 but it
wasn't fully available until gcc 5.1 and
https://github.com/gcc-mirror/gcc/commit/f5e523b76d1bdaf0df15f6bfdee602a3e153be68
resulting in the following build failure with gcc 4.9.1:

In file included from /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/internal/gtest-death-test-internal.h:39:0,
                 from /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/gtest-death-test.h:41,
                 from /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/gtest.h:64,
                 from /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/src/gtest-all.cc:38:
/nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/gtest-matchers.h: In static member function 'static constexpr bool testing::internal::MatcherBase<T>::IsInlined()':
/nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/gtest-matchers.h:414:12: error: 'is_trivially_copy_constructible' is not a member of 'std'
            std::is_trivially_copy_constructible<M>::value &&
            ^

Fixes:
 - http://autobuild.buildroot.org/results/1723705cb7aea5f6fcc7e6722d866ed3bd098115

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/falcosecurity-libs/Config.in |  2 +-
 package/gtest/Config.in              | 13 ++++++-------
 package/libcamera/Config.in          |  7 +++----
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
index 157bc8ef6d..f101883384 100644
--- a/package/falcosecurity-libs/Config.in
+++ b/package/falcosecurity-libs/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_FALCOSECURITY_LIBS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # grpc
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # grpc, gtest
 	depends on BR2_TOOLCHAIN_HAS_THREADS # jq, protobuf, tbb
 	depends on !BR2_STATIC_LIBS # protobuf, tbb
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
diff --git a/package/gtest/Config.in b/package/gtest/Config.in
index 35fc9fea7b..4355e9c9c5 100644
--- a/package/gtest/Config.in
+++ b/package/gtest/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_GTEST
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11
 	depends on BR2_USE_MMU # fork()
 	help
 	  Google's framework for writing C++ tests on a variety of
@@ -26,7 +26,7 @@ if BR2_PACKAGE_GTEST
 
 config BR2_PACKAGE_GTEST_GMOCK
 	bool "gmock"
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-gtest
+	depends on BR2_HOST_GCC_AT_LEAST_5 # host-gtest
 	help
 	  Inspired by jMock, EasyMock, and Hamcrest, and designed with
 	  C++'s specifics in mind, Google C++ Mocking Framework (or
@@ -48,13 +48,12 @@ config BR2_PACKAGE_GTEST_GMOCK
 	  libraries required to link/run them. The host package installs
 	  gmock_gen, a Python script used to generate code mocks.
 
-comment "gmock needs host gcc >= 4.9"
-	depends on !BR2_HOST_GCC_AT_LEAST_4_9
+comment "gmock needs host gcc >= 5"
+	depends on !BR2_HOST_GCC_AT_LEAST_5
 
 endif # BR2_PACKAGE_GTEST
 
-comment "gtest needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "gtest needs a toolchain w/ C++, wchar, threads, gcc >= 5"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 23a0040abf..fd7b3c92c4 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -77,18 +77,17 @@ config BR2_PACKAGE_LIBCAMERA_COMPLIANCE
 	depends on BR2_USE_WCHAR # gtest
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gtest
 	depends on BR2_INSTALL_LIBSTDCPP # gtest
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gtest
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # gtest
 	depends on BR2_USE_MMU # gtest
 	select BR2_PACKAGE_GTEST
 	select BR2_PACKAGE_LIBEVENT
 	help
 	  lc-compliance test application
 
-comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads, gcc >= 5"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 endif # BR2_PACKAGE_LIBCAMERA
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
