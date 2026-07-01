Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A1DC43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 09:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24AB361484;
	Wed,  1 Jul 2026 09:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0W7h53bP46Ea; Wed,  1 Jul 2026 09:20:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09F8560AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782897645;
	bh=r+Xg53k82HoLMHVGnj/9eEz1cl9Qi2/3SUyQM1bVNMY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Abobhtzh61skpi09yuabDDaOXraOhnCW6Rrp9sxj2KEbjvWpYNI6+cOj0tQdrUKPx
	 JuupxawKkUytdaBee+nOr8tuZ83KhOX5WA3ewIFXE6nLpCzZkpQVYv1KhEMb2XO1Qd
	 +isychfW7yjh/RkZ2jInW+gzaf6iXPDfBr2lu6VfFKP4msabZSKqVBixR9cRmyYkMK
	 MeNDJ/ZeB99nQjG/2i5wz8jpUWwpEF4C/UAgoJD3tLLE4oKp/wqC3lbJdbnelglStc
	 R8BVaQ+2kshXYU5Ay1r9zqgNWTuwR16fn/IeE2vGitvaZwQr6PGMyn/07uFqN6wbwi
	 634go3v9wgFCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09F8560AA8;
	Wed,  1 Jul 2026 09:20:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1AFB127
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 09:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7756822C3
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 09:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rr6tE0gIu41z for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 09:20:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5AC1C82273
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AC1C82273
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AC1C82273
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 09:20:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdefJ-1xEBny33In-00aiow; Wed, 01
 Jul 2026 11:20:39 +0200
Message-ID: <03ee76e0-3a45-4e01-9fd6-1268a68a0788@gmx.de>
Date: Wed, 1 Jul 2026 11:20:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
References: <6f000416ccf3c83ade242ea0619c1df08aa9af64.1782886248.git.yann.morin@orange.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <6f000416ccf3c83ade242ea0619c1df08aa9af64.1782886248.git.yann.morin@orange.com>
X-Provags-ID: V03:K1:dH549PgcxIEEXIdguFsy8p0wRP3fzuYp02n1XcADrz+f/If02A/
 F8d4zuQnsUA0hqTUP3mCD4BomiXNYX/d4+djFYKOfStf0c3EXnptTeRTvE74GqL8K4dRS/6
 7CTxLnriPc+Vi2b1TYFhYolVnlbUrBBN5tKpCUa8Nm7S7ISmiZr3Yv3hyieHvadteCz9/6k
 KgiVviFZ1i2uUK0k3UKfA==
UI-OutboundReport: notjunk:1;M01:P0:taiNYIBv5lo=;hDuAL6z6pjPKPp8kEN9k9qRyBo5
 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
 J7qIC3OBZ7gJ17qlSCCOwSJGISfEQCpddXB1pGK
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782897639; x=1783502439; i=fiona.klute@gmx.de;
 bh=LFxcZcdLyyDeHUI7nXwkfJxArLhDFiOtR1LkbGwh7rY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=hAP7FNleXYXFoimc7gM3+vGs2D2dJ5BD1lEETAqaUZLyaarVBp5z4smRTvZCWqZr
 BxFPEMkGeWVhZqYoZEiVj67F6+P3huo8uQjUcxHT0bWMu4PvoXsBYgXJkuuwSReEA
 a29Lc3siLboNaD3B3LPL93IZD3unJr88l+eUCOWh+SqdhOjQAwvjQLxoqhfjesaWg
 cgNU4M+SZ+2kikofjPN8JayZbit0OM1fTBRse4ePJmOC1RVuWZgIwz8JCaUQgIkQo
 SwW875+anhuk536jBJcTFjMQsBYyNj/G2HMWZGPZY0FAHalh/E2+hZkaBOSSjsB+a
 s6vlWBO2whE44veijA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=hAP7FNle
Subject: Re: [Buildroot] [PATCH] package/shadow: needs host-pkgconf
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 01.07.26 um 08:10 schrieb yann.morin@orange.com:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Since version 4.14.0 and upstream commit 2a5b8810bb17, shadow has
> required pkgconfig to find libbsd.
> 
> Add a dependency on host-kgconf.
> 
> Fixes: https://autobuild.buildroot.org/results/90f/90ff13ff4c519b0606888eaa90acbd8cd0c0f73a/
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> 
> ---
> Can be backported to all maintenance branches still active, as the
> oldest already contain shadow >= 4.14.0, and so are affected.

Applied to master, thank you!

> ---
>   package/shadow/shadow.mk | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
> index cf05fc1bdc..5f9b69ef88 100644
> --- a/package/shadow/shadow.mk
> +++ b/package/shadow/shadow.mk
> @@ -10,9 +10,12 @@ SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
>   SHADOW_LICENSE = BSD-3-Clause
>   SHADOW_LICENSE_FILES = COPYING
>   SHADOW_CPE_ID_VENDOR = debian
> -SHADOW_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>   SHADOW_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
>   
> +SHADOW_DEPENDENCIES = \
> +	host-pkgconf \
> +	$(TARGET_NLS_DEPENDENCIES)
> +
>   SHADOW_CONF_OPTS = \
>   	--disable-man \
>   	--without-btrfs \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
