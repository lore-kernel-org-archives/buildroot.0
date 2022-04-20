Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49DEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 17:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5522784154;
	Wed, 20 Apr 2022 17:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bhXPB-78HTwT; Wed, 20 Apr 2022 17:30:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49959840BC;
	Wed, 20 Apr 2022 17:30:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98C081BF4D6
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 17:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87393840BC
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 17:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p6VI31Lv_dsA for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 17:30:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9699F81DCB
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 17:30:22 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id p18so3236855wru.5
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 10:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FYybqZdYTXtII6Q/IPrd7X3Kgwuddwv28YJQuAQ+fMA=;
 b=pB13idGOPSwnvRreetThs2TUimXj7RqDxEszgJPgrXW20gYFUovRQdwoARUqxEWzZf
 zHgOo0S4vC+GT3BzlFt5BVBaRHszSc53ArIkHhDGxOrCU64yGfmruj0JlowjoEmOkQKN
 HDCwxUdZLnBQQh0xITiiXtLpsUwoysoUlxCpQiuej02XtBRqGgegwtpS633MLUDQNRaw
 74Hu3DCOW/vWb1LI2ww70w5qXr4fkSoLI6Z0TW54hL2mJlUi778nu0KnQ+O/S1LLmTnW
 oZiJLU5SKj1N+3Pd7t2VALQxyXAMJp0MFFq7EIGX9OOrkhufbQTxPNSCV1oA+QGwNv/w
 Yzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FYybqZdYTXtII6Q/IPrd7X3Kgwuddwv28YJQuAQ+fMA=;
 b=CflFKJsUQoBPfKFKvWWiiSG96wvD+S9GA9Xbq19pHCatCUFNiOsXPFAR2jcSlz7Ju9
 snbFj3CLGn+xbi3gxsVJe/OnqJfw+g0JrPv031QuhFMTLALLqjwgnYapOx+A9zF3LvIV
 NtBHDlC9nacoxAKj5buc1kCsJ45bLetnx46d75qW++3FqIx65ksWh0vVpQArUPAluNek
 PmC3wV0JBn1VCnCov6rBWe8bcf2MjwTGoGK8nybNNPoZv/hXaQbGYp0ewuaZ7j1P3cM+
 VSvLMiAJ10LqB9/qwPBqbpFJD+il9ZuP3WXZOmpk8FVgqRcRRozl25WZMGZlsbGTxuMC
 Pr1g==
X-Gm-Message-State: AOAM533SdQzYrdTZBojMfcJYIJ6QgWiCnlyxakz3Ocy5tQf4aFRjRmdy
 0AsFqjMNY0h6tfPoeInnZisjRdqgLyo=
X-Google-Smtp-Source: ABdhPJyGNv6or/b66b9qouRUqKadivX9pXH7r0hayfQuR06RE89EX9QazPeeMc+AP0UHJdhK3OL2Ig==
X-Received: by 2002:a5d:67d2:0:b0:207:a5cf:c14d with SMTP id
 n18-20020a5d67d2000000b00207a5cfc14dmr16545159wrw.365.1650475820503; 
 Wed, 20 Apr 2022 10:30:20 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a056000186500b0020a8688963bsm475917wri.89.2022.04.20.10.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 10:30:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 19:28:16 +0200
Message-Id: <20220420172816.1160081-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/opencv4: fix uclibc build
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

Add BR2_PACKAGE_OPENCV4_LIB_DNN to fix the following uclibc build
failure raised since bump to version 4.5.5 in commit
b6922313937712a89841b58d3b355edd53754bca and
https://github.com/opencv/opencv/commit/1feb3838b51c0b27b0f3e64f02358ff5ef3111b8:

/home/giuliobenetti/autobuild/run/instance-3/output-1/build/opencv4-4.5.5/modules/dnn/src/layers/elementwise_layers.cpp: In member function 'float cv::dnn::RoundFunctor::calculate(float) const':
/home/giuliobenetti/autobuild/run/instance-3/output-1/build/opencv4-4.5.5/modules/dnn/src/layers/elementwise_layers.cpp:1260:43: error: 'fegetround' is not a member of 'std'
 1260 |         int old_rounding_direction = std::fegetround();
      |                                           ^~~~~~~~~~
/home/peko/autobuild/instance-0/output-1/build/opencv4-4.5.5/modules/dnn/src/layers/elementwise_layers.cpp:1261:14: error: 'fesetround' is not a member of 'std'
 1261 |         std::fesetround(FE_TONEAREST);
      |              ^~~~~~~~~~
/home/peko/autobuild/instance-0/output-1/build/opencv4-4.5.5/modules/dnn/src/layers/elementwise_layers.cpp:1261:25: error: 'FE_TONEAREST' was not declared in this scope
 1261 |         std::fesetround(FE_TONEAREST);
      |                         ^~~~~~~~~~~~

Indeed, uclibc pretends to implement fenv but it raises build failures
on numerous architectures (or1k, sh4, xtensa, mipsel, arm, arc, riscv64,
etc.)

Fixes:
 - http://autobuild.buildroot.org/results/a6dd3c10acfbf6bc1af867d770cf0ce926c6ce84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv4/Config.in  | 11 +++++++++++
 package/opencv4/opencv4.mk |  1 +
 2 files changed, 12 insertions(+)

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index 23d34a9d22..a61a106952 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -30,6 +30,17 @@ config BR2_PACKAGE_OPENCV4_LIB_CALIB3D
 	  Include opencv_calib3d (camera calibration and 3d
 	  reconstruction) module into the OpenCV build.
 
+config BR2_PACKAGE_OPENCV4_LIB_DNN
+	bool "dnn"
+	# dnn needs fenv.h which is not provided by uclibc
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	help
+	  Include opencv_dnn (Deep Neural Networks) module into the
+	  OpenCV build.
+
+comment "dnn needs a glibc or musl toolchain"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
+
 config BR2_PACKAGE_OPENCV4_LIB_FEATURES2D
 	bool "features2d"
 	select BR2_PACKAGE_OPENCV4_LIB_FLANN
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 0563026b18..84e0487dc4 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -92,6 +92,7 @@ OPENCV4_CONF_OPTS += \
 	-DBUILD_opencv_apps=OFF \
 	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV4_LIB_CALIB3D),ON,OFF) \
 	-DBUILD_opencv_core=ON \
+	-DBUILD_opencv_dnn=$(if $(BR2_PACKAGE_OPENCV4_LIB_DNN),ON,OFF) \
 	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV4_LIB_FEATURES2D),ON,OFF) \
 	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV4_LIB_FLANN),ON,OFF) \
 	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV4_LIB_HIGHGUI),ON,OFF) \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
