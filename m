Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C68FECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 21:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2C296108B;
	Wed, 21 Sep 2022 21:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2C296108B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uz31uBaYRNhN; Wed, 21 Sep 2022 21:11:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A43AF61086;
	Wed, 21 Sep 2022 21:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A43AF61086
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 630661BF25B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 21:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C31F40491
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 21:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C31F40491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vWAKBKPon_Rw for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 21:10:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A2D540496
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A2D540496
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 21:10:45 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so87467wmb.0
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 14:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=QMjm5Q7rwuc94V9SuC/MQL9OOYBUh6hAsi0T+N5rAFE=;
 b=1nznRgq3dKX3CI0fimo/2X/gchAa6HU2jIvbbz+YY08z638C7FA0GJYNoV/k2FYjvj
 c7UcPpNVsVb0K2CFbcqn/dspcS8U3daWOnb2hoi0egDk6IKQTdGVrvhK6aC5ukNPOTZ4
 zEZS4eApwj/Bxal4r96Oko/mysjEc3UP1vDKMOwxi6Qia7rUGXq3GLulbZsWaMLF5L2V
 cCFLZKalp5OQCseaECrMJr0jKlangzfdz9gQXCZGK9kOLi5QQ3BYzemhayOhqbK0ENSY
 /IVQhBI8wb7TAjfHkecuxLxtF39cFP9K+LXdzrZiWK3YZYVwk/tIelrrcC8fEJkI23GP
 C2bg==
X-Gm-Message-State: ACrzQf0HjEFtrKJveD7wq8hBR8/UG/vCevv6Uldq++30BlFR1J12hS2b
 /QC+zuXunnFeyCRoNajeieqTqoGV5YQ=
X-Google-Smtp-Source: AMsMyM7RYtTQBf+AhLOaBCc7x9ugP9j9Orh4FslLug/uzv6BAuQm+q0vv+LMs0h01El4BnCyBs2A9g==
X-Received: by 2002:a05:600c:3d15:b0:3b4:8bd9:3905 with SMTP id
 bh21-20020a05600c3d1500b003b48bd93905mr7140041wmb.173.1663794644153; 
 Wed, 21 Sep 2022 14:10:44 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1cf608000000b003a5fa79007fsm3827612wmc.7.2022.09.21.14.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 14:10:43 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 23:10:27 +0200
Message-Id: <20220921211027.25034-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220921211027.25034-1-romain.naour@gmail.com>
References: <20220921211027.25034-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=QMjm5Q7rwuc94V9SuC/MQL9OOYBUh6hAsi0T+N5rAFE=;
 b=GYEJfXf4Qa/nPJ10SbeKBGKsyscmhsvoGBzTN1Kquag2uil5g+4oiokkuxyj89HabY
 JtiYKOPjfS9LbpGWvk1e47FP2o/ZTvOuRuTxTQUt0dEI2FnQP/HoXJVsRb+X7/94rTJi
 Qy0gYBcEdSP2ochYF1EOs/Mp46MWsTJZk8d3A98H2bTB3z8zQtx596bmNDnML7oI98eT
 rUOqC99jCy9G5Nn1sIFcZNfzjgiZOJ+02KMPuEB1D9keykqRkP5T/bMIACZ2lHFisC2i
 vEIDhnCeOrr5Ksd39D5rsQu4GKrYaACY6nNdmGgVkyJyBAd3ZHU76UuP+W+4JwTOft4O
 MDLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GYEJfXf4
Subject: [Buildroot] [PATCH 3/3] Revert "toolchain/toolchain-external:
 update Arm AArch64 toolchain 11.2-2022.02"
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

This reverts commit 34cf3a15c9da81afb6cab6c56babd5a2096e44ca.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-arm-aarch64/Config.in                | 4 ++--
 .../toolchain-external-arm-aarch64.hash                     | 6 ++++--
 .../toolchain-external-arm-aarch64.mk                       | 6 +++---
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index a2dd252a9c..9eb5d64a9d 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -1,12 +1,12 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
-	bool "Arm AArch64 2022.02"
+	bool "Arm AArch64 2021.07"
 	depends on BR2_aarch64
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
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
index c7173324b8..ca1ea48bcb 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
@@ -1,2 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/11.2-2022.02/binrel/gcc-arm-11.2-2022.02-x86_64-aarch64-none-linux-gnu.tar.xz.sha256asc
-sha256  52dbac3eb71dbe0916f60a8c5ab9b7dc9b66b3ce513047baa09fae56234e53f3  gcc-arm-11.2-2022.02-x86_64-aarch64-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz.asc
+md5  07bbe2b5277b75ba36a924e9136366a4  gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz
+# locally calculated
+sha256  1e33d53dea59c8de823bbdfe0798280bdcd138636c7060da9d77a97ded095a84  gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
index 3d340ea0d7..356e0810b3 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2022.02
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/11.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2021.07
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-11.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
 
 $(eval $(toolchain-external-package))
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
