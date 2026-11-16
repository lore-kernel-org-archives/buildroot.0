Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9823606A322
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e3X01JBs
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A54C96081B;
	Mon, 16 Nov 2026 15:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGqkRkv0_quE; Mon, 16 Nov 2026 15:40:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A7C0F6081F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843621;
	b=lC5Y94LD1gl6Wv1ZJIy8eiLpUxmspiOtLMCeDucAAgFLLspglbdpgrV063OCJT40H0LN
	 vvYWLtDlGazgO1BJAccMdXSibr+YqtIjnjytp3D+94k2rk83N4k/9O4l9Wu+wbFgHp3dc
	 iQA2n4njVVW9e+d2S9YQ1PSHZXCF6b7nImqo9o111Cus8QG8tXkuMMYwuZ2QBQecCVd8q
	 WxFGo4lmkgpzmNeuoRNo2ql18WpgAI9Y1kL7pwSNdZQF7MfivY1AwnRzZGQm2C0BcD4kp
	 +cp+ecr5GYgrB9UE+VaeG2sq5+ZftVxWKFC0UaKvqb/oTwooxjHFb5RT0ehndrpCX1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843621;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Jb3BaoBlzJVGNbcKfsJbzekfUwQnsiUEKlFIAYAvApI=;
	b=fARa0DtNsNH5GLiOijiVaQsL44YQrrkdaGuATCtWuLrHiZn5I8jbYY7QEECZ5fUaX3CL
	 gdDbkhqGahVy4T/YAFnaSLzuJwkSDpmhtQ32TsqDDqA09qoPpZZwx3aC6qNHwmCk45SWs
	 hRCqXFCNS3OzJW/+xNp+2JOE10WWRNZ5qHrDv2giD9Zgi19rwlgYHVoHArtJtUlfjLC7R
	 jfXD5OTNw/yNDUxMlValS5WAlk2v3IUmn4+oW7+O5M2/XLA2hwEWdRRkfLqIbUCbT6TOS
	 7Gn+gZ4pqVXYWm2/yypuj7JEE4EeP3KDH/hCe/Gop+vORzVJ3DKrR1qCdMXbOG7obEg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843621;
	bh=Jb3BaoBlzJVGNbcKfsJbzekfUwQnsiUEKlFIAYAvApI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e3X01JBsHsbgSDil7TdTpc3FAx9OB7NjR8ZdsdSgoBU8EFt7AwyJ32Vi6Kweyewj9
	 ani6vb4naRlTBYPYAlsGRUzi4kA1ffBbF/ExQMU6abzC4VDTt13HXuh7Z5zwW8lf7J
	 TZoKQogcb2p5KTOwyjpXWKdxCSRo6pNpQcGoRAZL5cj/XO/jJfT3hxuiQVemBHAE1H
	 efQQBSce5adN28ZcJKA/lvEZfDOO3trq8qAoZAuVAx5FsybB84Owzqd5f/7SPtezWJ
	 eGOe1LLcFpMgCl6Ki+3yk4YmnAKx9t/wzLTGCKc7HnD/QGpjwDNO7+AeLF0hBjEao+
	 rQIe0xsfGDziw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7C0F6081F;
	Mon, 16 Nov 2026 15:40:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C1062FE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 725A24009E
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3bP9oebU0uB for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:40:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A62C740282
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A62C740282
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:17 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so36291705e9.3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:40:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843615; x=1795448415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=K+PiLB3vL2MBOhqYFiG1ufL2ngm2kT8gn190co7UldE=;
 b=Pp02650NOmYRiAneFEyl34k6QSQBGTZck3zNVDNlLBNKj0e7OlCvPacFNk492NcUoZ
 PiCyvKlP8ncnBPFIyqbuZY5XtMELTkndEVmZft9ndi7CTYqVKP+dnFDm4+W57mJQ9SyP
 VOTm5DIeN+JZKVz1M+ZIutIrCSSAKa0KPBz1LnZJvJUka1ZbsKHcWHRRzuyG/+9D2xRQ
 dK9uAmkNWdnBQpJDQ697/3WgB+EG56bCOS1glLe7g9T0LPDisTeU7t0Trt28ejuaXJvM
 H7DBeK7GBFaJ6/jwBcKc5E/1tSCA+qcESXsOqqgLozBYkHlItitjYpiuSxWXceEPQ751
 9lRQ==
X-Gm-Message-State: APuU4Z9McKrcipgTJYtpqtT7805FfbMGG5uGUd10UbfI5VmxZwv2HeYz
 LsuDDWdBj1GTVy8VZriunOdUELiZPoGxAI4YUsbUOMvyrv9A0cO2d87Anh9ac/KsAu9deozEI1L
 QAGKBKIc=
