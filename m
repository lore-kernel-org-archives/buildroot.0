Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C477FC00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 19:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 671E660FE5;
	Wed, 24 Aug 2022 19:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 671E660FE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RRzvUiacI6-g; Wed, 24 Aug 2022 19:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85D6B60FDC;
	Wed, 24 Aug 2022 19:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85D6B60FDC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3406B1BF307
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 19:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F20860FDC
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 19:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F20860FDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RhL7PtPDLwot for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 19:26:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 205BD60FDA
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 205BD60FDA
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 19:26:24 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id p13so5149179pld.6
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 12:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=9zfhUpOTjC7ezU0KQTdZK+TqBGuiASeN0mplPDPIDNU=;
 b=UTasVei/jiQlyjNk+fFuoVtqBaOec/Lz8YtA2+W+vzEoEQ1Twc+Fl52LPqImcSztI+
 8Thbgmv6asZ6AOZdNZ8dRgO5QuAhdtGML3bOTn5q3N6LiaPJAInzLNn/4F0fwT59jBCq
 XYmuSy0Qj4IqXUfpQtf4yn87Wz0ktjbQa3L1SyFeoDv2tU9ekhdg2W8edn2d7uV9zHoI
 GKBS/LMVuzIoH3MeeNaPQjits/WMKuADDGioNKEaPynJp7aXYJQFkFc8/BWbwtepp6To
 RC5VM15zZN1yR+fblFHEi5gmeaVJZW5BrgCfVp7FnCyiizgtwlt+WdcYVldVpn6DSMKM
 H0bw==
X-Gm-Message-State: ACgBeo1Y1NoWfvUM0axCAdOTRKWMmtGtO8i2GE3gHvcQpJznxX8stG22
 6Ot+0XyKVmihmqYK0WOcYvPXbEmzPtX40ziKlbo=
X-Google-Smtp-Source: AA6agR4fIuF2hB1kaO1pdWKa/y4acFtahzJk4D2U8MtooBOdr4IjOw5iIcFq9toDN2uDdH4zbG02GQ==
X-Received: by 2002:a17:902:8a8d:b0:172:b26d:7a54 with SMTP id
 p13-20020a1709028a8d00b00172b26d7a54mr320905plo.36.1661369183448; 
 Wed, 24 Aug 2022 12:26:23 -0700 (PDT)
Received: from chris-jammy.hollywoodparkca.com
 (2603-8000-3f01-0100-893e-b127-a8ca-bcb9.res6.spectrum.com.
 [2603:8000:3f01:100:893e:b127:a8ca:bcb9])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a17090a1b0100b001fb4a8d82a7sm1741338pjq.56.2022.08.24.12.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 12:26:23 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 12:25:58 -0700
Message-Id: <20220824192604.2549356-8-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824192604.2549356-1-chris.dimich@boundarydevices.com>
References: <20220824192604.2549356-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=9zfhUpOTjC7ezU0KQTdZK+TqBGuiASeN0mplPDPIDNU=;
 b=PhyLhSWS+AZsfkFC1IYCU/NbNAZ4AsT4mMZK8QE6VL06pQ/PCrStgu+QuX+lDN55Wz
 Bnn0VLvEKduycJgalKTzmad3ztJqWBPiQrRhAr3qYvCuayNMoXL+21/I7aLTgfpvVFHD
 4FYyGsnlvgTyYEuz/s88YB0RW8N5gMsuxzgBE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=PhyLhSWS
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
