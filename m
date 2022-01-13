Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B4FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 07:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3AB541638;
	Thu, 13 Jan 2022 07:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ldexwLxDx_Ct; Thu, 13 Jan 2022 07:02:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3F8E4162F;
	Thu, 13 Jan 2022 07:02:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CEF1F1BF860
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 07:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEB7560BE6
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 07:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFiCSc7LGLog for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 07:02:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AACB360AA2
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 07:02:17 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id 78so3240143vkz.7
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 23:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mzD0C/50rDjOMyf05GnQLNPBtU/uUuLuRWZkzwNBjX4=;
 b=hnkZEwj34POPZgTAAllRthuMEDOs7rAameDmhnAYhEve1KyezypBurBoJzm2Cdch7m
 m1Bzh5oSxRXUQfx5/qWtVXIrEvz7kPkRgNAf3VzICQ0JDeqZIVcNzWK5adSAG37VMUI7
 f6/3bc9Fgrq9HVvlDiPWf5xIhhAJEchgz5arKYzdds88VBc0SZP8pMPyuHYshIXNLUWU
 z16Zfegxd/TlQx1p8CjHhca99exRRg/h6uPVXEvtS2UEG0axjriGJMczYMJht2BZgeBi
 WHR9v0a2c6UN1jNFyMwHLEYttRjvFFc90c+ytAGhf2fwu4NqqyBsxEuZCOZYAasC6K4L
 1T4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mzD0C/50rDjOMyf05GnQLNPBtU/uUuLuRWZkzwNBjX4=;
 b=O2M1TnmgnWyftJAW4T9w3s8+2Inme8Vco4NHm5wRg0WbLfL6IVK7zskaVxwYYMHjmQ
 EicOiuIOYA1EM48cnjHvtKTIccrZ0wMr9wl9BkAyC85hKskFo+wM0/F4f6JWh+H7+0P6
 CPTcu4E/LDm4RaQN47ESLNk7hUdPE0Nyi2f8SAkl7p37/tXlEkMOPUl/qhjhfLE77cUK
 1/H1wA0WLvIBUd3M8sL9W6wNye1v9vKWoF+9zoNUEJUlbqNPjIqGwjwQqTuF3zChiWhA
 yWVFetX9AnzxwC6VApgKgvuwclfBVNx006CfCS62dfzWq4cCq/yB9yH8b7P4WQn8ciZd
 wG1A==
X-Gm-Message-State: AOAM530aUqs2iN/A9rmsmrfIrOjS7RCvXHVj0zFkKzFCci+5dgJ5X/fZ
 kqlRITYRbGSyCrXuBYQ/b9Gwa79PpCiy4ps1U0CPeJM2Bx4=
X-Google-Smtp-Source: ABdhPJy6kKXjq+oAF5yrHa8c55u+RUTYp+2yI84XHXPQFt6iXHvgnIpxshwYr0TzZCIuXGOdyULGiZfqSN80uVjCS3w=
X-Received: by 2002:a1f:1fd3:: with SMTP id f202mr1689871vkf.27.1642057336510; 
 Wed, 12 Jan 2022 23:02:16 -0800 (PST)
MIME-Version: 1.0
References: <20220107222613.4124764-1-james.hilliard1@gmail.com>
 <20220107222613.4124764-4-james.hilliard1@gmail.com>
