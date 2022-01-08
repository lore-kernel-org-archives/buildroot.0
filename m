Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E222C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB21F60B0C;
	Sat,  8 Jan 2022 15:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0uer928UqCAL; Sat,  8 Jan 2022 15:10:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17791607C9;
	Sat,  8 Jan 2022 15:10:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD5C21BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9EAF40105
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Op9pSHfS7tl for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:10:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 849A740136
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:10:09 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r9so15377202wrg.0
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 07:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nDPoTSJIshNWia8xD932c1Gc53VYttYZ2906W6OOH1w=;
 b=qSP9InK+Xf6fOp7P9SkvkTwpUdv5zefXyu+e9H73a/2t5vlVJLhZJao2YNZkxNUIMP
 5/MaXKymfQ5oE/swF1L3DnCUtMlYXO0h6ZIGGW6WYp9rEgHf/3kw1WipD1ub3I/GF90x
 AwCsuKYWi3c77SRIE6qbXFZUNf3SmEueP+I772wG5zt4XQ6L+U+R0mVKlAxZ73YljQYX
 upShTC5oGLY3lSvgajf2LNtJ0YQ3E+Lc3R12sjS9tLNBJmQx/OPIJUz3+pMl3pr8x8au
 zKpg8hwjupPPurtzbLsaLDOolYmgp4MV38AVDax1Yu2YrutxxT1BHP7EoYCCAlLdpCCL
 jSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nDPoTSJIshNWia8xD932c1Gc53VYttYZ2906W6OOH1w=;
 b=zda3L5jA6DqmOkCPsOAi+Os/ViyAefsVONW0/boWR+2yNMEjh3pRs/HzSTiLz0Wzfd
 f7HXLIY1xxG9ILDxMVG5yzFCrUJtrLRFvI0E3w0sQdqTTszlJg1iltYa1pW18VNUDwFP
 8AHmdPs/ErsSlV4BzzFzFrsz+WARWRumu9zWaS6uyBOkfx4MqXPOT+I30Y/1rGUol6UC
 /BQcVmLVoa3L4E6FuShCqFa1TeoIbD+Ou2SU7br/5w7mt3ISRoAErArtTJjLfAeEXB3O
 H/RI+P6Sqa4X56LkA8LbKEfe1DT6Z/bbkW4eJJRTMKY6VPKM+A8400O6EebPIRSSWuRh
 yjag==
X-Gm-Message-State: AOAM530zFu9B9649YJe6DK+gRdL+sCory+towvWkPkVc+mHcyYmICFYm
 p5M+bIzX9PJ9FZC+xCtZgETjaQ==
X-Google-Smtp-Source: ABdhPJwYWwlXTVZdZsBy1bQl8TSw0TiebOY0gfKxzQB/yX1rOL7O7kamu3iT7MiWk+0B0bYT+EhSEA==
X-Received: by 2002:a05:6000:188a:: with SMTP id
 a10mr57301980wri.423.1641654607758; 
 Sat, 08 Jan 2022 07:10:07 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id e13sm1849898wmq.10.2022.01.08.07.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 07:10:07 -0800 (PST)
