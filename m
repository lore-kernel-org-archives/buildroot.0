Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354C2C77B78
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 02:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEE46822E7;
	Wed,  3 May 2023 02:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEE46822E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T_014K_v3dd6; Wed,  3 May 2023 02:37:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC27B822CA;
	Wed,  3 May 2023 02:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC27B822CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 644DE1BF860
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 02:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D8C1401F3
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 02:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D8C1401F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E43PgRYDbpIm for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 02:37:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41D5A40120
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41D5A40120
 for <buildroot@buildroot.org>; Wed,  3 May 2023 02:37:25 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-52863157da6so3090853a12.0
 for <buildroot@buildroot.org>; Tue, 02 May 2023 19:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683081444; x=1685673444;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q4KIkYuMYThej1eZu7FsEV/p0XeuJAeutV+U3RLzawQ=;
 b=a26vrJL3pASn1byN7szhvtnwRjtT2gO+QCa3Pl7M/pqHOFRWrud3/e5gHb7SQ13P1Y
 LvUG8akJRwvvw9T8YDfCRkaI4OeQs1cUn4t8lwtGznjlvLeRi8E7EEpy9BmvlCEVK0RV
 7lXPr3h+QteawJwhAV4pLWCZA1SrWYftCU6uewDOC5FEObsE47MEVmHr4AL2Dbv9WZUm
 ghqXEZ6q8l04giE71K7BlvGEBHs67CYMtdjapbuCFMMfy/6mOIJmz0G+pifLSRl4tsct
 vS+1PxFIjfCKgT2m4TSKyWh1CaHhVoBFhCsRj+C9d53Nuhsbv3iVt8sv2b4POw15ykbK
 JN8w==
X-Gm-Message-State: AC+VfDz1UulWddsUeThxPqEUBgRElrMSsVAurgwxD3xO4ELWvGdmqzvC
 fzBCm0b6KWpanjbQF+WKfoleSTGAb2LQew==
X-Google-Smtp-Source: ACHHUZ4By+NzrXLCPHcbSbQ9NeazrJIIYZGrr16SNfzAfUPZEYx1bJPbi7YAUIahtTVDaY7DjNgcrw==
X-Received: by 2002:a05:6a20:841a:b0:fa:e7cf:f72a with SMTP id
 c26-20020a056a20841a00b000fae7cff72amr10301260pzd.2.1683081444151; 
 Tue, 02 May 2023 19:37:24 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a17090ac08f00b0024b79a69361sm184877pjs.32.2023.05.02.19.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 19:37:23 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 12:37:10 +1000
Message-Id: <20230503023711.586439-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683081444; x=1685673444;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q4KIkYuMYThej1eZu7FsEV/p0XeuJAeutV+U3RLzawQ=;
 b=fBT5zjfDNLiSXhy/0VL9cVsx3CUTjUO/EBLDXpIIX2Y2n6016wIopHAQyTJ6/0q3gS
 Y5VK0TnuuDMOm+hFU2ZY4tYDYBQhanTXf6kE37/h+KeYzOWPFP861YMnVNgvS85c/XkJ
 rixsFMvlIILvy+Y71hidODy5PHyNoAV+Yr9AFpM7szpYqvNoWr06AuVgvkOsdvQvsB1B
 hmkX7JCw0+v68Exizod6zoeGrG2r7brHAwUGnirxPJKYRlvRmtCdpFqp8cXPumJS9uWX
 W2cqKWne09VzcFVAtv/QhAptq9ueeoKGVkoBDoVTT4U3XOnMBvNgpuh1GiK7455sHWe3
 OfNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fBT5zjfD
Subject: [Buildroot] [PATCH 1/2] boot/opensbi: Bump to version 1.2
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...Makefile-Don-t-specify-mabi-or-march.patch | 37 -------------
 ...Makefile-unconditionally-disable-SSP.patch | 53 -------------------
 boot/opensbi/Config.in                        |  4 +-
 boot/opensbi/opensbi.hash                     |  2 +-
 4 files changed, 3 insertions(+), 93 deletions(-)
 delete mode 100644 boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch
 delete mode 100644 boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch

