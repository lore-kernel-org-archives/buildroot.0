Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432D7C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 21:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1D3E60E3C;
	Mon,  3 Jan 2022 21:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flBmOR35VqlT; Mon,  3 Jan 2022 21:26:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0960E60B3A;
	Mon,  3 Jan 2022 21:26:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DDA91BF285
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 21:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2ABBC81D67
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 21:26:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KMX1skYx_v2h for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 21:26:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16A0181D4D
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 21:26:01 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e5so72164458wrc.5
 for <buildroot@buildroot.org>; Mon, 03 Jan 2022 13:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=JxoUyXFLM17imbmH+b5eXPn6oLckZAawmkm5xU/53Iw=;
 b=gcCv38cnzuvWLu6CyDroCJuzN59MUspnRdketofgAglQSRVwsWX6t376ms4KvSb68n
 ZWYW98kn9frGvlpnp6VoVf9Cb6bTa0RLsI9e8Lka6a2ZYIqPoR609DtSpHVbcsKRWsGY
 iKY+okAwSEJWNMK25PXNU7F1UY32t0r6i3ffICJFr/dDNS08boyzO3lXRgjhZcov9ZQD
 Ebp/TV8aSPV4B38oP3/uVVApO/jmJANpeUU1lEszOkRNWBl3/IuSE8LKcGG8oe7xvkCE
 wWHnawxSJPh0L7D+uz3DliHVjADphaKn0hrcv1CtXsM9rcqoTK1hoY+/7I+bI1C+H3Gc
 MfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=JxoUyXFLM17imbmH+b5eXPn6oLckZAawmkm5xU/53Iw=;
 b=xQNaoTFuhF7pR5KeXvDiqAZ1c++gFQMyPVIan6OLIPnXtj1X6Z9QfHtIaBoquJT6jb
 n7jCYmWQy9pgq/cxSIZn8GZr8W5q7wAtL++PY98QPlGYFG3WmeAZkNqvI5/ErB0fcewA
 tOYx4Pj3o9DUjEuanpUR/TS0zq+Kcn97QjofSTj8FCVFMESGHGW9IYL6YZTJiMWbfZYB
 snAV6vjNL5oNU8TwVJm8mQBxwSnd/8XxU5R6WfPbg7+k+Bi+m/9IvMynkitBirjlNfxp
 eJz7hqMvHhKDnVifNzRRQkjndI2hvFe34TsSN2HKW9SUCp7jYW8qUaz8tBAAH2XBMhtX
 xivw==
X-Gm-Message-State: AOAM531FTa3C7iHkT5/nNsBoIVXywWiiZHpfKIXDShgIRZ73GkhoM9WX
 EdWDG4/Au91EesROWyBgHWs=
X-Google-Smtp-Source: ABdhPJztz6jWik1vlrgUioXVKC9DuVf78bnPf8LjdkmWVA6/UhEJPilfug38vn1+fzlXwNM/Y4E+yg==
X-Received: by 2002:a05:6000:2a2:: with SMTP id
 l2mr39520462wry.424.1641245159304; 
 Mon, 03 Jan 2022 13:25:59 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id n14sm19041332wrf.107.2022.01.03.13.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 13:25:58 -0800 (PST)
Message-ID: <2679464d-5793-f8dc-4b57-14646bfdba6e@gmail.com>
Date: Mon, 3 Jan 2022 22:25:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
From: Romain Naour <romain.naour@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <cover.1595839612.git.yann.morin.1998@free.fr>
 <c48baa11cd0c06ec5af3fd4989306c3ec581d0e9.1595839612.git.yann.morin.1998@free.fr>
 <20200727173844.2ac2945f@windsurf.home> <20200727173524.GG19818@scaer>
 <85de806e-39a4-ce1b-fd07-2916443dfbbf@gmail.com>
