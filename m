Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53869606A331
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Sltm7wXC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2954D812C4;
	Fri,  6 Nov 2026 15:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPTghSAb1HR6; Fri,  6 Nov 2026 15:59:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 185EC812B8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980749;
	b=f7CSzvLQCFDi7q8lV1S4kzRhW1PgrDIXunUDDRTNUsUFqLrlDPK+ClQS70Sm6I7lHIsU
	 SwuTl2T/t38nI/KX+/mx8svYRxXWf8qf0hL7vrFa2WgJCG0OsT/B8FyfR/T83EvmC0UGY
	 9gnfPk6dHtCIqhYLUb/kdS0eajyMbjx+jo3dnWlWFCUgFTE1s5u1LJspOYOaTqtR+os+1
	 1eNgcb2lIDwCUPJFf1+tJ4H/AeRBhVr2TJy+1EoSKAxTk3PF/hMIYSfdTB9HoLjNEmCAl
	 ncSxWSYiOEnze1zYrxrvKIBjjeEzZCTYeDKWaQlkM8j1E7iSXCbf+eVyyqBrCRGL6PQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980749;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=X4oQSQvtJYgPWLsjDkrXIbm1BdzhGYz6TpoKVS89Mzg=;
	b=JMfzpGmKZ87TY0MprP/x8/1vg7nal3g0QsdDJE+lQFZPz+5sJBv0FaBzVwnX7DDSRv1Z
	 UpF0CMbuzjSgE3pikCrKjyJ0lH4Aw/X38CqaFxOLCG2stWHKhY38nbnm6778DwPee9bid
	 BZE6tTW3gxXNTZ7J6mpQade9ULeXeEwk/M2OvP2XwRpZWU50AKXJgpmQL/acLMiUIKyD5
	 lYu1S5LXqjbn8NytWZXUs71EkU1/QRbZ3AE0yonB9Iy8I/oj7oJ3GpnnByF7IcliUkR3K
	 yZSrRzfut+glrMHgcxDiKpZxuX6Wtd9aA37vvilY4UgUFZDsBpb+CgavibPKUxZGpVw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980749;
	bh=X4oQSQvtJYgPWLsjDkrXIbm1BdzhGYz6TpoKVS89Mzg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sltm7wXCwEHJPOyU8avAfdQ6gKGzmDHoyXWigCOvXD2jBLD0b0xNTfAAoU2XOw+KA
	 lpAUAnjBEbGw8vrI3T3Ucq/MkusBDTxqwmQmpo1k9WXXGZZ/RPbFHnIMYg04mlgBAX
	 VXjlKzZVhSrdmajwruWqDVVXxQbRzPLavKMBk22LFYKJa+XsQ7K6/1Dr4Yk6DVPQtk
	 NYqb8mY1LxwIKrZlx8oCfou0jDCRGckmVuUYJpLuVVRduYC0JDmFbW328RwwSepm02
	 zHW9nI2SnYqv9ncm72WSdbVpsbq897F06fs4b3tlTXOfDMno913NQRAcHN09m6ha3+
	 OyvNZAuDA/Fdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 185EC812B8;
	Fri,  6 Nov 2026 15:59:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 694737AA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AD25403D9
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7E2ypih3F99 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A9037403CB
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9037403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0DD89E09B; Fri,  6 Nov 2026 15:56:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:27:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5b3aacf81125a8b2bf7ce9de122b16162f1ac074
X-Git-Newrev: 89f18f45aae1eecfb34927831ad1708f67b5ee7e
X-Patchwork-Hint: ignore
Message-Id: <20261106155656.E0DD89E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wolfssl: fix
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
Content-Type: multipart/mixed; boundary="===============2652079128292994634=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2652079128292994634==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/89f18f45aae1eecfb34927831ad1708f67b5ee7e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
 

--===============2652079128292994634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2652079128292994634==--
