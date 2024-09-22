Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD12ACF9C5B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 02:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AF1540124;
	Sun, 22 Sep 2024 02:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9AX-Pte3J_a; Sun, 22 Sep 2024 02:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E1404036A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E1404036A;
	Sun, 22 Sep 2024 02:56:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6CC1BF419
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 02:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C6C74036A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 02:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4IzEj3rPS6Ep for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 02:56:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 05CC940124
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05CC940124
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05CC940124
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 02:56:33 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-82aa7c3b482so127255939f.2
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 19:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726973792; x=1727578592;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4TtRHpFd1xSjrHwRtoqKSEHuQ/hdUKCmHjbsAZEQcKw=;
 b=jbo68kXxaVHIvmDNsjgEae26liIRTd70QrznmxeyDZPWPokyBbNVmOk0nP1DTzgScQ
 pYEIBii/p/p1szsDADL7n5cIuUvZRzFas6OxjoRh8py91UPishpx8Epk01MKsQEKtrxn
 gQRavEl2Oy6Gh6YCXrOgxGOhpofNfZnqQq8W+6MyfnooQbmZ6UfZsGmkpn4mN76+AjlE
 WCpWenrBnEfA8gn4G7SeZAjJXwpm3P41216AhQGViwY2B1jblTw1h/S0GU4t9+RTlBcF
 fd72fjalhxTSka95n1WYBv/EjqIlTuFp30IJtYJW3Tc/p+e73UR3YsSG/S38dgnqG048
 jD6Q==
X-Gm-Message-State: AOJu0YzQ8kg0LFaYxLVjB9J5LMmZxNWS9ROUJg3oAork73S2XUOz0ouN
 P5WyZ3zlsiAd6XBzVf9qEoiBHuce5bIK95guBXxldzOkmQj1ol+lyIFiZg==
X-Google-Smtp-Source: AGHT+IGzEG5DMkirK61GQU8gpueLuKXOYb4QHsOJlcgRCTz1b4Pj0TMgHYdWAykch3TVl98v4fHdDw==
X-Received: by 2002:a05:6e02:18c9:b0:3a0:8c5f:90d8 with SMTP id
 e9e14a558f8ab-3a0c8c7eabdmr59779365ab.6.1726973792525; 
 Sat, 21 Sep 2024 19:56:32 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed13d78sm4332747173.105.2024.09.21.19.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 19:56:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 20:56:30 -0600
Message-Id: <20240922025630.749018-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726973792; x=1727578592; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4TtRHpFd1xSjrHwRtoqKSEHuQ/hdUKCmHjbsAZEQcKw=;
 b=munmghtcahzb+TMO9iF8ySWS1UwK3VrdIl011Av8MG10bzu9IgS2sV/BMgh3hvUPrg
 edO1BOH9yVilZ1GT2X5oTAx16O6C+okT0DU48LlN8YHAyynkfL9vpEGw/24H+K4VspkE
 UKuFks1YsGh1ce3McGMVp+UEIOzU5WA+g3ELEqNZUx13xOmUZnkR8ijH1ANxAWnIx9qM
 Wc1KI9sKU9SNKvYYQRBxK4R9y7gS6al+e8DaLvkju1b+NJ9NxzLPJkJicJc1v55CyHHd
 sYSrzNzgUZG+zyu1/GRhJrbx8Xwriwxmsvq+3DkebH3I9hoB0QETEVVXNAFzeaO2zzOS
 DvvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=munmghtc
Subject: [Buildroot] [PATCH 1/1] package/python-sockjs: bump to version
 0.13.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-async-timeout runtime dependency.

License file renamed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sockjs/Config.in          | 1 +
 package/python-sockjs/python-sockjs.hash | 6 +++---
 package/python-sockjs/python-sockjs.mk   | 6 +++---
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-sockjs/Config.in b/package/python-sockjs/Config.in
index 92489ec71f..12346217c7 100644
--- a/package/python-sockjs/Config.in
+++ b/package/python-sockjs/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_SOCKJS
 	bool "python-sockjs"
 	select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
+	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	help
 	  SockJS server implementation for aiohttp.
 
diff --git a/package/python-sockjs/python-sockjs.hash b/package/python-sockjs/python-sockjs.hash
index 137b54a89d..30a4ae1072 100644
--- a/package/python-sockjs/python-sockjs.hash
+++ b/package/python-sockjs/python-sockjs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sockjs/json
-md5  e28c1a82aa84c3994817905090abb169  sockjs-0.11.0.tar.gz
-sha256  0347d404ed9ef3196506787ed8018f87ee4e2d0baea49d420cdd53a969bec229  sockjs-0.11.0.tar.gz
+md5  0d35a367e2e82644112d6070d867bf7c  sockjs-0.13.0.tar.gz
+sha256  57e959a23f20a8d55149d1e5db0b3b870726f2b4ad8166d41bdcf411b36cdf76  sockjs-0.13.0.tar.gz
 # Locally computed sha256 checksums
-sha256  7be23c071df0314fadeba6077a3830340a5121ad88bfa66b0c095051a766e141  LICENSE.txt
+sha256  7be23c071df0314fadeba6077a3830340a5121ad88bfa66b0c095051a766e141  LICENSE
diff --git a/package/python-sockjs/python-sockjs.mk b/package/python-sockjs/python-sockjs.mk
index 0aea63f934..d9cfaf58ff 100644
--- a/package/python-sockjs/python-sockjs.mk
+++ b/package/python-sockjs/python-sockjs.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_SOCKJS_VERSION = 0.11.0
+PYTHON_SOCKJS_VERSION = 0.13.0
 PYTHON_SOCKJS_SOURCE = sockjs-$(PYTHON_SOCKJS_VERSION).tar.gz
-PYTHON_SOCKJS_SITE = https://files.pythonhosted.org/packages/88/e9/af7b321f70325fd2af3941aa147efd097156150da635e09efc7ccf70e54d
+PYTHON_SOCKJS_SITE = https://files.pythonhosted.org/packages/00/a4/644d5901d51aecb9fff218bbfc2525ef9362d4d03c2fcb8cb322aa0ce77f
 PYTHON_SOCKJS_SETUP_TYPE = setuptools
 PYTHON_SOCKJS_LICENSE = Apache-2.0
-PYTHON_SOCKJS_LICENSE_FILES = LICENSE.txt
+PYTHON_SOCKJS_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
