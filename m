Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B96FC433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 19:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED2AD40C3F;
	Wed, 23 Nov 2022 19:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED2AD40C3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8XFMplgCfKwz; Wed, 23 Nov 2022 19:54:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1807A40C33;
	Wed, 23 Nov 2022 19:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1807A40C33
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03B3F1BF314
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3B6B600B9
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3B6B600B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tNF3P8R8tbYY for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 19:53:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF89B60071
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF89B60071
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 19:53:24 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id 9so1550864pfx.11
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 11:53:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wlpHpx7N41KV548uu1oUmGsuaHu05tkeGrJE1bIvnRM=;
 b=4FOFx7qLH/qNTJXwIZOy5AUFqNrY/gleX/XTgjOg5hmm43/sgZfKm6A8RyvJUDGkD+
 U6w1nhh8hpY2+VihViAMKzoOGcrO2zfBWYtf1G0m3ST12rf9QQVlGroaCZgJiAfvWMnX
 YQVOXJXhNgPeRUZeEnK8VkEAtzVuRot0Ol5TjRKL+cq/RLMjE1miJ3ERY2ji1VBVl7pz
 XklGu5E0jX7th8VD0aXZV5A+oJAcbZgpESX3x5IJSnmIZGt5d5puarbmTj+IR3nKFQd7
 /uzp4suE8bV9aLCHtrBuyfHG2C0NppzLh4OTc3dYic1IFoFcNOvbwBRVz1cWWa0IJhR8
 yRXg==
X-Gm-Message-State: ANoB5pm7eJb3zKsjCoS85v60cvEAJ2lSdxkCHLTY4XxAoTv7oLYyZTyO
 VU2U4iUut7gCa/P6cD6as7RXjyWB7FWNQw==
X-Google-Smtp-Source: AA0mqf53dTdp4BGbQqyYhV9/CHUV7cxYrSCJ3zdDb/u9h+GLl81I18cIyKDl3UlJbVWTt36aY6NSuA==
X-Received: by 2002:a63:e20:0:b0:440:6e64:fb02 with SMTP id
 d32-20020a630e20000000b004406e64fb02mr8746965pgl.84.1669233204000; 
 Wed, 23 Nov 2022 11:53:24 -0800 (PST)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 y129-20020a626487000000b005745a586badsm1818282pfb.218.2022.11.23.11.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 11:53:23 -0800 (PST)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:52:58 -0800
Message-Id: <20221123195304.1582783-8-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
References: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wlpHpx7N41KV548uu1oUmGsuaHu05tkeGrJE1bIvnRM=;
 b=E5N5a4bUUn0A0OZhyas5JiKcn5ob9nkqslKzyzkZgTIHXwUzpJG/w9N9GqJ4dWVum2
 MBMXNvxSsH236Ny6pfrmnh3FXAT/U/8g1nBmWDgTUlynu2uBRbjONF+8iQKQndpWq9nP
 ElMsBey8kLfXskK5WderTh70h6v1FJF/6OK4M=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=E5N5a4bU
Subject: [Buildroot] [PATCH 1/7] toolchain/toolchain-external: update Arm
 AArch64 toolchain 11.3.Rel1
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated to gcc 11.3, gdb 12, binutils 2.38, glibc 2.35.

See https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 .../toolchain-external-arm-aarch64/Config.in                | 4 ++--
 .../toolchain-external-arm-aarch64.hash                     | 6 ++----
 .../toolchain-external-arm-aarch64.mk                       | 6 +++---
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index 9eb5d64a9d..4a1bb4ee92 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -1,12 +1,12 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
-	bool "Arm AArch64 2021.07"
+	bool "Arm AArch64 11.3.Rel1"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
index ca1ea48bcb..fa923c6c3e 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
@@ -1,4 +1,2 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz.asc
-md5  07bbe2b5277b75ba36a924e9136366a4  gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz
-# locally calculated
-sha256  1e33d53dea59c8de823bbdfe0798280bdcd138636c7060da9d77a97ded095a84  gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/11.3.rel1/binrel/arm-gnu-toolchain-11.3.rel1-x86_64-aarch64-none-linux-gnu.tar.xz.sha256asc
+sha256  50cdef6c5baddaa00f60502cc8b59cc11065306ae575ad2f51e412a9b2a90364  arm-gnu-toolchain-11.3.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
index 356e0810b3..a988c15f50 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2021.07
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = rel1
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/11.3.$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = arm-gnu-toolchain-11.3.$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
 
 $(eval $(toolchain-external-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
