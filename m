Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708D0C00528
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 22:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 022B682068;
	Wed,  2 Aug 2023 22:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 022B682068
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lFl59lSQeDwG; Wed,  2 Aug 2023 22:12:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CA1480FAA;
	Wed,  2 Aug 2023 22:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CA1480FAA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CC7B1BF2F8
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 22:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A406341508
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 22:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A406341508
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vo4MJ3-CwiHa for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 22:12:36 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38C72404C1
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 22:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38C72404C1
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fe1fc8768aso3607925e9.1
 for <buildroot@buildroot.org>; Wed, 02 Aug 2023 15:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691014354; x=1691619154;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YxSrdcLPkXOk4oT/w21laHWOLkx6M5lQUK45wqUJgdw=;
 b=SKTH4aAng6r0Crh2zlZ8YetpUAYQm0ywLPAWLWdMXiM2bvYInmnK/agfwi0nS6STLN
 cRx1VNyQ/37pDxxEiBPEaYF1jN26NygqbW87buEOAjmZWk/8puQoYSAgtR/8pbU5ehDq
 LiAh6V7ragfZZaa9PCf0W5oWdCFG4c5M6tWY1pNsCCSiyM06S/jNduLCVDm5Teapm6Fi
 u2ZkSTPxo/Vdhwlt0iYra9pwLgJ8nJmBfvANKwvLOZ4LZcMxzARX+KWnQnISqDi4FqJb
 pPMDXn6clxs2NKZdLijkXmt2lrNuLGPHhnr1XFbNjQEjbSUGqJAtnBsj6+XnYOVfazZW
 Ra8A==
X-Gm-Message-State: ABy/qLaNwf7UYAJJM7x6HYQaVvzhtzH0Iqrx6OxdzuPfRafk6nqHkHdq
 3avUWLxeQoYN91CrLHvtim845A==
