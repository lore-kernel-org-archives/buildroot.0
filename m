Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4082DC7EE22
	for <buildroot@archiver.kernel.org>; Wed, 10 May 2023 10:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A438415FE;
	Wed, 10 May 2023 10:06:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A438415FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ds8jJKMGnaV9; Wed, 10 May 2023 10:06:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46162415D6;
	Wed, 10 May 2023 10:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46162415D6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38FA31BF314
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 10:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1191860D53
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 10:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1191860D53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yGiZjkb82TCW for <buildroot@lists.busybox.net>;
 Wed, 10 May 2023 10:06:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4763B60BFE
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4763B60BFE
 for <buildroot@buildroot.org>; Wed, 10 May 2023 10:06:30 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-30771c68a9eso6262975f8f.2
 for <buildroot@buildroot.org>; Wed, 10 May 2023 03:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683713188; x=1686305188;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=udO3YUzmVvby4bNRvzL5zoqDemmP8EKxijS9sNvVtFs=;
 b=NZR5imXTRCiXUG9a27GZENohDIQa1ghDAjwCiqXhllEiCQ8LMrfuBUxU3+Q466z2UX
 our2L+KeWTgXx2coRkNk0OV4dIX2vEzMtwGfcfnwdr9/N1gyuGO31ds8Pe8DOXAg9jFd
 qBP8KXzwEkhVCohE/bF+kVkmHGv+A5NsvcOUmiZyAq6HOpt20LhFevqu/AJs3lwmDni4
 T6vjxo0EKzSX9wAz8VE399GUxacPXTSCpQZ+A3quhfubUEaPAKZ32MduIZIhKY9PhabT
 wjeuPvM3LzSjZqRusZfyITKLDP1o40JrvL+3reajrr4K/ivLn2RRQc/bQzQU841U+zKq
 +Ivw==
X-Gm-Message-State: AC+VfDwBPqwOCGrsgJiZ7iYxdDyvPbF/W41meWKAECqLbo5Z5lMEaFpE
 pMmcsooV6q5OjJbMWuZWfz6hqQ==
X-Google-Smtp-Source: ACHHUZ47e6s+mVYK15csUmcVQWxxzSeBxZMib+i4X9q4ffWW+ynOsdNQp15C+qDiHrDBVef8Wb84KA==
X-Received: by 2002:a5d:62c1:0:b0:307:8548:f793 with SMTP id
 o1-20020a5d62c1000000b003078548f793mr11429441wrv.53.1683713188050; 
 Wed, 10 May 2023 03:06:28 -0700 (PDT)
Received: from [10.5.2.122]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 j10-20020adff54a000000b00304b5b2f5ffsm16918081wrp.53.2023.05.10.03.06.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 03:06:27 -0700 (PDT)
Message-ID: <628684a7-6ad9-1055-ad0b-065761105349@smile.fr>
Date: Wed, 10 May 2023 12:06:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20230210233658.3763549-1-romain.naour@gmail.com>
 <20230211104934.4c34267c@windsurf>
 <7bbd1030-488a-9876-7c69-0ac6ae15653e@smile.fr>
In-Reply-To: <7bbd1030-488a-9876-7c69-0ac6ae15653e@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1683713188; x=1686305188;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=udO3YUzmVvby4bNRvzL5zoqDemmP8EKxijS9sNvVtFs=;
 b=fyjoAc8VjYLUxOaE+dbetHYMnFc5+kq1d+QM+gN2RehUF/s3MW6dbF63UChmuu/q6t
 yaQP1vYDih8Ejuvg0EIgw49pRqaoA/zNnixondVqcoWuHL+oKMkNVR03bG1fxiF3Nz7J
 tyFUN3mCYchIo72fWk9OH+XFQyQoIdizHjwcDzFjmU+EIdD5S/RBV+1U+zHpBJiG24aj
 kW4pFkLiiEQ4AZnbbnzyJcnWf/968UY5Qclo9j/XbirJyA/IHJDg6B26d99EK7M6h0Gf
 N5oCX97ObBhxDpXhMhQ+hXCWmaN8WnceifEcznApXkhY6igAUyHUh7z5T3JkUJVD60G1
 GDQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=fyjoAc8V