In-Reply-To: <85de806e-39a4-ce1b-fd07-2916443dfbbf@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2 v4] package/mesa3d: make it aware of
 libglvnd and support it when present
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
Cc: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDMvMDEvMjAyMiDDoCAyMjoyMCwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gSGVsbG8g
WWFubiwgVGhvbWFzLAo+IAo+IExlIDI3LzA3LzIwMjAgw6AgMTk6MzUsIFlhbm4gRS4gTU9SSU4g
YSDDqWNyaXTCoDoKPj4gVGhvbWFzLCBBbGwsCj4+Cj4+IE9uIDIwMjAtMDctMjcgMTc6MzggKzAy
MDAsIFRob21hcyBQZXRhenpvbmkgc3Bha2UgdGh1c2x5Ogo+Pj4gT24gTW9uLCAyNyBKdWwgMjAy
MCAxMDo0NzowMiArMDIwMAo+Pj4gIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThAZnJl
ZS5mcj4gd3JvdGU6Cj4+Pj4gRnJvbTogSmFrdWIgU2tyenlwbmlrIDxqc2tyenlwbmlrQG5vdm9t
YXRpYy10ZWNoLmNvbT4KPj4+Pgo+Pj4+IFdoZW4gbGliZ2x2bmQgaXMgZW5hYmxlZCwgbWVzYTNk
IG11c3QgYmUgdG9sZCBzbywgc28gYXMgaXQgaW5zdGFsbHMgaXRzCj4+Pj4gbGlicmFyaWVzIHdp
dGggdGhlIHZlbmRvciBzdWZmaXggKGUuZy4gbGliRUdMX21lc2Euc28gaW5zdGVhZCBvZgo+Pj4+
IGxpYkVHTC5zbykuCj4+Pj4KPj4+PiBBZGRpdGlvbmFsbHksIHRoZSBwcm92aWRlciAoaW4gQnVp
bGRyb290IHBhcmxhbmNlKSBpcyBsaWJnbHZuZCwgbm90IG1lc2EzZC4KPj4gWy0tU05JUC0tXQo+
Pj4+ICBjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9HTFgKPj4+PiAgCWJvb2wgIk9w
ZW5HTCBHTFgiCj4+Pj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1hPUkc3Cj4+Pj4gLQlzZWxl
Y3QgQlIyX1BBQ0tBR0VfSEFTX0xJQkdMCj4+Pj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSEFTX0xJ
QkdMIGlmICFCUjJfUEFDS0FHRV9MSUJHTFZORAo+Pj4+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0xJ
QkdMVk5EX0RJU1BBVENIX0dMIGlmIEJSMl9QQUNLQUdFX0xJQkdMVk5ECj4+Pgo+Pj4gSSBkb24n
dCBpbW1lZGlhdGVseSBzZWUgYSBnb29kIHNvbHV0aW9uIGZvciB0aGlzLCBidXQgSSBmaW5kIHRo
YXQKPj4+IHNvbHV0aW9uIHRvIGJlIHF1aXRlIGFubm95aW5nIDotLwo+Pgo+PiBBdCBmaXJzdCwg
SSB0aG91Z2ggc28gdG9vLCBhbmQgSSBhbHNvIGxvb2tlZCBmb3IgYSBiZXR0ZXIgYXBwcm9hY2gs
Cj4+IGJ1dC4uLgo+Pgo+Pj4gSW5kZWVkLCBJIHVuZGVyc3RhbmQgdGhhdCBvbmNlIGxpYmdsdm5k
IGlzIGVuYWJsZWQsIHRoZSBHTC1wcm92aWRlciBpcwo+Pj4gbGliZ2x2bmQsIHdoaWNoIGluIHRo
ZSBiYWNrZ3JvdW5kIGlzIHVzaW5nIG1lc2EzZC4gVGhlIGRhbmNlIHRvIGhhbmRsZQo+Pj4gbGli
Z2x2bmQgaW4gbWVzYTNkIGlzIGFscmVhZHkgbm90IG5pY2UsIGFuZCB3ZSB3b3VsZCBoYXZlIHRv
IGhhdmUgdGhlCj4+PiBzYW1lIGRhbmNlIGluIG90aGVyIEdMIHByb3ZpZGVycyB0aGF0IHN1cHBv
cnQgbGliZ2x2bmQuCj4+Cj4+IFdlbGwsIGl0IGlzIG5vdCBfc29fIGJhZC4gV2UgY291bGQgbWF5
YmUgbWFrZSBpdCBhIGJpdCBzaW1wbGVyLCB3aXRoOgo+Pgo+PiAgICAgY29uZmlnIEJSMl9QQUNL
QUdFX01FU0EzRF9PUEVOR0xfR0xYCj4+ICAgICAgICAgYm9vbCAiT3BlbkdMIEdMWCIKPj4gICAg
ICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfSEFTX0xJQkdMCj4+Cj4+IFdlIHN0aWxsIG5lZWQgdG8g
ZGVjbGFyZSBlbXNhM2QgYXMgcHJvdmlkaW5nIGxpYmdsIGRlcGVuZGluZyBvbiB3aGV0aGVyCj4+
IGxpYmdsdm5kIGlzIGVuYWJsZWQsIGJ1dCB3ZSBjYW4gbWFrZSBpdCBhIGJpdCBtb3JlICJjb21w
YWN0IjoKPj4KPj4gICAgIGlmICFCUjJfUEFDS0FHRV9MSUJHTFZORAo+Pgo+PiAgICAgY29uZmln
IEJSMl9QQUNLQUdFX1BST1ZJREVTX0xJQkdMCj4+ICAgICAgICAgZGVmYXVsdCAibWVzYTNkIiBp
ZiBCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdMX0dMWAo+Pgo+PiAgICAgW0VHTCBhbmQgR0xFUyB0
b28gaGVyZV0KPj4KPj4gICAgIGVuZGlmCj4+Cj4+IEFuZCBpbiBtZXNhM2QubWsgdG9vOgo+Pgo+
PiAgICAgaWZlcSAoJChCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdMX0dMWCkseSkKPj4gICAgIE1F
U0EzRF9QUk9WSURFUyArPSAkKGlmICQoQlIyX1BBQ0tBR0VfTElCR0xWTkQpLCxsaWJnbCkKPj4g
ICAgIFsuLi5dCj4+ICAgICBlbmRpZgo+Pgo+PiBCdXQgbm93LCBpbiBsaWJnbHZuZCwgd2UgZG9u
J3QgbmVlZCBhbnkgZXh0cmEgc3ltYm9sLCB3ZSBjYW4ganVzdCByZS11c2UKPj4gQlIyX1BBQ0tB
R0VfUFJPVklERVNfTElCR0wgZXQgYWwuOgo+Pgo+PiAgICAgY29uZmlnIEJSMl9QQUNLQUdFX0xJ
QkdMVk5ECj4+ICAgICAgICAgYm9vbCAibGliZ2x2bmQiCj4+ICAgICAgICAgc2VsZWN0IEJSMl9Q
QUNLQUdFX1hMSUJfTElCWDExIGlmIEJSMl9QQUNLQUdFX1BST1ZJREVTX0xJQkdMCj4+ICAgICAg
ICAgc2VsZWN0IEJSMl9QQUNLQUdFX1hMSUJfTElCWEVYVCBpZiBCUjJfUEFDS0FHRV9QUk9WSURF
U19MSUJHTAo+PiAgICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9YTElCX1hPUkdQUk9UTyBpZiBC
UjJfUEFDS0FHRV9QUk9WSURFU19MSUJHTAo+PiAgICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9I
QVNfTElCR0wgaWYgQlIyX1BBQ0tBR0VfUFJPVklERVNfTElCR0wKPj4KPj4gICAgIGlmIEJSMl9Q
QUNLQUdFX0xJQkdMVk5ECj4+Cj4+ICAgICBjb25maWcgQlIyX1BBQ0tBR0VfUFJPVklERVNfTElC
R0wKPj4gICAgICAgICBkZWZhdWx0ICJsaWJnbHZuZCIgaWYgQlIyX1BBQ0tBR0VfSEFTX0xJQkdM
Cj4+Cj4+ICAgICBlbmRpZgo+Pgo+PiBhbmQgaW4gbGliZ2x2bmQubWs6Cj4+Cj4+ICAgICBpZmVx
ICgkKEJSMl9QQUNLQUdFX1BST1ZJREVTX0xJQkdMKSx5KQo+PiAgICAgTElCR0xWTkRfREVQRU5E
RU5DSUVTICs9IHhsaWJfbGliWGV4dCB4b3JncHJvdG8KPj4gICAgIExJQkdMVk5EX0NPTkZfT1BU
UyArPSAtRGdseD1lbmFibGVkCj4+ICAgICBMSUJHTFZORF9QUk9WSURFUyArPSBsaWJnbAo+PiAg
ICAgZWxzZQo+PiAgICAgTElCR0xWTkRfQ09ORl9PUFRTICs9IC1EZ2x4PWRpc2FibGVkCj4+ICAg
ICBlbmRpZgo+Pgo+Pj4gT0ssIGhlcmUgaXMgc29tZSB2YWd1ZSBpZGVhIGZvciBhIHBvc3NpYmxl
IHNvbHV0aW9uOgo+Pj4gIC0gV2UgaW50cm9kdWNlIGFuIGludGVybWVkaWF0ZSAibGF5ZXIiIGJl
dHdlZW4gbGliZ2wgYW5kIEdMIHByb3ZpZGVycy4KPj4gWy0tU05JUC0tXQo+Pj4gSSAqdGhpbmsq
IHRoaXMgd291bGQgcGVyaGFwcyBhdm9pZCB0aGF0IGNvbXBsZXhpdHkgaW4gbWVzYTNkLi4uCj4+
PiBvYnZpb3VzbHkgZm9yIGFkZGl0aW9uYWwgY29tcGxleGl0eSBpbiB0ZXJtcyBvZiBob3cgdGhl
IHZpcnR1YWwKPj4+IHBhY2thZ2VzIGluIEdMIHdvcmxkIGFsbCB3b3JrIHRvZ2V0aGVyLgo+Pgo+
PiBZb3UgYXJlIHJlaW52ZW50aW5nIGxpYmdsdm5kIGluIGJldHdlZW4gbGliZ2x2bmQgYW5kIGFj
dHVhbCBwcm92aWRlcnMsIG5vPwo+Pgo+PiBBbHNvLCByZW1lbWJlciB0aGF0IGluZGl2aWR1YWwg
R0wgcHJvdmlkZXJzIHdpbGwgc3RpbGwgaGF2ZSB0byBmdW5jdGlvbgo+PiBhcyBwcm92aWRlcnMg
d2l0aG91dCBsaWJnbHZuZCwgd2hpY2ggaXMgbm90IHJlcXVpcmVkLgo+Pgo+PiBCdXQgSSB3b3Vs
ZCBsaWtlIHdlIHByb2dyZXNzIG9uIHRoZSB0b3BpYywgYW5kIHdoZW4gd2UgaGF2ZSBhIHNlY29u
ZAo+PiBjYW5kaWRhdGUgZm9yIGxpYmdsdm5kIHVzZSwgd2UgY2FuIHJldmlzaXQgdGhlIHRvcGlj
IGFuZCBzZWUgaWYgd2UgY2FuCj4+IG92ZXItZW5naW5lZXIgdGhlIHRoaW5nLgo+Pgo+PiBVc3Vh
bGx5LCB3ZSB3YWl0IGZvciB0aHJlZSBvciBmb3VyIGNhc2VzIGJlZm9yZSB0cnlpbmcgdG8gc29s
dmUgdGhlCj4+IHByb2JsZW0gaW4gYSBnZW5lcmljIGZhc2hpb24sIGFuZCBzbyBJJ2QgbGlrZSB0
byBkbyBoZXJlIGFzIHdlbGwuCj4+IEJlY2F1c2Ugc28gZmFyLCBvbmx5IHR3byBwcm92aWRlcnMg
YXJlIGtub3duIHRvIHdvcmsgd2l0aCBsaWJnbHZuZDoKPj4gbWV3c2EzZCBhbmQgbnZpZGlhLiBB
VEkgbWlnaHQgYmUgYSB0aGlyZCBvbmUsIGJ1dCBJIGhhdmUgbm8gY2x1ZSBhYm91dAo+PiBpdC4g
QW5kIGluIHRoZSBTb0MgbGFuZCwgdGhlcmUgaXMgbm90IG11Y2ggdGhhdCBpcyBsaWJnbHZuZCBj
b21wYXRpYmxlCj4+IHNvIGZhciwgaWYgYXQgYWxsLgo+Pgo+PiBTbywgaW4gdGhlIHNob3J0LXRv
LW1lZGl1bSB0ZXJtLCB3ZSdkIGF0IGJlc3QgaGF2ZSB0aHJlZSBwcm92aWRlcnMuIElzCj4+IHRo
YXQgZW5vdWdoIHRvIGRlbHZlIGludG8gYSBnZW5lcmljIGluZnJhIHNvIGZhcj8gTm90IHN1cmUu
Li4KPiAKPiBJIGhhZCBhbiBpc3N1ZSB3aXRoIGEgcGFja2FnZSAob2dyZSkgdGhhdCBub3cgdXNl
IE9QRU5HTF9nbHhfTElCUkFSWSB0byBmaW5kIHRoZQo+ICJHTFZORCAnR0xYJyBsaWJyYXJ5Igo+
IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9PR1JFQ2F2ZS9vZ3JlL2NvbW1pdC9hYTlmZmE3YTUxZTUy
Y2I3MTRmMWJmNWEzYTAwYjllZjlmNWE3ZGMyCj4gaHR0cHM6Ly9jbWFrZS5vcmcvY21ha2UvaGVs
cC9sYXRlc3QvbW9kdWxlL0ZpbmRPcGVuR0wuaHRtbAo+IAo+IEkgZ3Vlc3MgbGliZ2x2bmQgd2ls
bCBiZSByZXF1aXJlZCBhdCBzb21lIHBvaW50LgoKQWN0dWFsbHkgSSBkaWQgYSB0ZXN0IHVzaW5n
IHRoaXMgc2VyaWVzIGFzIGlzLgoKVGVzdGVkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBnbWFpbC5jb20+CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gQmVzdCByZWdhcmRzLAo+
IFJvbWFpbgo+IAo+IAo+Pgo+PiBSZWdhcmRzLAo+PiBZYW5uIEUuIE1PUklOLgo+Pgo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
