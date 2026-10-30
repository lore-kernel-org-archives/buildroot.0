Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5CA606A321
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=R5vfcbfK
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 222FC40E4E;
	Fri, 30 Oct 2026 15:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glALHvi_G0DQ; Fri, 30 Oct 2026 15:31:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1C56D40E41
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374275;
	b=XVH2XU3PSOOe89CMOgsAB1XrU+t5mIVYFfznH8le9O/YPcX5nIYf7M2O7fVbWLe59wTM
	 gKHId7v5rdtvNNaUYnX3o/KvrRG/2qkG9vNtgxtjKnbq41sg8SBCrDpmXHBSQvtZ1oU7M
	 nVT97dS3doSrzP+rqLo5ZDAuP7J+21udzi77szd5PFzxnINLkhvAtTFQDPMebCj0wkFJi
	 jeTYT/jUPcEX8yFqgpDhovyRlXcX2m/1sF7PdI2i0glvv7UDrln5hmOSiseINZNRlaN5S
	 ixzqbMp9/5zboUcnBwY8N6ShpxuTySUQwrn2rQnlI8Sqvu7OIfv1nWur8NXYqiL0t/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374275;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EbJXOXNUTYOAo36WDo2q8qbtWsrt9UVTGNUY45LcRto=;
	b=r6URSpCmOMNK+rR6vx115rTyly1lCH2ZmD8hqJ4InaagaDzwa72gjRMbRBcDDt8guFd1
	 8Rj/SFT6NeXABGQdvoAq3t923o10QL5YTjlQrHoJ3fOXz3gHq95/5FfZIDg5sI36bstKS
	 b1OgCHqb6+u7PApyy+S5BwJPvDdScx5hx4Fb98U7Ak5p1xn33SDBmrxEMKrPukhteA5O8
	 FyFDMkaTG+WSLFshjH9s5tCFU4It7HmBiM9hpJtXKKevuehyostoALjVy50/3ckXDKpje
	 ajfK3Ka6B+BFOHuAixAGNAl08waf+iZDw4JFwgNmLliQdx2wMBXk5RiKyhU4lEADZTA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374275;
	bh=EbJXOXNUTYOAo36WDo2q8qbtWsrt9UVTGNUY45LcRto=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=R5vfcbfKxLvQO6fPnuhF9tijsyTMwCSRHrtfuVgsettGGj4nEcpetCmqYHACh1SHg
	 lGjjg0Wf/pdxbRLv0X8f5ZZQUno8VhnJRr9DF/n/Gkmu698nyE0tdngLjHnuB0vgXo
	 3P5e/Ukk8Tvq6W6oPEGqG+3bab9qS2LrNCz9plwvyaa2+E5P0q7aXXyt0sTY3HBBZY
	 AZw7FJbgfTyMbBlWxkgi0bYWar3wraXcaBhjLWE4vnBXfvVxi6jOgiuyyTCV9RfEYK
	 OtNDC9g4Pa0DO6njJwFulgwHxpYCPtWOnTpXx/i1F6tYVCM1/JOR1FAVNAyf1oysCV
	 NIY0nusvGZPsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C56D40E41;
	Fri, 30 Oct 2026 15:31:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ABE5D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E45B440E7D
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44fctbPTphwj for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AEA8440E95
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374196;
 b=YeitPxZJuIh1u8I5RapZHRDACkEo8OM4MPGbtDtzZmhht9IW7XzdoATKTMR7ZHhOEaic
 c435g876MuYV9QKdfnOxop4Yj43BsnGXDZK7b+91Tu9PZxf7K7LziUDdM9+y1SCXy8myy
 vxM/L824hq4PraOs/GNQvMuMsBdbJCX1j3COEPjQIyK7ljNrgplAlIvLKLmjC6NrLKKf4
 RtKbpHiAUlBGamhBR6Io/90DOFbmQsoHEmkymX+1T4lwuIPxu1DFIRQqXalCat401yZ3y
 WU+moYcTJhZMKWIP2mKpQ7E5cvU3z85pbbZxko66Ik9R1l0MQ0JzvPlwOvh+Yd+n8CA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374196;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=pGzqBHmP0ApX4QtrwN8qkYrZQp5ahqWWdFI/CcucU/g=;
 b=hu36YN0vFxAOAqV43AGDfKsX0kAgKSwDYA7jZ3i0amU0V8OrLnqs3SUpKTramWq//NmH
 X+8U3v8UamxturR91LSccjanhTM2hD0nzhJzgWYsgUyBWZslOsq/wNWMPUrTCU9UqLeN5
 mawOmNlAeF0vfvTV71JMQQHHJnU01FNjYr+anzvsxjm93k4o+kTOttP5DU//nlP+86H3h
 GTzYNVU8deuE8RMOZLoQORlkuhAKwFnLXW5V/BQq7657nLA265wJbPn41lIWE1ff+Rfdi
 BwZOZdW68V6g6u6A/51YAlpfNhC+bvQdp1M5aZ+2139pPRLfC2xcw59DbFLAS0yAZpA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=h6hcPg0Y; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AEA8440E95
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a59100fa83so7601615e9.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374193; x=1793978993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pGzqBHmP0ApX4QtrwN8qkYrZQp5ahqWWdFI/CcucU/g=;
 b=bw50OwdOjDazk/eaGi8IaTdKm1pK41fzINt8bJTpXXhY3BxPK/eG8kd0SIwN6REJXC
 m+ivlS5BdgylVwLRloP7qmF3Jgpbkt2j2/3MEWSRCNpxHiMzep77yExgDnvZtbc+pDEs
 h83cQBPvVsD24bTNOFswzDbPfx/r15ZRjt6ReABz7J5/NRRCu6trYl0APn3FeF7aiNKf
 wNI6HUC9aXRSYlVj4Xvmj3iNpUSSjH8r2z8fDMVp0PkAZb4SdgDbASrF0OIO0FGDoWXZ
 Q9QiKmPGHxNZPQrDaCLlWUmpTw/r02SeVa76sfX3GgnNaUFEXubW7arziq3tKSRMugZb
 S5dg==