diff --git a/boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch b/boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch
deleted file mode 100644
index 5f554a6c24..0000000000
--- a/boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f5871e1f3650d6c8a032928cb5d8ca00c275c377 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Fri, 15 Feb 2019 14:57:41 -0800
-Subject: [PATCH] Makefile: Don't specify mabi or march
-
-To avoid
-    can't link double-float modules with soft-float modules
-errors when building 32-bit openSBI don't specify mabi or march.
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
----
- Makefile | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index ae68f55..10851fc 100644
---- a/Makefile
-+++ b/Makefile
-@@ -145,7 +145,6 @@ GENFLAGS	+=	$(firmware-genflags-y)
- CFLAGS		=	-g -Wall -Werror -nostdlib -fno-strict-aliasing -O2
- CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
- CFLAGS		+=	-mno-save-restore -mstrict-align
--CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
- CFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
- CFLAGS		+=	$(GENFLAGS)
- CFLAGS		+=	$(platform-cflags-y)
-@@ -158,7 +157,6 @@ CPPFLAGS	+=	$(firmware-cppflags-y)
- ASFLAGS		=	-g -Wall -nostdlib -D__ASSEMBLY__
- ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
- ASFLAGS		+=	-mno-save-restore -mstrict-align
--ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
- ASFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
- ASFLAGS		+=	$(GENFLAGS)
- ASFLAGS		+=	$(platform-asflags-y)
--- 
-2.20.1
-
diff --git a/boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch b/boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch
deleted file mode 100644
index c4edd37f1a..0000000000
--- a/boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From e389d5fbc296e496db15368b2b621e0f178f7f34 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 8 May 2021 21:28:10 +0200
-Subject: [PATCH] Makefile: unconditionally disable SSP
-
-Though -nostdlib is passed in {C,+AS,DTSCPP}FLAGS, -fno-stack-protector
-must also be passed to avoid linking errors related to undefined
-references to '__stack_chk_guard' and '__stack_chk_fail' if toolchain
-enforces -fstack-protector.
-
-Fixes:
- - https://gitlab.com/kubu93/buildroot/-/jobs/1247043359
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/riscv/opensbi/pull/211]
----
- Makefile | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index eeffe6b..1419360 100644
---- a/Makefile
-+++ b/Makefile
-@@ -203,7 +203,7 @@ GENFLAGS	+=	$(libsbiutils-genflags-y)
- GENFLAGS	+=	$(platform-genflags-y)
- GENFLAGS	+=	$(firmware-genflags-y)
- 
--CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-strict-aliasing -O2
-+CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -O2
- CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
- CFLAGS		+=	-mno-save-restore -mstrict-align
- CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
-@@ -217,7 +217,7 @@ CPPFLAGS	+=	$(GENFLAGS)
- CPPFLAGS	+=	$(platform-cppflags-y)
- CPPFLAGS	+=	$(firmware-cppflags-y)
- 
--ASFLAGS		=	-g -Wall -nostdlib -D__ASSEMBLY__
-+ASFLAGS		=	-g -Wall -nostdlib -fno-stack-protector -D__ASSEMBLY__
- ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
- ASFLAGS		+=	-mno-save-restore -mstrict-align
- ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
-@@ -236,7 +236,7 @@ MERGEFLAGS	+=	-r
- MERGEFLAGS	+=	-b elf$(PLATFORM_RISCV_XLEN)-littleriscv
- MERGEFLAGS	+=	-m elf$(PLATFORM_RISCV_XLEN)lriscv
- 
--DTSCPPFLAGS	=	$(CPPFLAGS) -nostdinc -nostdlib -fno-builtin -D__DTS__ -x assembler-with-cpp
-+DTSCPPFLAGS	=	$(CPPFLAGS) -nostdinc -nostdlib -fno-stack-protector -fno-builtin -D__DTS__ -x assembler-with-cpp
- 
- # Setup functions for compilation
- define dynamic_flags
--- 
-2.30.2
-
diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 86f848f177..5e6b8d158e 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -19,7 +19,7 @@ choice
 	  Select the specific OpenSBI version you want to use
 
 config BR2_TARGET_OPENSBI_LATEST_VERSION
-	bool "0.9"
+	bool "1.2"
 
 config BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	bool "Custom version"
@@ -57,7 +57,7 @@ endif
 
 config BR2_TARGET_OPENSBI_VERSION
 	string
-	default "0.9"	if BR2_TARGET_OPENSBI_LATEST_VERSION
+	default "1.2"	if BR2_TARGET_OPENSBI_LATEST_VERSION
 	default BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_OPENSBI_CUSTOM_TARBALL
diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
index 3b6d97c42d..dbc77e856f 100644
--- a/boot/opensbi/opensbi.hash
+++ b/boot/opensbi/opensbi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  60f995cb3cd03e3cf5e649194d3395d0fe67499fd960a36cf7058a4efde686f0  opensbi-0.9.tar.gz
+sha256  8fcbce598a73acc2c7f7d5607d46b9d5107d3ecbede8f68f42631dcfc25ef2b2  opensbi-1.2.tar.gz
 sha256  82d13fb1bf6bb162629deeea9eb9c117e74548d3b707e478967691fe79a68e21  COPYING.BSD
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
