Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525AEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 20:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC3814032B;
	Wed, 12 Jan 2022 20:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGe5en8jEFYg; Wed, 12 Jan 2022 20:07:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C416140329;
	Wed, 12 Jan 2022 20:07:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46CEB1BF2F4
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 20:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34F9D8291C
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 20:07:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QwvGilre7fRl for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 20:06:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 131D78264A
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 20:06:57 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso4140559wmc.3
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 12:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=p3TWswTKbl9OEarcQa22HyvP/bH9IJARPLv8dWuIzHE=;
 b=yp/mTx7NKyAJN0eZo+Hln/8GI0AEirMPzwvV5xNPKQwDW6vTkqM3toGAcO7he0tZda
 uEuW7pmP85USW8kziFUZWzX4jsCOMcoXWKxn2eeZdSrxx3OEW1b3kwl3q4HOiW3dPPwo
 P26n4cG0o5ZjjcSVaDmop4mQFF0kPSb/TN2nqdCr3co+oaKb4OziZPkU16Us1dj8iN7b
 HGUt2j4XOXT1/5YPn5b3EXjv7zYT/gAWOJjD/QsfRpA3K/q1o5+OgtwUteTdm3zCRtrV
 hY1TM92espC+RN4sZQN8EKonf1PnI5RujJhnRPguAbuT7zYmCWHCkOh/5mvWL7MbZTEr
 Nwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p3TWswTKbl9OEarcQa22HyvP/bH9IJARPLv8dWuIzHE=;
 b=xbY1MQX2sS8t8Zss8qt/+9bNJxdf3pa8Qld6uPkypIdhu23TG8NHaqWycwB5nnPPLE
 uaMcC4RdxbstDNi/yQ0U7oEXU9NDKC6NXc8VF4jecYoAvJz8+3refQNfsCvFSur85sM4
 jmOZ+vJXG0kCxz7urOmA3A7MjGU51MaSs8SOTp1NTaJWRwJPkxbcbqjRQNy4tO/rgS09
 z6nicxr5QwUt9xuVPxCwbcM5Ne0JicXiGmIlCSzXhgXyUvY6CHMA1cQRPLNxjMdvtAd1
 zQTU0nSzxrKdf1jnB/uRvjcPT/7euY6FaZeBhV9ntLHoUWZHdi+vrKlGjRu++HWs4ZAq
 a+EA==
X-Gm-Message-State: AOAM532cKZCTpC3u1eT84Z7XUHIMKjshGZnZ8goI1g6U3LuF4hQKEQUV
 Vj0zE7pjvrQD5QGo99hXojtU3w==
X-Google-Smtp-Source: ABdhPJyPx5ui9vRKCRjm56eDKuO++0BUAHEOKKftX0uijHWCyXja/jcojl89ETBt/v1deUiJ6FSm0w==
X-Received: by 2002:a05:600c:3d10:: with SMTP id
 bh16mr959588wmb.111.1642018016172; 
 Wed, 12 Jan 2022 12:06:56 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id z17sm685642wrh.87.2022.01.12.12.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 12:06:55 -0800 (PST)
Message-ID: <7ac86017-7b00-cc39-d6dc-a2dac0028382@smile.fr>
Date: Wed, 12 Jan 2022 21:06:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: fr
To: Arnout Vandecappelle <arnout@mind.be>,
 Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210518113652.29609-1-patrickdepinguin@gmail.com>
 <20210518113652.29609-4-patrickdepinguin@gmail.com>
 <5269b781-3bed-9b6c-9a4f-2d077964a16e@smile.fr>
 <CAAXf6LVZ38y=7X2YzN9WoC-0N940D2WGUFP54aRhT4FebTkfnA@mail.gmail.com>
 <0abbcb3c-e2db-ae06-a065-2bcb71b74f8d@mind.be>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <0abbcb3c-e2db-ae06-a065-2bcb71b74f8d@mind.be>
