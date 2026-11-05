Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB37606BFB0
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XuJtTb87
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07B3060A58;
	Fri,  6 Nov 2026 16:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OD0y93Hy52LK; Fri,  6 Nov 2026 16:09:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1421A60A50
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981358;
	b=Y76H5CG6U40tWN4lsBCNXdyRz99hKOgThdLjXhrTVJGpjvqk6QZdbrWExXpd3kgxguZr
	 7GbQ/V6Z2pDTWA04E1lfdJ9gnUIy8E3PlzdvM/ZWScR9grecRccs3chXlouZwum25N5Vi
	 M5g4i81jzTHoP6KfCyxe1rrcaBVYuJpG84Rf8/1jV6LwOP5VPYjYTLM+TmF5XKZxEaXJt
	 uOkASfeioJh1Ley7p4HCwxiw1OKJfPoqY4ai0suDYo0CmzP0QRSdndEZvJMBGSoR2v6JU
	 N8iniqclvmR8JwVCEtykw3nUk7VtK5UiYsXsRcGYLrM4tFFhQSWbdMR0UzYrz1uYOGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981358;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=IepKi6HAZiNyYPm9ioznIgF48ZSV0JwRfCRyYGDZ60Q=;
	b=dmJynuJITh7DS0z8zoVIVKUPlPx/6mdbjo6NilY4PF9nzTjQJcB6/T16eTrWaE0xOMXB
	 oQAGF6X1+BGquU50JYubYyzYNJIwDbd+T6/mLX7MFfuoiEm6c1fpinBU6HpwJeE0t0I5R
	 SlwVuwJ3zsnlM9xJGV5+ZAP+GUIA6nYVzw7LD0xPpJZWuydGScGm9yWghz84tSrxPE8oi
	 k/MamSLxnppr/bPtL0+qb9WYGHzggD6stSQsBt4Kj3OLkpm72q8PTy7FQVY44E2kV82gu
	 DlRNoAkDbXtli1CkMd+NEV6Sp/iZhY0qHrBn/UnPibYIpbb0Pp9BNpie1kjB0MBZoYg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981358;
	bh=IepKi6HAZiNyYPm9ioznIgF48ZSV0JwRfCRyYGDZ60Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XuJtTb87Lstx88QAFiIUC0GitQxGO5GQGoVFRiCmbXxy3RM7Lqm1T7BrfPk3TuLvk
	 G6aMxeYDObzj4lCej4z57EMY/PZQ16PrJB4GGqpIMNF6JYey3YznIVU4faDhryOj5j
	 By10xXMJ64WtB7TbzyjVW8F7O4k9SRd+qW36/k2psThZOqm4BzY8RvDpV0Z1oxMwCx
	 A3eosWidp5cGCedBttfM1xFJqe8+pDhCit0k+5u3lmDuI7skd8+mCN32DdeGjm7pds
	 6B14+nlD8m8ut5XwkW0dDCgfj2CyMIB3BJhTkQI93uLSRVZ7HSCQpn0fhhzAq8pjOh
	 vlmbWtQI9z8LQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1421A60A50;
	Fri,  6 Nov 2026 16:09:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CCF07AA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A46740913
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtumNhPtTNnL for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B405F4090B
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B405F4090B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDFA29E09B; Fri,  6 Nov 2026 16:07:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:58 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: a46cd58f6f953a9afc7eeb8a074d3483e7c75253
X-Git-Newrev: f3723d838f87bcb46124e0e5615350343c66b05d
X-Patchwork-Hint: ignore
Message-Id: <20261106160709.DDFA29E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/wolfssl: fix
 build on MIPS r6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8992004011516535055=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8992004011516535055==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f3723d838f87bcb46124e0e5615350343c66b05d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The MIPS assembly code in wolfcrypt/src/sp_int.c uses the
multu/dmultu, mflo and mfhi instructions and clobbers the hi/lo
registers. These were removed in MIPS release 6, so the build fails
on MIPS64 r6:

  wolfcrypt/src/sp_int.c:4217:5: error: the register '$hi' cannot be clobbered in 'asm' for the current target

and on MIPS32 r6:

  wolfcrypt/src/sp_int.c:4418:5: error: the register '%hi' cannot be clobbered in 'asm' for the current target

BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS was meant to exclude MIPS64 r6, but
the mips64/mips64el conditions test BR2_MIPS_CPU_MIPS32R6, which can
never be set for a 64-bit CPU, and the mips/mipsel condition has no
r6 exclusion at all. Test BR2_MIPS_CPU_MIPS64R6 for mips64/mips64el
and BR2_MIPS_CPU_MIPS32R6 for mips/mipsel instead, so assembly is
disabled on all r6 CPUs.

Commit d8dc5315eb71 ("package/wolfssl: disable assembly when not
supported") introduced BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS to fix the
MIPS64 r6 build, but used the wrong r6 symbol for mips64 and added no
r6 exclusion for mips, so the issue was never fixed. It therefore
affects 2023.02 and later, including all maintained branches.

Fixes:
https://autobuild.buildroot.org/results/10c901b8c57f6322b127f1b14c78f73dbb7f28b2

Fixes: d8dc5315eb712eca0a5cbf793a6714a47ab6e57e ("package/wolfssl: disable assembly when not supported")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3602e1ba7fd49c90a2e05f270ed2a57f472d0305)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wolfssl/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wolfssl/Config.in b/package/wolfssl/Config.in
index 9d173412fe..8eb789274c 100644
--- a/package/wolfssl/Config.in
+++ b/package/wolfssl/Config.in
@@ -4,9 +4,9 @@ config BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS
 	default y if (BR2_arm || BR2_armeb) && !BR2_ARM_CPU_ARMV4 # clz
 	default y if BR2_powerpc
 	default y if BR2_powerpc64 || BR2_powerpc64le
-	default y if BR2_mips64 && !BR2_MIPS_CPU_MIPS32R6
-	default y if BR2_mips64el && !BR2_MIPS_CPU_MIPS32R6
-	default y if BR2_mips || BR2_mipsel
+	default y if BR2_mips64 && !BR2_MIPS_CPU_MIPS64R6
+	default y if BR2_mips64el && !BR2_MIPS_CPU_MIPS64R6
+	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_CPU_MIPS32R6
 	default y if BR2_riscv && BR2_RISCV_ISA_RVM
 	default y if BR2_s390x
 

--===============8992004011516535055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8992004011516535055==--
