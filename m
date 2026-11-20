Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC35D606A326
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 09:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=T9efNJ2K
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8D7881429;
	Fri, 20 Nov 2026 09:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MylDqbE8CkTA; Fri, 20 Nov 2026 09:59:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CF40E8135D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168781;
	b=Zcb463o0zDye4anOcS9TMBwCsfOLSiIs6rzN/FMu9D/17k4TDF9YZvRFimQGMytCjYcc
	 owy0niFzH8UzUZ0AyXy7QpD0T6g8ddPiTZq/EDXR2eiVFczfxwHz2LPMXAwPXqYydpYTt
	 huII0zEXgHD11CRy641tCd7eWD+df+b4QfVAMmgr8WmZQA7MJlLTLm3dqiHFCkL5q3sAG
	 vKBkSMK19X0ax4rr0KHInAZNrscwWwjeqBO1DlBRMLCXeDrzXIZlVwh+EPKQhlUhwUwdr
	 CACOnbtzKL18R1pOz0lYQDzJpv1o2HqEXhP9L2GCErJ0Jnqvs4Pc1deN42OvostTczw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168781;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qD8IxC8AeiDk4IHF6IYwDRIHfMl4sf+0Iy3DUVybSJQ=;
	b=cuLfRswTKCebKdaVqQ7VBU7j+R41uHMDQ0VwIwQ+6gHAW6PpxkUhEYfoWslKLq3Tfg04
	 D+c6QtnmdAc4XDCBFwXYJVANDY6Imjqe6nSJkV47+Q1xqc5yfiiyEjPYoKSoScjgzGhHg
	 0IaaOEWs3Y9nk01gPXvY5k6+vpSX/wQKWa33ZC0XIA71HC2um6XQDVqBW0JxnIVjS6Jrw
	 9q69xiuM9iDO9II6njzJQklHMj850HDW446nWuMZNh1it+LYqyk6yYkW3PbFKklFw+C0j
	 y3v7T48GLg8OLFBJ49VmosnNDPHO7Y2aOCITgPrYmtlV3USt8BpVYCE8upRBDT7jsjQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168781;
	bh=qD8IxC8AeiDk4IHF6IYwDRIHfMl4sf+0Iy3DUVybSJQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T9efNJ2Kx8fjRXpsGDeiFPPHwEqcvtrUcSQh8kQfXESlF0kNk18dJ33Ng4Ppiv1FM
	 MWJUkIW5nctV7FwqNg1w/UnUKzXgt7ffA6OMqgurhf4AK52iLr/XoogwE9K2xlxyt6
	 D1r1Jsp8jVh1ZHN7gwiGYgc8s3EvQ3aJ74S8ZqnU5vo3iFyBEc4MW4IT+p4vrkVLI/
	 UgV+xul4jhLDw+4Dl4DeSXEbYoGtWxv475PSNuXenaai6xLHc6kBGbghv7gqJJCQus
	 s5CqXxXTP2+oqr30EEl2ns6Nd+G19SRb8ncnLJ/BJEjgfVWATZv/hC2+3ATF6fN6/G
	 CccqwpQXKB3xA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF40E8135D;
	Fri, 20 Nov 2026 09:59:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AAAA169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C89F4020D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GinL07oZ3VFK for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 09:59:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D8C3D4016D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8C3D4016D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:39 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4bb6adaf0f1so5726425e9.0
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:59:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168778; x=1795773578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AzTyNp5kg1JGQqINEP+gqw28dQkKpwCyuZ2speQDuEw=;
 b=yKKrW54fqOWWLL+OQUMeLQ3fcagMFxp/0LgW+Ys0NEKI7cni+kIGKCt/6QZ/9dWotG
 HvujYV4RF6Fg0ncWuVWetdFMyvlVXX7t12zeZpufc/oIPUEPaZayP+9yDm6Qn60aa/Du
 Qa2EzhQoCQuUqGiqLzUxUn8gMZNHLrXkr1RFxLmQm0Oajian2in8szCi1+6RbJuwihAq
 7CzLKy7kI84GC7k+exqCwMdNkQ6FwhMzGMnCJlipI83enCSDb3um68zEfMI40JJrcX1S
 7qjGG56t/h7RcwNY7JWIZpa0N0BcjLReVYdCwR9Qip24WapCwdl2Ocb65yTsNIQyKP9Z
 uWfQ==
X-Gm-Message-State: APuU4Z8qy2VePueNrSBEmZ9GFnGecXut82wkEP1Dpn2RBboZbsZtppb1
 8v3TpCSe3XLLpFq60kTEwRoD8JQJHO5+tsnrC8oP8REknHJp9vZW+BAKjTshsM6ms5EiZ5uareV
 nz8UUr4ZHIg==
