Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398B6606A329
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gxO+W6s3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18892814A0;
	Fri, 30 Oct 2026 14:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4kPr2F2-kPTU; Fri, 30 Oct 2026 14:18:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3EB278146E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369920;
	b=N8jLsmYfMvlY+IN8YXkW9zT7uax2pkBCu+kEs/VqUZ8wcKmPc95eUX6OFzjXZlnMbbdR
	 7jXZXfqMK6B3Y9SoYN/X+G2f2dY4VnuLnW7FUPRPeT5WRZMijLHux5PImLX72BWnz2DX7
	 0VXcVFzcBGVS3AwSXbNcxmKoq6ZiCwL8gHRjjI98nWfebPzXXsdh+8jtEN1t6Rg4DuWru
	 dp+XuaIdlYRH5ASw61ADgzb6g39LKQozQXQeL+F7R/JbrrgeSxLESNq2cUrh2xPWMZnPl
	 w2MIDniNPQPpe1cTNKHK8nq1B0TAW5GuAUY6FksPq1MeuFHSRXJrbIS2GCrj0c7ShGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369920;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=WKmIpM2+sHcDoV+S93tdR6YQIVTffMzkuN569ad/Fhc=;
	b=ORdO1KHkw2LnnmGnnp8xggiBXtIXtTlkaPr18gb0DlSQQoyWj0JzAqrpCbL9hqjOyVnA
	 ZDZ0UpOc/6A1Ol2P0iY3f/zttsV3ugvxMqqhToZx/jETo/Rb36rR15r88GucWslHwBafP
	 Gq5oqvYu0SyvXqsQNglvpTm+bcChvanHFV2Oc7p1NdeBpivPaAUsqRoZRCgetJjbHcGkq
	 gDJofuUB2zx2ZEAx3MIaLyBnuu7czP3dje1V63bnTC98x+lwG99SlBBba4f0g89mNgyhZ
	 4+YmgepyDVvLdGLF9xC2GvskSSpUpva2snuGIw4AFkd/shhOmQWYA7oNfkbybryCf+A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369920;
	bh=WKmIpM2+sHcDoV+S93tdR6YQIVTffMzkuN569ad/Fhc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gxO+W6s3w6z5q4FpDD0q0sr7U0NJP8S/vDjxcqKiAugaNzhtxDu5oCMEyO5axFix/
	 lf08f4vOqABlmcaHJa+w6unbxaMFTzFZ5QqOmtZJov2ZrxecENibR0Gq6I2lREPEoC
	 bpf5DCTarvYPzw9Sw904EHX164TDEr/J9TBszvwtkY67DnZIAlJbIbQJ4rvtAnKrjI
	 Rax/iO2kC8m9uuJnzK6PVtsD+/Dxp0TtlIrgmH2pQ1ZjW20Npqs+cM1RjKJ9VdbJLz
	 7HQbVjh5Mx6tKKWbLAtHz5Zqp+uZ4+aEIWw5Tb9+QkMit841Q6oNeys1qH66c02zEk
	 FUunYL+uhNiEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EB278146E;
	Fri, 30 Oct 2026 14:18:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D45FED43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C65C1812B9
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-rCuvbnioqD for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EF111812B3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369885;
 b=klKBg3liq0/XEgg0LrLVlV7YQCBbknpYorhfwP0ULX6D2e6nzVSB7h8NvwA8fHIdJT3+
 jXjmjDo/ohqDKKHVoYW1X+sEc38uD+MK8xZhH3cVkZ99ScGpRNulWt2zzcfT0cYGN0BDU
 U+Rw1zTgpWe6jD9r8rxtTJlVJpWv1dKNIQImSLrw5iS3V88uzwns3Gu/NbNPpJOlTfwZY
 ux+oNLhhqdX/itOCbpWZWoxioaXwDAIZo0bI54lkJ3+AvB3mMvbcoYv+J+Qu+6vIVTYaq
 ugWIB7dJlySey85jp0//ppY5X5zbMunoWMJ3umBiu/T5hPneNorseBeFJRhueHUZQGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369885;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LwOz1Q96Ay9isZNIh2ZmN2zlIoXafraH/N7w2iwHEW8=;
 b=b8zTii+T6383GcRlB0YbRDizgSo8y5WhkZ+uXGe5AKlkRJmC35PlNAyTCSDuYaw2CoQa
 ucThK5iVocLxga2ouyGs8Xdbi9CWwvluN4f/IEuV4Ag/WwNpE4w5op1V1R1VP2gr0fSuc
 r5cjPd77RPl6C27LbIlMevgK9kWbqYc/StgjgLz7M8fih3IEKatHdGitV7kIYzEegbYlj
 vikO86dPXoYV1gI2cbesAJXGKzDCKsDiQQX2NiUNU/Iu2dS7pu2NZxIl/NhtXUq1PYfzL
 3zYnulhoJUFOsuY6cAzC1VbZEqsx40olvW/9l8itjkTSQ6DhUB3ScHQK5G0VL8zBwuQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF111812B3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19E5B9D389; Fri, 30 Oct 2026 14:16:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:05 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 10df8e9c96751420cb0234efd9294dc7b3bd27b4
X-Git-Newrev: 1588df237259574ef7e98154a5a18118c75e3762
X-Patchwork-Hint: ignore
Message-Id: <20261030141637.19E5B9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/pkg-golang.mk:
 use golang toolchain default GOPROXY
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
Content-Type: multipart/mixed; boundary="===============5691574577842972725=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5691574577842972725==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1588df237259574ef7e98154a5a18118c75e3762
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

This change sets the default GOPROXY value to match Go's built-in
default of "https://proxy.golang.org,direct" which provides several
benefits:

- Avoid package breakages due to missing module sources
- Better alignment with upstream Go toolchain defaults
- Faster downloads via the proxy compared to direct Git clones
- Maintains reproducible builds through Go's module checksum validation

The default value from the toolchain can be read with "go env GOPROXY"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 84a940ebe1cca7c6df49062a8e9c250fe9221867)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/pkg-golang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index ffd50adecc..26da7be71b 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -101,7 +101,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY=direct \
+	GOPROXY="https://proxy.golang.org,direct" \
 	$$($(2)_GO_ENV)
 
 # If building in a sub directory, do the vendoring in there

--===============5691574577842972725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5691574577842972725==--
