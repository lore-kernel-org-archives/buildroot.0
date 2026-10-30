Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52370606A31E
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qlKFWJ+K
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 316A2816FF;
	Fri, 30 Oct 2026 15:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9izME049-AwK; Fri, 30 Oct 2026 15:27:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4280F8168A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374077;
	b=CVnXSJ+nfgC1wbF6H7Y/w4bRm8auI8x/m3hsOiVHHGcANh1oFgBa7nknzcpKEed8qyja
	 jqEluwpPidWTkzwPx1GpwdgtFN29osOA6GdQZe+KiWXP8hzT3BPXjvLwUL/vdvcnMC+XJ
	 3KeDrIkofQ6JGguTega7mHfjAGQ96yxN1x/Qsx1qh+wxNZomlQ18MtBppid++8yOTyBpH
	 Kir5o/ZOIatO5stYGjgma1aKl4xb+no112voz6u4DtvIw5v8Z/oZl5kelJ/QMtHwwxPP/
	 7R3iGnoXOmBNpfjyXuHKcSEku19y7RcFguedGmcn+y3hS/Uxc1T8GZhtJBmycd/aRWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374077;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=m4E/OdurDN9ARKAmJCKQqWnQMHwsc2KMxydLeMH7B/s=;
	b=YakYv85bkY4kkWwTKtozFG70wXPhrsOuiycd9R1m0erQnvLRUkuAImBd9kQMm4bnLX4r
	 onqyD0qNp5Xl/rod7/SN604GXB64c5GjMFMm5PTHFhXNxdBBF4lu8cjIfTI39aTnAniop
	 qgou85uEAURh4Eii9Rtu22QBRiX0e2rPX8fnfT7HQvXp5N4MJGsXos0eGLMb5WAEA3lxa
	 jqcYThMBPs7WOR8yont5kiK49cAmNc6JjaJlp34nyhSNehi5bidjuXbB4Vkl6l6AnzUeY
	 W83ThdS+1tdwEi2uNlon1Ul9shtKHYkEtLX4HfAQ0xwaoQjMwhja80vvyOv49TsN9eA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374077;
	bh=m4E/OdurDN9ARKAmJCKQqWnQMHwsc2KMxydLeMH7B/s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qlKFWJ+KHELsRNGIx/HKQxte5X1HezW6CkQBe+2PNgiFhEQVZDY/O7XKCCX7vvuaO
	 i3C59EY6ztHt4KLEAia1lLr8zEzemspVXOXbiKMgS56AIZrOBIFrIlDPLXwdhm6SoS
	 bSeukH1hdc9lQfsfT+zeSGhiDMJx4w4w0taBZI+bU2EnDGvPZr1qT7S6zRCEQJ5hRh
	 YUtm18RMkV034uaNfUzDKO6RtsXclx4rDKc7Nv5GlLbjI/2MefTE3u5J4otiGWFW0L
	 rdUub2bGQIA5FXkDZfF6LG82mQqkSy2nsHLjOAMDu0IGKxLRK/ik7fLRq8C1voq9pm
	 818jb9Zp1PuwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4280F8168A;
	Fri, 30 Oct 2026 15:27:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99888D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D9E281697
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lByPAhxyE6Qs for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:27:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 019258156E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374049;
 b=S++8sYDVx0N0MS7/qUzN+nsRO/u+8Exf9YDpcAl+rsly+XlbMkKEdlp1dOsEJAPPqqSS
 Jo1jb2LN3gmiGJqetveKcwGDIkwj3tMTNVG4NJtBtrG84a38kSk0yiq0teF3v6+5DfdJI
 N+INJkAObu1mAi/pKWc4BmBTEg5LWsipQYnJSDfVdrYAp3sR48XmZSmSrWeIbi0DwCqFp
 MUoiL0IHYq/BNwoUxRGsGL1EWNUfVice/gKnrVHRoS48HAh2rZJQkcRdf4P8zz6KRqZxu
 WWA0+zj2+sxvlN4Xh0I0frbwRJQgDFZyCG45x0yvmgt4t0tD1HfBjxpGwKRGA4hxjMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374049;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=an6Z+EDex29IM/4R76tJ5p2mdGoxWxXXf0QF2BDWcV4=;
 b=oBajVcfKglDXQ5VgzmK+1QPl47rfY8BKj4bId7Q9/YhsmzyjtKIilX/fANjS6VC5ybtb
 Do9MvG+r7bQ3gryZVbBHMrZ/wOlKVYXnUdiIlXrEcxYTEF9whw/PIj1Thtws8u7KcgIOU
 NdiIiQVvN4gWpCPx4ECsApLQ+mMpejBZBwbBryUd6+tkM8erGIxcQeZnm2Z6SWpyWl5uk
 jnn0AYl6mS4jHwUm5vTq4wQWkZiAXn3PMa3NwHWOscD9BBYrpT9p0kCorXl0HSbI9Qcqr
 NGU2k2/ZjHyR608Y/noNy0S4yIBVjhlrtufQWdX21LVAfXOFkb5RU0pnXwdCY95uRNQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bXgnZaS0; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 019258156E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:28 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a7992e2f7dso8862965e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374046; x=1793978846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=an6Z+EDex29IM/4R76tJ5p2mdGoxWxXXf0QF2BDWcV4=;
 b=Ea/0wNE20K/lV1VcGvWAzw+JuODionckyEXvthRXwGEoMixATTdCt+H5kwcGHmNb1S
 ljs1wd7a4dp+tEfBMM3jXmEDdESQKPhpXoRlCPdXR7zY58i0YUPPEyr8At4nzF1YH6ik
 hOqoryVXiSftyoM3T/YVsae/MxAm258liKbYKYo5U2JmlQvTEr8djMOnBIej3MEsjf6T
 d8D26yIDUdr806X9DO/Vyp2BIPfXhLJBFu4goAQJI5KqlBhXs3UCwFHBqSKtUPMhKg4u
 Z83nJ1nbIkv9ePPEKZjiN6Np5cRBxkIVO2w7YKwafZ5+iy1b6bSi9teDBftYN1Hp4vL3
 yE6w==
