Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA36606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lYyLQZma
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C57881DE8;
	Fri, 30 Oct 2026 15:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJeFUqKC7zh3; Fri, 30 Oct 2026 15:31:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 569A781D65
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374302;
	b=NQU8dM5HXD7nMJcYLITiWR53ICY5IOd0xJXDhyiYlbLKjRFrIEO+eA6+ZfiU1ToTceDE
	 zht07mcOxeJ2zp98e6/crmDSEj/fhpzVgpURVx7f9SeP17t+4TeffBCxIlfTH3oS1HTBd
	 LCVHHiMt6v5Yi0VF6cEMrLM45e9suBc8xHiGmVMqjAZGTKQLOZyFVYxpx9qIffxkOeINP
	 byEKchmuRde6+JwTrOhYm45od63LhVSbItaZb2ReKbsdd/IIPwHqWI5vPw6WtQ+6GJo8e
	 pWJcuuKUm1Sfa0BK/kofAE2JHpVIN0HKGsxTqISjrqSJxiQ/loGdziGs2kEji9/5M7g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374302;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=isogonfSmJKEaEnAg0tPLCfOwjelj2ttlM3JeYHjFAM=;
	b=e64xPqEbJ5/XwDgy8YlHhbTwXaOQlTwOCHO5F1Y1yoWqk2Z42uHVOeBNpJsEkZ1x/MBI
	 m07zcJhoWMFIM+dw1FfcejTwK4CHccPKLhzIMBjDCqYLK9l5BKrCqDF06tJLNyGYMbuj3
	 8V8QYNTNMv7zfoipWdeqAFkvyzxZossQ5jSW+I0leF8vI5af2tXHbnnpILD6/XedCjca6
	 4AoI+8zAUdYIh2e3UTwv7uBzIzuK2tq6etJaSvkxTaq6tcHqEM4qle5FoB9o1QNI5hMIV
	 0pIfIgj+zAazjqbgtJqsnRUnT9AsyCFeoT42zrhgSocJ2Fx9PekFxRmuFdEhHzqhebQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374302;
	bh=isogonfSmJKEaEnAg0tPLCfOwjelj2ttlM3JeYHjFAM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lYyLQZma5UIucXpS9li+VgDqcWi8kWXUDz5Z4QRF3kr4HLTrjAEKydHj12X0CAaJM
	 DCHR1UlhqWqbh0mG1CS+II3Fh0zaJnGvnZTvz1KWBDafly22SnFMFoI0wa4+SNC4Vk
	 0r+iAHSaP++0FvpxN7O4dkjGGv4N1mpHmqdlA3iA8IHHSNNWdHxTlJ5ArmzLx9vTkY
	 9RSdNGIeTGTluUpg9IZXhTe9I41a/L85Xs7GrxV+p8HxxECCzP4otjpE1drRBtqgUb
	 QHYkHIO991qWn4sjdBq/Cr0RabiFvgqBxFFWsWAIeidXwOukDjeQuNlWOsbWeHX5SP
	 M4GYpTvXtwhOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 569A781D65;
	Fri, 30 Oct 2026 15:31:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9366D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA7D481C19
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgouddB5Fc6a for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 94D9081B35
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374193;
 b=BkDrPWkNeUeG4eAydJfXEdKxHDX5PY4S5tTuS8c6dEEw9AMRkrf3JESVw+l0+E1i+Emb
 AUjYJDP/r8Z1Ee8nreDBJE9AhqQnB1JYWRo2XK8c3IhtCR4YtdEm7revco/4XSJUBjRsf
 9S5EovI2i7XE5Kr7RvIVFmyT6GOnimoKAOF45636e/ddTT0iebxdDJx1FTKB1LNAHeSp6
 6V52cEUJyYWET5lNpvdm5vCPp3ChEzj2Gq803WE0dQzO45O9myygX45pDo9B6Fe9k+fda
 pd6YAbKiAdGAKK6u4V0Mgd8M9bP0T0OM4tpzCSVpns5FzaldOh2x8h0orLZDOCmrFzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374193;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=k3/GdCeANniBE/dBGuPsotM9Y2Ddi5J6GXq7Q9IG4oo=;
 b=he8GywCQxprsZhCyaoHK3/rPu+r9iOLNfdEgp6XTto4rEGsZ1e6aTi8ga0jDXfAvsoHb
 g+aCEKWMazeQ/DeqWTjCST+mZtbQGY7Rjs5YiEfVo9J14A0relK8J7CDxOGr3wwguXFUS
 BbkgvA1+xvQAKVNWPxI0WCO/TglJ39xO0kL2ltTmx1ExR2Na/j/uIQWzELXsf9bhvbJ2X
 LSCvKnfFRazZwyiZmXBIm2m5QBsT8ODSB1qF5LGmahXZpYC6bpJCWCmCg21FWEGg+wybl
 UCv6kowoRW9Re3gKj8mGZvIKuGTm3fb/qYSGCPuRVpgkYfAgovtAbsqU7ePbNYGD7Ug==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ienHZa8M; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94D9081B35
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:51 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48e1d0e5dafso1087791f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374190; x=1793978990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=k3/GdCeANniBE/dBGuPsotM9Y2Ddi5J6GXq7Q9IG4oo=;
 b=NLfjCigpJQWZNWt5xlFnXIas3ihZ+eWfcLglYRIAdlPwMDsGc1eY40XPw3Uks2buTy
 LXzfO5Ae+OO1rPvMvdLL+GzO9umAV7jFQjEnlMd6h4CMvSKWar1DMOiM05hV1TBwrRT/
 uQmLDHTQtPOaR/ze5i5+saXdw6Aai+ihH6dVkjB2aU9Az6Oeed/NPQPHGltNayjp4Brw
 lWb6pn9sZ/GWRsRuL+PoWnp8AIc79Q7gxFaFIu5iMnwniKdHtlkusakIpmi4GRGymNbU
 q1GsoH1oRGKhttpRKmsD3l9EILDU9pwMdXND2ffFtVtTAjcl157dGsxRTf/D1cKWsanC
 AQyA==