X-Google-Smtp-Source: APBJJlFHDG3Q6ix9trgEinfvb17dsWYKu6rwMEEJtDFGqDE2MTfSwSDUQepyYfFdDsyrLV7ivgfyZg==
X-Received: by 2002:a05:600c:2159:b0:3fe:22a9:900 with SMTP id
 v25-20020a05600c215900b003fe22a90900mr6234231wml.3.1691014353769; 
 Wed, 02 Aug 2023 15:12:33 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:eeca:726b:991c:1980?
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a5d524e000000b0030fd03e3d25sm20108627wrc.75.2023.08.02.15.12.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 15:12:33 -0700 (PDT)
Message-ID: <ba3a6c60-333b-8df3-11fc-e71a2198f129@smile.fr>
Date: Thu, 3 Aug 2023 00:12:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20230729065616.961984-1-james.hilliard1@gmail.com>
 <20230731212049.10b538fd@windsurf>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230731212049.10b538fd@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1691014354; x=1691619154;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YxSrdcLPkXOk4oT/w21laHWOLkx6M5lQUK45wqUJgdw=;
 b=adL1a/9AE4iPx2fSrZw8V6VvqiERwwJyMBTgk6S9D47m48mEWTQzuvH9QFiDeQ196n
 0h9DPBdVuvyUmKgq8by9GXBiC6M+TUcpvzkQwnrxMThZ/BYn5Tt3sAnUzRo1XvvkUoQu
 P8WYNDBUmEOzmhcaLOeUYKttcRhVDcmxikbS09H6Fzc3O3Nw/4vrknErmDZ/h+3xFV0t
 MgdFSH2C9fT2DwBtyvtdZ0ohsefxoAc63V6S7fn7Nu/O/w5iDTsnCxJrxxeeT3F4uyup
 5qRHp1m67Gf+YloLcB8GZf7zNnP9x5BA8nc9GyVdIOjCQSgJaFKAqnby96YjbmaciChA
 +vsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=adL1a/9A
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: bump to version 254
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsIFRob21hcywgWWFubiwgQWxsLAoKTGUgMzEvMDcvMjAyMyDDoCAyMToyMCwg
VGhvbWFzIFBldGF6em9uaSBhIMOpY3JpdMKgOgo+IEhlbGxvIEphbWVzLAo+IAo+IE9uIFNhdCwg
MjkgSnVsIDIwMjMgMDA6NTY6MTYgLTA2MDAKPiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlh
cmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4+IFJFQURNRS5tZCBoYXNoIGNoYW5nZWQgZHVlIHRv
IHN5bnRheCBmaXg6Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQtc3RhYmxl
L2NvbW1pdC80OWRkYjQ3NTdiMTk3YjMwMzMwOWIwZGNkZmM1Zjg1OGY0YjhlMTY4Cj4+Cj4+IFJl
bW92ZSBubyBsb25nZXIgc3VwcG9ydGVkL3JlcXVpcmVkIHZhbGdyaW5kIGNvbmZpZyBvcHRpb24u
Cj4+Cj4+IERpc2FibGUgbmV3IHVuc3VwcG9ydGVkIHBhc3N3ZHFjIGNvbmZpZyBvcHRpb24uCj4+
Cj4+IERpc2FibGUgbmV3IHVuc3VwcG9ydGVkIHVraWZ5IGNvbmZpZyBvcHRpb24uCj4+Cj4+IERp
c2FibGUgbmV3IHVuc3VwcG9ydGVkIHhlbmN0cmwgY29uZmlnIG9wdGlvbi4KPj4KPj4gVXBkYXRl
IHN5c3RlbWQtYm9vdCBjb25maWcgb3B0aW9ucyB0byBuZXcgZm9ybWF0Lgo+Pgo+PiBBZGQgbmV3
IGhvc3QtcHl0aG9uLXB5ZWxmdG9vbHMgc3lzdGVtZC1ib290IGRlcGVuZGVuY3kuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+
PiAtLS0KPj4gIHBhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLmhhc2ggfCAgNCArKy0tCj4+ICBwYWNr
YWdlL3N5c3RlbWQvc3lzdGVtZC5tayAgIHwgMjkgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0p
Cj4gCj4gSSBhbSBnZXR0aW5nIGJhY2sgdG8geW91IHJlZ2FyZGluZyB0aGlzIHZlcnNpb24gYnVt
cC4gRGlkIHlvdSBydW4gdGhlCj4gc3lzdGVtZCB0ZXN0IGNhc2VzIGluIHN1cHBvcnRpbmcvdGVz
dGluZyBhZnRlciBkb2luZyB0aGlzIHZlcnNpb24gYnVtcD8KPiAKPiBJbmRlZWQsIGl0IHNlZW1z
IGxpa2UgdGhlIHN5c3RlbWQgdGVzdCBjYXNlcyBhcmUgbm8gYnJva2VuLiBTZWUKPiBodHRwczov
L2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9waXBlbGluZXMvOTUwMTc1MDc3
L2ZhaWx1cmVzCj4gZm9yIHRoZSBmdWxsIGxpc3Qgb2YgZmFpbGVkIGNhc2VzIChhIG51bWJlciBh
cmUgbm90IHN5c3RlbWQgcmVsYXRlZCwKPiBhbmQgbm90IHJlbGV2YW50IGhlcmUsIGJ1dCBtYW55
IGFyZSBzeXN0ZW1kIHJlbGF0ZWQpLgo+IAo+IEkgbG9va2VkIGF0IG9ubHkgb25lLCBhbmQgdGhl
IGZhaWx1cmUgaGFwcGVucyBhdCBydW50aW1lIGFuZCBnb2VzIGxpa2UKPiB0aGlzOgo+IAo+ICMg
c3lzdGVtY3RsIC0tbm8tcGFnZXIgLS1mYWlsZWQgLS1uby1sZWdlbmQKPiDil48gc3lzdGVtZC12
Y29uc29sZS1zZXR1cC5zZXJ2aWNlIGxvYWRlZCBmYWlsZWQgZmFpbGVkIFZpcnR1YWwgQ29uc29s
ZSBTZXR1cAo+ICMgZWNobyAkPwo+IDAKPiAKPiBJIGhhdmVuJ3QgY2hlY2tlZCB0aGUgb3RoZXIg
ZmFpbHVyZXMuIENvdWxkIHlvdSBoYXZlIGEgbG9vayBhdCBmaXggdGhlCj4gaXNzdWU/CgpUaGVy
ZSBpcyBvbmUgKGhvcGVmdWxseSkgcmVtYWluaW5nIGlzc3VlIHJlbGF0ZWQgdG8gc3lzdGVtZCB2
MjU0CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzQ3
Njg1NjE0NjQgKFRlc3RQb2xraXRTeXN0ZW1kKQoKU29tZXRoaW5nIGNoYW5nZWQgaW4gc3lzdGVt
ZCBiZWNhdXNlIHRoZSByZXR1cm4gY29kZSBvZiAic3UgYnJ0ZXN0IC1jCicvYmluL3N5c3RlbWN0
bCByZXN0YXJ0IHN5c3RlbWQtdGltZXN5bmNkLnNlcnZpY2UiIGNoYW5nZWQgZnJvbSAxIHRvIDQu
CgpJbmRlZWQsIHRoZSBsb2cgc2VlbXMgZGlmZmVyZW50OgoKc3lzdGVtZCB2MjUzOgpGYWlsZWQg
dG8gcmVzdGFydCBzeXN0ZW1kLXRpbWVzeW5jZC5zZXJ2aWNlOiBJbnRlcmFjdGl2ZSBhdXRoZW50
aWNhdGlvbiByZXF1aXJlZC4KCnN5c3RlbWQgdjI1NDoKRmFpbGVkIHRvIHJlc3RhcnQgc3lzdGVt
ZC10aW1lc3luY2Quc2VydmljZTogQWNjZXNzIGRlbmllZAoKZ2l0IGJpc2VjdCByZXBvcnQgdGhp
cyBjb21taXQ6Cmh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvY29tbWl0Lzk1OTMw
MWNmOWY0MjQxODMxNGFiZjAyNzE4M2RjMjVjMDg3MzFiODIKCkZyb20gdGhlIFBSICh0byBnZXQg
bW9yZSBjb250ZXh0KToKaHR0cHM6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC9wdWxsLzI2
MzY1CgpJJ20gbm90IHN1cmUgaWYgaXQncyBleHBlY3RlZCBvciBub3QuLgoKT3RoZXJ3aXNlIHdl
IGhhdmUgdG8gZG8gYSAib25lIGNoYXJhY3RlciBjaGFuZ2UiIGluIFRlc3RQb2xraXRTeXN0ZW1k
OgoKICBjbWQgPSAic3UgYnJ0ZXN0IC1jICcvYmluL3N5c3RlbWN0bCByZXN0YXJ0IHN5c3RlbWQt
dGltZXN5bmNkLnNlcnZpY2UnIgogIF8sIGV4aXRfY29kZSA9IHNlbGYuZW11bGF0b3IucnVuKGNt
ZCwgMTApCiAgc2VsZi5hc3NlcnRFcXVhbChleGl0X2NvZGUsIDEpCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXl5eCnVwZGF0ZSB0byA0ID8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAK
PiBUaGFua3MgYSBsb3QhCj4gCj4gVGhvbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
