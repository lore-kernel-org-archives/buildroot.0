Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2037B606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lLmtfBhB
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF080812BA;
	Fri, 30 Oct 2026 15:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XuhNmFeCoSXH; Fri, 30 Oct 2026 15:26:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EAC33812C1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373980;
	b=iF0zA0hCXS0HVGlP9SHFcjC4EmRtcc9CKkKMW2K7ob/jUcaIHmqMt7hhBGZVoCALFtqH
	 lTgDhZLfNILiQwzNfVeZ+lomjJX5dbsgCy7zea6ocqY52jgZY/fj5Uy8PUEznyBRHOeh5
	 yqu1dSruXUqWUsD0pcqS9gRf21+ryuI285dXkI0qo65AGOsEMK0D7SRqshsUsQkS/gRfq
	 1rd/AfE+Vwnb/y9FTcBpA4FpnzUJWz1fLCExMK4YkJsPAFh+5lmCXUKXD9gT6F7wWGLyh
	 LNtWRLe0ssXncT7tRN5w/XhHxkSMXdipJhB8qWTLTc+33ddfFNjKtYiFuFHZkaF5vAQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373980;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PX5vL9Q5HGLlK/unHU5/vDUwNQFkTmKDOUgIh29/Uq8=;
	b=Rjqr65vLIVbS+KvGxi50lIOKcZZnBbfMGzrIyuLMdSQZuY4tXHEndilJ4lSDtKzDr2+3
	 jdJuTr6dGa48iPP1W19ydC/YWs3suGkktNAAN04gEMHmb9yojvU8C1iyCGddEPFiPiXFx
	 fFHslFFs2hRxFCet1YJ9cG7u1c0/zdPnPqZbd12iXh/uNhujb2ohUcKjHp654h5PctbbG
	 rhxClzMQDyjmWcL63I2ljN4V5Vxfd37bDyKbiZ6lBQFbWsW8mfqLHfi+VTrtPWbC9x5NW
	 zv5uonA+/hBoiT7cWiU7NkjWf8tRBdvgs/GqH0vWJdI1b1PNDYL+mbOjp7bucaJznPg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373980;
	bh=PX5vL9Q5HGLlK/unHU5/vDUwNQFkTmKDOUgIh29/Uq8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lLmtfBhBJ5YS4mKQX14OQCYgzLpsmeUH9XFfBdTzYfWjYYSmQ71JX2p65IgqbqqsA
	 GG0fiz4D3t83t4kfbTBG8hvJ2kCGaFSIpPb9kfEsGafQQa8H0YKFj83ikoJPUrWVOO
	 WzVI46V0bACX3eiu/swTDDVZYfoB2EnBaDxH3HYzw5CwgdiIUTpEX9aLP1dmS9gra/
	 YlfDTLuZ4rTxY01Ro9N3t3MYFb8k+zE465n+S32L8XmCP5Vxq56r91wwH4UqEoDDd+
	 FZmMHdPU9/uy3myvzXvfGu2CHKew+2MopD1viW5eV36RQMn21yRqKl93+eDBWhYTa0
	 2ezDK3fOkDuBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAC33812C1;
	Fri, 30 Oct 2026 15:26:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05953235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DECBE60AB2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aO0V3op0fgAS for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:26:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 99B2460AA2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373965;
 b=AhnCtL4tYyGEitbzNHPVz7nLtP33AfSMqQnZUG640Oi+qUJZH1/wwnJlLVaSeZGM43aF
 RqUDrlD0iFmoao5WozYmMEJjW2R1RHgr7PU/znBM9s0F1qET1NUgMIteVtlepDtYVSAgK
 um3fCE+NijeshtXEE667yFA0hHhyYZNP0g0gohiZuiG2Kpu04lKZ2tDhujrUFs8Nm8J3q
 SnTuuJj3rrNutgamc0OyYvrxvj29deU2S9facLlJwz3swzZQnTUd6qOdwAMPC4aFQvbV0
 KQReKuVLP65svsjs+NZNiD9x+PCzGlpI1NSVkHciBbbn+inHGPCCbY00iRzwVn7STaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373965;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=8R9UnlvcZJA64JO04yJUSroaoxuAj6nUoq0EbvAFUC8=;
 b=IjZYnaO4a0znZZ1zgBDWYRLGJV8ioa1caLLxIpag71AX0b4yvGYlT4IqJl2riJhqq7ai
 XMrlx7YUXCw0HgnwHXyQnRVGdKOiva0F2BzO9hQ1pLAwx/fujf9xx5QxIlN6wzoKbMgNt
 BoEQl401Obg7rH5ftq8Q7Afl+1NxO63e98x+EkGsW2A1h3H1BR5IoEBGRF/L8AnSI1slT
 /MhyFjZBxIAkWEwEgKmX0HjChKP8vYeoSVZ5H/SId7S3set0fm3XGEe2mtl4BAHs59bSV
 ymZHpEUHRlzi8I4QO5C0x71yMTbwGhw6WXMg1VGutarBjRH31yg2hu2GpDvIYVI5wQA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=e9iTEXpy; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99B2460AA2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:04 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a35d5d4a20so8899455e9.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373962; x=1793978762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8R9UnlvcZJA64JO04yJUSroaoxuAj6nUoq0EbvAFUC8=;
 b=zfNQ8xtEoLhpYmfImPQ78AZBcXogEtO9OAwdgQI+bgWpxEPToYywacmN8E6V45U5nN
 A6vNpxk97OdU/2n+lL1BDAbstl5ubtGcwVEvpktsJK1dTaRBG999UcQcqKQsQmcF8FeF
 XM/cIAZ8cstDYpINImj5tlvN7LSOgpe/XLQu09UX3KJbSD4v0tmAxwLQ5If1Daa0yUUL
 /u1LxrA0YUxmz1VkECMHOYWA+qkA508s/ElUGb52rH+IM6kavCwzpNoAJQDSzDFeR+16
 nUlZW0lnN6lICfdrPDgo01WyKOSjCGXAXBbxzl701mD4QWtuOPjwLQdnN34GLLTWDwSL
 KeOQ==
