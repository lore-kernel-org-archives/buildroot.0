Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A92C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 16:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC52F40C04;
	Wed,  6 Apr 2022 16:25:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QM5aYyiIhMe1; Wed,  6 Apr 2022 16:25:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71BFE40AE2;
	Wed,  6 Apr 2022 16:25:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E5601BF593
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 16:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C51460EE5
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 16:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TF64fSjwiH-n for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 16:25:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6F8D60EDD
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 16:25:36 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id c7so4110479wrd.0
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 09:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yh8YJIxLRCxu7/PuYd4hh1BpXgH8OVgRbuWaGVT965I=;
 b=l0WgAyB7ll/KPoVt3tYg8ykSDa7jXCVd2tWJkcS2qO1ZWYyMASiY0f8GBlp0hZABUO
 LWmFRMuYEXh54Zjz9trai1LY0lAtn1RKmH6oH+M5VfCBhznYeKEZx1lKCC8F3m5lzdHH
 ru26Tpkkodei/25m9RrPOnR7iaJ5EX8kak2EFfYTQm+Tgee9uNiaE8aU3csQDz2tN8NX
 fbWVEl6khRDd5BoD4NJ6oyc2QLjaP8VHvWLZvM6wCvKDTrtTJ2Bh3NoAxDOaoEC24FFL
 V+9ebhrbq9HxCcWjx0gz8aNIEZuQLhn2r9b6S8NraBoD/ZrXCk/aOP40dfEyCIKxz8do
 O88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yh8YJIxLRCxu7/PuYd4hh1BpXgH8OVgRbuWaGVT965I=;
 b=OnqGfAE13IitUoiqTq7J4DhJbfzqdlj7Cx67mN/k/jt8lYMUH7uRqsD7uRrdYDLTnd
 +7+il4M1nBoisHXH6eB9N3T9QYM/1FCQyKWMaoNlfFluITuTH4UZYPz3wzo7X224eMmG
 nje+KpmJzuvQk4S4pkQAeW4kRYHzACgx4bsPvIluEqhjr75JhyozZZKUg5yEJFj8ME0F
 7pHxbkuEsFT6lbDnDLR2mxb0MI9/TpM9xqJZd367fMvRv/nGQftRsDdtxta69Rfm8v3B
 k9sSkGA1E4GN7s0LdjjyfMiROLMGx5iau9iQhuNQAbU6GRFSUYXK95/B205zGM4tsw0E
 G5Kg==
X-Gm-Message-State: AOAM533ddAu7uJ9lCNHa06JSRXh17HCtBgnvr4OWEhfwjuOYDf3ttGEg
 1KC/YBqye2/4KfGGpFggl8zuDhspsts=
X-Google-Smtp-Source: ABdhPJzD0SKnXRxswzaph4rl+NTuy2CxFAXAGdAmZGelTgiw3Q0Wc71XbwvxbvT0cL+/hKr2cz0XPQ==
X-Received: by 2002:adf:f303:0:b0:206:e61:a5a9 with SMTP id
 i3-20020adff303000000b002060e61a5a9mr7301974wro.112.1649262334669; 
 Wed, 06 Apr 2022 09:25:34 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm18061444wry.102.2022.04.06.09.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 09:25:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Apr 2022 18:23:44 +0200
Message-Id: <20220406162344.4005462-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/intel-gmmlib: needs C++
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Louis-Paul Cordier <lpdev@cordier.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

intel-gmmlib needs C++ since its addition in commit
93e4ee81a2e3e163bf74c24b6ec68f9446f96ae4 and
https://github.com/intel/gmmlib/commit/7a1ec78c0bc74939ba3ef61854f98eb4d7267cc3:

CMake Error at /nvmedata/autobuild/instance-15/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
  The C++ compiler

    "/usr/bin/clang++"

  is not able to compile a simple test program.

Fixes:
 - http://autobuild.buildroot.org/results/8cadfee0288a05676868e05d56243d866cbf051d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/intel-gmmlib/Config.in      | 5 +++--
 package/intel-mediadriver/Config.in | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/intel-gmmlib/Config.in b/package/intel-gmmlib/Config.in
index 9d5fbd9cae..b6f93f7416 100644
--- a/package/intel-gmmlib/Config.in
+++ b/package/intel-gmmlib/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_INTEL_GMMLIB
 	bool "intel-gmmlib"
 	depends on BR2_x86_64
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  The Intel(R) Graphics Memory Management Library provides
 	  device specific and buffer management for the Intel(R)
@@ -10,5 +11,5 @@ config BR2_PACKAGE_INTEL_GMMLIB
 
 	  https://github.com/intel/gmmlib
 
-comment "intel-gmmlib needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "intel-gmmlib needs a toolchain w/ dynamic library, C++"
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/intel-mediadriver/Config.in b/package/intel-mediadriver/Config.in
index c29c2fb6ab..ad56590008 100644
--- a/package/intel-mediadriver/Config.in
+++ b/package/intel-mediadriver/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_INTEL_MEDIADRIVER
 	bool "intel-mediadriver"
 	depends on BR2_x86_64
 	depends on !BR2_STATIC_LIBS # mesa3d, libva
-	depends on BR2_INSTALL_LIBSTDCPP # mesa3d
+	depends on BR2_INSTALL_LIBSTDCPP # intel-gmmlib, mesa3d
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libva
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3d
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
