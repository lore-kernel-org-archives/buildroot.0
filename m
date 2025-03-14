Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9573C282EC
	for <buildroot@archiver.kernel.org>; Fri, 14 Mar 2025 20:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A23F5848A4;
	Fri, 14 Mar 2025 20:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yuTO3r0hdA11; Fri, 14 Mar 2025 20:05:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFB37848A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFB37848A5;
	Fri, 14 Mar 2025 20:05:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D906C8
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 20:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F19B861255
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 20:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8a5y7BArgg98 for <buildroot@buildroot.org>;
 Fri, 14 Mar 2025 20:05:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CF3F0611FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF3F0611FA
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF3F0611FA
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 20:05:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 0790578035E;
 Fri, 14 Mar 2025 21:05:16 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 14 Mar 2025 21:05:16 +0100
MIME-Version: 1.0
Date: Fri, 14 Mar 2025 21:05:16 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
In-Reply-To: <20250314104109.2821418-1-alex.bennee@linaro.org>
References: <20250314104109.2821418-1-alex.bennee@linaro.org>
User-Agent: Webmail Free/1.6.10
Message-ID: <cc51e4f2c3bdb94dc184a5583e35584f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741982719;
 bh=mQbFz9w9lHe7jFuooFd7XxMhA2tld7/taYKJEAOKxv0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CBRM9ECdnsx87aXM0SbZeGP8hrS+LV20s3nI+gFFbugK4bb1qyau2IctUx6y91fZv
 ReP0xobyJ1AHnJ7p7IJBDCgfC8rtlI9+2bBmGB3vV6T63MdePr7xRwQbVVyTMGjYrM
 eR3j3/uXrVenLbR6l9WrmU8iB41E3xFPG9eIfEYQowBiNxb4vXuNNtTTm51avpjgMS
 OZpcWD37Re5sRTmOg+Y2LfMN2stC9ig/7rsE4dr6vOFrP/41Uelf+lWMDbYlyNwZR9
 6EJlnKcZMEpf4hX/d6GhCPF4wZapqJpzfK/Lq+QFyE3iWB6gYbIPc83mOVqDpHsR7q
 ZxSbMI7MtNFGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CBRM9ECd
Subject: Re: [Buildroot] [RFC PATCH] package/fio: explicitly control libnfs
 dependency
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTQvMDMvMjAyNSAxMTo0MSwgQWxleCBCZW5uw6llIHdyb3RlOgo+IFRoZSB1cHN0cmVhbSB1
c2VzIHBrZy1jb25maWcgdG8gZGV0ZWN0IGFuZCBlbmFibGUgbGlibmZzIHVzYWdlIGlmIGl0Cj4g
aXMgZm91bmQuIFRoaXMgY2FuIGdldCBjb25mdXNlZCBieSB0aGUgaG9zdCBjb25maWd1cmF0aW9u
IHNvIGF0IHRoZQo+IGxlYXN0IHdlIHNob3VsZCBkaXNhYmxlIGRldGVjdGlvbiBpZiB3ZSBhcmUg
bm90IHBsYW5uaW5nIHRvIGJ1aWxkIHdpdGgKPiBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4
IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhh
bmtzLgpJIGFsc28gYWRkZWQgZXh0cmEgaW5mbyBpbiB0aGUgY29tbWl0IGxvZy4gU2VlOgpodHRw
czovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvZmM2OTA2MzFj
YWEzZjA2MWFkYzIyYzFmN2RjNGRlZjIyNmE4MDE5NAoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
