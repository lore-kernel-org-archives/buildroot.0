Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7013AC25B75
	for <buildroot@archiver.kernel.org>; Sun, 19 May 2024 10:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9D1681415;
	Sun, 19 May 2024 10:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5FdVzb8Hm8AN; Sun, 19 May 2024 10:54:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE4D981E6D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE4D981E6D;
	Sun, 19 May 2024 10:54:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D45A1C3D15
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 10:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A96B400F2
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 10:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrquwmkcrk1h for <buildroot@lists.busybox.net>;
 Sun, 19 May 2024 10:54:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C5865400A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5865400A6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5865400A6
 for <buildroot@buildroot.org>; Sun, 19 May 2024 10:54:46 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-34e28e32ea4so1427723f8f.2
 for <buildroot@buildroot.org>; Sun, 19 May 2024 03:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716116083; x=1716720883;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NVWWd0jNNhsC0sPMzRhngcwrtWhNma7JHT5zO6e9elg=;
 b=tcR5csB++xPQw+/lDNoWGx3latgczJ1Fuwar0DHK8EOwT1HUP+D455zd3Q4ZB0ohuC
 L25kqURfD0sEy6vEh1iVZjqEMJuyfiYDBPPRbGo0chPzJUESzdsZ3L9uFlh4lqr+SrLw
 1+1Cbvpnx5dH2ZgZUXSsyy/mWmGtelIJf7sTZwaB5tBp954H+BYeh3Ze9y0t+tXqHtmS
 kiRc3XOJu5ZAcOCMQJEVeON5YN8jWunLI6T4UujHApwZHBkxxpHk7GOrVT9qJ9n6OPW7
 wnTmyaBuzrfYlgYSzmQ382dHDl30l1GLLTU9YYsG+pRX/0SrQ8eBnm6stvICKcGLXHes
 zmSQ==
X-Gm-Message-State: AOJu0Yx5jJClx/Dxi93CMqqf+KM32sGfNroLb4I4W6FOaSD5EVqdeHmT
 pjA80C0iVFTlNMjJNYdUTxqC/I1ocgqgZ4KOl4PYU4WP/7OkqSpVWI+zYw==
X-Google-Smtp-Source: AGHT+IH6Si++5/Pmo8uyPSTc9Wj38v8md+CsYghrc8/UkBhjyNPH2e6ZQcMDVhALc/b26//fSOgsuA==
X-Received: by 2002:adf:ec48:0:b0:343:ef64:e0fd with SMTP id
 ffacd0b85a97d-3504a96a4c5mr18407256f8f.52.1716116083285; 
 Sun, 19 May 2024 03:54:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbbefdsm26288145f8f.94.2024.05.19.03.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 03:54:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 May 2024 12:54:36 +0200
Message-ID: <20240519105436.354168-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716116083; x=1716720883; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NVWWd0jNNhsC0sPMzRhngcwrtWhNma7JHT5zO6e9elg=;
 b=NZVn/S7N287cZ7KBZj/WCo4koXojR47iPjCvjnwWMHdWshNwPbq3thc2XmU2zPrThU
 crWI/f1iCanWw9p2W90agk+4PpVpkejtSfTcqcm1veKJTwL38/rzCJpq80hEC/3MZGX2
 plDCQpUi9D5fyDnPNXzoHFqIIFrnNqRqRnbneaxttPcb9D9esaf5alYwRBcKYSes/JWx
 YLQAFI7Q1OV0rCid+2wednsFGpQJazw94wi/avit5OdZlIOBAoZ3R+TLD5SE/H/1BzIc
 E7kv6d+S7CJTJIN1XCUDhVWzmkUiqxgohE2KT0JjsjGGZ3875npBuoHeULIpmtGuRSmD
 GDHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NZVn/S7N
Subject: [Buildroot] [PATCH 1/1] package/ivi-homescreen: needs gcc >= 8
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ivi-homescreen needs C++17 filesystem resulting in the following build
failure with gcc < 8 since its addition in commit
9d8497e79de3ced144877ba6ee38cc5b7181aaeb:

In file included from /home/buildroot/instance-0/output-1/build/ivi-homescreen-5ab78a19e95c88cc5d6b173ab1260a211e78cf0a/third_party/flutter/shell/platform/common/path_utils.cc:5:0:
/home/buildroot/instance-0/output-1/build/ivi-homescreen-5ab78a19e95c88cc5d6b173ab1260a211e78cf0a/third_party/./flutter/shell/platform/common/path_utils.h:8:10: fatal error: filesystem: No such file or directory
 #include <filesystem>
          ^~~~~~~~~~~~

Fixes: 9d8497e79de3ced144877ba6ee38cc5b7181aaeb
 - http://autobuild.buildroot.org/results/a5e88d5a4264a6165be31a99f1c123af53fa382e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ivi-homescreen/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ivi-homescreen/Config.in b/package/ivi-homescreen/Config.in
index dc2ccb0c97..a4f5f6835f 100644
--- a/package/ivi-homescreen/Config.in
+++ b/package/ivi-homescreen/Config.in
@@ -3,7 +3,7 @@ menuconfig BR2_PACKAGE_IVI_HOMESCREEN
 	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
 	depends on BR2_HOST_GCC_AT_LEAST_5 # flutter-engine
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # flutter-engine
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # flutter-engine
 	depends on BR2_TOOLCHAIN_USES_GLIBC # flutter-engine
 	depends on BR2_INSTALL_LIBSTDCPP # flutter-engine
@@ -250,11 +250,11 @@ comment "OpenGL texture plugin needs an EGL backend"
 
 endif # BR2_PACKAGE_IVI_HOMESCREEN
 
-comment "ivi-homescreen needs a glibc toolchain w/ wchar, C++, gcc >= 5, dynamic library, host gcc >= 5"
+comment "ivi-homescreen needs a glibc toolchain w/ wchar, C++, gcc >= 8, dynamic library, host gcc >= 5"
 	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8 \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
 		|| !BR2_HOST_GCC_AT_LEAST_5
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
