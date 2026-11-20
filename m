Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7A6606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 09:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Qu2SrYcP
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28CD540E0B;
	Fri, 20 Nov 2026 09:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ab-jZiKxW7mY; Fri, 20 Nov 2026 09:59:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3D98F40ADC
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168751;
	b=Mn+JK4eQvH+rbomtk3ULHW/h71bMBv78Mlic4fgyxEsRadX1+Tx+hzfVH306rn8GbgRD
	 eL+78Dwqaqd5d+HkZE4uOTYa0xCSf5J72pOL1xKP+LsB98Mv1iEUpaXuC4OECq0VhTr0C
	 FJbISkZBUYQiqhPs7CQOYesWKlMGW0pyp7C/ycBZRCvxEfM77yuEMtAzNojhcpbEVgjZ8
	 usy+HFqTj1sP4VAThz5xVlo3d5kb6gJSfTsw9f4FCeeu7eWarv66zXlPYPAuD/6e3lNC4
	 9OeQ1F9RGzHGEBCC2hg8SdYYg4hjrB5Uqjz+Q4fXF/BmDz3yxL85fNshUzMBQoFgmVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168751;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/InLxNlRcblFsMec7rIZF8Pl0uUBUYWA+TrWSBqQq9I=;
	b=DrP+aGug4X+RDEedHEJbjEh34cT/S2S3t9SPkJYvrEZ5E8HXgxeg1vG9HgrYhJS+DxhU
	 IaoQUUXWB7toefxb6UA1/0CmlQ4has2qBXTxh1OVTKVh7pKRZdx0lKbIvEzbfMCiRzNIl
	 jqy3nVlO4SypMDpu3BLpyoRhfDe1GKT5EYZVKM1epbV9ZN0BtRuEgafWEcgEqct13IT4k
	 SxNtvJuDX5NnkVrP0aReo1+cjsRu2QTRYW/BB5s9ze1ZctV0bqzGYI8vkpLlBZlx74MHz
	 DaCgLCydm+kS3VM2kkY34D5KxA4H3zT9BcNTTatM3tdqjNDYerlamVafr7zJP1fy6KA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168751;
	bh=/InLxNlRcblFsMec7rIZF8Pl0uUBUYWA+TrWSBqQq9I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Qu2SrYcPnUpCyTdUXsrfmnF7KA6a+ZOm/Sfla8ycfugkxxrbMIUSyI1fKxDS42esq
	 rCBh0ZHfq1AFMy2NN0PZjdvaI2syqJR1Ugnvbu8KQhTfWcxLIddTbUJNX3CNNrtfif
	 zkk8WQceQM5BfPFhHyriXjIxf10S66wKwEtwF0fxOCYuHc6vyuZB+W764zAu+t88iA
	 ejivVrUyMyRNqdjMxYSruqOAMPR4lpfbQxVvWJtRoR1D66NT0g458N7FGaE9VZSPLk
	 dDzaRXhokYwfTweC7ANMr/D2bbIZAvxAobBmON7ZybbwvTxXk08VUGCCbCQ4iBiquf
	 RAIegFSFHaXGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D98F40ADC;
	Fri, 20 Nov 2026 09:59:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7D27E22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A600B812C2
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eJchWTmPL854 for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 09:59:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 74BFB80C94
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74BFB80C94
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:08 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a1fbd52ab6so4766975e9.0
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168746; x=1795773546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=iVTEqOlJ7fHzR4xrQqh6fgawg/cLAhDNaGp+I9yqa+s=;
 b=jn0NKbVdp65Ypv7GfYyZVJCb/lNtBRjRmslcH4SS5G7keurNvwGM51D2ajUVevraWf
 FpzygZrWPTIlMqd42quFrrSy2hbbB+WqG/2koeqHtvohHrYoIfb5xADony/aoUTQ2Emv
 bIZDrSctQvBDHRt5ZUAh+8pQUHC+Qxqpm9jFFIOd5FtVtresJTxMBh+efmRbzR2g+H3w
 EEhZTAzV8h7UYs1294Yu79Ipa8lZ/QLZ1W9VVoUv1ka7sGA3KVaiVM1Z1WcfucUA9+rQ
 lPar7XGanC+GZPIHP+yvICe+sM7IiQyFkwLQhzfWwyfh3U6tWMy8zaF0aYsw6B8ai/XJ
 1ivg==
