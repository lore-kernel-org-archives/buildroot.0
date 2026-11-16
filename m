Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9663F606A32F
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lt8RJznr
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73C7C60821;
	Mon, 16 Nov 2026 15:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anlCuGfgtwvH; Mon, 16 Nov 2026 15:40:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6FF1D6081B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843610;
	b=EJdLazhW2+z4AVtH9ewb++QRhJzE4l5Bq3tzOJu+m5IjllVZlQEQkquUPfbTS8AX+yQZ
	 eg2P9jfR5DBzsKnrNj5BiqIo41AElzi9fekBX9Pk9r/LUsChdAcXaQe6DhtLRiE6IFvdy
	 s1uhoSmNZgfrqgjjgCI4b5gX8jFNONJlp7ljHzv/rzR0l837UrkR+0g/8waX6kvpYOpv+
	 ziF0ExsXQku8FWP8QwkyxaOs8ZJ39ydB3c5LdtVz6x2UrTHDly4xrSMjWwnpmit3XbTr1
	 ztQDhjRtxwt1eWnZU80qrPihPYryzQJYUVxWu9UX+kIN/wGagt5McViWAYQBff8T7Zw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843610;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=D/T3jOB4m7hLox0CbTk9pXNn4JPbSBTUkxrIgOPIN+o=;
	b=mTW4/dnr1c3WZLj1132hwXPWkwcmlOue+8NGbiktJ7hEXeA8b3UO/yVvwYBi+hYbX1cX
	 CtmzsF6j2gMP2vpjRQs63I8LNxAuulKsRjurj9WbPS4rtQAtGmadL+y/rU3QNfUw/Powk
	 S+OngfySU2ELno/iWomIfSw5EmgQfBoUEj+/XFgyMxGRXxqFpCBnkC9bH4fAJAVG0jcE4
	 3aXSB0hE/imWYzZPz9/WFY63JngF8VJiKG/VpHOhE0i6R5YwjO+sacc1YSx/tM3SzQJU+
	 RArrPfbVdLbsHomk8U1lbFgooyVr9IB3w/+ZZB3S2MBA+/wPthY516dqv1Le0Nm7c8A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843610;
	bh=D/T3jOB4m7hLox0CbTk9pXNn4JPbSBTUkxrIgOPIN+o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lt8RJznrcBZ3AymCBBJZ7xgSZyPshuVPkMyGIZfoOwrspbtVfVO/9ZILqWqv6C96J
	 SMBh6r2cG6qgFX2RZrNhxdnJrhTudp9HXbz8BVlfFS5GQJwqofM4cGQv9xTaa+bI/B
	 hwsAuUCZVAZSJ/Vwwz8Hj6FkeoEyeOu9opuXSsOND2eNI0a4ftRVpZ9bXwbdht/NML
	 Qp76KlYuMGZpBMv+luTE9xqtk3E+DUX0dpUy5KiD986Sx1wQucJ4ursGspMj0kugen
	 vx8rUiERRXDCpgjDmIQpfdazEs0c28WOBBOnUYCxSre9kyxFkAhLXIG+iMSfiqyF8o
	 9kw/Le1J53LSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FF1D6081B;
	Mon, 16 Nov 2026 15:40:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B6612FE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61CC180F0C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oS-UHiDR5GVc for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:40:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 410B980ED8
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 410B980ED8
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:06 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-498f5fa4f70so3872634f8f.0
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:40:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843605; x=1795448405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SM4EpvhWvkihKxF3dNLU/nUoUk/lVyxX1Q66QD+8pqI=;
 b=FOakCOlhcjpDiY87TvjDP/QauC7wXPsAqWNUDQaVytu/UZGvmdNbtyBJ7PrA14TeNl
 qA9zRBFf8UNdDZ2kayFsJ7r4DFx4xBA1wtwlglDWUJnVJdC+jsQlDW0C2z6g/X0fjidQ
 yrAUIvmGhWLBZREtXsH7LtUukjs40NhxLLNLnj3XYDl7GUu8Vbaa3cTW9T4uUM/d11ot
 1FBQESKNySF5FZaMfQsPAROV3Tra4IHga4MRyx7cJO0w2omBaMeQgl841UzntvvVriQi
 0uY9wRuNKEc00e0JSJTPG5XXH2xyeL6l7Vw7emAWNFINqjZuYhMGKtRMkYhuStlWDpx1
 MTcQ==
