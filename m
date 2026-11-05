Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01229606A33B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 11:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WuC3EX50
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2A6B4086D;
	Thu,  5 Nov 2026 11:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ck_mRq_svAUd; Thu,  5 Nov 2026 11:57:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DCF144085A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793879823;
	b=B15sgN8zgaXAMDESttHS1p19PxWMRi2y15HWzsOojwxB0g3K4VTq6EdHHVzzEU7jOr9X
	 NXkVDUL9/FDa3YjrFL44EdJXHBJ/I6NZp4wiE4mPvebejX0SBpskwcz1G5NtKOPRGSmBs
	 +q2AxVc7IBveNxrgWkIjuqjkWr15pqMwNrLswFZWa7yyK+tK753/6gaRtSJ7KitCCh6Nw
	 OpjcxAeeC/nugU8q2lsj0MQ3+qxLeCddCmUm0/ekIBkP7VBShZ4Q2x8xGcPuJe51jVfiW
	 jHD8vMOO1f3/rvCDWKqam8Dc4IqfRH5OvX6L+h+CoundSksYrUXp4v+sYT0LrmjCzHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793879823;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=R0Ry028wK/uzkBIeCaRdXjfiIwwfZ6wCbhYGJkrsUyg=;
	b=QHbcS/4JWlMCCHgcRDX73YNDHo95Qe4gqwZQyiszUtDKs/9rjDPyNfHW0S6ZeLTR1+kQ
	 UT79ByAhOWRaigiZz3Kl+s4uotXy8LbrgGjbCCdZQTCv5nt/7vhd8Daz1QfDjoyyNp9kH
	 4NefFXvkXJ62W1igatQxnWH04BjZF08G9RCQwoDA27o4P4vRyyXl6TUjvfYSOTV315B9s
	 VRqmbDh4jCyewVOhEwBYMoKg//Ko2WFnK6QA6yoKBMVRaYwSCqlfZmM1LK140zNwik8WN
	 P5m3dIjt04tPaeLl+kt0TvaWEs/Y9fuQylsnZbQV8gFVFOdIzf3fKEFLUGc+5EsHicg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793879823;
	bh=R0Ry028wK/uzkBIeCaRdXjfiIwwfZ6wCbhYGJkrsUyg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=WuC3EX50cX+6hqEAvUk1Vs0isqaw4o0OOAWKzaFT4Btq14gXklCifL4FPgChY3DMa
	 4sILVzZV0EJaRvhdbFL+m3FGZOCyn+M+8kIQAGcuku6oyDImrdxTs2Nw3drTeWsTif
	 Tq3G+qYgy726TiMZYiRXRBOhI2rlhF67Ie+jB3kENsAQlyFnY5cKDZFFtF4fG7lvdH
	 yQ2YxRpnSUTBdAMxoMRbyJQq45DhhZnpHiJyznrH50NqN/CHuxUVzYsnpXqMOvyPGF
	 5P1mksfAbhc8YuFwsPFSSB9nRrndEFoEet8fgw+NQDrUEijcF5Y5t4MqoaE8vEzn8g
	 vaZqHt/NeorAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCF144085A;
	Thu,  5 Nov 2026 11:57:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42434177B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 11:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33FB481138
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 11:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8s-zQjt1mGuO for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 11:57:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 00B8181134
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00B8181134
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 11:57:00 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-c4ceaee6770so263840066b.0
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 03:57:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793879818; x=1794484618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=L+126M1c3W8fnI4zaFKjdMf5ErlWbfwrAnEjXHmHJ7M=;
 b=mN/0GvSMrLgtZ8OPukmdTgoVzJ+3z4ydyM+HMzGZuDWTE+Ci4J7yYROzYs3RN0Ft6q
 l0mZCVOJbTxwmI3u2nvDzvUDH+gelPKayCPAHhs+tr6R8rZ8PwjFBQy8NjJqRrYizIWj
 3mAjo/HYNYrdSfDrWOidfPaLH2pCa/vFNs435etMy1oojg/czlKEaCRJLULVjTmno0ka
 rpDwaPz2kAe4M/d69Ah6aRJtvT0Km/MOu86mHqkGRnTb2x7oX1YgJr4BhepLGymRK1PD
 6yvlOhvIPBpFgeAnKWkyxWKSzNliGGjbkf5B1kUb3twtafrQin2eejZmfqH+2wZHIG+z
 oLUA==
X-Gm-Message-State: APuU4Z9d3F/FXMBmX3GdusWzY0+RmFdlVzBB9SOrEzeFxMSqIOcZ4gMA
 ZrcDKRkns+3kmWlp2EIRTrtw6t1dG5cru9Fp2/IxsZErPRV/lkmfu1WbEh1YHQ==
