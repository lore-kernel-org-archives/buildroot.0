Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A9EC32771
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 21:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC7DA40497;
	Wed, 21 Sep 2022 21:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC7DA40497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i2xqzZkg5ywi; Wed, 21 Sep 2022 21:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4BC140491;
	Wed, 21 Sep 2022 21:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4BC140491
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51BEB1BF25B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 21:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F390400D2
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 21:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F390400D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bUAz7Ye3laVp for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 21:10:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63D1F40491
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63D1F40491
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 21:10:45 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 k3-20020a05600c1c8300b003b4fa1a85f8so59530wms.3
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 14:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UZ1hLfr8Y00Ehr4uNujs7gaiSMEw3iWfvxCiVcTd1n0=;
 b=PecVBDUSUHvyOMrA3WHoIEV9jHNjxh1nq/7o1fksZdS26sfwkwd48XFpJqBrZnwIkB
 6pWfk3Q/2Mh9cTs1v+whI0KI1YxxiQMkMjBMHbEycQVz+umulgLmsccYm5Nq2IZJjVm/
 2HnIf+M/K/VBIKQ1h94SFdWVF15N5ISuahL/qtGcMs+SkYVRLU5osNqOQ+Y+aZvUIN2W
 sU/H9MOR2e/iWoO3Oqr/olV10uJt5iiOk/Z0At3XZN9Mz3x1AQPPRs9wH1aaHVrNyoF1
 iUxQvjq+IHqjNkhEM9qiVTzIGbNl3RqQeZY/0s+afQIooo6xOnA89LEziQ9Hi1CGL7xs
 utDA==
X-Gm-Message-State: ACrzQf28brLAIG8gvnSTe3eOkgW3XePLJJ5j74qIHUfaJsfnlmnib8dI
 wcHso1ic6NXzSJgnTYB351l5T16u5fM=
X-Google-Smtp-Source: AMsMyM6wXIjyNIo20MXHoidkwdLcHq/3nJdaulOkUQ4EMZgLLqcSVtsHD1ekW9x1ylVPsaGn6WEjng==
X-Received: by 2002:a05:600c:254e:b0:3b4:9398:49d0 with SMTP id
 e14-20020a05600c254e00b003b4939849d0mr118504wma.126.1663794643452; 
 Wed, 21 Sep 2022 14:10:43 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1cf608000000b003a5fa79007fsm3827612wmc.7.2022.09.21.14.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 14:10:43 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 23:10:26 +0200
Message-Id: <20220921211027.25034-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220921211027.25034-1-romain.naour@gmail.com>
References: <20220921211027.25034-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=UZ1hLfr8Y00Ehr4uNujs7gaiSMEw3iWfvxCiVcTd1n0=;
 b=NjrzwTs4gukdQdovi88YLPdqF2xTtX2MTtPXJpkqIxPIIhTHmE5oWFKdfSgeR4oM0q
 OHulS5tknZj0TJ779UKIM/K6PhiDCw2t5n6kUldglBjnuq3owx7hYXRDUyEarAKFu4ie
 hP5EAyJS1c91Md37CSsAuwHLDNnbdeIYGx6rkFBx14S8nIZyShl01p/kDyp3d8dlCjqt
 qGwmJNub+stYajEfofC/KkH3VKTmN9wXez4POhAUc2BD76tLJpqOwrDIuElWPLwV0Uru
 lacJfp8ySb6eU6WdyQOHT1jHYHsAhKtpCfc7psOHF7n5WYO3p4cpc9XB6WvLzt8KL0C8
 vtUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NjrzwTs4
Subject: [Buildroot] [PATCH 2/3] Revert "toolchain/toolchain-external:
 update Arm AArch64 BE toolchain 11.2-2022.02"
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported to Linaro bug tracker [1] the Arm GNU Toolchain generated
since 2022.02 doesn't work on all x86_64 host.

It still not fixed with 11.3.Rel1 release (2022.08).

Fixes #15006

[1] https://bugs.linaro.org/show_bug.cgi?id=5825#c19

This reverts commit f4a78565db49b90d96b5e28cd06e6b07cb0a7e61.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-arm-aarch64-be/Config.in             | 4 ++--
 .../toolchain-external-arm-aarch64-be.hash                  | 6 ++++--
 .../toolchain-external-arm-aarch64-be.mk                    | 6 +++---
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index dba50595f5..eeb88579fe 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -1,12 +1,12 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
-	bool "Arm AArch64 BE 2022.02"
+	bool "Arm AArch64 BE 2021.07"
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
index 99a2f1ff22..1079917c98 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
@@ -1,2 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/11.2-2022.02/binrel/gcc-arm-11.2-2022.02-x86_64-aarch64_be-none-linux-gnu.tar.xz.sha256asc
-sha256  cc834d22fd8eff98d18cf3f464e30f5e4aee0966e51f9e09514e948f1eb9884b  gcc-arm-11.2-2022.02-x86_64-aarch64_be-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-aarch64_be-none-linux-gnu.tar.xz.asc
+md5  54cbaef7db7eb3de27732500f9da9c6f  gcc-arm-10.3-2021.07-x86_64-aarch64_be-none-linux-gnu.tar.xz
+# locally calculated
+sha256  63c34cac07ceadd74620ea87f27af1aa6a6f55c20a5bc116af21a59ddb6b6a6a  gcc-arm-10.3-2021.07-x86_64-aarch64_be-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
index f98f090327..5a6dbc60d5 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 2022.02
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/11.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 2021.07
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = gcc-arm-11.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-none-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-none-linux-gnu.tar.xz
 
 $(eval $(toolchain-external-package))
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
