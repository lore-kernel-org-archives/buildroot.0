Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B25FEB64D9
	for <buildroot@archiver.kernel.org>; Sat, 17 Jun 2023 15:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C62540261;
	Sat, 17 Jun 2023 15:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C62540261
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ClrTIzB_EeN9; Sat, 17 Jun 2023 15:48:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB870405C7;
	Sat, 17 Jun 2023 15:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB870405C7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 027521BF25F
 for <buildroot@lists.busybox.net>; Sat, 17 Jun 2023 15:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDECD60E00
 for <buildroot@lists.busybox.net>; Sat, 17 Jun 2023 15:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDECD60E00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t1N3LYqqQFee for <buildroot@lists.busybox.net>;
 Sat, 17 Jun 2023 15:47:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 819FC60EED
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 819FC60EED
 for <buildroot@buildroot.org>; Sat, 17 Jun 2023 15:47:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f8d2bfec9bso17704205e9.0
 for <buildroot@buildroot.org>; Sat, 17 Jun 2023 08:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687016871; x=1689608871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LGzSLzwEPOWQPpizAM6T3s8MIw6salp7oxANsEysxkc=;
 b=OdS5rWEhrwGuKKX8FbpJ6jhXvhyT8w5DRzlcCQvqcpveGiae4VyjCqw7Hdc9DeOBN5
 f/yGCmJM05e5/3pXk+nrflC4Nw0gxj566rN0jwKm//7WmgWuIfAxqGKw3NqeihZuU4r2
 EaUyuRR4nbIBsvkgDwAbbGyIhkgtJaYyCvTJ1CVM3UnHVnLgz12zg4z0+D2MmVqw8xgI
 /gor4nAv/Z8ka7LuwTd6bTBI+QHZTRn/FnmsX50lmE5FrqklO55M7L6lP3U0LWSva54M
 lHcRfoGqpUznjRyopP6KhAX5k0dpbIHChA9n+m2j8KXhTWnItyWB0D1E6EoiCy3qqpN8
 G/Tg==
X-Gm-Message-State: AC+VfDyLiuV1PM+fKV1HOvfYevUQamzZymWIJAfjIpCesct1nDrHjN7k
 EbW5Xpt9/T5lPb4fohYmfqBfvY/H8r0=
X-Google-Smtp-Source: ACHHUZ5ph63Tm9jpyGPLcwPosl+c32qphHeuJ+RCzxRfiIL8hZa2MvF/ondKiITfdyXR0SHGl2QzIA==
X-Received: by 2002:a7b:c7cb:0:b0:3f6:683:627d with SMTP id
 z11-20020a7bc7cb000000b003f60683627dmr5006007wmk.18.1687016871460; 
 Sat, 17 Jun 2023 08:47:51 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a5d5042000000b0030fd03e3d25sm12503663wrt.75.2023.06.17.08.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jun 2023 08:47:51 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Jun 2023 17:47:45 +0200
Message-ID: <20230617154745.875873-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230617154745.875873-1-romain.naour@gmail.com>
References: <20230617154745.875873-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687016871; x=1689608871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LGzSLzwEPOWQPpizAM6T3s8MIw6salp7oxANsEysxkc=;
 b=KLDlNyAHogxQ6su7E05bWd3HQbX9Y6ZelTKhl7VARiJGksJTov+bkzrq9LpqXuRybZ
 9CXesir5c+T87f01G8j/8RlV970K9JivACliN1vn4CrUQ+3/bXj78bfszntHrd+0q50t
 SipXYlf5f1sjmvo0IWFM91WI45G13x4Pp+tgO8IvPPYBk+efVbDVT/oy7605h+YsYSvB
 FamRaVzESNgOfkxcGEaN6YT7hTnuYz7ah62K1lU6W2in9GznTu58ACMF6YlsENrQqbpx
 1G0lN88cJIjOCnalIy9EyfoO4AbY0AgNjhLz+UN8SuNywu2dsRgka7bt/CaXEY2n3+1c
 Iz+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=KLDlNyAH
Subject: [Buildroot] [PATCH 3/3] toolchain/toolchain-external: update Arm
 Aarch64 BE toolchain 12.2-rel1
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

[1] https://bugs.linaro.org/show_bug.cgi?id=5825#c19
[2] https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
I'm able to reproduce the runtime issue with "Arm ARM 2021.07" on the
host testing the Arm ARM32 toolchain 12.2-rel1.
---
 .../toolchain-external-arm-aarch64-be/Config.in             | 4 ++--
 .../toolchain-external-arm-aarch64-be.hash                  | 6 ++----
 .../toolchain-external-arm-aarch64-be.mk                    | 6 +++---
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index eeb88579fe..62e5ea8667 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -1,12 +1,12 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
-	bool "Arm AArch64 BE 2021.07"
+	bool "Arm AArch64 BE 12.2.rel1"
 	depends on BR2_aarch64_be
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
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
index 1079917c98..f148d6326d 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
@@ -1,4 +1,2 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-aarch64_be-none-linux-gnu.tar.xz.asc
-md5  54cbaef7db7eb3de27732500f9da9c6f  gcc-arm-10.3-2021.07-x86_64-aarch64_be-none-linux-gnu.tar.xz
-# locally calculated
-sha256  63c34cac07ceadd74620ea87f27af1aa6a6f55c20a5bc116af21a59ddb6b6a6a  gcc-arm-10.3-2021.07-x86_64-aarch64_be-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz.sha256asc
+sha256  47632b5594ed6c3efda92a55c4c330263fc22f5d845d9e1c7d969ce24fcedeea  arm-gnu-toolchain-12.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
index 5a6dbc60d5..d35b945b04 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 2021.07
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 12.2.rel1
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-none-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-none-linux-gnu.tar.xz
 
 $(eval $(toolchain-external-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