X-Gm-Gg: AYBFou1E/E9jh9DEt6bajv+RaB/0cSCyLgE8JF3QWxPaLUxoPPNcPctV76HKm8cfbJz
 8JagtnxZ1mBC08GInVhuaq8oaI2oB/3sVlBxVsQI3IpsuTvB2tJ/3IIiYTa7VRC7owUpPF2bUdB
 Pl6Xo7Dl0GqRA2LB6MdzryWWZuNMBEI0XjiJYXPVz/g0RGWXA2uyR97m6tK1+tXhQCJCzESnOiM
 m7+tzAu1be8MkG+o56h7bHz2huU4NkKDm7DCUK1FFNPUTcPq6AtAy6bqOFrRRx43b45xsxCLKWD
 TEUpzWmxQCJAz16UoKye8g2BHtllj9BCIQEbV9CHlRupj8L0jkV7nje+2cPM/uRIxNmRCG3BGCY
 rNZzSwx4nu1ag6SufWrqQWMP+eCnUg5GvLztewhPlj/8P+k2gkZpNQ3a5HJsEf8pFPyMlMuGnDe
 XBP63/DwmnwUWxYJFNWmuGMwpynDZ99FTbhF/aPYOiXGIq2c45nqOp7IePGQqucXyzX7o9OxUKv
 1YZ8AXSE35/iWrUKkVQM0NJ7PggkBZO8eJm3OmM5byYJGUjCJbWS1YcMZwu/IcZimovude0s1zC
 7L7KsQCa15s0NZNeR4Rv0mGVzZo3cbC7npHts7cVra9fLSfAxllXeM4ilyB0FtuOJm4i5bmRx/m
 P+18H9D4X
X-Received: by 2002:a17:907:930d:b0:c2e:4b90:3c56 with SMTP id
 a640c23a62f3a-c4ca7a19969mr1780661666b.13.1793879818297; 
 Thu, 05 Nov 2026 03:56:58 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e4a49fasm162716666b.82.2026.11.05.03.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 03:56:57 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 12:56:57 +0100
Message-Id: <20261105115657.534652-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libbpf: fix arm64 build with kernel
 headers >= 7.3
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With kernel headers 7.3, libbpf fails to build on arm64 with glibc:

  In file included from [...]/sysroot/usr/include/bits/sigcontext.h:30,
                   from [...]/sysroot/usr/include/signal.h:301,
                   from [...]/sysroot/usr/include/sys/param.h:28,
                   from btf.c:13:
  [...]/sysroot/usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?

Linux 7.3 changed arm64's asm/sigcontext.h and asm/ptrace.h to use the
__u128 type from linux/types.h. libbpf bundles its own linux/types.h,
lacking __u128, which shadows the one from the kernel headers as the
build uses -I../include.

Backport the upstream commit adding the __s128 and __u128 typedefs to
the bundled header. It is not part of any release yet.

This issue has been present since commit b216661a73f7
("{toolchain, linux-headers}: add support for 7.3 headers"), which made
7.3 the latest kernel headers version. It only affects master, no
release or maintenance branch has 7.3 headers.

Fixes:
https://autobuild.buildroot.org/results/8de59d8e4eb4772a67248f4dade8676486beed8e

Fixes: b216661a73f7b8e21290a1bc9033e7f9b5fb230e ("{toolchain, linux-headers}: add support for 7.3 headers")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...8-bit-integer-types-to-linux-types.h.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/libbpf/0001-include-add-128-bit-integer-types-to-linux-types.h.patch

diff --git a/package/libbpf/0001-include-add-128-bit-integer-types-to-linux-types.h.patch b/package/libbpf/0001-include-add-128-bit-integer-types-to-linux-types.h.patch
new file mode 100644
index 0000000000..faee034687
--- /dev/null
+++ b/package/libbpf/0001-include-add-128-bit-integer-types-to-linux-types.h.patch
@@ -0,0 +1,36 @@
+From f90a9c487d7542d91fa584b83b6a624a4fbeb341 Mon Sep 17 00:00:00 2001
+From: Daniel Golle <daniel@makrotopia.org>
+Date: Mon, 7 Sep 2026 16:54:26 +0100
+Subject: [PATCH] include: add 128-bit integer types to linux/types.h
+
+Linux 7.3 declares the fpsimd registers in the arm64 sigcontext as
+__u128 instead of __uint128_t, see kernel commit d4bf9e08d412 ("arm64:
+uapi: Use __u128 instead of __uint128_t in UAPI headers"). The private
+linux/types.h in include/ shadows the kernel's linux/types.h while
+building libbpf, so with glibc, whose signal.h pulls in
+asm/sigcontext.h, the build fails with an unknown type name __u128.
+Add the __s128 and __u128 typedefs as the kernel's uapi and tools
+headers define them.
+
+Upstream: https://github.com/libbpf/libbpf/commit/f90a9c487d7542d91fa584b83b6a624a4fbeb341
+Signed-off-by: Daniel Golle <daniel@makrotopia.org>
+---
+ include/linux/types.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/include/linux/types.h b/include/linux/types.h
+index cfb558ac3..3560e9539 100644
+--- a/include/linux/types.h
++++ b/include/linux/types.h
+@@ -12,6 +12,11 @@
+ #include <asm/types.h>
+ #include <asm/posix_types.h>
+ 
++#ifdef __SIZEOF_INT128__
++typedef __signed__ __int128 __s128 __attribute__((aligned(16)));
++typedef unsigned __int128 __u128 __attribute__((aligned(16)));
++#endif
++
+ #define __bitwise__
+ #define __bitwise __bitwise__
+ 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
