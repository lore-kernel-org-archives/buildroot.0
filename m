Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15728606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=tBFDEDkE
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2F5C608AB;
	Fri,  6 Nov 2026 15:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eWGEG_eVMOFP; Fri,  6 Nov 2026 15:59:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 19CE9608AC
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980771;
	b=B7FINokD8per7cwrlikbGilPAZ/Ut1QaN7vuUBZzssnsEcbrj6pQol0mnuKdbIwpbpwm
	 MK8Ge9PPtZj57kpa9BvrVzqRVQcGUFPiZg4Gft7o5dDbQtNVSFEOK2Ekv7V/Ct8yc97kl
	 dOElw8JU7maJZteu1A+JPdPq7ZRXhnGelwreg7Xgk2f7GZQ7v2gRtkwx15QzLTe3juLI2
	 IDTRgdbFX3Np8fekyeMiFp89gjqWDc3yrOFunVcoVqNQ4waRiKb2keFoVBbxehneuVK0D
	 rt7y960gHANYHZ8jf7ewGtvaxofi83K6jAWy6ceaExBIbHylsO9Ou6L4vGHbrV4Rq8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980771;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=sWUKU4PiKFXOSlD9Rz25Fwun2WDjLeU1+2Uj265Eb4I=;
	b=JAJv+rKFz6dxmya5EBVLR+c16uF4vfpPw8fzWjY3RB8dFnbcdOooZ/jLIX06iWsTF4lE
	 SBieKaMN7RrdJEUBKZ6W+z4VBwG/rJzD6S/xO2rynFxuUEQWaamebrSjb3hvzcePoP64J
	 ifWewg1W1mIt6dcTxgwQNVOhmkykVt2LmDhr4CZo6bSRDGOwR8t0fFUK+8m2vs9we0SKj
	 54psjYr53yV27wD/f5+bnv1QDdI0DE9ZtUPGcbU4M9BHpFhPa50VXhek5m3BHgv9JeSZP
	 9e9eRpUtTUcZbydUXmQ+WFSPzw1lR9LEsYa76etciBcN5Jgimz+PtbipuUEIQa4qwNg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980771;
	bh=sWUKU4PiKFXOSlD9Rz25Fwun2WDjLeU1+2Uj265Eb4I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tBFDEDkEd7xl639jb0YdFN8Qus7mVaXqEUb+DA91hgiAl5fNUEtvv7X9QFRHUU79O
	 tmpdY1f6SsAXdj4EXKjYjxQ1utu2Z9O2daq9JC+bs2q9v145LjCwoRFt3x7mnsVyC2
	 H6NmXXq3NZEHG+9x86+g2vyJjOrh9lXB00AZuaPqSRjZZjuYQTdDy2A19RPfrcnbdx
	 CtUn288/Z23PC14ARKAgzxbnQBBpT1wOiciTXTDcKDSvO0tJeminsWjt2sI6Qqyfsn
	 veSym6rANXG7PgoOrbtIkykLlLDbHJI98Z/XLYWBSa7reEOXb1RY4ychhnWC1x9rP/
	 QX7CLQAscYDCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19CE9608AC;
	Fri,  6 Nov 2026 15:59:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C2501370
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8D76406CA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENdaKGyODSUp for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2459740925
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2459740925
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C80C9E0A8; Fri,  6 Nov 2026 15:56:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:27:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 955e2347209bf962f9961a5e21d81b9bc486ebe3
X-Git-Newrev: 0aee3548d37be45e8847ca7e6537521ee2c57c51
X-Patchwork-Hint: ignore
Message-Id: <20261106155657.5C80C9E0A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/linux-tools:
 perf: explicitly disable BPF skeletons
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
Content-Type: multipart/mixed; boundary="===============7182287443774837236=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7182287443774837236==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0aee3548d37be45e8847ca7e6537521ee2c57c51
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

perf builds its BPF skeletons by default whenever libelf, zlib, libbpf
and openssl support are enabled and a clang >= 12.0.1 is found in the
PATH. That clang is the host's one, and it compiles the BPF programs
against the host's system headers, so the build fails (here with
linux 7.2.6 on ARM and Ubuntu's clang 21.1.8):

/usr/include/linux/ioctl.h:5:10: fatal error: 'asm/ioctl.h' file not found
make[6]: *** [.../tools/perf/bpf_skel.mak:87: .../tools/perf/util/bpf_skel/.tmp/bpf_prog_profiler.bpf.o] Error 1

Without clang on the host, perf silently disables them, so whether the
build works depends on the build machine.

The perf tool does not depend on host-clang, so always pass
BUILD_BPF_SKEL=0 rather than let the host's clang be picked up.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d2f3cd8cbe3316484d6953f73db4a31277adcf7d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/linux-tools/linux-tool-perf.mk.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 08aeafd9d7..a21e6190d5 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -29,7 +29,8 @@ PERF_MAKE_FLAGS = \
 	NO_LIBPERL=1 \
 	NO_LIBPYTHON=1 \
 	NO_LIBBIONIC=1 \
-	NO_SHELLCHECK=1
+	NO_SHELLCHECK=1 \
+	BUILD_BPF_SKEL=0
 
 # We need to pass an argument to ld for setting the emulation when
 # building for MIPS architecture, otherwise the default one will always

--===============7182287443774837236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7182287443774837236==--
