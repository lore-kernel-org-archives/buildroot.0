Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6AA606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 07:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WWlYrLx2
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C38040501;
	Thu,  5 Nov 2026 07:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZ6JxtbJN7A0; Thu,  5 Nov 2026 07:35:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 74846407FE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793864103;
	b=YU3/tbH5CAsZEeYqTsm+FAT8Nh5AUCUvt+uWFUmVjhuhgPc5/gcJgVm+zphJdELuRGsO
	 4cxNpu/yJnCXcK4ls9tej2qFSEsKl24YLG1K0iTyLGAgiix+Bl0eqsR6Cs/drxrWWZRwy
	 +G67tk2jMbCa+Cn5i5Q2YEMtRNaM5LMa3Tv2ycCIVGL7NCeR3xYiVPCu0ohHiO4SW5hAo
	 MJg/Z4u8J8Eq26EQhqHhd0p3wGdV5bq7G0N0MhestEgtZlefMGLgBEOANEC7V8piYp+Ic
	 Nj+EesAMY8Za151hauXjbesl8fX/SSKBK2savN2+xVZ6t3rNDNbzNIKjdizxXfx+L6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793864103;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eMlNfQBxbghtWBeFiRX0UhB14hHQiurAFDrO+DIBPLo=;
	b=LVoQc9LSUmaPNwwuXtRnW5wG9htYdRjMiGP70x0/7DgYp49TLcRumCfafFi8PGc6FI4m
	 KFT2DTLfXmJvvbmgVqWeKCoqrp+47VnP7M8Y6nybmOD1ht8dlE9bwGvolISR6OAKw2VY1
	 vvvGpY9xP2GsW8m6Wv1IZr7chtGNsu3DyBIkkklj33YbVLYIGlY1Dy9UkQPq3vZrr3zyK
	 FdBtuzjsGK4BmmxGVkVSaM/LF3d/YT1pN8TNAifuNrcWO7cR13iT2eYlw45G3zhIsEAW2
	 T/N9ISduHHQO2Pei2GFA68LS5tQeR0kVSMptQKs4OKwlAN9F8coBD/ut61B82B9UuBg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793864103;
	bh=eMlNfQBxbghtWBeFiRX0UhB14hHQiurAFDrO+DIBPLo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WWlYrLx2j91AnZLx+PWQdCO/0G4Sm7TPtHoXOOZXf/jv1WpZzb5CZvJFcy3gHvRbS
	 4sFswJETO3ulOrpP2qb6hMbEtVz2VTueG2WJAswJlJvHE7sriDpgDwtSaUZYwa1DRI
	 sHCX1jtxxFrd3Zpxk2Nz+IqMap/yu3XkYxCfKQz+YQEEZrVWw34ElDnsAQjs4S5DZ/
	 IxF6HVeao2YHFSHCfhxVZ2EvWsZdJyhinCawVfA39gd6dtOutLrXRBhTFcOq2gC9RM
	 kKz/6KSAu0q2H70qf76x0hDLvXChafi5jNCdahql15zawEmliRmhyFQGDugomtOBff
	 LxWhWQcuNSFJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74846407FE;
	Thu,  5 Nov 2026 07:35:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7CDB362
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4FED81086
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpp6FFx4K7Az for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 07:35:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1A04581036
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A04581036
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:35:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF2EC9DFB1; Thu,  5 Nov 2026 07:33:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 08:34:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34c6f77f89aee44e4e324646c3700c79442e2f8c
X-Git-Newrev: d1fad27e965805c0e4e201994021cd9acf48b0a5
X-Patchwork-Hint: ignore
Message-Id: <20261105073329.DF2EC9DFB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: fix build with
 -fzero-call-used-regs on ARM Thumb-1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d1fad27e965805c0e4e201994021cd9acf48b0a5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since OpenSSH 9.6p1, configure enables -fzero-call-used-regs=used with
GCC when the compiler accepts it. On ARM cores that only support
Thumb-1 (e.g. ARM926EJ-S) built in Thumb mode, GCC accepts the flag,
but fails on some functions:

xcrypt.c: In function 'shadow_pw':
xcrypt.c:156:1: sorry, unimplemented: argument 'used' is not supported for '-fzero-call-used-regs' on this target

The ARM backend relies on GCC's generic register zeroing, which loads
zero into each register to clear. Thumb-1 cannot move an immediate
into a high register (ip, lr), so it falls back to copying from an
already zeroed low register. In functions where the only call-used
registers to clear are high registers, there is none to copy from and
GCC gives up. -fzero-call-used-regs=all, ARM mode and Thumb-2 all
work.

Disable the flag on Thumb-1 by presetting the configure cache
variable, as already done for powerpc64le and MIPS before R6.

This issue has been present since commit 3c047ea463e2 ("package/openssh:
security bump to version 9.6p1"), as OpenSSH 9.6p1 switched GCC builds
from -fzero-call-used-regs=all to -fzero-call-used-regs=used. It
therefore affects 2024.02 and later, including 2025.02.x.

Fixes:
https://autobuild.buildroot.org/results/6b064db6d713a6fef7f202c37daf041055e647ef

Fixes: 3c047ea463e27ceaafde76d64406862c3322daa0 ("package/openssh: security bump to version 9.6p1")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openssh/openssh.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index a0cd3168e0..27cd5fb169 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -36,9 +36,9 @@ define OPENSSH_PERMISSIONS
 	/var/empty d 755 root root - - - - -
 endef
 
-# -fzero-call-used-regs=used is not supported on powerpc64le and makes
-# gcc ICE on MIPS before R6
-ifneq ($(BR2_powerpc64le)$(BR2_TOOLCHAIN_HAS_GCC_BUG_104820),)
+# -fzero-call-used-regs=used is not supported on powerpc64le and ARM
+# Thumb-1, and makes gcc ICE on MIPS before R6
+ifneq ($(BR2_powerpc64le)$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_GCC_BUG_104820),)
 OPENSSH_CONF_ENV += ossh_cv_cflag__fzero_call_used_regs_used=no
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