X-Gm-Message-State: AFq9FYJCzaFBUCUMf3v1QQzk8Zmc3gjDdywV95DyAOv171xNK6OIaaAq
 Yc3ggxBEcDVuDnOgSSKCEpmQY0Kw6dvI1aspeP3RMgK/BJu3s3heBCY89zGT9sLa+/Bf99/W2B9
 hLapBMwY=
X-Gm-Gg: AYBFou2CSoCxp8VJjTBgdfMHrkKDH1/TDJ/oqMEINapNWnkmke6IeU5bue0jWZ9lNXC
 kQFK51XrkH9XQHgsKmJHpOI1+XBxdeXFPK25PA8vvO4FYX2eU2CboUY1lBiJVK9j2sUBY0LdfYq
 IPeXTr2wEbMqAan/fYNvFUjdsgiVaFQolFUf8/AgzAbF9Mh1RkmKwXQA/9iHgjmVQqEFdNqxvak
 BNkZJj9cFRuvy7S6GNtGmbHMB4ftgz2e5ydm4eCqVPRRiekzEpbcAxc+ChmIHBpt1fQEsqq3dT7
 7voYgYGElw9/bJrnWHavC963Rtk68PIQU7gAvohBKIgl3vd5EU1t4cEnXAPbNSuRdi2xXfMf6I/
 Uiz3z9IjMYDKSKWoA+ZLkCyc3xtOx8KF+YTv6ont9Phbv63ed/SmG2+yKpWi5QbcgYuu+p/0sds
 vam6GID7LLo9ng+syu6JhVQhEVSTCR7Xg2XffusYj3jQuTASR85Y1GYpNQEktNkb6JH9WWfM2lX
 vNGx20Q+Spx9ISR26ehXbNYFCEKbGDKPhDjH298h4ywT9zCgQn2l6xt4zT7aOOaIq/GZ/TBiDqZ
 DemMmb0EzdQjPs6MdS6xJSwkalKOBpgTTiMCw9DUtGkP8ATnWqGtuEFIllsEy0NhoegjmKl6
X-Received: by 2002:a5d:498b:0:b0:48d:f1b3:7e67 with SMTP id
 ffacd0b85a97d-48e64cb316emr11636866f8f.18.1793374190070; 
 Fri, 30 Oct 2026 08:29:50 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b78c10sm3585100f8f.25.2026.10.30.08.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:49 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:46 +0100
Message-ID: <20261030152949.1908130-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024215009.1004860-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] toolchain: introduce
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
> -fzero-call-used-regs is broken on MIPS before R6, which still has the
> hi/lo registers: gcc either rejects -fzero-call-used-regs=used for
> functions using them:
> 
>   sorry, unimplemented: argument 'used' is not supported for '-fzero-call-used-regs' on this target
> 
> or, depending on the code, the ABI and the optimization level, ICEs:
> 
>   during RTL pass: zero_call_used_regs
>   channels.c:437:1: internal compiler error: in int_mode_for_mode, at stor-layout.cc:408
> 
> This has been reported upstream, and is still present in gcc 15.3.0:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104820
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104817
> 
> MIPS R6 doesn't have hi/lo and is not affected.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  toolchain/Config.in | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 4e6a8d7927..5f4c5f5fb7 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -210,6 +210,16 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_104028
>  	bool
>  	default y if BR2_m68k
>  
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104820
> +# ICE: on MIPS: in int_mode_for_mode, at stor-layout.cc:408 during
> +# RTL pass: zero_call_used_regs. MIPS before R6 also rejects
> +# -fzero-call-used-regs=used in functions using the hi/lo registers.
> +# This bug still exists in gcc = 15.3.0
> +config BR2_TOOLCHAIN_HAS_GCC_BUG_104820
> +	bool
> +	default y if (BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) \
> +		&& !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
> +
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107728
>  # https://sourceware.org/bugzilla/show_bug.cgi?id=29621
>  config BR2_TOOLCHAIN_HAS_GCC_BUG_107728
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
