Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FDB606A329
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 20:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=m/46DQZe
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45FFC60712;
	Tue, 20 Oct 2026 20:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytvsQ0YzAzmI; Tue, 20 Oct 2026 20:27:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 44E1260728
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792528034;
	b=OZi87JD81Z/E29abtWUdgqEwIhG+n/t+ArJPRCHoxtBRXF9EjCMSgPDImGv4ze2YSocu
	 7CIqhmhJ0azMEXkvUZxYyx28LE4TC+W9ofCRP9IMkUDOwM1fWmda0ZAPofKVvgAVqpE4n
	 SFvDiTgxyDXv0xr6pFwCo3QeZ7LQbSY52YmsJFfZFtVHfjMRdr3adNgx65M7LPO1K/wm/
	 aGu8z96F+Tf8hd4TiKvgrYPIfxAuc1nXzaaUzRsA4gn44Ma+J5HwcUxbouVFa5tVDn1FO
	 CQsCqIsV4Xcw6jY2hK6OwU2C0uvjlnDvbIMORsrgt9bUm3BuMxf24PhyRBje+E8tzlw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792528034;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QQnQ63iWsCsyqQtI+RHgaQ6Sm0XwCV1Vbq+E++yjn6Q=;
	b=IbtzD1VTUScCuDyG6ISK1aQRNwxpIqp4mK0VywmlsAqc3tMI+5sytW/6Vil/ckcrL6yl
	 rIVJ2QJBhkOwGszDODwWEwkqdN4iHD64P8VcvtMS62kwaATukeI6O/w5k/d2gPM2Cdfab
	 aZ3fbqLxEM9Uk/sDmfGV7xNkN8XIT+9ACG8R//7EzNTY0UdqL5U8gsjuKlwhttrRMhbmb
	 2IlM/v4V7msblx1TRD64jgIDwjREuLEHNMAgNgZU6y5n0sSmHC2iD/g9h8rcd6Qviaf57
	 BEjRvWoWwpxWqqHL7o+5nDSIXayuSS3UvUWbbe6CRbHrL8yCx4U4F5foE4mfysUBngA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792528034;
	bh=QQnQ63iWsCsyqQtI+RHgaQ6Sm0XwCV1Vbq+E++yjn6Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m/46DQZeiCTRmT7wI6bw6LEOf+hnhaCNid4gbvbNRraHINKRQF8GEd8nWGoHPWaaC
	 lHxFxZW1FUDLRImBfvFTBAXJuGPXcXnhVCMW9ZchiK4Xuw3W5+CFX2bFGuk5KZtNu7
	 qQ4EFhimqE3nybwriGfil07AXH3qCpcZgiT71spAI5GXAYUNPyy46ae8IOzYy9Tuwo
	 ZMaoijklIpd93mYtCAuVTOaxUMqHCvJFSb2Tm6W20GIr72AwpYAqxLbFpWicplAuQA
	 q4NYU7CeeQnpypyKmq2X/c0qHnjyRlPL5Ve6ZLyq7gp8OfHRHFOToPO409jPGOydS0
	 jmWCDjMBs+Y+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44E1260728;
	Tue, 20 Oct 2026 20:27:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D42F255
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7311460728
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MlrRyIn5OQpJ for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 20:27:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B443F60712
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792528032;
 b=fzHK43IOcExLAPg4EXBQO4iSPTlUCSXlY8smrQb8rqhO/9wvie5a0F1CulfmLdBcLABx
 vICEKQ25XwSnpaVd0v3n2jpj6LGjOFrBWw9WAJ86XSJAVK+4xVo2dNiA3ofFVx6+vFPMu
 Rzga2RARUzlU144jvITvkdhD118fbRSNfFFqSKRUqD/uAxgfkdttb2XSlHFhZV3PPDXOo
 0f6gUJYprOVwq/N1JJ1Gl5dAegsiq7mBKYJmvwthWgBx5lOC7M0VWCGHdRgHG/C2sTh1W
 3niZFOsNwYMS5K9Ai3t+ZvOBSs6Hpxf64qa+umoq03m+H+D52OpPfxUA96eMLIU0PHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792528032;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=VHHLKpbH6XoVMqT4q77b75aM4sKswciNbzxpmHFUwwU=;
 b=f7RrzmVImiTLiuBDe3zNbGxGjnZzyR+WYbSMnwTClYN/AUcSgdJQDbY8F2qE+H15C4CO
 BvWWqA94TM6E7ruSrYyFkf+GPGtFzS2fxjYKryRH4qj1pvqla6MWXGVux7Pn0J036Jcxp
 9zEDrVzb2WXIRxaFPI9IwyuFBmvH6K90pu+DM9sX5g/eGIKbfHx/VWqyFNB97cSowbZEW
 qDCVzcRbcToSymWsH4evsXz1ThY0z6EQIP2z9DTALoszp9ZbnlFo0+A88npnaSkzff4VA
 IkZgolS9H5IBplpZ07hI+LRGPfqSEjm1VcnNM6ZIXXUDfgqTkdNtGiOYmZGSHKUZOxA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qnZY8q0C; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B443F60712
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:27:12 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D9FD6614CB;
 Tue, 20 Oct 2026 22:27:05 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue, 20 Oct 2026 22:26:39 +0200
