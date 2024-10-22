Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E159D2CE12
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 18:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2695A606F2;
	Tue, 22 Oct 2024 18:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TS1sGaTU9ZNi; Tue, 22 Oct 2024 18:05:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C49B6064B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C49B6064B;
	Tue, 22 Oct 2024 18:05:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9EF6963
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 18:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8481403BE
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 18:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYvEIo4JASih for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 18:05:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=bryce@raspberrywood.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 74B34403B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74B34403B8
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74B34403B8
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 18:05:54 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-83a9cd37a11so252447139f.3
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 11:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729620353; x=1730225153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xtg80pBzjeeIY3BoSVkBA0bmN3CFMiC+1DBmgeG+Z0w=;
 b=Ulc2Qm0jVnrr8c7zrTlkr14sVdnwJmgYqcatq9Mo2ZfPEqfMswrndxAlgeBHxFeFAp
 mfj+WiokZyVuYDoj23INLbZBQzDPQYDs/UuDPRobOmHH9QRtj0cEWgrkKREa+4Kff8f/
 S3JCNkEjbMYL/oUmgQiS4gkPtqmcjsCYoTfL9Xkpw0dwEu6VEp9UanMOadePX8lYwZV1
 X3ZBKza4mwlhdGS77JWGU9GvRsWYHDWem7lueP++8S1wWBRot3wyFfFG77h/cECjBsjU
 q5+z3RvPgdWTVbQbiW+lHjis9iM0ksMWpUuVanKJH4pR3oGtoJ7RyXzHYQhKWFqaxOpY
 kNnw==
X-Gm-Message-State: AOJu0YztZPYQf3X6pykqKd69MifCHB+veAy1SEnESa/UuHw8hLah+rk3
 D5j3MhtfAQo6I8j1MUTSV4ix8PzElD5BRUMXScUkr1Af1rW5gyTBxpKgpGkzPagZQHUptCiiGcZ
 N
X-Google-Smtp-Source: AGHT+IG+iEnaEnb+AUrlwJ1cwAdGzX1lF8spieOs0b70wtIAa3U5tsoFL59lTqSVmQvM1/LrapahvA==
X-Received: by 2002:a05:6602:3f86:b0:83a:c296:f5b0 with SMTP id
 ca18e2360f4ac-83af61a6b2bmr4415639f.9.1729620352961; 
 Tue, 22 Oct 2024 11:05:52 -0700 (PDT)
Received: from USATL1PC00222.am.bm.net ([149.106.100.80])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a52fcaasm1643378173.32.2024.10.22.11.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 11:05:52 -0700 (PDT)
From: bryce@raspberrywood.com
X-Google-Original-From: bryce@redpinelabs.com
To: buildroot@buildroot.org
Cc: Bryce Johnson <bryce@redpinelabs.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>
Date: Tue, 22 Oct 2024 12:05:40 -0600
Message-Id: <20241022180542.224972-1-bryce@redpinelabs.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrywood-com.20230601.gappssmtp.com; s=20230601; t=1729620353;
 x=1730225153; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xtg80pBzjeeIY3BoSVkBA0bmN3CFMiC+1DBmgeG+Z0w=;
 b=lQ60NXr4nWKcYOfWwACDoCb2nCwMRP4k7pbSaUWjjC7p2BLRRyGn5UjWDKeijetC0y
 V/R+4F8yHwkpSo3KWFeW8o2wYr1BD8I1r0Mqj/4fiPwTpqjHMkbhoAuTeG+F4AI9tZJx
 76T0FNX6z4aCw6jk0lJmPrxfgZ5PDUW20xxpO5KsZTUwhbcXoylquB233xIK/UPU5B1c
 gtULMa3/Ekp3pwXV3Pv2pXCOh3qsIcyKOAOuehEumeXUuSTp8J8gLYneTfgAuDEPbjJw
 Ni6fha60f+lvUvOtzB0P/Yve8BqsHe3woKY9WzkF/amNm7YqyIr8p8GAzrnwcbQMlm+q
 DfqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=raspberrywood.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=raspberrywood-com.20230601.gappssmtp.com
 header.i=@raspberrywood-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=lQ60NXr4
Subject: [Buildroot] [PATCH] package/arm-gnu-toolchain: Add $(HOSTARCH) so
 it can be built with aarch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bryce Johnson <bryce@redpinelabs.com>

Was testing building with arm64 build server and failed because it was downloading the x86_64 version. Use $(HOSTARCH) instead so it can also downloaded

Tested with building configs/ti_am62x_sk_defconfig on arm64. That it uses to build the 32bit R5 MCU.
---
 package/arm-gnu-toolchain/arm-gnu-toolchain.hash | 2 ++
 package/arm-gnu-toolchain/arm-gnu-toolchain.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.hash b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
index 0800fa2168..110ec40c09 100644
--- a/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
+++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
@@ -1,2 +1,4 @@
 # taken from https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz.sha256asc
 sha256  6cd1bbc1d9ae57312bcd169ae283153a9572bd6a8e4eeae2fedfbc33b115fdbb  arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz
+# taken from https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-aarch64-arm-none-eabi.tar.xz.sha256asc
+sha256  8fd8b4a0a8d44ab2e195ccfbeef42223dfb3ede29d80f14dcf2183c34b8d199a  arm-gnu-toolchain-13.2.rel1-aarch64-arm-none-eabi.tar.xz
diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.mk b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
index 03bb4dc5da..fce80f2f3a 100644
--- a/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
+++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
@@ -6,7 +6,7 @@
 
 ARM_GNU_TOOLCHAIN_VERSION = 13.2.rel1
 ARM_GNU_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(ARM_GNU_TOOLCHAIN_VERSION)/binrel
-ARM_GNU_TOOLCHAIN_SOURCE = arm-gnu-toolchain-$(ARM_GNU_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
+ARM_GNU_TOOLCHAIN_SOURCE = arm-gnu-toolchain-$(ARM_GNU_TOOLCHAIN_VERSION)-$(HOSTARCH)-arm-none-eabi.tar.xz
 ARM_GNU_TOOLCHAIN_LICENSE = GPL-3.0+
 
 HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/gcc-arm-none-eabi
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
