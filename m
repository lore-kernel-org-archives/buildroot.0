Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47738606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CgFZatze
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 195BF605CE;
	Fri, 30 Oct 2026 14:08:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gnw-qYU-c1G4; Fri, 30 Oct 2026 14:08:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 26C8660BD3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369304;
	b=VPk96W/r64p+zVbI+Fp8cllnOOg78chMJIx0qOekunQrlCmVGT5ZjtxC3pGb45yn4MTG
	 a+h3nDaG1WO37tyAmg/LLY6fYtaN0bix7DUGe9qHLB2IHIw8tdIiIoYvwEFkY5bsU2tFg
	 OZ/q2PCWoYVTVcHdD7UGPx6PZpHPPn/qDmE45kk4Goqa3pROk6fjIwd3FN1T4PgF1KSy1
	 Sbt4dCwBAEFKhreigBvQKbu4hwh82/hpo41sZFJJsSGKEjWwR4XflvgigzJPscKPSHZjC
	 Oo1OtfbW87ZmrQ9o23JNlrWGFBfiVXAUSJsKVM0DIVdEbMwA/rru+xbnS+kKCfF0n0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369304;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=EM0h+oJCiPmTtOnvVs8mGpr4+qBUfqBZqRppiUbFJIM=;
	b=ObTrTCtWgCBwX7I/bLisB7OhSj8Pj5eJr0Fuw+hmtxC4NzEzvanoWTy4uRrv94Lp1vW7
	 5Om/RINanLY0giAEdS9APVm1q6nm2FisWelYFH4TuxXHwpS/Z08PSqUe5pZgNAU1oybzV
	 e89f4nsr7PS4fv94pWFfu7qfbuxhEHi4DDHnn6Utyju38sYnr5Po/7Z+3D5RsPOVXy6KB
	 kNtTHbBVXMdjRfvT2aCy79D76kKaHRXC3i9rOwgEZ825VdY/5rR9wwHxiJeo2jdew/et3
	 dH93ZgV62K1EDoQRT3V846kejtYJQo0c7tIstWPHxzQlSrVeqn3n5k44rCMpmJVgEGw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369304;
	bh=EM0h+oJCiPmTtOnvVs8mGpr4+qBUfqBZqRppiUbFJIM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CgFZatzenXcT5CIgBcCdlG2XH0ysnaMyhmfMvjZe+e8pf3D2Ix2Pm2vfgvdfK5lh7
	 fGLq7uDopyc3tBzk1134sxTY3tgEefG6k++aFGPaI2dIWfyhq1XZ11wIXIiM2hdiAa
	 pjSZwARhpffK1SDRRLOlwnDpVaO0dp/Z+K/uC8U1+E/Wqn9TL00qlY5YYMpUkYVkDB
	 JHBCxWgeFvm/zvWHzALTHP1RQak+AUIPSuwNmgeXscvV6+dEVIqNQ3DE3qXo2ZWGwm
	 7Ky6VcQmqWVCAYkxdQpAnt642tGYTTmeaRJ383X7obQWKLqGt3DyyxKzj/c5ysiBHB
	 F60a8dTuNs1JQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26C8660BD3;
	Fri, 30 Oct 2026 14:08:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B1E98D44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3D7C81136
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0p3WQR3l0FL for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EFC3F81180
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369169;
 b=IS+6EX79NksH94l5VfE9pfSZDz4HCR3awuWWdZigPv84ZQZd3Gf9oPj0Foq6bK7/ZHFd
 r89RK00vfq3auESHO5VNOYNR/uf1HTT41B96osLoGYv+u1apDc8qVKPTD2E6FoHbfQDiN
 lA3Vq24pkYViV+IuoVqDUaQeQzTT/UlWYM7eeLyD8vrmacMQMikbjO+a9Nkioyr5UFEDQ
 IwKAC7uX3M9TTlC4LU9BVjLLOB5ADh7LS7cLl0rrNSYma/bLKZOs/rmrJgAPJFTtLL/zf
 4a4kmuWFbJ01cmFFSZqBc3yMPwLSTMpcx2Hnsh4YiIb/Y63fpAaY2luLeOD6pqKd/Pw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369169;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=24maFfyfYBQGj9dfPKQMiyQ4RvxhugxE0RohoKhARS4=;
 b=a8txqRTmz4UEBPlpi314xqslnp/I3TXI1iw+GSCE2+XFCWwrnZ4W3EczyDv9ISj6uGk0
 XnIzBqpwDLWzBHvDC5HyTcmYbonfFI7+z8KPnY47ENVW1qS9zCbjp4IdjDZOZA02Yxmta
 bg/KRiimwahYkeKUXnjo9imMdXXAdCMwho3+TzVhLRzw56Fv77uvpge2NQ6a83Frn9MMJ
 0kvMl9/KvZJVtMcZGkRaYKAoUOmRNNiK/P4jsU+eZCQD6Ss8KlVHoKSARn3so1NzGNOmF
 XS1a6VlzmblOm3VsaDOVUur7dh7/Hsp+QgY1VYbfYevaGRlpIol3AYb99N2PaXdTIxg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFC3F81180
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AEB69D389; Fri, 30 Oct 2026 14:04:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3a1585aa1beb70af89f47ba9ef1e028f33151d2c
X-Git-Newrev: 63765701c65b00045e1f7dda3d451c6dd3c86808
X-Patchwork-Hint: ignore
Message-Id: <20261030140441.1AEB69D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_104820
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
Content-Type: multipart/mixed; boundary="===============2750694841866206641=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE,WEIRD_PORT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2750694841866206641==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/63765701c65b00045e1f7dda3d451c6dd3c86808
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

-fzero-call-used-regs is broken on MIPS before R6, which still has the
hi/lo registers: gcc either rejects -fzero-call-used-regs=used for
functions using them:

  sorry, unimplemented: argument 'used' is not supported for '-fzero-call-used-regs' on this target

or, depending on the code, the ABI and the optimization level, ICEs:

  during RTL pass: zero_call_used_regs
  channels.c:437:1: internal compiler error: in int_mode_for_mode, at stor-layout.cc:408

This has been reported upstream, and is still present in gcc 15.3.0:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104820
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104817

MIPS R6 doesn't have hi/lo and is not affected.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f5b1cdc0454d5d0fc5d9c5b734c38795625f16a6)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 toolchain/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 7b3542340d..086d507d9b 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -214,6 +214,16 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_104028
 	bool
 	default y if BR2_m68k
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104820
+# ICE: on MIPS: in int_mode_for_mode, at stor-layout.cc:408 during
+# RTL pass: zero_call_used_regs. MIPS before R6 also rejects
+# -fzero-call-used-regs=used in functions using the hi/lo registers.
+# This bug still exists in gcc = 15.3.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_104820
+	bool
+	default y if (BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) \
+		&& !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107728
 # https://sourceware.org/bugzilla/show_bug.cgi?id=29621
 config BR2_TOOLCHAIN_HAS_GCC_BUG_107728

--===============2750694841866206641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2750694841866206641==--