X-Gm-Message-State: APuU4Z+p1W8JPdc1p9zKQU5xt2329Me3csB631Ox1ds6VnJX8pmzFMmt
 84PxqeV8B4WNLhdeRKvT7bM/HTdMV2/6x+pnaf/MNuWpQbPuMcPdgOGvPWWwR3YIlu+8jQcVdk8
 6tOlfa2I=
X-Gm-Gg: AZFdTZeKr8XDew/NYgGDJQ+HyLtpnLeXGycGyrkpJSFCIeuLm1ns7s8lXyFkpwHRVt0
 T1MG4M4iTGSW1WOdmfmEU/1KYu8RBR0wlDX50XMdLOPMbO+1VhzJARnT1qO6fkxzFxedOcp7RhC
 a13FCwPsK5OH6z0v1CZY8toxRyJWf6tEnZDIDgoQKMvo4+vbPRepbFoDs7D9P8i2tpZylnwOscb
 cOkQwMgKnlfOPUBsh1Fm1MYHbQgfOjUHwKaSFN7twJcm0VIbBB/9BRRQEOzpmviyBsiXs1Zr08y
 4arrtf1MYsh+t5TmoMscDu7x6jKDlh0gBh/pXa6HuaC6lH+mhhuZsJ6T0hNT/xvYP4N5RzdN4HS
 HR+DNIUGUV2XXGxLV9N4uLs1iDkscyQ/pIJwr4cMx9TF9h2QgDLpHsPsRZ3l8SD+1dbAz9zq0wq
 jN4xy3x+RyiAFno0rpg7yP3bVd/mzjyXXlizMuLo7ao5f6Zny9/3cjjNkbwDoDCLKqp3LfykGLy
 62p1GcGEfAEHbegWcjF03xb1Y5aXcY1bD1MyDJ6VFq6kitCh7OM7tUGIJzesyOW+hWEt3Z5qZwF
 LeIV2WjRnGA7ZGg6
X-Received: by 2002:a05:6000:4688:b0:488:7d08:edbc with SMTP id
 ffacd0b85a97d-49c714a2a99mr15868300f8f.24.1794843605056; 
 Mon, 16 Nov 2026 07:40:05 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a2f61c0989sm1066164f8f.48.2026.11.16.07.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:40:04 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:40:02 +0100
Message-ID: <20261116154003.725738-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104082735.4134892-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/linux-tools: hv: fix build on
 non-x86 build hosts
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Since Linux 5.4, commit 9b5434196529 ("Tools: hv: move to tools
> buildsystem"), the Hyper-V daemons are built with tools/build, which
> first links the objects with "$(LD) -r". We only pass CC to the hv
> build, so LD defaults to $(CROSS_COMPILE)ld, i.e. the build host's
> plain ld. That only works by chance on x86 build hosts, whose ld
> handles i386/x86_64 objects; on an aarch64 build host it fails:
> 
>   LD      hv_kvp_daemon-in.o
> /usr/bin/ld.bfd: relocatable linking with relocations from format elf32-i386 (hv_kvp_daemon.o) to format elf64-littleaarch64 (hv_kvp_daemon-in.o) is not supported
> 
> Pass LD="$(TARGET_LD)", as already done for rtla.
> 
> This issue has been present since commit 2703383c7201 ("package/linux-tools:
> add hyperv integration services"), which added the hv tools while the
> supported kernels already used tools/build for them, without passing
> LD. It therefore affects 2020.02 and later, including 2025.02.x.
> 
> Fixes:
> https://autobuild.buildroot.org/results/86c33797a5f09dbb1162a554cb6019f7c0702fbd
> 
> Fixes: 2703383c72011d38a1e3559cb7a5a2b0071b35c6 ("package/linux-tools: add hyperv integration services")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/linux-tools/linux-tool-hv.mk.in | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/linux-tools/linux-tool-hv.mk.in b/package/linux-tools/linux-tool-hv.mk.in
> index e638fecfc6..3aead40178 100644
> --- a/package/linux-tools/linux-tool-hv.mk.in
> +++ b/package/linux-tools/linux-tool-hv.mk.in
> @@ -16,7 +16,10 @@ HV_hv_kvp_daemon = hypervkvpd
>  HV_hv_fcopy_daemon = hypervfcopyd
>  HV_hv_vss_daemon = hypervvssd
>  
> -HV_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(filter-out -g%,$(TARGET_CFLAGS))"
> +HV_MAKE_OPTS = \
> +	CC="$(TARGET_CC)" \
> +	LD="$(TARGET_LD)" \
> +	CFLAGS="$(filter-out -g%,$(TARGET_CFLAGS))"
>  
>  define HV_BUILD_CMDS
>  	$(Q)for prog in $(HV_PROGS_y); do \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
