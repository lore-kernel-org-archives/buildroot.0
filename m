Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3676FEB64D9
	for <buildroot@archiver.kernel.org>; Sat, 17 Jun 2023 15:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26F3140883;
	Sat, 17 Jun 2023 15:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26F3140883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QEC4-xZlel_h; Sat, 17 Jun 2023 15:48:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 950BA404C6;
	Sat, 17 Jun 2023 15:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 950BA404C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 361021BF25F
 for <buildroot@lists.busybox.net>; Sat, 17 Jun 2023 15:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FB4560E00
 for <buildroot@lists.busybox.net>; Sat, 17 Jun 2023 15:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FB4560E00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C0VCEKOQati0 for <buildroot@lists.busybox.net>;
 Sat, 17 Jun 2023 15:47:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C665860E72
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C665860E72
 for <buildroot@buildroot.org>; Sat, 17 Jun 2023 15:47:52 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-311099fac92so1627989f8f.0
 for <buildroot@buildroot.org>; Sat, 17 Jun 2023 08:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687016870; x=1689608870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uhZ/6E4WPRiz4kOIZAx+RCvsKNPbPHFZS9BoJtJLa/o=;
 b=W3Rz4/BNv/MQO7CibJLPO9q2rL9z9Uyw6PB5M8ijrzNQyswf4BgftO68vJJ64miMde
 e5LamDZxhnhKTnslrdhS964xyvsnQf2v7HmgtW4wfhdJgn7YXoV2l9ZY2MjRU7i49gwE
 3pwNHxS4oAoRbwyqMq8FI2Or8HM1jjgqSc9eATLx4vfa6Pw9BHWuqOKKOG6VyjQnl+83
 29LLUoQgEhKeRqa63D1mG+2mE2PW4HPoQIGGnWOTnwRbNqvexaBgtMCF5ePUZ8MLQSwn
 0oMjSAxX1IDHC2wbn6q5m+RtTaF7AP1EFWJCMp8s4ZqtZbUCl+QQfni4U4TElaGq+RqH
 glbw==
X-Gm-Message-State: AC+VfDzr0YeyCZ6zk0SHibANOgMPZOXFrydlzeSJ4oMSjW0PCob+c+vp
 Nj+J/TZVUGI31+iSuU1wON+mgCshEJ8=
X-Google-Smtp-Source: ACHHUZ5mQfsPdh0U6BiiJQJsw8yP6y1CGIbDoiQoasHVnCejY73UMEOToZ8mUJpmA+ztTFn7wsM67A==
X-Received: by 2002:adf:f84e:0:b0:311:10db:dad2 with SMTP id
 d14-20020adff84e000000b0031110dbdad2mr4035231wrq.53.1687016870592; 
 Sat, 17 Jun 2023 08:47:50 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a5d5042000000b0030fd03e3d25sm12503663wrt.75.2023.06.17.08.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jun 2023 08:47:50 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Jun 2023 17:47:44 +0200
Message-ID: <20230617154745.875873-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230617154745.875873-1-romain.naour@gmail.com>
References: <20230617154745.875873-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687016870; x=1689608870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uhZ/6E4WPRiz4kOIZAx+RCvsKNPbPHFZS9BoJtJLa/o=;
 b=AyxeWmXyrGiHwwBWHM3aEeEaID0+dflDmncPXmmMiksjWIjcj8rWkzgDjogM9PKem8
 v4BHN6HTb405hsI9dFJAmSNaU75cN/Rm6qscp/8wMovfMnDin+iTFd7HMSk+2e8GcE4K
 Zky4b+NgBh/gUAsXRrpEUrqNMyx0yFe26byOsCR8hiAYl3GEL7U3RqwkRu/qzGBVfIjh
 VkHp/gSuHVl0xm0WvZRexiBeZzywzfdGdzh6QjPTpt9TxqHnpuoO1A4BeAfltl5Iwb2Q
 rNnOrwIadLfBXmNJo7+K7NweYSaiVJM3xlHx+6louv8EI9vneB7iIgd9vC58ROiSIoac
 fxaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=AyxeWmXy
Subject: [Buildroot] [PATCH 2/3] toolchain/toolchain-external: update Arm
 Aarch64 toolchain 12.2-rel1
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

Updated to gcc 12.2, gdb 12, binutils 2.39, glibc 2.36.

Upstream changed version scheme previously based on the release
date (2021.07) to a version scheme based on gcc version (12.2.rel1).

The runtime issue (Illegal instruction on some x86 host) [1] seems to
be fixed since it can't be reproduced anymore on the same host.

The x86_64 host variant prebuilt toolchain is built on RHEL7
(glibc 2.17) and is likely also be useable on OS versions like
RHEL8, Ubuntu 18.04 or later.

The AArch64 host variant prebuilt toolchain is built on Ubuntu 18.04
(glibc 2.27) is likely also be useable on OS versions like RHEL8,
Ubuntu 18.04 or later.

Use the sha256 hash that is now provided by upsteam.

Tested with qemu_aarch64_virt_defconfig.

[1] https://bugs.linaro.org/show_bug.cgi?id=5825#c19
[2] https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
I'm able to reproduce the runtime issue with "Arm ARM 2021.07" on the
host testing the Arm ARM32 toolchain 12.2-rel1.
---
 .../toolchain-external-arm-aarch64/Config.in                | 4 ++--
 .../toolchain-external-arm-aarch64.hash                     | 6 ++----
 .../toolchain-external-arm-aarch64.mk                       | 6 +++---
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index 9eb5d64a9d..0c2e64192d 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -1,12 +1,12 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
-	bool "Arm AArch64 2021.07"
+	bool "Arm AArch64 12.2.rel1"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
index ca1ea48bcb..6c4847831e 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
@@ -1,4 +1,2 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz.asc
-md5  07bbe2b5277b75ba36a924e9136366a4  gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz
-# locally calculated
-sha256  1e33d53dea59c8de823bbdfe0798280bdcd138636c7060da9d77a97ded095a84  gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz.sha256asc
+sha256  6e8112dce0d4334d93bd3193815f16abe6a2dd5e7872697987a0b12308f876a4  arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
index 356e0810b3..9cdf58305b 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2021.07
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 12.2.rel1
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
 
 $(eval $(toolchain-external-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