X-Gm-Gg: AYBFou0gYloUeUT3bHYndxtX4e/yayVc88b/PgyPJHEQR22uxWhCj5ep7Ro1/xHC+rp
 ugukrVzGxQz62SJozdeMjdw4li2bQIAGJrLcvmoDdH2N14i42zv2r02SR5JOG3jIyyS1Ba/cpSj
 cTUraQSk0Z8vws7Ns7aB8psWfo2+kYOFvfn2GArc17xXwzf/SL0+LS4hV5855Dt8wxzrWnsnD0V
 vBbK++iq+tCp58nmEzzF7zrcgJvbTCPozRMemffv6hlMRuXs8OwMBFsY4C2e0f2YJxFQb2GeNVk
 Ete3um+fJ2bS4WpGica4nXYz9X7t6X4SGsFKIrZ5x0q81M5foA6wtbkJDXitX0ChccL6SsF3Rkd
 HaxcnTVa9E+IXeXRC+htCHoTZJxDGCQz3HAoC290jL/wsEKu8gk+oNaxIhfEQw8lALdaa5OvvST
 dNV81I7ajkWtkXIZ4H6zHMvy3oCQndTIlF7ryAUd513pvLPksWXb3zrEjAsQQ1eWbADRrMcIpi5
 +sJXTiOb99AtoYmrotL04Uh/S4BIK/kOCY2LHVCpWkCMC4j7Gx3xNhgXycVcUbpzCfKnjx1wgtD
 P/efLyZwsNYqF9IR/uUGrPVixegYu1rmFshZ3LSDQkoXRrSqBcLy
X-Received: by 2002:a05:600c:81c9:b0:4a1:83f0:7c91 with SMTP id
 5b1f17b1804b1-4bb55a65b31mr222989155e9.18.1794843615543; 
 Mon, 16 Nov 2026 07:40:15 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb56f97257sm192821535e9.4.2026.11.16.07.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:40:14 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:40:12 +0100
Message-ID: <20261116154013.725841-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105072853.30950-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/openssh: fix build with
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Since OpenSSH 9.6p1, configure enables -fzero-call-used-regs=used with
> GCC when the compiler accepts it. On ARM cores that only support
> Thumb-1 (e.g. ARM926EJ-S) built in Thumb mode, GCC accepts the flag,
> but fails on some functions:
> 
> xcrypt.c: In function 'shadow_pw':
> xcrypt.c:156:1: sorry, unimplemented: argument 'used' is not supported for '-fzero-call-used-regs' on this target
> 
> The ARM backend relies on GCC's generic register zeroing, which loads
> zero into each register to clear. Thumb-1 cannot move an immediate
> into a high register (ip, lr), so it falls back to copying from an
> already zeroed low register. In functions where the only call-used
> registers to clear are high registers, there is none to copy from and
> GCC gives up. -fzero-call-used-regs=all, ARM mode and Thumb-2 all
> work.
> 
> Disable the flag on Thumb-1 by presetting the configure cache
> variable, as already done for powerpc64le and MIPS before R6.
> 
> This issue has been present since commit 3c047ea463e2 ("package/openssh:
> security bump to version 9.6p1"), as OpenSSH 9.6p1 switched GCC builds
> from -fzero-call-used-regs=all to -fzero-call-used-regs=used. It
> therefore affects 2024.02 and later, including 2025.02.x.
> 
> Fixes:
> https://autobuild.buildroot.org/results/6b064db6d713a6fef7f202c37daf041055e647ef
> 
> Fixes: 3c047ea463e27ceaafde76d64406862c3322daa0 ("package/openssh: security bump to version 9.6p1")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/openssh/openssh.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index a0cd3168e0..27cd5fb169 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -36,9 +36,9 @@ define OPENSSH_PERMISSIONS
>  	/var/empty d 755 root root - - - - -
>  endef
>  
> -# -fzero-call-used-regs=used is not supported on powerpc64le and makes
> -# gcc ICE on MIPS before R6
> -ifneq ($(BR2_powerpc64le)$(BR2_TOOLCHAIN_HAS_GCC_BUG_104820),)
> +# -fzero-call-used-regs=used is not supported on powerpc64le and ARM
> +# Thumb-1, and makes gcc ICE on MIPS before R6
> +ifneq ($(BR2_powerpc64le)$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_GCC_BUG_104820),)
>  OPENSSH_CONF_ENV += ossh_cv_cflag__fzero_call_used_regs_used=no
>  endif
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