Message-ID: <20261020202639.1094960-4-ju.o@free.fr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020202639.1094960-1-ju.o@free.fr>
References: <20261020202639.1094960-1-ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] arch/Config.in: change default target
 architecture to AArch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This commit switches the default target architecture in arch/Config.in
from i686 to AArch64. AArch64 is now one of the most common
architecture on embedded Linux systems. The default CPU for this
architecture remains the Cortex-A53 (Armv8.0).

While at it, this commit also refreshes the .defconfig to:
- align to this new default,
- remove stale options (BR2_alpha, BR2_cris, BR2_ia64)
- add the missing options

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .defconfig     | 60 ++++++++++++++++++++------------------------------
 arch/Config.in |  2 +-
 2 files changed, 25 insertions(+), 37 deletions(-)

diff --git a/.defconfig b/.defconfig
index d25c62e104..56785b2bc3 100644
--- a/.defconfig
+++ b/.defconfig
@@ -1,50 +1,38 @@
 #
-# Automatically generated make config: don't edit
-# Mon Feb 18 09:11:56 2008
+# Automatically generated file; DO NOT EDIT.
+# Buildroot 2026.08 Configuration
 #
 BR2_HAVE_DOT_CONFIG=y
-# BR2_alpha is not set
+
+#
+# Target options
+#
+# BR2_arcle is not set
 # BR2_arm is not set
 # BR2_armeb is not set
-# BR2_cris is not set
-# BR2_ia64 is not set
-BR2_i386=y
+BR2_aarch64=y
+# BR2_aarch64_be is not set
+# BR2_hppa is not set
+# BR2_i386 is not set
+# BR2_loongarch64 is not set
 # BR2_m68k is not set
+# BR2_microblazeel is not set
+# BR2_microblazebe is not set
 # BR2_mips is not set
 # BR2_mipsel is not set
+# BR2_mips64 is not set
+# BR2_mips64el is not set
+# BR2_or1k is not set
 # BR2_powerpc is not set
+# BR2_powerpc64 is not set
+# BR2_powerpc64le is not set
+# BR2_riscv is not set
+# BR2_s390x is not set
 # BR2_sh is not set
 # BR2_sparc is not set
 # BR2_sparc64 is not set
 # BR2_x86_64 is not set
-# BR2_x86_i486 is not set
-# BR2_x86_i586 is not set
-BR2_x86_i686=y
-# BR2_x86_pentiumpro is not set
-# BR2_x86_pentium_mmx is not set
-# BR2_x86_pentium_m is not set
-# BR2_x86_pentium2 is not set
-# BR2_x86_pentium3 is not set
-# BR2_x86_pentium4 is not set
-# BR2_x86_prescott is not set
-# BR2_x86_nocona is not set
-# BR2_x86_core2 is not set
-# BR2_x86_k6 is not set
-# BR2_x86_k6_2 is not set
-# BR2_x86_athlon is not set
-# BR2_x86_athlon_4 is not set
-# BR2_x86_opteron is not set
-# BR2_x86_opteron_sse3 is not set
-# BR2_x86_barcelona is not set
-# BR2_x86_geode is not set
-# BR2_x86_c3 is not set
-# BR2_x86_winchip_c6 is not set
-# BR2_x86_winchip2 is not set
-BR2_ARCH="i686"
+# BR2_xtensa is not set
+BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT=y
+BR2_ARCH="aarch64"
 BR2_ENDIAN="LITTLE"
-BR2_GCC_TARGET_TUNE="i686"
-BR2_GCC_TARGET_ARCH="i686"
-
-#
-# Target options
-#
diff --git a/arch/Config.in b/arch/Config.in
index 7bfa174b5f..0f1697597e 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -17,7 +17,7 @@ config BR2_ARCH_HAS_FDPIC_SUPPORT
 
 choice
 	prompt "Target Architecture"
-	default BR2_i386
+	default BR2_aarch64
 	help
 	  Select the target architecture family to build for.
 
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
