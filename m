Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B48FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 15:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC6C94045C;
	Sat, 14 May 2022 15:55:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KBBbGI39Drd9; Sat, 14 May 2022 15:55:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1C6D40183;
	Sat, 14 May 2022 15:55:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D582B1BF2F8
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 15:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C465383FA4
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 15:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id exrlyxJ2xTBR for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 15:55:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D843783F2F
 for <buildroot@buildroot.org>; Sat, 14 May 2022 15:55:18 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a5so11190205wrp.7
 for <buildroot@buildroot.org>; Sat, 14 May 2022 08:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f1CZss7YRn19fRVOU36xmHw+RZtaNme6xd7swFgXvjI=;
 b=NACfQZa+mOK0esbccxf5EhwGB9JrPm3RNz4piBiaIJW3sQFNKWSJjkk+nG7j5lDCrA
 81AeA+CrXXC9rwsaLjW4Uyf1Nj1+eSqrIs2E/DHeG9CVNqyj4YRL0m+tTNJVyO2/0Uvc
 +a93vZtkQmBlygot7Lfdy1+CKLRJebI/C52817VGmJaISp+BiPflo66gm/TfRmG5OWYD
 8j+QFMUI5YW9dUOT4/7BiOZsbd+U3j2nomuZ5yocQ7E2Yx8cXHGCP9cLPweHTVM2FUSU
 3n3Q3cNR5MrXJDp5JvuKcCBHdmyptwDdvksyrn77bH+cSp0r6rpHXb8iZ7X3XYZAXWUx
 s9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f1CZss7YRn19fRVOU36xmHw+RZtaNme6xd7swFgXvjI=;
 b=Wg+PwBfZ2a4DGHTq4r86yAZaV6zp+Lcm9YnYi3rdFlH9MCGSESt6srGcWAtzZ1bfMG
 nNsm0EHe2pIyzDBmJVjH4/+aw1IOKvCK63WG0DA3aP65tekb4TBbnFlYIS4LbTEyatNl
 v+7CCW9hBY+Bli+oKlG2EriNFGreX5YcXIuaI+4BaOzaaFmNYqbvNgk8McCLTA2QVJa+
 +DO7Y6F2kCTdKqYBK228Cps5XrFlSIZ+enQfjw8iLMjJ30L03Qvqix29IHxBp/VnptHG
 hA9RvX5/gPAyMoaWbwncMMEtt84edbAeqMiwAPiAC9xwuzp4yfLyZ1FdKATXfSaAF+1i
 s0qw==
X-Gm-Message-State: AOAM533ABpYdznQgjWD3QiH9hND2WJfkkFPxd7+bEfvhNyQgw1JO8gjF
 Yjmct11jG9Ds8zHqH7fAnLJ+v27y5ro=
X-Google-Smtp-Source: ABdhPJyyvzxOivddqxmZNv4V1srEVS4+nuD4rBGp0IvdnODl3zHf8U3vQ8/gK3KyYS21/DD1OT59Ug==
X-Received: by 2002:a05:6000:1d8b:b0:20c:54e6:1659 with SMTP id
 bk11-20020a0560001d8b00b0020c54e61659mr8069265wrb.169.1652543716894; 
 Sat, 14 May 2022 08:55:16 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 x15-20020adfcc0f000000b0020c5253d923sm5180870wrh.111.2022.05.14.08.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 08:55:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 17:53:00 +0200
Message-Id: <20220514155301.4901-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] toolchain/toolchain-buildroot: glibc can't
 be built with Optimize for fast
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

In file included from <command-line>:
./../include/libc-symbols.h:82:3: error: #error "glibc must not be compiled with -ffast-math"
   82 | # error "glibc must not be compiled with -ffast-math"
      |   ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/3d91f3685ae6c3e1f765d419ea2c0da4cb0eb3be

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 toolchain/toolchain-buildroot/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 8d9cf4cc68..8838cc48ff 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -60,6 +60,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
 	depends on !BR2_powerpc_SPE
 	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
+	depends on !BR2_OPTIMIZE_FAST
 	select BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  This option selects glibc as the C library for the
@@ -81,6 +82,9 @@ comment "glibc on MIPS w/ NAN2008 needs a toolchain w/ headers >= 4.5"
 	depends on BR2_MIPS_NAN_2008
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 
+comment "glibc can't be built with Optimize for fast"
+	depends on BR2_OPTIMIZE_FAST
+
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl"
 	depends on BR2_aarch64	   || BR2_arm   || BR2_armeb   || BR2_i386 || \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