X-Gm-Message-State: AFq9FYKsY/IuixNbZ2AOyTY6pYXa2rCEOZp2WpKZpAHOSioQjvjbgOHC
 BX3zomjoZl0MBTXfVn6FxwhD9MFFkt5yzYkU0nixguwPdhdsh+OIwztQ9hrY2HKZwbPzhdL9bbG
 mo/AL5WI=
X-Gm-Gg: AYBFou0viYRBFaXmePKgjnEtTa01QYptXQ8GksyiQnR96E3kPosSGJLueZNKEusiSid
 vGWiRmO2A5cOxx6iNYe3mtQf6Pcd4X+1BmA13Qflk9njFYc5UVwA5q93mbmvSJR+zrSDPneEXA6
 WInuyEv6NLezv3ZbCkdPFT8nXgHk3JzodbdcIIqm3d7EY4QwiExX2eqHDrLv+pNzlKPkADrDOJ3
 u05qpT3jX2QR9Ra0QQMaN3Ke+la8KmBqKba9EpkAP2OXwlLPaFXMOdQAylqwgHDMDoKHJ7/9xOQ
 HAdDjAnXsBcdPkaKr11Ve4DoQQw0MKxcZuoq4rA4u+zy1Vaagoc7ThRKoes2ht7eWyOKZRcnH2f
 hT3vyep3VLRUvlw8gUCfqMiP3CC9BlxmHcd5AD0z833fIZP7geC3AT1KNmsu5MopFKzFAvWCCWd
 bxeIT9y/hvWXWy32lZDl6KyJlAdsyTgqOl9aWHZdZEbdJFbFY/BeVaTXyFNFx2fwxXJtSnlkzwV
 K8w/0Jzz5eR4eK3QrYnvufpzTm42r/KDDWI3KGCH2lIC7osc+lEDDcA59JTnsF11UEPMvQk7Qsy
 aLjMgCzOOBMV0USXI4M8DIcOuVJs9WXU4dHQBveO+WIAtgfkMuTeIXcQoHX0+a40RG2oTi96
X-Received: by 2002:a05:600c:3b87:b0:4a2:150f:1607 with SMTP id
 5b1f17b1804b1-4ac1709ad56mr57072615e9.13.1793374046534; 
 Fri, 30 Oct 2026 08:27:26 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b7270asm3842500f8f.11.2026.10.30.08.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:27:26 -0700 (PDT)
To: buildroot@buildroot.org,
	Christian Stewart <christian@aperture.us>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:27:23 +0100
Message-ID: <20261030152725.1906744-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020195145.32754-1-christian@aperture.us>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] package/pkg-golang: use external
 linking on ARM Thumb
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
> On ARMv5, runtime/cgo calls __sync_synchronize, which comes from
> libgcc.a. When cgo objects have unresolved symbols, the Go internal
> linker loads libgcc.a itself to resolve them. With
> BR2_ARM_INSTRUCTIONS_THUMB=y, gcc is built with --with-mode=thumb, so
> libgcc.a contains Thumb code, which the internal linker rejects:
> 
>   link: R_ARM_THM_CALL, are you using -marm?
> 
> Go already passes -marm when it compiles the cgo C sources, so adding
> -marm to CGO_CFLAGS does not help. The call from ARM code into Thumb
> code must switch the processor to the other instruction set, which the
> internal linker cannot do. Force external linking instead: GNU ld can,
> by rewriting the call to BLX or routing it through a small stub.
> 
> Fixes: https://autobuild.buildroot.org/results/7534211959577546c3777939d11e411d8a417baa
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> Reviewed-by: Yann E. MORIN <yann.morin@orange.com>
> Tested-by: Yann E. MORIN <yann.morin@orange.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/pkg-golang.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index 3e388cb257..cf12dd56b0 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -146,6 +146,17 @@ ifeq ($(BR2_aarch64),y)
>  $(2)_EXTLDFLAGS += -fuse-ld=bfd
>  endif
>  
> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS),yy)
> +# On ARMv5, runtime/cgo calls helpers such as __sync_synchronize that
> +# come from libgcc.a. With BR2_ARM_INSTRUCTIONS_THUMB, libgcc.a is built
> +# as Thumb code while Go emits ARM code. A call between the two must
> +# switch the processor to the other instruction set, which Go's
> +# internal linker cannot do: it aborts on the R_ARM_THM_CALL relocation.
> +# The external linker (GNU ld) can, by rewriting the call to BLX or
> +# routing it through a small stub, so use it.
> +$(2)_LDFLAGS += -linkmode=external
> +endif
> +
>  ifneq ($$($(2)_EXTLDFLAGS),)
>  $(2)_LDFLAGS += -extldflags '$$($(2)_EXTLDFLAGS)'
>  endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