Message-ID: <e5361436-d792-e89a-97b1-d833ea390d89@smile.fr>
Date: Sat, 8 Jan 2022 16:10:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: fr
To: Norbert Lange <nolange79@gmail.com>
References: <20201126144745.502228-1-nolange79@gmail.com>
 <06dd49b7-5abc-7a18-2d56-3f69e624e8b7@smile.fr>
 <CADYdroOkabKn=tnfvfbsLyp4MUJfvLWHY1ATJuOErE-whpj9Dg@mail.gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CADYdroOkabKn=tnfvfbsLyp4MUJfvLWHY1ATJuOErE-whpj9Dg@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v3 1/1] package/systemd: add support for
 creating journal catalog DB
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
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDgvMDEvMjAyMiDDoCAxNTozMywgTm9yYmVydCBMYW5nZSBhIMOpY3JpdMKgOgo+IEFtIFNh
LiwgOC4gSmFuLiAyMDIyIHVtIDEyOjU1IFVociBzY2hyaWViIFJvbWFpbiBOYW91ciA8cm9tYWlu
Lm5hb3VyQHNtaWxlLmZyPjoKPj4KWy4uLl0KPj4+Cj4+PiAraWZlcSAoJChCUjJfRU5BQkxFX0xP
Q0FMRV9QVVJHRSkseSkKPj4+ICtkZWZpbmUgU1lTVEVNRF9MT0NBTEVfUFVSR0VfQ0FUQUxPR1MK
Pj4+ICsgICAgICMgZ28gdGhyb3VnaCBhbGwgZmlsZXMgd2l0aCBzY2hlbWUgPGJhc2VuYW1lPi48
bGFuZ2V4dD4uY2F0YWxvZwo+Pj4gKyAgICAgIyBhbmQgcmVtb3ZlIHRob3NlIHdoZXJlIDxsYW5n
ZXh0PiBpcyBub3QgaW4gTE9DQUxFX05PUFVSR0UKPj4+ICsgICAgIGZvciBjZmlsZSBpbiBgZmlu
ZCAkKFRBUkdFVF9ESVIpL3Vzci9saWIvc3lzdGVtZC9jYXRhbG9nIC1uYW1lICcqLiouY2F0YWxv
ZydgOyBcCj4+Cj4+IFdoeSBub3QgInN5c3RlbWQuKi5jYXRhbG9nIiA/Cj4+Cj4+IE9uIG15IHN5
c3RlbSwgYWxsIGNhdGFsb2cgZmlsZXMgd2l0aCA8bGFuZ2V4dD4gYXJlIG5hbW1lZCBzdGFydGlu
ZyB3aXRoICJzeXN0ZW1kLiIKPiAKPiBDYXVzZSB0aGUgaWRlYSBpcyB0aGF0IG90aGVyIHBhY2th
Z2VzIGNvdWxkIGV4dGVuZCBsb2cgbWVzc2FnZXMgYnkKPiBkcm9wcGluZyBjYXRhbG9ncyB0aGVy
ZSwKPiB0aGVyZSBtaWdodCBiZSBhIGRidXMtYnJva2VyLmNhdGFsb2cgZm9yIGV4YW1wbGUsIHNl
ZSBbMV0uCgpkYnVzLWJyb2tlci5jYXRhbG9nIGRvZXNuJ3QgbWF0Y2ggdGhlIGZpbmQgcmVnZXgg
JyouKi5jYXRhbG9nJywgdGhpcyBmaWxlIGlzIG5vdApyZW1vdmVkLgoKPiAKPj4KPj4+ICsgICAg
IGRvIFwKPj4+ICsgICAgICAgICAgICAgYmFzZW5hbWU9JCR7Y2ZpbGUjIyovfTsgXAo+Pj4gKyAg
ICAgICAgICAgICBiYXNlbmFtZT0kJHtiYXNlbmFtZSUuY2F0YWxvZ307IFwKPj4+ICsgICAgICAg
ICAgICAgbGFuZ2V4dD0kJHtiYXNlbmFtZSMqLn07IFwKPj4+ICsgICAgICAgICAgICAgWyAiJCRs
YW5nZXh0IiA9ICIkJHtiYXNlbmFtZX0iIF0gJiYgY29udGludWU7IFwKPj4+ICsgICAgICAgICAg
ICAgZXhwciAnJChMT0NBTEVfTk9QVVJHRSknIDogIi4qXGIkJHtsYW5nZXh0fVxiIiA+L2Rldi9u
dWxsICYmIGNvbnRpbnVlOyBcCj4+PiArICAgICAgICAgICAgIHJtIC1mICIkJGNmaWxlIjsgXAo+
Pj4gKyAgICAgZG9uZQo+Pj4gK2VuZGVmCj4+PiArCj4+PiArU1lTVEVNRF9ST09URlNfUFJFX0NN
RF9IT09LUyArPSBTWVNURU1EX0xPQ0FMRV9QVVJHRV9DQVRBTE9HUwo+Pj4gK2VuZGlmCj4+PiAr
Cj4+PiAraWZlcSAoJChCUjJfUEFDS0FHRV9TWVNURU1EX0NBVEFMT0dEQikseSkKPj4+ICtkZWZp
bmUgU1lTVEVNRF9VUERBVEVfQ0FUQUxPR1MKPj4+ICsgICAgICQoSE9TVF9ESVIpL2Jpbi9qb3Vy
bmFsY3RsIC0tcm9vdD0kKFRBUkdFVF9ESVIpIC0tdXBkYXRlLWNhdGFsb2cKPj4+ICsgICAgIGlu
c3RhbGwgLUQgJChUQVJHRVRfRElSKS92YXIvbGliL3N5c3RlbWQvY2F0YWxvZy9kYXRhYmFzZSBc
Cj4+PiArICAgICAgICAgICAgICQoVEFSR0VUX0RJUikvdXNyL3NoYXJlL2ZhY3RvcnkvdmFyL2xp
Yi9zeXN0ZW1kL2NhdGFsb2cvZGF0YWJhc2UKPj4+ICsgICAgIHJtICQoVEFSR0VUX0RJUikvdmFy
L2xpYi9zeXN0ZW1kL2NhdGFsb2cvZGF0YWJhc2UKPj4+ICsgICAgIGxuIC1zZiAvdXNyL3NoYXJl
L2ZhY3RvcnkvdmFyL2xpYi9zeXN0ZW1kL2NhdGFsb2cvZGF0YWJhc2UgXAo+Pj4gKyAgICAgICAg
ICAgICAkKFRBUkdFVF9ESVIpL3Zhci9saWIvc3lzdGVtZC9jYXRhbG9nL2RhdGFiYXNlCj4+PiAr
ICAgICBncmVwIC1xICdeTCAvdmFyL2xpYi9zeXN0ZW1kL2NhdGFsb2cvZGF0YWJhc2UnICQoVEFS
R0VUX0RJUikvdXNyL2xpYi90bXBmaWxlcy5kL3Zhci5jb25mIHx8IFwKPj4+ICsgICAgICAgICAg
ICAgcHJpbnRmICJcbkwgL3Zhci9saWIvc3lzdGVtZC9jYXRhbG9nL2RhdGFiYXNlXG4iID4+ICQo
VEFSR0VUX0RJUikvdXNyL2xpYi90bXBmaWxlcy5kL3Zhci5jb25mCj4+PiArZW5kZWYKPj4+ICsK
Pj4+ICtTWVNURU1EX1JPT1RGU19QUkVfQ01EX0hPT0tTICs9IFNZU1RFTURfVVBEQVRFX0NBVEFM
T0dTCj4+PiArZW5kaWYKPj4+ICsKPj4+ICtkZWZpbmUgU1lTVEVNRF9STV9DQVRBTE9HX1VQREFU
RV9TRVJWSUNFCj4+PiArICAgICBybSAtcmYgJChUQVJHRVRfRElSKS91c3IvbGliL3N5c3RlbWQv
Y2F0YWxvZyBcCj4+Cj4+IFNvIHdlIHJlbW92ZSB0aGlzIGRpcmVjdG9yeS4KPj4KPj4gV2h5IGFk
ZGluZyBTWVNURU1EX0xPQ0FMRV9QVVJHRV9DQVRBTE9HUyB0aGVuID8KPiAKPiBUaGUgb3JkZXIg
aXMgcmVsZXZhbnQsIGFzc3VtaW5nIExPQ0FMRV9OT1BVUkdFID0gZGUsIHRoZW4KPiAKPiAtIGZp
cnN0IHJlbW92ZSB0aGUgc291cmNlLWZpbGVzIGZvciBvdGhlciBsYW5ndWFnZXMKPiAoU1lTVEVN
RF9MT0NBTEVfUFVSR0VfQ0FUQUxPR1MpCj4gLSB0aGVuIGJ1aWxkIGFuZCBpbnN0YWxsIHRoZSBk
YXRhYmFzZSBmcm9tIHRoZSBzb3VyY2UtZmlsZXMgd2l0aCB0aGUKPiBjaG9zZW4gbGFuZ3VhZ2Vz
Cj4gLSB0aGVuIHJlbW92ZSBhbGwgbGFuZ3VhZ2Ugc291cmNlLWZpbGVzCgpPaywgbWF5YmUgYSBj
b21tZW50IHdvdWxkIGJlIG5lY2Vzc2FyeSBoZXJlLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4g
Cj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gUm9tYWluCj4+Cj4+Cj4+PiArICAgICAgICAgICAgICQo
VEFSR0VUX0RJUikvdXNyL2xpYi9zeXN0ZW1kL3N5c3RlbS9zeXN0ZW1kLWpvdXJuYWwtY2F0YWxv
Zy11cGRhdGUuc2VydmljZSBcCj4+PiArICAgICAgICAgICAgICQoVEFSR0VUX0RJUikvdXNyL2xp
Yi9zeXN0ZW1kL3N5c3RlbS8qL3N5c3RlbWQtam91cm5hbC1jYXRhbG9nLXVwZGF0ZS5zZXJ2aWNl
Cj4+PiArZW5kZWYKPj4+ICsKPj4+ICtTWVNURU1EX1JPT1RGU19QUkVfQ01EX0hPT0tTICs9IFNZ
U1RFTURfUk1fQ0FUQUxPR19VUERBVEVfU0VSVklDRQo+Pj4gKwo+Pj4gIGRlZmluZSBTWVNURU1E
X1BSRVNFVF9BTEwKPj4+ICAgICAgICQoSE9TVF9ESVIpL2Jpbi9zeXN0ZW1jdGwgLS1yb290PSQo
VEFSR0VUX0RJUikgcHJlc2V0LWFsbAo+Pj4gIGVuZGVmCj4+Pgo+Pgo+IAo+IE5vcmJlcnQKPiAK
PiBbMV0gLSBodHRwczovL2dpdGh1Yi5jb20vYnVzMS9kYnVzLWJyb2tlci90cmVlL21haW4vc3Jj
L2NhdGFsb2cKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