X-Gm-Message-State: AFq9FYKyR8D3elQRvcVsgf1d//FOqZcxEwG57Jw/Cx4Mm3nlD6+aqYHO
 rcxJ5iLnSe7cULcldq++9sg+DWJPYgi1NFI0pMgufwP0e/Bw8jn7lC3O9m7QYjxXngQ8ZIVCVZd
 v1T7qDFM=
X-Gm-Gg: AYBFou2FDGU1lZNqa7pcg/LqPBChQJB5WOjR6CqEkBhCFjZnAAEpR1AR8h6Dz/e+dtf
 LfYJBSVfGHVyFBIpW02i9bnl/cc71y7+pwawfc2owm0gDMtxFnznfl2ESzP9Cc4bXurQZ1H8fuY
 HqmgRxXffKougs9ZMtu5TAu1U6//kAReBakdqtOGU2a8IAFFnVznITW/HudsOJzicsGUUyj9+Hq
 giv+w5IRsz/8jy4uBcI6Hi2vKADcL3uAPEfEB3RAh9nVAHsURkDi6wsQldGyuJMeOnVdecDE3BD
 rdENT0/IJ57wpYeh9aJHydhNTK3b4QLr75Hgrhx7+oKQrqrgwJw7PoNyPJ0h1Amcxf+xUiWHUe0
 Hosg1OPN8tF6XiO+mTd71nDSrUzQlVUBRAEqCwKlkvSlyOm61Xj5qJSIXTYvYf/r2Mcp7u1iIas
 Yw8AlI3oCiC9G1RgH3lGPC9lBUCO7WVQ/ae1gp/3A6Qkyh7QByFed8AYIDzZIagESDLgneKOV5p
 4indDC4zPUhRjniYHAOjVnNBqCgcreaDygv7b+LCFnPeyhHlLfjP0XmgFRjdHfwh0y2a1CXlBv7
 nMX0NqwwGbtIHObyYzksSqRKzjGdVuURK9WHUtBAPXF9b/2YazMwbyuoJkk2AjNmGfIXuGxbhw=
 =
X-Received: by 2002:a05:600c:4ece:b0:4a2:40:8d2c with SMTP id
 5b1f17b1804b1-4ac17b2c396mr57474215e9.26.1793374193143; 
 Fri, 30 Oct 2026 08:29:53 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa8213ead6sm142504885e9.14.2026.10.30.08.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:52 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:50 +0100
Message-ID: <20261030152952.1908157-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024215009.1004860-2-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/openssh: fix build on MIPS
 before R6 at -O0
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
> openssh fails to build on MIPS64 (n32/n64 ABI) before R6 with
> BR2_OPTIMIZE_0:
> 
>   during RTL pass: zero_call_used_regs
>   channels.c: In function 'channel_set_xtype':
>   channels.c:437:1: internal compiler error: in int_mode_for_mode, at stor-layout.cc:408
> 
> Since version 9.6p1, openssh builds with -fzero-call-used-regs=used if
> the compiler supports it. On MIPS before R6, gcc rejects this option or
> ICEs on functions using the hi/lo registers (gcc bug 104820). The
> configure check usually catches this, but at -O0 its test program
> builds fine with n32/n64, so the option ends up being used.
> 
> Disable -fzero-call-used-regs on MIPS before R6, through the configure
> cache variable already used for powerpc64le. This doesn't lose anything,
> as the option is never usable there.
> 
> This issue has been present since commit 3c047ea463e2
> ("package/openssh: security bump to version 9.6p1"), which switched
> from -fzero-call-used-regs=all (always rejected by the configure check
> on MIPS before R6) to -fzero-call-used-regs=used. It therefore affects
> 2024.02 and later, including all maintained branches. The cache
> variable only exists since openssh 10.1, so for branches with an older
> openssh, --without-hardening would be needed instead.
> 
> Fixes:
> https://autobuild.buildroot.org/results/68d260341341afb0dfb7244f641f5196df3649a8
> 
> Fixes: 3c047ea463e27ceaafde76d64406862c3322daa0 ("package/openssh: security bump to version 9.6p1")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/openssh/openssh.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 6808db9962..a0cd3168e0 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -36,7 +36,9 @@ define OPENSSH_PERMISSIONS
>  	/var/empty d 755 root root - - - - -
>  endef
>  
> -ifeq ($(BR2_powerpc64le),y)
> +# -fzero-call-used-regs=used is not supported on powerpc64le and makes
> +# gcc ICE on MIPS before R6
> +ifneq ($(BR2_powerpc64le)$(BR2_TOOLCHAIN_HAS_GCC_BUG_104820),)
>  OPENSSH_CONF_ENV += ossh_cv_cflag__fzero_call_used_regs_used=no
>  endif
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
