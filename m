Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E96C04FE0
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 16:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2706C6128C;
	Wed,  2 Aug 2023 16:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2706C6128C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3NBbw6im_k5K; Wed,  2 Aug 2023 16:47:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DB2A600C9;
	Wed,  2 Aug 2023 16:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DB2A600C9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 267EC1BF3A0
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 16:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CF17600C9
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 16:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CF17600C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G59Iz_-2tP0a for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 16:47:39 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF16960E19
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 16:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF16960E19
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso25852f8f.0
 for <buildroot@buildroot.org>; Wed, 02 Aug 2023 09:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690994856; x=1691599656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GR9th9xBE0aIZa6f3GGO3YN7SR12sJJ1cn3cKApt9NU=;
 b=Z/4dZV4eOkTEtrNH3UdeJ9rKQ/qiB2Ns5bkRwLJT4CLkFvt5oWRyTI+1sKoyb8LdqD
 gPItgqNuLfAnqIXTDHesZqSrY5Fpfc37F2zmBKNLtbnTXByF/TgeVcGpehjOfSkw9MGc
 +DHvYirgdqGS15GAvvOxZQ8szgODZKFkqyvIEoI0zs/sjzUGHF1wRThqrMEmF3kWjJnt
 hzxzhFf7q0vHfpBcyRlduvN69FiS9o3MuMZzhd/1OZgZ52YzF0k9NrQkFY4sHpb27PRH
 lNq2XFlizdieOzBLTBWIOC1ff5TCgiIJO3v1aX9ZUXoqUrdQxNEuGDkpfhwPtu7pm8me
 wZww==
X-Gm-Message-State: ABy/qLbREcD9lXx6AuQ2zxB18ZnLsTz0JdGgVBquu8+hG2VPVpjZLuJA
 DhxSFNkUCbeTxoGCJB1r8di8FUi9wKc=
X-Google-Smtp-Source: APBJJlHi2ZkzI9tFFSHJncvvWxIEQ6rKc2HArZozW6phlio4VdvLldbGIrxAY1NzdPM1ODjAU2308w==
X-Received: by 2002:a5d:4e04:0:b0:315:901b:e795 with SMTP id
 p4-20020a5d4e04000000b00315901be795mr5432939wrt.13.1690994856292; 
 Wed, 02 Aug 2023 09:47:36 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 y1-20020adfd081000000b003179d5aee63sm11349703wrh.91.2023.08.02.09.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 09:47:35 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Aug 2023 18:46:28 +0200
Message-ID: <20230802164628.389812-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802164628.389812-1-romain.naour@gmail.com>
References: <20230802164628.389812-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690994856; x=1691599656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GR9th9xBE0aIZa6f3GGO3YN7SR12sJJ1cn3cKApt9NU=;
 b=njYOfwZKrg5zdT6BDr2j9GTGTDRIAqUocZcS34BQrC6wX7qv3Y1opNHbsGUQBiGODT
 pymzZoCn5D39UTMypWyKe6tf3OUb3OQfYjnpiIra9WffND0+Sn3SUDnxze+trZrryyS3
 KG1jZh2oPccl/wU0RWjyKE9nJ+HXgU3nerKvDSzhbSM6bra/tz8PCvAhyFXmIL7gc+Gf
 q00OxA4DJcdGjJ+PA17/1wo4iWLBHCCqPBOUDjIMrslUbHhUR+PBUsibk6C3Qetprxcp
 VcH45pSX4rDorMcfsLlZYrCLk9FAuAlXMDIyinlAunW2Vnfwrxc/Px5W6QBBAYTbCjs7
 k4eA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=njYOfwZK
Subject: [Buildroot] [PATCH 2/2] package/systemd: bump linux-headers
 dependency to 4.14
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

The recent update to systemd v254 requires a toolchain w/ linux headers
>= 4.14 to provide LOOP_SET_BLOCK_SIZE [1] (added in systemd v253 [2]).

Note:
Buildroot already warn the user if a toolchain w/ linux headers < 4.15
is used while enabling systemd as init system [3]. It was matter of
time before problem occurs.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=89e4fdecb51cf5535867026274bc97de9480ade5
[2] https://github.com/systemd/systemd/commit/1163ddb386ef46f63942171e6eab0ca64eb818e4
[3] 9a095643b4dd34eb7acb69662aa64fa945f4b542

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/systemd/Config.in | 7 +++----
 system/Config.in          | 6 +++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 174ee77b29..a3e424cb4c 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -22,7 +22,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 # LOOP_SET_BLOCK_SIZE
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
 	select BR2_PACKAGE_HAS_UDEV
@@ -237,7 +237,6 @@ config BR2_PACKAGE_SYSTEMD_HOMED
 	depends on BR2_USE_MMU # cryptsetup -> lvm2
 	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # fscrypt_key
 	select BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
@@ -248,11 +247,11 @@ config BR2_PACKAGE_SYSTEMD_HOMED
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-homed.service.html
 
-comment "homed support needs a toolchain w/ threads, dynamic library, kernel headers >= 4.12"
+comment "homed support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+		BR2_STATIC_LIBS
 
 config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 	bool "enable hostname daemon"
diff --git a/system/Config.in b/system/Config.in
index 1ca7690ea3..24798dc068 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -124,19 +124,19 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
 
-comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.15, host and target gcc >= 5"
+comment "systemd needs a glibc toolchain w/ SSP, headers >= 4.14, host and target gcc >= 5"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_HAS_SSP || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_HOST_GCC_AT_LEAST_5
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
