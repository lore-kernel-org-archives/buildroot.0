Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6724F606A31D
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JdjCURFz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 359A340AE9;
	Sat, 31 Oct 2026 09:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-m062B1pnWM; Sat, 31 Oct 2026 09:56:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 31BB840B08
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793440573;
	b=eeKILQc0hX9JEekt+CuN+12o9K9+fI7KL99ICc9kbWikc1lxNnGGTuY4AJvxh2KtHmRR
	 /kdloGK+VRFePhb6gqkUWM1YLl1gKKG7ePWI32CLeDDTBHVrNBb6EbZk5vSmFnWqpNMAG
	 INQ3WHyh1OOOhgBfURwIb4UE+XD6gR1KhI8VRZMe93WqSw/bMxNBoYcobmPk2ADSA/ne7
	 i31wU76xwY/p3r2CkMWzkgQ3kujt59Nw22JCIbhc3N57/fqE7Nwdgf+Ch0bEAcuWcoTjp
	 jWdXfnGc8uccjzJCDnMTW/pdOAa47cuaNAvwM+Hc2iXR1zI4z+5iVCEYtthVzQO6Feg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793440573;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZW9ALP3qsKUdOKe8ka/aP5/H+xowcoPGqbmBNBJpzI4=;
	b=N5vXFengpBuaBT7uf9tQIXd1kAYEyyewmeQBzvuJjhg5el1spDWF4TZ2Aj/d0Cx9QKzD
	 jCa3cYw8W79yjSTAb80A1M4/cTe5SFZuGmlO+62TSvKIY0KWOYR5FVE7sLIO3fdXUdvid
	 7su3s1xrNxmUoxcm4tjBMEK9kipwDPnx3YwR4ZZqwZvBJGo4d8hlBdI13foPwvdYLSW/Z
	 fxkaaE/WW4bryp2rK7WWCkZLQai75bjKPReT5ovPquEyJfjKiOcEp+39mU92t4fJGFzLd
	 bVBo9fXb5nFms61HltgnCCfEX+in3J2JMZGX8GamI+hMXMjsyUeN57dc9busN8vbBbA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793440573;
	bh=ZW9ALP3qsKUdOKe8ka/aP5/H+xowcoPGqbmBNBJpzI4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JdjCURFza5RrG3tR33K1KdjkVSXckn6hy5JepQT4jLtcH0ND9rm+HzAhaNeQDA2A1
	 5RSTmWphm2zPHUepr3LnyRk4F1dTa2VqySw49W8vj+pmO7GqjbnaHOE22Mt/I2dTzS
	 rYq8nwPbFE+H+85BfOVh4ed6JO+yjmcJJi3gk/vEIg2UbM2lPSUw3QNhEQu/AsHOmK
	 2V5zujF4HVOigwZw1qvM7xjbf0kBxh6PK/wOmKw8dsQtPzyAvCfmaoxrU8fDfpmCse
	 mLzjmN5DeesNUn7ZkwQLWgeJZ42Ujo8rHG9OA96NaWVfb3QhGiXu5YQDhOoJt7uJIG
	 7Vy5I/COzALog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31BB840B08;
	Sat, 31 Oct 2026 09:56:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11B9E2C7
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 09:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBE7481166
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 09:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0KlVPQOVetB for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 09:56:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BACF581134
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793440571;
 b=iswSaWe+vU/dHWJWiuOaNMpf4g5QvBBgihAUzcO68vxwq4eB+4WMLLQVIYqttucYS+Ea
 0jE2lHFtQLjDrQ88fUta/lkksbJsStcbeVMuSa9DHQnwNwUscIFEIAwCOKKTalTqGMS6O
 fjXJ37ErSJaKqszuIhU4hnWSC/a+nffJRvuwYWZ8FA6OcUFPo70uBIlj5eTmgf7dKL3Q7
 4LZJJkglsUuLXPMVgihyKUtwy0uluhOlvyrMGOMOMIBpDGhtEh3fxE6EwRXYjSRhDAmgn
 Ua3mwuMCarlQhPXXzvnkIl0Ulo9/pD6RXLhDFjQYISZN87X9wL6zVitZC+XcdTZ1UOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793440571;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=TD5zDu8r8ApLZpb4v+rZRnpw+DGH91mQQ8xgvssFy5s=;
 b=n6QnFAzdOM3V81/fXmrLHjVREBeGDTYwCuH3TtMbkQhIFrHqnAmFdqJj4J9fIPDAEPUu
 A3U0Uv5oFBnsSSSG9eZ25NcgTcVOu31YQnEc2FPhfwM+SG0TmKVg/QDH55KqPOeQivXuU
 jNo61o9RfRzhIlGRWSOnYsOH6gVEQ9xkNiLkZGbB9RYQbgNFKm7ZHDUkgjvUyW/fC7Jkl
 YbjnB8gWHBP+LGJ9v2rv427B3bIT8upeZRvIQ7E/nL+aA967P4rOmOcdUMK6aDmqtVRE6
 5GSPeQIqvAuZC1Qr3CTp87mvwFKHNYik3LtyLL3bsuvpMiC1zpsWhD6Wek5QIgINQpg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=bcyahvd3; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BACF581134
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 09:56:10 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6b429f71dbeso1545726a12.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 02:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793440568; x=1794045368;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TD5zDu8r8ApLZpb4v+rZRnpw+DGH91mQQ8xgvssFy5s=;
 b=aWHGqb52ptEvO6/H0Tft62lS2slIBLqhynerGQ64vmhOR6w7dF3ltvxYEzSqorvbjb
 Ptwh1hcWgRlHFgNd3+izMGYoJQvB3pgZukq6C8eP6T1ZzLlgEGaYDkkjQisl3673HJ46
 FNmgHK8Ct7+68sUHJiRdUwxe7ynZi/fjM4fc9Rxw9iaGXbm7DBQpuPNQRSoiJqdu2ocF
 qkcQUPdpcRuwaw3gOTxZ1kA8ZxPBCxsa2a9/HJc97OWRlh5lHg/c28aibzN74OHwbT/E
 8VgiTCIMuWcVVhove9/2CX8/sfFbLxQSdxEXXHy9zG+P7SM2j79+ZseSpr8vDRaOrKGj
 FSAg==
