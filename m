Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B52C433EF
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 20:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AAFB80B9C;
	Sat, 21 May 2022 20:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yPZcF1HTwU2S; Sat, 21 May 2022 20:46:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DF268415A;
	Sat, 21 May 2022 20:46:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D2761BF286
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 20:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BE3B8415A
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 20:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hool5IUgluiG for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 20:46:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27AC183F87
 for <buildroot@buildroot.org>; Sat, 21 May 2022 20:46:21 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id u27so14907336wru.8
 for <buildroot@buildroot.org>; Sat, 21 May 2022 13:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7bHLCMBmFpqPw5GMm7z3VfWTboWyGWozBGBqcWjUC+s=;
 b=mf0ULCeCFnvlvTL0SCfL3iI3VwyePuwevVjtHPdTA3B22gQlBESEfKqv7u7SoZk//C
 SQWinLI/dbbsm/QPZoszFRxcQ3VmVUMpW2bALYliwHQg8FQEPm9IvBGVpCxJ3hXgC5Hu
 8bdnQlBcVAnyOEYbq9B+j32rYI6bQ0ri6f01PlGTJsQO2K7AU6XJ94SVWgOSw+jAwo1B
 PHKIfSVic4cWuXbR32Qtwmf7r3Wbv1VN6JhcYPkmjjZYTGWmF6Y1NXXzu+HNwsVeq38d
 R+ClBasrOKMHeavQYZb0zuiLnDYyyQJWtWQKS9L3FvEE9Dz/2UAJOj3VGZL4BBW1iXz0
 QZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7bHLCMBmFpqPw5GMm7z3VfWTboWyGWozBGBqcWjUC+s=;
 b=SJbRVWYiqGvdRU0vTjUHTcBeTT93pINuiVWX2ZsC1292wKY1LF0fbffa1ilPiBBgKh
 KSAFGZwXbJ0f/t3rtoFpFOL+/7RjnbyeJnRzy4gPI2R42cQYEZ5W+e3FjoyqFbpUotIQ
 cJqf36RzpRvc0ivZHEjEg73EYP8zznr7OIcXcR5JwmaxA8Vf6+pW2FWcp4MjLRQkI0nZ
 cxiAU+GLlueNk3yWsz+qzUNSLS7zcE1kD0rEvnTk42JUk1dKC5BqSdHIil7Dad6FFspA
 ibhor8ouQDoG6de/9xwJDhzPBG/fm8sS+mXMYgemh+dp+RvA/5ZnJWavMgqhPZVn6SOp
 UYBg==
X-Gm-Message-State: AOAM530gZ2sHrsh98n0w8m65/9XvdrgKM6paC/uNwFrKbDRqqW7Pro6k
 7zGB5tG1P0Gdek3MAXVMfVLMsFqjsrY=
X-Google-Smtp-Source: ABdhPJzK+RhE0BggA3Tx11fT+n0ZqqoH93SHI9ZMCg/4com6DUXve6qQnX525X1erZ7xaJJR4lFOrQ==
X-Received: by 2002:a5d:64ad:0:b0:20e:5947:7cbf with SMTP id
 m13-20020a5d64ad000000b0020e59477cbfmr13375036wrp.278.1653165979037; 
 Sat, 21 May 2022 13:46:19 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 bd15-20020a05600c1f0f00b00397393419e3sm4586092wmb.28.2022.05.21.13.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 13:46:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 May 2022 22:43:48 +0200
Message-Id: <20220521204348.1023965-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qpid-proton: needs C++ and threads
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

qpid-proton needs C++ (and so threads due to proactor) to avoid the
following build failure:

CMake Error at /nvmedata/autobuild/instance-3/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
  The C++ compiler

    "/usr/bin/c++"

  is not able to compile a simple test program.

C++ check can't easily be removed:
https://github.com/apache/qpid-proton/pull/366

Fixes:
 - http://autobuild.buildroot.org/results/76f8deccc9c4eee29eddf42586cc28e96eec0827

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qpid-proton/Config.in      |  7 +++++--
 package/qpid-proton/qpid-proton.mk | 15 +--------------
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/package/qpid-proton/Config.in b/package/qpid-proton/Config.in
index b49a2afa7e..adddc6eca0 100644
--- a/package/qpid-proton/Config.in
+++ b/package/qpid-proton/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_QPID_PROTON
 	bool "qpid-proton"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # build a shared library
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
@@ -13,5 +15,6 @@ config BR2_PACKAGE_QPID_PROTON
 
 	  https://qpid.apache.org/proton/
 
-comment "qpid-proton needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "qpid-proton needs a toolchain w/ C++, dynamic library, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index 103cf9fd31..fae6ecc413 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -23,6 +23,7 @@ QPID_PROTON_DEPENDENCIES = \
 # go language binding is enabled when host-go is present
 # For now, disable all of them.
 QPID_PROTON_CONF_OPTS = \
+	-DBUILD_CPP=ON \
 	-DBUILD_GO=OFF \
 	-DBUILD_PYTHON=OFF \
 	-DBUILD_RUBY=OFF \
@@ -31,20 +32,6 @@ QPID_PROTON_CONF_OPTS = \
 	-DENABLE_WARNING_ERROR=OFF \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3
 
-# epoll proactor unconditionally uses pthread and cpp (C++) bindings
-# unconditionally use proactor
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-QPID_PROTON_CONF_OPTS += -DBUILD_CPP=ON
-else
-QPID_PROTON_CONF_OPTS += -DBUILD_CPP=OFF
-endif
-else
-QPID_PROTON_CONF_OPTS += \
-	-DBUILD_CPP=OFF \
-	-DPROACTOR=none
-endif
-
 ifeq ($(BR2_PACKAGE_JSONCPP),y)
 QPID_PROTON_DEPENDENCIES += jsoncpp
 QPID_PROTON_CONF_OPTS += -DENABLE_JSONCPP=ON
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
