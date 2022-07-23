Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E32BC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1B2D848E5;
	Sat, 23 Jul 2022 13:35:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1B2D848E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JntLRRchhaj0; Sat, 23 Jul 2022 13:35:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1A1784886;
	Sat, 23 Jul 2022 13:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1A1784886
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB3441BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85BF884886
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85BF884886
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BWUkjwiPrlm6 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:35:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E14384830
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E14384830
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:35:33 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 i205-20020a1c3bd6000000b003a2fa488efdso930782wma.4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 06:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8TU9SkDk9HwNu6rcFJ+l7zkNo1qKYKgJHefOSJ2mu80=;
 b=zAiNUPlY/cudNSh5C/mFZWESBCPjsrY22zAE48xuoFIaGxpkJu/p4YezECFDCjNHeT
 TFz8uTTI0r1xKB90QYG8w8yfAS6D/yM4qEw3D+xthJxtQI3CcIMl5zgc5DOCe+O2ffPn
 midMcSQhkSgjFRu7bbR3omaXfiaAe2rili/ItLYsxr6SNz+zhKvcTO6DKEVCj3SI++vF
 cKiyaysdjwzPhwfxP/lq17JggcXtri659dpfSmRrehYKhnAzMiyK7FoRuxT+5PL0vDBs
 ba8L2V63ONT8CBasvE1LFvh04cfq5bsej5Bun0h+hM28XjDODGgktLomGu13uPgzvxSg
 8MlQ==
X-Gm-Message-State: AJIora+Zotgk8mBCE5n8gP8/NcTSQive9vhKFpAa1Wq3zeWogoLQvNAi
 ZENLngq/a+XznWdGAUbapyzSoC0229/qAQ==
X-Google-Smtp-Source: AGRyM1tEdLYrzt2doZ7hBahplPCIUn9HJezQ/TgHUa4ri5fB94Tr9c/IUdXl2PxZ4KgdV2G92tjd2A==
X-Received: by 2002:a05:600c:154f:b0:3a3:4383:e1eb with SMTP id
 f15-20020a05600c154f00b003a34383e1ebmr3028428wmg.111.1658583331517; 
 Sat, 23 Jul 2022 06:35:31 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 j11-20020adfe50b000000b0021e4a4fc017sm6923887wrm.34.2022.07.23.06.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 06:35:31 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 15:35:24 +0200
Message-Id: <20220723133525.279819-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8TU9SkDk9HwNu6rcFJ+l7zkNo1qKYKgJHefOSJ2mu80=;
 b=PlRXTGAQjYoF69FOlZWGWBYXVW4XI3ZVBetMs7uLMAF1YWX+AKcwTJ9RfvPHlw9kvb
 mhqBG6IcayITjMTC7KFjd61VwlEuUOxp3XJASfHOf4xP2OwPaS3X806AeANUTKE1HrNe
 /MHZfr64KhbCrgw+xMptxHN6GX6T/PkZ458urzivGIqqpYrUtYakYo/3t2szXy44GG+u
 9fVGQRKhYf1zQUN4MMnbtSzoB1sQNKjGccCW2Xx9gsT8oW6R5AUpKrkovM7S92NYj84q
 Fa7IvLfqKO85YoJVPPnJajlqDKHFICcCvymbTbhRnr3x+SCc45FjQLH04V2UuWtb1YKr
 gyIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=PlRXTGAQ
Subject: [Buildroot] [PATCHv2 1/2] arch/Config.in.riscv: enable Zicsr and
 Zifencei standalone extensions with gcc >= 12
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
Cc: Romain Naour <romain.naour@gmail.com>, Mark Corbin <mark@dibsco.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Romain Naour <romain.naour@gmail.com>

Since gcc 12, default Riscv ISA spec version was bump to 20191213 [1].

This introduce a major incompatibility issue is the csr read/write
(csrr*/csrw*) instructions and fence.i instruction has separated from
the "I" extension, become two standalone extensions: Zicsr and
Zifencei; so you might get error messages like that: unrecognized
opcode "csrr" (or "fence.i").

Indeed, without Zifencei we can't build opensbi bootloader [2]:

opensbi-1.0/lib/sbi/sbi_tlb.c: Assembler messages:
opensbi-1.0/lib/sbi/sbi_tlb.c:190: Error: unrecognized opcode `fence.i', extension `zifencei' required

As a workaround, opensbi build system has been patched [3] to use
-march=rv64imafdc_zicsr_zifencei when needed.
This workaround doesn't work in Buildroot due to the local patch
0001-Makefile-Don-t-specify-mabi-or-march.patch removing -march
from CFLAGS.

In the context of Buildroot, we can enable unconditionnaly Zicsr
and Zifencei standalone extensions for gcc >=12 (as recommanded
by [4]) since there will likely no RISC-V cores running Linux that
support the base I instruction, but not the csr and fence extensions...
as even OpenSBI assumes the RISC-V core supports them! [5]

[1] https://gcc.gnu.org/gcc-12/changes.html
[2] https://github.com/riscv-software-src/opensbi/blob/v0.9/lib/sbi/sbi_tlb.c#L173
[3] https://github.com/riscv-software-src/opensbi/commit/5d53b55aa77ffeefd4012445dfa6ad3535e1ff2c
[4] https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/aE1ZeHHCYf4
[5] http://lists.busybox.net/pipermail/buildroot/2022-July/646698.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Mark Corbin <mark@dibsco.co.uk>
---
v2: remove Kconfig symbols BR2_RISCV_ISA_RVZicsr and BR2_RISCV_ISA_RVZifencei
    rework the commit log.
---
 arch/arch.mk.riscv | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
index f3bf2b3467..006df7de52 100644
--- a/arch/arch.mk.riscv
+++ b/arch/arch.mk.riscv
@@ -26,5 +26,8 @@ endif
 ifeq ($(BR2_RISCV_ISA_RVC),y)
 GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)c
 endif
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_12),y)
+GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)_zicsr_zifencei
+endif
 
 endif
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