Subject: Re: [Buildroot] [PATCH 3/4] core: introduce BR2_KERNEL_ARCH_OVERRIDE
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLCBBcm5vdXQsCgpMZSAxMi8wMS8yMDIyIMOgIDIwOjEwLCBBcm5vdXQgVmFu
ZGVjYXBwZWxsZSBhIMOpY3JpdMKgOgo+IAo+IAo+IE9uIDEyLzAxLzIwMjIgMTI6MDQsIFRob21h
cyBEZSBTY2hhbXBoZWxlaXJlIHdyb3RlOgo+PiBIaSBSb21haW4sCj4+Cj4+IEVsIGx1biwgMTAg
ZW5lIDIwMjIgYSBsYXMgMDoyNywgUm9tYWluIE5hb3VyICg8cm9tYWluLm5hb3VyQHNtaWxlLmZy
PikgZXNjcmliacOzOgo+Pj4KPj4+IEhlbGxvIFRob21hcywKPj4+Cj4+PiBMZSAxOC8wNS8yMDIx
IMOgIDEzOjM2LCBUaG9tYXMgRGUgU2NoYW1waGVsZWlyZSBhIMOpY3JpdCA6Cj4+Pj4gRnJvbTog
VGhvbWFzIERlIFNjaGFtcGhlbGVpcmUgPHRob21hcy5kZV9zY2hhbXBoZWxlaXJlQG5va2lhLmNv
bT4KPj4+Pgo+Pj4+IFRoZXJlIGFyZSBjYXNlcyB3aGVyZSBhIDY0LWJpdCBhcmNoaXRlY3R1cmUg
aXMgcnVubmluZyBhIDY0LWJpdCBrZXJuZWwgYnV0Cj4+Pj4gMzItYml0IHVzZXJzcGFjZS4gRXhh
bXBsZXMgaW5jbHVkZToKPj4+PiDCoMKgwqDCoCAqIGFhcmNoNjQgYXJjaGl0ZWN0dXJlLCB3aXRo
IGFhcmNoNjQga2VybmVsIGFuZCAzMi1iaXQgKEFSTSkgdXNlcnNwYWNlCj4+Pj4gwqDCoMKgwqAg
KiB4ODZfNjQgYXJjaGl0ZWN0dXJlLCB3aXRoIHg4Nl82NCBrZXJuZWwgYW5kIDMyLWJpdCAoaTM4
NikgdXNlcnNwYWNlCj4+Pgo+Pj4gQ2FuIHlvdSBwcm92aWRlIGEgbmV3IHFlbXUgZGVmY29uZmln
IHRoYXQgY292ZXIgdGhpcyB1c2UgY2FzZT8KPj4+IFRoaXMgaXMgZm9yIGdpdGxhYi1jaSBydW50
aW1lIHRlc3RpbmcuCj4+Pgo+Pj4gQmVzdCByZWdhcmRzLAo+Pj4gUm9tYWluCj4+Pgo+Pj4gUFM6
IChUaGlzIGVtYWlsIGRvZXNuJ3QgY291bnQgYXMgYSByZXZpZXcgb2YgdGhpcyBzZXJpZXMgOikp
Cj4+Cj4+Cj4+IFRoYW5rcyBmb3IgeW91ciBpbnRlcmVzdCBpbiB0aGlzIHNlcmllcyA6LSkKPj4K
Pj4gQ3VycmVudGx5IHRoZSBxZW11IGRlZmNvbmZpZyB0aGF0IEkgdXNlIHVzZXMgYW4gZXh0ZXJu
YWwgdG9vbGNoYWluCj4+IGJ1aWx0IHZpYSBjcm9zc3Rvb2wtbmcuIENyb3NzdG9vbC1uZyBpcyBj
YXBhYmxlIG9mIGNyZWF0aW5nIGEgbXVsdGlsaWIKPj4gdG9vbGNoYWluIHN1cHBvcnRpbmcgMzIt
Yml0IGFuZCA2NC1iaXQgYmluYXJpZXMuCj4+IEhvd2V2ZXIsIEJ1aWxkcm9vdCBkb2VzIG5vdCBj
dXJyZW50bHkgc3VwcG9ydCB0aGlzIGZvciBpbnRlcm5hbAo+PiB0b29sY2hhaW5zLiBIb3cgZG8g
eW91IHN1Z2dlc3QgdG8gcHJvY2VlZCBoZXJlPwo+PiBDb3VsZCB3ZSBwZXJoYXBzIGFkZCBhIGNy
b3NzdG9vbC1uZy1idWlsdCBtdWx0aWxpYiB0b29sY2hhaW4gdG8gdGhlCj4+IEJvb3RsaW4gdG9v
bGNoYWlucz8KPiAKPiDCoEJvb3RsaW4gdG9vbGNoYWlucyBubyAtIHRoZXkgYXJlIGdlbmVyYXRl
ZCBieSBCdWlsZHJvb3QuCgpJbmRlZWQuCgo+IMKgSG93ZXZlciwgaXQgd291bGQgYmUgdXNlZnVs
IHRvIGhhdmUgc3VjaCBhIHRvb2xjaGFpbiBhcyBhbiBhdXRvYnVpbGRlcgo+IHRvb2xjaGFpbi4g
V2UgY291bGQgdXNlIGl0IGJvdGggaW4gYSAzMi1iaXQgYW5kIDY0LWJpdCBjb25maWcuIFdlIGNh
biBzaW1wbHkgYWRkCj4geW91ciBiaW5hcnkgdG8gYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvdG9v
bGNoYWlucy90YXJiYWxscyBhbmQgYWRkIHR3byBjb25maWcKPiBmcmFnbWVudHMgdG8gc3VwcG9y
dC9jb25maWctZnJhZ21lbnRzL2F1dG9idWlsZC4KPiAKPiDCoFRoZSBzYW1lIHRvb2xjaGFpbiB0
YXJiYWxsIGNhbiB0aGVuIGFsc28gYmUgdXNlZCBmb3IgYSBydW50aW1lIHRlc3QuCgpBZ3JlZSwg
YnV0IHdlIGhhdmUgdG8gYmUgYWJsZSB0byByZWJ1aWxkIHRoZW0gd2hlbiBuZWVkZWQuCkEgc2Ny
aXB0IG9yIGEgc2ltcGxlIHRleHQgd291bGQgYmUgb2suCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoK
PiAKPiDCoFJlZ2FyZHMsCj4gwqBBcm5vdXQKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