X-Gm-Message-State: AFq9FYJqY/NnG1pOWCzjDb1bskakV2wlYiZes/8sR+kyDFgpW+W7DGXW
 vYhiHpPb3FahLuGe4tBYKYQ9bRkIc5dP0yIE5pqdrxbIfJnCuLkKyyd73x3n5g==
X-Gm-Gg: AYBFou31zL6YJ1ijV55XaX5ikpwejGrtAFVVX9muau0WX7P5fy+PNjJUFHDiNbdXEEF
 pOewOafalLHxennX6OS9aET5ItTsoweCZdyMly4EyTxDUQpmK21kWCTvq3UMHbc/0TDu5y29RUa
 FSbFLkzNKPsGjvffjlkzLNuwRPCTJQhGkKnF2RxdFbldyX32q1hS8Er0kgCuw/U8qesGe+s6GeQ
 vUSPQeFtXzG/zsQfbCXENdspkj32hdwyJCDv/DgiOzRP7VC2qGABZ16+94HhB+tVjov0HMCQhSR
 agai3udgs62VBqh7vs63Wj35O4xaR7DoOZx2QGBW1avOkC4A1Ople4ZZGdP7+vBSv5UGulXrN7Q
 anAXuTfw0aVv4EVMsuoe3dHcpk9DniTrDOU8pzWTS2m2pAjFhTPlPE7JY4sf6tRmbDIQBWQ19BI
 rZUgPmekm+RnG/yPaDtJC2LWPiDXN6k1GLwGlMbH9SRnbDN0rI4DKHYpluW2AhUkuYxl2z16pH3
 VdLGFKAoKEUcDTvLc6kmFQ0W9Q/rHb/kX3huCpOeTKY51w3jk9fCFPAJQctiF4NiXpIuM5E4t26
 wFgVFwu534Ar62maktLH6xlf3R9NgqOuDBROBPUemhS2K/TRR5dAAt9f9s7Yzmls6nSWI/KFOai
 Px3wQoW+8