X-Gm-Message-State: APuU4Z9gj/+gKM4vpvdiu1pnMimp+2m4yQzkDHvrI++R/2N7cNG0CBv3
 1tcq1f3eiLsQhETyn+StPEPPUq5Yu1D/aWQO33V4gJ7KT3YsrlJ5g6UVwRyjV08rMfnnS9rjiEL
 i9wrnyr+MCw==
X-Gm-Gg: AYBFou1XtAa4CceNrWcr8dXYTuZJlRyBa95vsAUac1W+8+NeJbknVexTcX7Stpz7C5q
 OBZTkJoj9pw4OeiFJAFXmnrcMUIfnPc3W2NT1nWrslFofcRHg8eLt/TxK3DiYYtVVp9X+2M0QbW
 cV+pcgv++4mPpcLsrmoeDIdvmhH/9t0Zv+R/YrC/qMW7BSG8RRaAzsO7G9gi/nFu6zmJJHUzahH
 98UgqS6kHtKA+tMSXEyEMW2Q9FpDV6nTch4pm2X0rzxv8UlvlnCmAbwSHTueqfcfvXFTmniJsen
 higXIIO7pMRE4v8zdoxgPfIf3iGhgNQlTdMY2ELQztlbQGMXKSr902nhZ5NwM4UU3UDj+8OFDyR
 0qNe/bGxtTG1WaJBe9u72AHBJA5SvHhH4CgVdRTCTZj0plFI8Lhu75ea/6b5p5C/1fXrsRkVFFe
 DzhLF/7DfVw++e4PpcYKmzIJt0QaILX6eA+ImHCnu8w21DstJZR3zAjHZfw7MFdqxS7K7Yo/j7I
 NrHvMiJiNY2Dv0OEY751golbjFi/8MLwoVw234Lt17BhxlTXsnaLsHd34KWUJU3WtZ/9IhGVmYj
 0L4JEfi/xA5I1uZaAWPrjQohJup/PT+KI6MsSHUvNyh/
X-Received: by 2002:a05:600c:4e93:b0:4a2:190f:cf6a with SMTP id
 5b1f17b1804b1-4bb8894283emr56173725e9.35.1795168746409; 
 Fri, 20 Nov 2026 01:59:06 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88f635ffsm45827725e9.4.2026.11.20.01.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 01:59:06 -0800 (PST)
To: buildroot@buildroot.org,
	Adrian Perez de Castro <aperez@igalia.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 10:59:01 +0100
Message-ID: <20261120095905.539337-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261110165837.3684633-1-aperez@igalia.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/xdg-dbus-proxy: security bump to
 version 0.1.9
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> This release solves vulnerabilities that resulted in bypassing message
> filtering. Release notes:
> 
>   https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.9
> 
> Fixes:
> 
>   https://github.com/flatpak/xdg-dbus-proxy/security/advisories/GHSA-2cgv-pwcq-wvpq
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/xdg-dbus-proxy/xdg-dbus-proxy.hash | 4 ++--
>  package/xdg-dbus-proxy/xdg-dbus-proxy.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
> index bbc1762acb..fdc14b1121 100644
> --- a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
> +++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.8
> -sha256  b6630bd24f8161b0e2546d2acbb014a3b3249f5c0d75f2a863ade898b9034d3d  xdg-dbus-proxy-0.1.8.tar.xz
> +# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.9
> +sha256  5450dda586ec3bb3ca709d311e845487883faa3b09cf562608d7e84f4311dced  xdg-dbus-proxy-0.1.9.tar.xz
>  
>  # Hash for license files:
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
> index 7f9fe16f28..4a8ae661a3 100644
> --- a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
> +++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XDG_DBUS_PROXY_VERSION = 0.1.8
> +XDG_DBUS_PROXY_VERSION = 0.1.9
>  XDG_DBUS_PROXY_SITE = https://github.com/flatpak/xdg-dbus-proxy/releases/download/$(XDG_DBUS_PROXY_VERSION)
>  XDG_DBUS_PROXY_SOURCE = xdg-dbus-proxy-$(XDG_DBUS_PROXY_VERSION).tar.xz
>  XDG_DBUS_PROXY_DEPENDENCIES = host-pkgconf libglib2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
