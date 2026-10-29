Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8A8606A320
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JS6cTx2F
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2B5F60DB6;
	Fri, 30 Oct 2026 14:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CYfhVtTLrx5A; Fri, 30 Oct 2026 14:20:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D6C9860D71
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370033;
	b=X9QW2IHMjEofwogpsK7LfG1tMb4kPavGtqEt4MeP95/QADwnKfjvgZQk8LM2gza8cuIl
	 85+SBCXWQEykjdPyjaZ57w1uY1PRCYGmtjdwmZRdHLvTQNhnP/rmHk5C9TfnzdWSNqUPD
	 gQ29XTK+eU/B1CNZAZH4q5OlmBWDa9CJlxUCW9/KEhMIg90LFAtCOKxUNyZTCMjKA1Xjj
	 GPk33kcnu1EmZX6qpeOrM7pfOnA6UScaiB6UV/xFORHdsw6wpGluDhfQbGS1UXz3SvWKK
	 1y96pmb+nBBCpnkijoc5k79FtcpHVyMEt/DvQgETjIJpH4OJR1+doe9lVntZyMBse+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370033;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=M1KN4Qgf45D5wRHvzbEOH3e1/hJAS8BRFAmdz/H5v3I=;
	b=ZkV88QiYsvDHBrEFsrp+HRv4FnINuVjMW42aAPnTrqtStIQEVuOfhzY2+Xhk0+ONapG/
	 1tFvUaAyVprNQpR6xLAI96Qr95zdsn8BJZN90WwAaCWBU+b8dbLIixZ20LVlHXdpHVzYP
	 9V5HWDmsPOYt51kHWLTOoFq/jTkKSYTYFTocxLfnT0hrI86bIMl1Y50lIh7c2QoD0Ypu1
	 UGp7Y08CsrNZKidVPMHTLnjflc74A2EZmrIPn7r5y6Y1JrluHp6u7+Sbk+iZzPv/IiPLL
	 KRkwRpXI1Y7OlFMTmJ5EWbtjw4ROERunejnX6Q57NUcbdr+NOP5MV/TwWRr/zGjdDxA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370032;
	bh=M1KN4Qgf45D5wRHvzbEOH3e1/hJAS8BRFAmdz/H5v3I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JS6cTx2FbDi498FPokqUlkcGnG/kr4RRLLBwvK2fYxg/YKymsuvoWoII0kthGDJpi
	 tYmPa4ovpt+SDKYld96iCzBLF0qevaBRYR0FHq+oYl/qW7KiQDziKjFxVP39GigODZ
	 bSMv5SOiPPapzMrs9qiqx9zuJgV8abZs9FYWnMfcuTvQZLoBhwNaOCpv/qTQh2IVDL
	 ucGAGlfw0r0iCG3K+B4VZEhZy19kYgUWwar6bcfAXNgl0C7dWMr8NU2KjYUbP3624R
	 98fdfAu/WItZF2RPVZfXiuiLLdOFbcgBDah7+x/ecfBrCmX92UUxWF20VaeMNVedz4
	 QgiYOi393OxKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6C9860D71;
	Fri, 30 Oct 2026 14:20:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F5F7712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 321CE400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qz9avBiqmO8k for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7AF3A40530
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369896;
 b=kkXocQr1iO5+lWewf6oJo389n8JOk0Fx1KrylpiWzzLsOGvjRRdpv11CpizKiO1atTqA
 Ooa5FEylWG2NJVZ8jGkfT69Xfw+tqJJiGLaNRw4qc8uVZ5wa1XIJFkdmO2W04t7lVAd1C
 lVCCRx58FCtavMY1Avfe5wXQBBaBltMFC0/KNTlGfWp7BFdMcS/+nWxngBObeq4DKzbbw
 2iYz4wMAAkEvxqfsSk078M4gM0xDG89K9/NjLWQ09MqG3r3TBDHQGvaCMrscua948wLu3
 IcmrxQxMm9N95cWLnr8e8kvT4fU0U6iDTeBNp7A1ol0s/+piuhnaXhgGngGqD01Y7Vw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369896;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ruMaq1hHtzuIRZZQnskKrmFFOJU2AmroVDOFoLM0McI=;
 b=aXufFgXPpFZreC58JMY+lNo2tXFzJveJIOX6nj/BMbp48j0Vu4j4/vSYg0Zyn/xkxwe6
 hYVomq2pXICioxrR5DKiyiyu5M6TOeS/kLFXKqu618xN+yMh8GsZdyYrlrUGyeK3Jwoqr
 /bv8BjrX2KGzA9/0yYpVSvjalAN7eO+OtauPmESrfGp82n23s+2EYV5YhraebViPl44k6
 Xhfsa7qb7HjNyO6DERR3XBYX5sAx1+ZabyDeWfiq4VkmUe73UQzCl8g3BtUDhr0U5iwSs
 LjsxAsevD1d0MIBjg0tgJLz8hvp9nCBIpdpU4R0clEdVIUcb1b3RUkZ8cmS+5rj2x+g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AF3A40530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A2F19D388; Fri, 30 Oct 2026 14:16:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:12 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: f69f6443cf61a681aa6a056ad8a9ad27a4ca58f0
X-Git-Newrev: 5e5396b693c34bfcff2c37eb43c4b24cdab6e5d7
X-Patchwork-Hint: ignore
Message-Id: <20261030141648.9A2F19D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] toolchain: introduce
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
Content-Type: multipart/mixed; boundary="===============5667765197412806953=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS,WEIRD_PORT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5667765197412806953==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5e5396b693c34bfcff2c37eb43c4b24cdab6e5d7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
index 128f8faef2..beb14d26e4 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -217,6 +217,16 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_104028
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

--===============5667765197412806953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5667765197412806953==--
