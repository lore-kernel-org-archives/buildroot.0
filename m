Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1311CC32793
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 02:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB9F240B1D;
	Wed, 24 Aug 2022 02:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB9F240B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vUpE5jkO9qpY; Wed, 24 Aug 2022 02:51:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B72E3405C6;
	Wed, 24 Aug 2022 02:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B72E3405C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6FA61BF3FF
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 02:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0683409AA
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 02:49:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0683409AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4L8zRByQlms2 for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 02:49:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85C9440921
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85C9440921
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 02:49:38 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id
 r15-20020a17090a1bcf00b001fabf42a11cso189626pjr.3
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=9zfhUpOTjC7ezU0KQTdZK+TqBGuiASeN0mplPDPIDNU=;
 b=DKpcYK1KrR73yUnXOKrEgqCKfkCavXNfe6h4lW+C5JjZcHDphPvfw8RPTNXpIDuLO1
 i2dyNmc4Gc72aobZ0X6NsU8x+AA4U/ztwcLU4TS8LY2iir3g32gRNGt4tLK+zO3jHQ37
 h2kKHkpdQLWyrGLTZagl1kqW+YaKuN6MynLbTXfom+qJYwsyNmN46npb3mwNUkteE01N
 84VGIDMrYCFT6WBR0jhVfTHQhMQfqQDpn1eukSdxTgEhXNE+eEEQ5tMzHfj98E+PKqVa
 jBrHeNCgpVyEEPAqqGi/EgqTcUn5SNAQSlKavsYeMCEYTfEgyoIbXe/yK6yDMnjfr+ie
 760w==
X-Gm-Message-State: ACgBeo2gxVTNZDBHFLNg8aOlBefmi6Yl4KhQ/UaNGDitd4ovIDxC2Xk4
 umQa8fV+YAJjtvaHFOkmVNTdvSgj5fX8abaZw4k=
X-Google-Smtp-Source: AA6agR4zD2XeF0cNzZazMy9tFTTcKqnQoq/J/SV7OZWuorR60ueQcTP09ZbjwdRyqLDi71BHehEPXQ==
X-Received: by 2002:a17:90a:5d88:b0:1fa:b5c4:608b with SMTP id
 t8-20020a17090a5d8800b001fab5c4608bmr6080169pji.22.1661309377718; 
 Tue, 23 Aug 2022 19:49:37 -0700 (PDT)
Received: from chris-jammy.hollywoodparkca.com
 (2603-8000-3f01-0100-893e-b127-a8ca-bcb9.res6.spectrum.com.
 [2603:8000:3f01:100:893e:b127:a8ca:bcb9])
 by smtp.googlemail.com with ESMTPSA id
 p13-20020a635b0d000000b004296719538esm9845273pgb.40.2022.08.23.19.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 19:49:37 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 19:48:58 -0700
Message-Id: <20220824024904.2529728-8-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
References: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=9zfhUpOTjC7ezU0KQTdZK+TqBGuiASeN0mplPDPIDNU=;
 b=ZspI3ycKP+CQ1tgdB1XaIctZVs9DREv6dPoAzm3nHkzHv3rIHSmqff1YHdlJHDlaU1
 6El0L1wFEugHEj6Vjhq3wsA1c3fm/RDmnUzNcV6t5UxUz3GFnhtcM9WOqXJVrlOXVwNi
 ho3OA5+//6eWYd2zza19wjSg6YOH2tn2bG4Jk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=ZspI3ycK
Subject: [Buildroot] [PATCH 1/7] toolchain/toolchain-external: update Arm
 AArch64 toolchain 11.2-2022.02
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated to gcc 11.2, gdb 11, binutils 2.37, glibc 2.34.

See "Release Note":
https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads-1

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 .../toolchain-external-arm-aarch64/Config.in                | 2 +-
 .../toolchain-external-arm-aarch64.hash                     | 6 +++---
 .../toolchain-external-arm-aarch64.mk                       | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index 9eb5d64a9d..b5b4d137b8 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -6,7 +6,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
index ca1ea48bcb..6d81f58594 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz.asc
-md5  07bbe2b5277b75ba36a924e9136366a4  gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/11.2-2022.02/binrel/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf.tar.xz
+md5  712ee3fa6247ac3f619dd193f714fbc1  gcc-arm-11.2-2022.02-x86_64-aarch64-none-linux-gnu.tar.xz
 # locally calculated
-sha256  1e33d53dea59c8de823bbdfe0798280bdcd138636c7060da9d77a97ded095a84  gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz
+sha256  52dbac3eb71dbe0916f60a8c5ab9b7dc9b66b3ce513047baa09fae56234e53f3  gcc-arm-11.2-2022.02-x86_64-aarch64-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
index 356e0810b3..3d340ea0d7 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2021.07
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2022.02
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/11.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-11.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
 
 $(eval $(toolchain-external-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