X-Received: by 2002:a17:907:3d87:b0:c42:73df:933d with SMTP id
 a640c23a62f3a-c4ca7a9efedmr412603266b.29.1793440568303; 
 Sat, 31 Oct 2026 02:56:08 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4cabc190d0sm161619566b.11.2026.10.31.02.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 02:56:07 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 10:56:07 +0100
Message-Id: <20261031095607.462527-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libunwind: fix build in Thumb-1 mode
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When building for a Thumb-1 configuration (BR2_ARM_INSTRUCTIONS_THUMB,
e.g. ARMv5/ARMv6), libunwind fails to build:

  /tmp/ccX8Ttef.s:58: Error: lo register required -- `ldmia r2,{r4-r12,lr}'
  make[3]: *** [Makefile:4829: arm/Gresume.lo] Error 1

arm_local_resume() restores the registers with an inline
"ldmia %0, {r4-r12, lr}", but Thumb-1 ldmia can only load r0-r7.

Add a patch, sent upstream, that compiles arm_local_resume() in ARM
mode on Thumb-1 with __attribute__((target("arm"))). All Thumb-1
capable cores also support the ARM instruction set, and the function
is only reached through the resume function pointer, so interworking
is handled by the indirect call.

This issue has been present since commit 79310d3275 ("arch/arm: add
support for thumb(1) mode"), which made Thumb-1 builds possible while
libunwind 1.1 already used this ldmia. It therefore affects 2013.08 and
later, including all maintained branches.

Fixes:
https://autobuild.buildroot.org/results/2d5de71842f86b18e14094f3aeb95c3e849c3a21

Fixes: 79310d327586619866a672fbaecc5682a33a0937 ("arch/arm: add support for thumb(1) mode")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ..._local_resume-in-ARM-mode-on-Thumb-1.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/libunwind/0001-arm-build-arm_local_resume-in-ARM-mode-on-Thumb-1.patch

diff --git a/package/libunwind/0001-arm-build-arm_local_resume-in-ARM-mode-on-Thumb-1.patch b/package/libunwind/0001-arm-build-arm_local_resume-in-ARM-mode-on-Thumb-1.patch
new file mode 100644
index 0000000000..88b906ead6
--- /dev/null
+++ b/package/libunwind/0001-arm-build-arm_local_resume-in-ARM-mode-on-Thumb-1.patch
@@ -0,0 +1,43 @@
+From a504993e059c6225e923488e2dbbc4112c277a28 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Sat, 31 Oct 2026 08:55:20 +0100
+Subject: [PATCH] arm: build arm_local_resume() in ARM mode on Thumb-1
+
+When libunwind is built for Thumb-1 (e.g. -march=armv5te -mthumb),
+assembling arm_local_resume() fails:
+
+  Error: lo register required -- `ldmia r3,{r4-r12,lr}'
+
+Thumb-1 ldmia can only load r0-r7, so the register restore sequence
+cannot be encoded. Every Thumb-1 capable core also supports the ARM
+instruction set, so compile this function in ARM mode with
+__attribute__((target("arm"))). It is only reached through the
+resume function pointer, so interworking is handled by the
+indirect call. Thumb-2 builds are not affected.
+
+Upstream: https://github.com/libunwind/libunwind/pull/1079
+Assisted-by: Claude:claude-opus-5-5
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/arm/Gresume.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/arm/Gresume.c b/src/arm/Gresume.c
+index ed284e7..d3b3875 100644
+--- a/src/arm/Gresume.c
++++ b/src/arm/Gresume.c
+@@ -29,6 +29,11 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
+ 
+ #ifndef UNW_REMOTE_ONLY
+ 
++/* Thumb-1 ldmia can only load the low registers, so build the resume
++   code in ARM mode.  */
++#if defined(__thumb__) && !defined(__thumb2__)
++__attribute__((target("arm")))
++#endif
+ HIDDEN inline int
+ arm_local_resume (unw_addr_space_t as, unw_cursor_t *cursor, void *arg)
+ {
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