In-Reply-To: <20220107222613.4124764-4-james.hilliard1@gmail.com>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 13 Jan 2022 08:00:07 +0100
Message-ID: <CAKcgs2w=y6_-JMZc78TenTPPQ7XQvM078zS8LGFfetWSwx_gug@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 4/5] package/sratom: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsIGFsbCwKCgpMZSB2ZW4uIDcgamFudi4gMjAyMiDDoCAyMzoyNywgSmFtZXMgSGls
bGlhcmQKPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IGEgw6ljcml0IDoKPgo+IFNpZ25lZC1v
ZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+IC0tLQo+
ICBERVZFTE9QRVJTICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9Db25maWcuaW4g
ICAgICAgICAgfCAgMSArCj4gIHBhY2thZ2Uvc3JhdG9tL0NvbmZpZy5pbiAgIHwgMTAgKysrKysr
KysrKwo+ICBwYWNrYWdlL3NyYXRvbS9zcmF0b20uaGFzaCB8ICA0ICsrKysKPiAgcGFja2FnZS9z
cmF0b20vc3JhdG9tLm1rICAgfCAyMSArKysrKysrKysrKysrKysrKysrKysKPiAgNSBmaWxlcyBj
aGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Ny
YXRvbS9Db25maWcuaW4KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc3JhdG9tL3NyYXRv
bS5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3NyYXRvbS9zcmF0b20ubWsKPgo+
IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IDZjNmU5M2YwODku
LmY4YWE4MDkyOTQgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMK
PiBAQCAtMTMwMiw2ICsxMzAyLDcgQEAgRjogICAgICAgIHBhY2thZ2UvcHl0aG9uLXlhcmwvCj4g
IEY6ICAgICBwYWNrYWdlL3B5dGhvbi16b3BmbGkvCj4gIEY6ICAgICBwYWNrYWdlL3NlcmQvCj4g
IEY6ICAgICBwYWNrYWdlL3NvcmQvCj4gK0Y6ICAgICBwYWNrYWdlL3NyYXRvbS8KPiAgRjogICAg
IHBhY2thZ2UvemNodW5rLwo+Cj4gIE46ICAgICBKYW1lcyBLbmlnaHQgPGphbWVzLmtuaWdodEBj
b2xsaW5zLmNvbT4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0Nv
bmZpZy5pbgo+IGluZGV4IGE0MzlhNDU2YTQuLjUxYTQxODA1NjkgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL0NvbmZpZy5pbgo+IEBAIC0xMzY5LDYgKzEz
NjksNyBAQCBtZW51ICJBdWRpby9Tb3VuZCIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9zcGFu
ZHNwL0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9zcGVleC9Db25maWcuaW4i
Cj4gICAgICAgICBzb3VyY2UgInBhY2thZ2Uvc3BlZXhkc3AvQ29uZmlnLmluIgo+ICsgICAgICAg
c291cmNlICJwYWNrYWdlL3NyYXRvbS9Db25maWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2th
Z2UvdGFnbGliL0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS90aW55YWxzYS9D
b25maWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvdHJlbW9yL0NvbmZpZy5pbiIKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9zcmF0b20vQ29uZmlnLmluIGIvcGFja2FnZS9zcmF0b20vQ29u
ZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi43NzFlODIw
NzNkCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2Uvc3JhdG9tL0NvbmZpZy5pbgo+IEBA
IC0wLDAgKzEsMTAgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX1NSQVRPTQo+ICsgICAgICAgYm9v
bCAic3JhdG9tIgo+ICsgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0xWMgo+ICsgICAgICAgc2Vs
ZWN0IEJSMl9QQUNLQUdFX1NFUkQKPiArICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9TT1JECj4g
KyAgICAgICBoZWxwCj4gKyAgICAgICAgIFNyYXRvbSBpcyBhIGxpYnJhcnkgZm9yIHNlcmlhbGlz
aW5nIExWMiBhdG9tcyB0byBhbmQgZnJvbQo+ICsgICAgICAgICBSREYsIHBhcnRpY3VsYXJseSB0
aGUgVHVydGxlIHN5bnRheC4KPiArCj4gKyAgICAgICAgIGh0dHBzOi8vZHJvYmlsbGEubmV0L3Nv
ZnR3YXJlL3NyYXRvbS5odG1sCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3JhdG9tL3NyYXRvbS5o
YXNoIGIvcGFja2FnZS9zcmF0b20vc3JhdG9tLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDAwMDAwMDAwMDAuLjY0ZDQ2MGIyZWEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFj
a2FnZS9zcmF0b20vc3JhdG9tLmhhc2gKPiBAQCAtMCwwICsxLDQgQEAKPiArIyBMb2NhbGx5IGNh
bGN1bGF0ZWQgYWZ0ZXIgY2hlY2tpbmcgc2lnbmF0dXJlCj4gKyMgaHR0cHM6Ly9kb3dubG9hZC5k
cm9iaWxsYS5uZXQvc3JhdG9tLTAuNi44LnRhci5iejIuYXNjCj4gK3NoYTI1NiAgM2FjYjMyYjFh
ZGM1YTJiN2ZhY2RhZGUyZTA4MThiY2Q2YzcxZjIzZjg0YTFlYmMxNzgxNWJiN2EwZDJkMDJkZiAg
c3JhdG9tLTAuNi44LnRhci5iejIKPiArc2hhMjU2ICAzZmM0MjlkNmI5NDRmYTIwMzA2MzU3MTk2
YTI4YmI0ZGQ3YzI1ZTJkNjdlZGViZWM3NzFmNDRkZTViZDdmOWU4ICBDT1BZSU5HCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2Uvc3JhdG9tL3NyYXRvbS5tayBiL3BhY2thZ2Uvc3JhdG9tL3NyYXRvbS5t
awo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uZTFlMGY0ZTAzMwo+
IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3NyYXRvbS9zcmF0b20ubWsKPiBAQCAtMCww
ICsxLDIxIEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBzcmF0b20KPiAr
Iwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArU1JBVE9NX1ZFUlNJT04gPSAwLjYu
OAo+ICtTUkFUT01fU0lURSA9IGh0dHBzOi8vZG93bmxvYWQuZHJvYmlsbGEubmV0Cj4gK1NSQVRP
TV9TT1VSQ0UgPSBzcmF0b20tJChTUkFUT01fVkVSU0lPTikudGFyLmJ6Mgo+ICtTUkFUT01fTElD
RU5TRSA9IElTQwo+ICtTUkFUT01fTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiArU1JBVE9NX0RF
UEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiBsdjIgc2VyZCBzb3JkCj4gK1NSQVRPTV9JTlNUQUxM
X1NUQUdJTkcgPSBZRVMKPiArCj4gK1NSQVRPTV9DT05GX09QVFMgKz0gLS1uby1jb3ZlcmFnZQo+
ICsKPiAraWZlcSAoJChCUjJfU1RBVElDX0xJQlMpLHkpCj4gK1NSQVRPTV9DT05GX09QVFMgKz0g
LS1zdGF0aWMgLS1uby1zaGFyZWQKPiArZW5kaWYKPiArCj4gKyQoZXZhbCAkKHdhZi1wYWNrYWdl
KSkKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKClJhbiBjb21waWxhdGlvbiB0ZXN0IG9uIGFybTY0IHdpdGggZXh0ZXJuYWwgdG9vbGNo
YWluLgpBbHNvIHJhbiB0aGUgdGVzdC1wa2cgdXRpbGl0eSB3aGljaCBkaWQgbm90IGdvIHRocm91
Z2ggZm9yIHR3bwpjb25maWd1cmF0aW9ucyBkdWUgdG8gZGVwZW5kZW5jeSBmYWlsdXJlLgpCdXQ6
ClRlc3RlZC1ieTogR2lsbGVzIFRhbGlzIDxnaWxsZXMudGFsaXNAZ21haWwuY29tPgphbnl3YXku
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