X-Gm-Message-State: AFq9FYJDrKUiyv9DO2hUghWJagFvpXTBkvDnc2m//3cwoWwQWYK5kcuj
 H7fV9i9Bhoqis3bIorWh2IMsZM5y2yp9/qCvst+owvXkmSK8wWxsWyWAw+ren8c8G2rH315X7Fg
 XEukbNaE=
X-Gm-Gg: AYBFou2VCjetCyGxWJqr2CXoCjvgwD3R5PoC+a4pGb0w2V1vuX6ilRL2uicW6ZU/Bff
 YRTu/vHH3K4WOasjV11Lv1l3cYSkrlHz+5rKLwAL81NKgPS8R0E50sFk0n3hA/3xmJwcwCZA0uu
 jJjDF+u1e97iNRzwDwKLKqYLV2nvk7kfqcVUj0P4n84HX5O907U12mayKJ25UisZacfuDirXRuU
 OO87YEkJ8FkDbaB/IItuoqByHwj4V73fPLfATOuIDXrdmFEEZabqIlx6rIvuQqG6o3FVmdVcPjc
 8BIY6Sg3dcNRHlGSsqx/ROz1YJVX0TcTbiqsyiKA6UYo3N31i7uh068HfLXiuIuJQZ8lYMOeG30
 R+lLe8ah0kuoQ2GjxDUpCMS/fMuT9zpZ/ZRmVRWsFCPllZp/bdn8+gffem3E3gKkVVteq3FjWtv
 v8T+uKi4IPmjaFnKI+20gs49bYG/X7Mid8dqSO+GfDSZ236re1EzM0z2CrAsB5DxWn+GG0w6h/F
 CBpFLNOKI9EbMNZL/LUrKLZ5on5r0VcYGwsxLe+TMXexW33jIeE3wt3QAd5LYzYaIPmWVP4iIKH
 MCADEO56j3Z8BkrErTs0Y/ngYfe9KqGkVQMuJZRZpiKQhrTHDmv77ibR/S9/Z1MRrcWqTPRb
X-Received: by 2002:a05:600c:8b66:b0:4a3:5a91:5f61 with SMTP id
 5b1f17b1804b1-4ac1793f8ddmr61750325e9.14.1793373962423; 
 Fri, 30 Oct 2026 08:26:02 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf5b286a0sm55493065e9.4.2026.10.30.08.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:26:01 -0700 (PDT)
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:25:59 +0100
Message-ID: <20261030152601.1905889-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261002192648.3757582-2-james.hilliard1@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v7 2/3] package/pkg-golang.mk: make GOPROXY
 configurable
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
> BR2_GOPROXY now configures the Go module proxy URL used to download Go modules
> specified in project go.mod and go.sum files. By default, it uses Google's
> official Go module mirror at proxy.golang.org, falling back to direct downloads
> if the module is not found in the mirror.
> 
> The default value from the toolchain can be read with "go env GOPROXY"
> 
> We rely on package developers to audit their dependencies in go.mod and go.sum.
> 
> The value can be configured to:
> - A comma-separated list of proxy URLs
> - "off" to disable all downloads
> - "direct" to download directly from source repositories
> 
> For more details on Go module proxies:
> https://go.dev/ref/mod#module-proxy
> 
> Discussion:
> https://lore.kernel.org/all/CADvTj4pXO2rwJ8oCzzGNY+OxLuo3uJnDT2PAxbyquw0L6dhfiA@mail.gmail.com/T/#t
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> v1 -> v2:
> 
>  - added more context and links
>  - renamed to GOPROXY instead of GOPROXY_LIST
>  - moved into the !BR2_PRIMARY_SITE_ONLY section
> 
> v2 -> v3:
>  - split out GOPROXY default change
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  Config.in             | 16 ++++++++++++++++
>  package/pkg-golang.mk |  2 +-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/Config.in b/Config.in
> index ac58c685d1..34e9ec6705 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -334,6 +334,22 @@ config BR2_LUAROCKS_MIRROR
>  
>  	  See http://luarocks.org
>  
> +config BR2_GOPROXY
> +	string "Go module proxy"
> +	default "https://proxy.golang.org,direct"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	help
> +	  The Go module proxy URL used to download Go modules. By
> +	  default, it uses the official Go module mirror, falling back
> +	  to direct downloads if the module is not found in the mirror.
> +
> +	  The value can be one of:
> +	    - Comma-separated list of proxy URLs
> +	    - "off" to disable all downloads
> +	    - "direct" to download directly from source repositories
> +
> +	  See https://go.dev/ref/mod#module-proxy
> +
>  config BR2_CPAN_MIRROR
>  	string "CPAN mirror (Perl packages)"
>  	default "https://cpan.metacpan.org"
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index 26da7be71b..3e388cb257 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -101,7 +101,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
>  $(2)_DOWNLOAD_POST_PROCESS = go
>  $(2)_DL_ENV += \
>  	$$(HOST_GO_COMMON_ENV) \
> -	GOPROXY="https://proxy.golang.org,direct" \
> +	GOPROXY=$$(call qstrip,$$(BR2_GOPROXY)) \
>  	$$($(2)_GO_ENV)
>  
>  # If building in a sub directory, do the vendoring in there
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