X-Gm-Gg: AYBFou3tHVLKdkb6FLQomKSXhm56rNGCEm55lTXTVBzTcQ0QJPDfQd1vehQWWd7HndH
 QIIHdB3bg/sxqtLIu8OKFAQRFJP1c/zDA5ZJf860rRria0PNzTNcILxdw4+yU+mi3LBFhygoIFS
 67e5CupsPee1BRgXFR18D3grpCAyzxT6HauUUVvOhiSn8bOSVqT7KGrySf939zlSRAb7hFB+qi/
 1dos3jtbkyYDEmnlS+NHrspKAP9oeSvr4gOfdWGTGbqnsHzRruP6adHdo2Q59QGp04SUQ+ydHVX
 9+q7uP+pS6wmN3QEuJ1RdeyUcjCDcWQlWAupvySJDXgUL8cAogIqr6SSnGqmxfcd/ymks4wh38s
 5wtEewOF05IfTrss8xUAoMCSbKN3XaransH6hzmmxLAtcqY6Wx9vu0IB7JpL41W9UQrUQ8MYHOf
 EvIjxRI9KbZ7RJ/I17Jm3sZkeUKtTJa9aM2lBBcx30GlrXWcUlI+mjEDuBUR3gDhmnZyxoZOKQL
 S1qMxR92f61YgrrRusfAL/5dw+8wPGWbVtokbXSrLp76vSvhgppdBAltadoP75Ry4LnygqxktmW
 VFpwTi3nuSgocQI05BYPMvG2kpEvPCCM6nuj/l3ViyTm
X-Received: by 2002:a05:600c:a05:b0:4bb:5e6b:49e with SMTP id
 5b1f17b1804b1-4bb88807c0fmr53426185e9.6.1795168777910; 
 Fri, 20 Nov 2026 01:59:37 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4abbd84e661sm3591878f8f.18.2026.11.20.01.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 01:59:37 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 10:59:33 +0100
Message-ID: <20261120095936.540255-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112144541.3663027-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/cairo: work around gcc bug 125410
 on hppa
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT,
	WEIRD_PORT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> GCC 16 uses LRA by default on hppa, and crashes while compiling
> cairo-pattern.c:
> 
> ../src/cairo-pattern.c: In function 'cairo_mesh_pattern_end_patch':
> ../src/cairo-pattern.c:1417:1: error: unrecognizable insn:
> (insn 325 0 0 (set (reg/f:SI 381)
>         (mem/f/c:SI (plus:SI (reg/f:SI 89 sfp)
>                 (const_int -184 [0xffffffffffffff48])) [25 p[0][0]+0 S4 A64])) -1
>      (nil))
> during RTL pass: reload
> ../src/cairo-pattern.c:1417:1: internal compiler error: in extract_insn, at recog.cc:2892
> 
> This is GCC bug 125410 [1], reported upstream with a test case reduced
> from this very cairo function, and still open. GCC 15 is not affected,
> and with GCC 16 both the test case and cairo build when passing
> -mno-lra, as reported in [2].
> 
> Add BR2_TOOLCHAIN_HAS_GCC_BUG_125410 for hppa with GCC >= 16, and pass
> -mno-lra to cairo in that case, so that the old reload pass is used.
> 
> This issue has been present since commit 1b290781cf37 ("package/gcc:
> add version 16.1.0"), which made GCC 16 available. It therefore
> affects 2026.08 and later, including the 2026.08.x maintenance
> branch.
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=125410
> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=125410#c2
> 
> Fixes:
> https://autobuild.buildroot.org/results/f76b8f361d01eef892ad21722b099ba8bacfcc57
> https://autobuild.buildroot.org/results/a5ee815bd49784cc522e76e49a2a021a151a9e57
> https://autobuild.buildroot.org/results/54bbea14bef321c193d9b6450b253edf832c6b8d
> 
> Fixes: 1b290781cf3782576091dbeacdd7d1a30b051856 ("package/gcc: add version 16.1.0")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2026.08.x. Thanks

> ---
>  package/cairo/cairo.mk | 5 +++++
>  toolchain/Config.in    | 9 +++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
> index 26c2555f9d..0c354c7414 100644
> --- a/package/cairo/cairo.mk
> +++ b/package/cairo/cairo.mk
> @@ -24,6 +24,11 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
>  CAIRO_CFLAGS += -DCAIRO_NO_MUTEX=1
>  endif
>  
> +# Use the old reload pass instead of LRA to work around an ICE
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_125410),y)
> +CAIRO_CFLAGS += -mno-lra
> +endif
> +
>  # cairo can use C++11 atomics when available, so we need to link with
>  # libatomic for the architectures who need libatomic.
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 5f4c5f5fb7..3f5d9760b9 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -249,6 +249,15 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_111001
>  		   BR2_OPTIMIZE_2 || \
>  		   BR2_OPTIMIZE_3
>  
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=125410
> +# ICE: on hppa: in extract_insn, at recog.cc:2892 during RTL pass:
> +# reload, with LRA, which is the default since gcc 16.
> +# This bug exists in gcc = 16.1.0 and gcc = 16.2.0
> +config BR2_TOOLCHAIN_HAS_GCC_BUG_125410
> +	bool
> +	default y if BR2_hppa
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_16
> +
>  config BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	bool
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
