Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76102C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 17:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1998F60ABA;
	Sat, 30 Dec 2023 17:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1998F60ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1-oKa7eECTj; Sat, 30 Dec 2023 17:47:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 574B860AA0;
	Sat, 30 Dec 2023 17:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 574B860AA0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D91991BF40B
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B07F3403BF
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B07F3403BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xiGBQ0sCqsd3 for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 17:47:35 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C2CF40189
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 17:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C2CF40189
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40d3ae326f6so85137325e9.3
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 09:47:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703958452; x=1704563252;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hc0btD29n+HnME0uHM2o+ckeDzOZKv/sOJIy+GJFA2A=;
 b=ZuX5TNY8DIupf5GRFUn9NfYreWZKGgNjGmnfdBEzuh8yMIHUM0We2PoGcdYYp4EblC
 Aae3m3U/lARTxjm2wx9mHeI/kAIPlfbfZyuU/bSUq/iGaL9dLOmNBeiMDBcCS+wK3yUu
 WK+zZh9zSmi645YRkgxf2AVXJED5a2NEnYLGRoRB/aAw3PdCSGL4Bjqpj4S98bGeCFUt
 /LI1UafenTvSU1+Eg3GGY55d4nUzngNIuQcxc1ELk17696qe+ibI8ZjloS3TLHtSSJyC
 wtULYjWVGlvCGHWHHtnVU6ozE8Uw5eh0otVE31QqvtA7vuBgdGEPd4rVpHBMagwhJvOh
 xzEw==
X-Gm-Message-State: AOJu0Yxcqy/U/TJtSXpqoG1KgpJvkLVWte33nUg9zggQsHxOtYsHIwsQ
 JXAxg1d/uceMN5lrkUwcmQxqUjnkoX8=
X-Google-Smtp-Source: AGHT+IHSeOh/e7QLsli3MBwSAYC2VPgWqIe9UC7lHJzt9twjGd5g3MBuRt8/DznDON04MhY18dk5WA==
X-Received: by 2002:a05:600c:1d20:b0:40d:5bbe:ff8c with SMTP id
 l32-20020a05600c1d2000b0040d5bbeff8cmr3236400wms.160.1703958451899; 
 Sat, 30 Dec 2023 09:47:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b0040d5aca25f1sm16012829wmq.17.2023.12.30.09.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 09:47:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 18:47:27 +0100
Message-ID: <20231230174727.945145-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703958452; x=1704563252; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hc0btD29n+HnME0uHM2o+ckeDzOZKv/sOJIy+GJFA2A=;
 b=OPGrHzli/zLIht5ELteEN35hAR7XncTrbx+0yjWrnGiDuqgyqm7xaahCGa76MOogCl
 akzrVyVLnpl6FKI+sqWcN6njGSbbAouoadOFnnEtP7MVRkFojvf68il4T0lxvZyQSFV9
 kXpR0TwSE4+eh+DPrBNMO7O8aRAs2Uc7wvBaJGwtvwjm4mbQ47FuV9X99OPksZ9aXIKB
 91MF6bW+t1FM84S+QgeV7cwdbo6iKcCwWVuya7sa/k73Yx81kT9yOmDvglpk7SLmcu9B
 4K7JwvPbgR83PN28r/oj6TrsUUqJX/Tvew3np63TvN3OLRHwNpMMA/hqNk4vIWfMTleI
 GwCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OPGrHzli
Subject: [Buildroot] [PATCH 1/1] package/libhttpserver: bump to version
 0.19.0
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
Cc: Stephan Hoffmann <sho@relinux.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

C++17 is mandatory since
https://github.com/etr/libhttpserver/commit/17772843eac42bbd15e13659f96596d59e622872

https://github.com/etr/libhttpserver/releases/tag/0.19.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libhttpserver/Config.in          | 6 +++---
 package/libhttpserver/libhttpserver.hash | 2 +-
 package/libhttpserver/libhttpserver.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libhttpserver/Config.in b/package/libhttpserver/Config.in
index dcdf30566d..3120059a08 100644
--- a/package/libhttpserver/Config.in
+++ b/package/libhttpserver/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBHTTPSERVER
 	bool "libhttpserver"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11 PR59526
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBMICROHTTPD
@@ -12,6 +12,6 @@ config BR2_PACKAGE_LIBHTTPSERVER
 
 	  https://github.com/etr/libhttpserver
 
-comment "libhttpserver needs a toolchain w/ C++, threads, gcc >= 5"
+comment "libhttpserver needs a toolchain w/ C++, threads, gcc >= 7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/libhttpserver/libhttpserver.hash b/package/libhttpserver/libhttpserver.hash
index 19ad63bde2..03ebdc4a76 100644
--- a/package/libhttpserver/libhttpserver.hash
+++ b/package/libhttpserver/libhttpserver.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  1dfe548ac2add77fcb6c05bd00222c55650ffd02b209f4e3f133a6e3eb29c89d  libhttpserver-0.18.2.tar.gz
+sha256  b108769ed68d72c58961c517ab16c3a64e4efdc4c45687723bb45bb9e04c5193  libhttpserver-0.19.0.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LESSER
diff --git a/package/libhttpserver/libhttpserver.mk b/package/libhttpserver/libhttpserver.mk
index bd3ecbd416..54774e763b 100644
--- a/package/libhttpserver/libhttpserver.mk
+++ b/package/libhttpserver/libhttpserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTTPSERVER_VERSION = 0.18.2
+LIBHTTPSERVER_VERSION = 0.19.0
 LIBHTTPSERVER_SITE = $(call github,etr,libhttpserver,$(LIBHTTPSERVER_VERSION))
 LIBHTTPSERVER_LICENSE = LGPL-2.1+
 LIBHTTPSERVER_LICENSE_FILES = COPYING.LESSER
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
