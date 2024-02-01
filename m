Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBC7C4828D
	for <buildroot@archiver.kernel.org>; Thu,  1 Feb 2024 17:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E7D742258;
	Thu,  1 Feb 2024 17:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E7D742258
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QERUES3QA0cN; Thu,  1 Feb 2024 17:48:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CF114224D;
	Thu,  1 Feb 2024 17:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CF114224D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C10191BF3BB
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 17:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95D28404CC
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 17:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95D28404CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tpOZKM7lujC5 for <buildroot@lists.busybox.net>;
 Thu,  1 Feb 2024 17:48:37 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8324D42238
 for <buildroot@buildroot.org>; Thu,  1 Feb 2024 17:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8324D42238
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5113000a426so1531599e87.2
 for <buildroot@buildroot.org>; Thu, 01 Feb 2024 09:48:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706809715; x=1707414515;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nc8lWe+haz+lnh6IdQFAUi5QqdFb1cYI0EKYhzCjvYQ=;
 b=A6ku5pjubPCXwAJf/Mu98dKhmkh3Frn+yulw25jBCZQ4XdfwmbK94HWFNbkxbPKQ0t
 yHSKceIVUSuizO+HKn4vPgdwVG8DHvw0sSwJZPV+rpwaE0Dk7GbAjOO9RZaZa7aR/Uhl
 9rYoe9y5VMcR/5vtqQEGX+zgj0IWUBVfSnaphyN8xbF18bMcYi/zGFwpriOQlT7pJB6z
 VAh5/J94+DYgZBWy/GUXtoqrXvrf1vCq523VbaidyzHbQjb6PkAey10Kb3Y0xNkA7xhZ
 j6nQUlGo3U7Sq6BAs8IDyzoF42d4v5U0RP21OPFbUPvwVmSIrXURsPMfJGN7k0AT04+5
 ubzg==
X-Gm-Message-State: AOJu0Yz25NWCmMt7BoQYXmIjX45QV1HC2R49tHnQoE2iGV5xUqY+z9Mi
 pfi4Nyyd66gbvWKlRNxXueYVT5HvRoEnk3d8m9IvHfVfmCAzVaZ1F7ciV1jzQyw=
X-Google-Smtp-Source: AGHT+IFAne/UBBnLzK5RGx+DkiNWe5To9dZtFn9Nh5CR/Q4qzFblmv6JzAsZTwqvgWesaoF9aD76Iw==
X-Received: by 2002:a19:430d:0:b0:511:32ce:d0c6 with SMTP id
 q13-20020a19430d000000b0051132ced0c6mr583565lfa.10.1706809714819; 
 Thu, 01 Feb 2024 09:48:34 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWBHlLkaX4eK4tXGN6rhEnofgfcpz3XNbiNhJwZUas/E7G5lytKXTHNn/Uj5Yu/40Ty0DqDuWKS4jKyUr6AgiM8s9ioTMHfyQV95A==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t12-20020a05600c450c00b0040d5ae2906esm5114981wmo.30.2024.02.01.09.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 09:48:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  1 Feb 2024 18:48:29 +0100
Message-ID: <20240201174829.184788-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706809715; x=1707414515; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nc8lWe+haz+lnh6IdQFAUi5QqdFb1cYI0EKYhzCjvYQ=;
 b=NYbPq/gOJrmiRTpyW7mxvo+/JJQz7RhaVq+YUf9u9dJV7VzzMt0EQik7gc0yeQimrU
 BySQkb3cbad9nxyMDK2t2fejIn6WswpKFCFjoX/v/8HPwN/Jb60BcaMx5da9hpSXkfyn
 9rPyehQdKqSaTaVgi5xs5d1o2SCHR0d9+c5i/WQxb55OH/pd0S6kQfdOIUhRoKwkcKJ4
 lVUSFh+aBrPK+FfBvsXuqCIbp5s60krpvVxZnVbpO6AtzUBuC6KBgoiq6E7bLWBgULxl
 pBBpkwrT/sgDjHtYKEU4qRuKit5jVVmBSeWSkPefB4GkmjptkzQq9pkyHBcaPHuIg5Ny
 4Wmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NYbPq/gO
Subject: [Buildroot] [PATCH 1/1] package/depot-tools: drop
 DEPOT_TOOLS_CPE_ID_VENDOR
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

cpe:2.3:a:google:depot-tools added by commit
48730a1a9d882a7c56146bd2955e074aed790dcb has never been a valid CPE ID
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:google:depot-tools

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/depot-tools/depot-tools.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
index 634258ffbb..a53afa14d6 100644
--- a/package/depot-tools/depot-tools.mk
+++ b/package/depot-tools/depot-tools.mk
@@ -9,7 +9,6 @@ DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
 DEPOT_TOOLS_SITE_METHOD = git
 DEPOT_TOOLS_LICENSE = BSD-3-Clause
 DEPOT_TOOLS_LICENSE_FILES = LICENSE
-DEPOT_TOOLS_CPE_ID_VENDOR = google
 
 HOST_DEPOT_TOOLS_DEPENDENCIES = \
 	host-python3 \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