Subject: Re: [Buildroot] [PATCH] package/busybox: disable stack optimization
 for i386 target
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAxMS8wMi8yMDIzIMOgIDExOjEwLCBSb21haW4gTmFvdXIg
YSDDqWNyaXTCoDoKPiBIZWxsbyBUaG9tYXMsCj4gCj4gTGUgMTEvMDIvMjAyMyDDoCAxMDo0OSwg
VGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4+IE9uIFNhdCwgMTEg
RmViIDIwMjMgMDA6MzY6NTggKzAxMDAKPj4gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21h
aWwuY29tPiB3cm90ZToKPj4KPj4+IFRoZSB0b29sY2hhaW4tYnVpbGRlciBwcm9qZWN0IHJlcG9y
dGVkIGFuIGlzc3VlIHdpdGggUWVtdSA3LjIuMCBmb3IKPj4+IHg4Ni1jb3JlMi0tZ2xpYmMtLWJs
ZWVkaW5nLWVkZ2UgdG9vbGNoYWluIFsxXToKPj4+Cj4+PiAgIFJ1biAvc2Jpbi9pbml0IGFzIGlu
aXQgcHJvY2Vzcwo+Pj4gICByYW5kb206IGZhc3QgaW5pdCBkb25lCj4+PiAgIEVYVDQtZnMgKHZk
YSk6IHdhcm5pbmc6IG1vdW50aW5nIHVuY2hlY2tlZCBmcywgcnVubmluZyBlMmZzY2sgaXMgcmVj
b21tZW5kZWQKPj4+ICAgRVhUNC1mcyAodmRhKTogcmUtbW91bnRlZC4gT3B0czogKG51bGwpLiBR
dW90YSBtb2RlOiBkaXNhYmxlZC4KPj4+ICAgU3RhcnRpbmcgc3lzbG9nZDogT0sKPj4+ICAgdHJh
cHM6IHN5c2xvZ2RbNTJdIGdlbmVyYWwgcHJvdGVjdGlvbiBmYXVsdCBpcDpiN2UyMTQ2NSBzcDpi
ZmU1OWU2YyBlcnJvcjowIGluIGxpYmMuc28uNltiN2Q5YjAwMCsxMjMwMDBdCj4+PiAgIFN0YXJ0
aW5nIGtsb2dkOiBPSwo+Pj4gICB0cmFwczoga2xvZ2RbNTZdIGdlbmVyYWwgcHJvdGVjdGlvbiBm
YXVsdCBpcDpiN2U5NDQ2NSBzcDpiZjhmMDY5YyBlcnJvcjowIGluIGxpYmMuc28uNltiN2UwZTAw
MCsxMjMwMDBdCj4+PiAgIFJ1bm5pbmcgc3lzY3RsOiB0cmFwczogbG9nZ2VyWzYyXSBnZW5lcmFs
IHByb3RlY3Rpb24gZmF1bHQgaXA6YjdlNDhiNmMgc3A6YmZkN2QxOTQgZXJyb3I6MCBpbiBsaWJj
LnNvLjZbYjdlMDUwMDArMTIzMDAwXQo+Pj4gICBTZWdtZW50YXRpb24gZmF1bHQKPj4+ICAgdHJh
cHM6IGxvZ2dlcls2NF0gZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0IGlwOmI3ZGQzYjZjIHNwOmJm
OWI4NjA0IGVycm9yOjAgaW4gbGliYy5zby42W2I3ZDkwMDAwKzEyMzAwMF0KPj4+ICAgU2VnbWVu
dGF0aW9uIGZhdWx0Cj4+Pgo+Pj4gICAoRm9sbG93ZWQgYnkgYSBrZXJuZWwgcGFuaWMuKQo+Pj4K
Pj4+IFRlc3Rpbmcgd2l0aCB0aGUgcGV2aW91cyBRZW11IHJlbGVhc2UgKDcuMS4wKSBhbGxvd3Mg
dG8gYm9vdCB0aGUgc3lzdGVtIHdpdGhvdXQgYW55IHByb2JsZW0uCj4+Pgo+Pj4gQnVpbGRpbmcg
cWVtdSBzb3VyY2VzIGJldHdlZW4gNy4xLjAgYW5kIDcuMi4wIGFsbG93cyB0byBpZGVudGlmeSB0
aGUgZmlyc3QgImJhZCIgY29tbWl0IFsyXSBhbmQKPj4+IHJlcG9ydCB0byB0aGUgUWVtdSBwcm9q
ZWN0IFszXS4KPj4+Cj4+PiBUaGFua3MgdG8gUWVtdSBtYWludGFpbmVycyByZXZpZXcsIHNldmVy
YWwgaXNzdWVzIHdhcyBub3RpY2VkOgo+Pj4KPj4+ICAgIlRoZSBkZWZhdWx0IGkzODYgYnVzeWJv
eCBidWlsZCBjb25maWcgZG9lcyBub3QgcmVzcGVjdCBnbGliYydzIHJlcXVpcmVtZW50cyBhcm91
bmQgc3RhY2sgYWxpZ25tZW50Cj4+PiAgIChzZWUgWzRdIGZvciBwcmV2aW91cyBkaXNjdXNzaW9u
cyBhbmQgYSB3b3JrYXJvdW5kKS4iCj4+Pgo+Pj4gRGlzYWJsaW5nIENPTkZJR19TVEFDS19PUFRJ
TUlaQVRJT05fMzg2IG9wdGlvbiAoYXMgc3VnZ2VzdGVkIGluIHRoZSBHZW50b28gYnVnIHJlcG9y
dCkgZml4ZWQgdGhlIGlzc3VlIQo+Pj4KPj4+IFRoaXMgb3B0aW9uIGhhcyBiZWVuIGFkZGVkIGFu
ZCBlbmFibGVkIGJ5IGRlZmF1bHQgaW4gYnV4eWJveCAxXzI5XzAsIHNvIGl0IHdhcyB1c2VkIHNp
bmNlIHRoZW4gdGhlIGZvcgo+Pj4gQnVpbGRyb290J3MgcWVtdSBkZWZjb25maWcuCj4+Pgo+Pj4g
Tm90ZTogVGhlIHg4Ni1pNjg2LS1nbGliYy0tYmxlZWRpbmctZWRnZSAoZ2VuZXJpYyB4ODYpIGRv
ZXNuJ3QgdHJpZ2dlciB0aGUgaXNzdWUgd2l0aAo+Pj4gQ09ORklHX1NUQUNLX09QVElNSVpBVElP
Tl8zODYgZW5hYmxlZC4KPj4+Cj4+PiBGaXhlczoKPj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWls
ZHJvb3Qub3JnL3Rvb2xjaGFpbnMtYnVpbGRlci8tL2pvYnMvMzczMTY4MzMzNwo+Pj4KPj4+IFsx
XSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy90b29sY2hhaW5zLWJ1aWxkZXIvLS9q
b2JzLzM3MzE2ODMzMzcKPj4+IFsyXSBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3Fl
bXUvLS9jb21taXQvOTU4ZTFkZDEzMDBmMzdmMThiMjE2MWRmYjRlYjgwNmZjOGMxOWI0NAo+Pj4g
WzNdIGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2lzc3Vlcy8xNDc4Cj4+
PiBbNF0gaHR0cHM6Ly9idWdzLmdlbnRvby5vcmcvNzI1Njc0Cj4+Cj4+IFRoYW5rcyBhIGxvIGZv
ciB0aGUgZ3JlYXQgaW52ZXN0aWdhdGlvbi4gRG8gd2UgdW5kZXJzdGFuZCBwcmVjaXNlbHkKPj4g
d2hhdCBpcyBoYXBwZW5pbmc/IFRoZSBsaW5rIGF0IFs0XSBkb2VzIG5vdCByZWFsbHkgaGF2ZSBh
biBleHBsYW5hdGlvbiwKPj4gaXQgb25seSBoYXMgZXhwZXJpbWVudGFsIG9ic2VydmF0aW9ucyB0
aGF0IGxlYWQgdG8gdGhlIGNvbmNsdXNpb24gdGhhdAo+PiBkaXNhYmxpbmcgQ09ORklHX1NUQUNL
X09QVElNSVpBVElPTl8zODYgaXMgYSB3b3JrLWFyb3VuZCwgYnV0IGl0IGRvZXMKPj4gbm90IHJl
YWxseSBleHBsYWluIHdoYXQgaXMgaGFwcGVuaW5nLgo+IAo+IEFjdHVhbGx5IHRoZXJlIGFyZSB0
d28gZGlmZmVyZW50IGlzc3VlcyB0aGF0IGNvbnRyaWJ1dGUgdG8gdGhpcyBpc3N1ZToKPiAKPiAx
KSBBbiBleGlzdGluZyBsYXRlbnQgQnVzeWJveCBidWcgb24gaTM4NiAoYnVzeWJveCBjb21waWxl
ZCB3aXRoCj4gLW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9MikKPiAKPiBodHRwczovL2xpc3Rz
LmRlYmlhbi5vcmcvZGViaWFuLWJvb3QvMjAxOC8wMS9tc2cwMDM1Mi5odG1sCj4gCj4gMikgQSBR
ZW11IGltcHJvdmVtZW50IHRoYXQgdHJpZ2dlciBhbiBleGNlcHRpb24gb24gdW5hbGlnbmVkIG1l
bW9yeSBhY2Nlc3Nlcwo+IHRoYXQgcmVxdWlyZSAxNi1ieXRlIGFsaWdubWVudC4KPiAKPiBodHRw
czovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9jb21taXQvOTU4ZTFkZDEzMDBmMzdm
MThiMjE2MWRmYjRlYjgwNmZjOGMxOWI0NAo+IAo+IEkgZGlkbid0IGRpZ2dpbmcgZnVydGhlciB0
aGUgcm9vdCBjYXVzZSBvZiB0aGUgaXNzdWUuCgpTZXZlcmFsIGJ1ZyByZXBvcnQgYXJlIGNvbmZp
cm1pbmcgYSBzdGFjayBwcm9ibGVtIGR1ZSB0byB0aGUgaTM4NiBHQ0MgQUJJIHdoaWNoCmFzc3Vt
ZXMgdGhlIHN0YWNrIGlzIDE2LWJ5dGUgYWxpZ25lZCBbMV0gWzJdLiBUaGUgZ2NjJ3MgZGVmYXVs
dCBBQkkgZm9yCmkzODYtbGludXgtZ251IHdhcyBxdWlldGx5IGNoYW5nZWQgWzNdIChtYXliZSBi
ZXR3ZWVuIGdjYyA5IGFuZCBnY2MgMTApLgoKTm90ZTogV2hlbiB0aGUgb3B0aW9uIHdhcyBhZGRl
ZCB0byBCdXN5Ym94IGFuZCBlbmFibGVkIGJ5IGRlZmF1bHQsIHRoZSBoZWxwIHRleHQKZXhwbGFp
bnMgdGhhdCB0aGlzIG9wdGlvbiBtYXkgbm90IHdvcmsgd2l0aCBzb21lIGxpYmMgdmVyc2lvbnM6
CgoiVGhpcyBvcHRpb24gbWFrZXMgZm9yIHNtYWxsZXIgY29kZSwgYnV0IHNvbWUgbGliYyB2ZXJz
aW9ucwpkbyBub3Qgd29yayB3aXRoIGl0ICh0aGV5IHVzZSBTU0UgaW5zdHJ1Y3Rpb25zIHdpdGhv
dXQKZW5zdXJpbmcgc3RhY2sgYWxpZ25tZW50KS4iCgpUaGlzIHByb2JsZW0gYnJlYWsgdGhlIHRl
c3Qgb2YgdGhlIHg4NiBjb3JlMiB0b29sY2hhaW4gb24gdG9vbGNoYWluLWJ1aWxkZXIuCgpbMV0g
aHR0cHM6Ly9idWdzLmdlbnRvby5vcmcvNzI1Njc0I2MzMApbMl0gaHR0cHM6Ly9saXN0cy5kZWJp
YW4ub3JnL2RlYmlhbi1ib290LzIwMTgvMDEvbXNnMDAzNTIuaHRtbApbM10gaHR0cHM6Ly9idWdz
LmRlYmlhbi5vcmcvY2dpLWJpbi9idWdyZXBvcnQuY2dpP2J1Zz04ODY1MDY7bXNnPTk3Cls0XQpo
dHRwczovL2dpdC5idXN5Ym94Lm5ldC9idXN5Ym94L2NvbW1pdC8/aWQ9MmM5OTcwMjgxMDgzYTk5
YWNmYTNhZWM4YzZkNDFkYjk1NWNiNTgzZAoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gQmVz
dCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+IAo+Pgo+PiBUaG9tYXMKPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
