Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D348C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 21:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF2DE40116;
	Mon,  3 Jan 2022 21:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUW201U5ZBJ4; Mon,  3 Jan 2022 21:20:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCEED403E9;
	Mon,  3 Jan 2022 21:20:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F12E61BF285
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 21:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFF1D60B49
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 21:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eo2iVgdtWTCd for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 21:20:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBC6F60B3A
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 21:20:48 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q16so72169271wrg.7
 for <buildroot@buildroot.org>; Mon, 03 Jan 2022 13:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ocUE7iszKLoOJ1QCohSvWBbG2FHxvQ1FQVcbqb4KVKs=;
 b=RWn/W4MJuVo9ktINNZhV/C6/w7uF2fDGwha8dU1LGWqvlcXVR2R64I3/OP3f0isHUY
 TGpWYtDWvHLbUntFBJ6pAUc8ErD19UB05KKkrLpgnwe5nA57xBRHP8rAmcwHNoaspSU3
 w9KqaHMray9YVcMSICC2yvklHV7nEJoVkw6H1y7CZazVMVdbQkzthGl/Zd1UbUPN2Lf/
 bK0Up/wZY1j4xJNwCnVot5YMLYNbN8xE17ns8KW7E02wTisxzHTB4BaXsPqkEDye+0wi
 6wbAciWslmy58P0L49IWr/Bpp02B/ucrmL+c3niupKykQ8MjGuhE5Vpfn0KUPc0AuNDz
 uapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ocUE7iszKLoOJ1QCohSvWBbG2FHxvQ1FQVcbqb4KVKs=;
 b=LGol5l26IyTtJD19YyzI1+Bl/0T1MgrtSPgekNM3Rt4byY0sqoB6XWoKlHUPprhzio
 y7aUr5cXiaJksOw7zPxQhQjUap0DIPYBe3hjiYt6VAb9zWEBDDRQDTwawwuGP2P3kcZS
 Cw66XVclq4tHV7gJOR5WD911tBwmiQ3mDzRR2VIISvpGiOk+gckSGSCCIs/7nqMjmauO
 OcqdFuIalGn06rSjlhO4xQoHWSJB8cb+cBZFMkybnpWR183+TXmU0x1zn9TF5QCugk+C
 NHcwNc32Spbk1yDmQyoojCXv8a9AlrmQooMLPY3n1YQLa4jpmxtRIsIX1RJHDVlvzPeE
 Ua5Q==
X-Gm-Message-State: AOAM533VRmxJMiamuA4ZUkqQA7VvHYk/z13qUHWC/hnbiWiYfuh4Fwnl
 81pbdb3wa+TjfmbwBCO7Vlo=
X-Google-Smtp-Source: ABdhPJwJzJFBNQlYe8C8doveX2MWLZzK/EnBUZmKRGbfI0D2VifAUQu9XvnKOaE5iWu2Q93q7PbGrg==
X-Received: by 2002:adf:fb90:: with SMTP id a16mr16686744wrr.283.1641244846962; 
 Mon, 03 Jan 2022 13:20:46 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id 1sm29297314wrb.13.2022.01.03.13.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 13:20:46 -0800 (PST)
Message-ID: <85de806e-39a4-ce1b-fd07-2916443dfbbf@gmail.com>
Date: Mon, 3 Jan 2022 22:20:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <cover.1595839612.git.yann.morin.1998@free.fr>
 <c48baa11cd0c06ec5af3fd4989306c3ec581d0e9.1595839612.git.yann.morin.1998@free.fr>
 <20200727173844.2ac2945f@windsurf.home> <20200727173524.GG19818@scaer>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20200727173524.GG19818@scaer>
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

SGVsbG8gWWFubiwgVGhvbWFzLAoKTGUgMjcvMDcvMjAyMCDDoCAxOTozNSwgWWFubiBFLiBNT1JJ
TiBhIMOpY3JpdMKgOgo+IFRob21hcywgQWxsLAo+IAo+IE9uIDIwMjAtMDctMjcgMTc6MzggKzAy
MDAsIFRob21hcyBQZXRhenpvbmkgc3Bha2UgdGh1c2x5Ogo+PiBPbiBNb24sIDI3IEp1bCAyMDIw
IDEwOjQ3OjAyICswMjAwCj4+ICJZYW5uIEUuIE1PUklOIiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUu
ZnI+IHdyb3RlOgo+Pj4gRnJvbTogSmFrdWIgU2tyenlwbmlrIDxqc2tyenlwbmlrQG5vdm9tYXRp
Yy10ZWNoLmNvbT4KPj4+Cj4+PiBXaGVuIGxpYmdsdm5kIGlzIGVuYWJsZWQsIG1lc2EzZCBtdXN0
IGJlIHRvbGQgc28sIHNvIGFzIGl0IGluc3RhbGxzIGl0cwo+Pj4gbGlicmFyaWVzIHdpdGggdGhl
IHZlbmRvciBzdWZmaXggKGUuZy4gbGliRUdMX21lc2Euc28gaW5zdGVhZCBvZgo+Pj4gbGliRUdM
LnNvKS4KPj4+Cj4+PiBBZGRpdGlvbmFsbHksIHRoZSBwcm92aWRlciAoaW4gQnVpbGRyb290IHBh
cmxhbmNlKSBpcyBsaWJnbHZuZCwgbm90IG1lc2EzZC4KPiBbLS1TTklQLS1dCj4+PiAgY29uZmln
IEJSMl9QQUNLQUdFX01FU0EzRF9PUEVOR0xfR0xYCj4+PiAgCWJvb2wgIk9wZW5HTCBHTFgiCj4+
PiAgCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfWE9SRzcKPj4+IC0Jc2VsZWN0IEJSMl9QQUNLQUdF
X0hBU19MSUJHTAo+Pj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSEFTX0xJQkdMIGlmICFCUjJfUEFD
S0FHRV9MSUJHTFZORAo+Pj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCR0xWTkRfRElTUEFUQ0hf
R0wgaWYgQlIyX1BBQ0tBR0VfTElCR0xWTkQKPj4KPj4gSSBkb24ndCBpbW1lZGlhdGVseSBzZWUg
YSBnb29kIHNvbHV0aW9uIGZvciB0aGlzLCBidXQgSSBmaW5kIHRoYXQKPj4gc29sdXRpb24gdG8g
YmUgcXVpdGUgYW5ub3lpbmcgOi0vCj4gCj4gQXQgZmlyc3QsIEkgdGhvdWdoIHNvIHRvbywgYW5k
IEkgYWxzbyBsb29rZWQgZm9yIGEgYmV0dGVyIGFwcHJvYWNoLAo+IGJ1dC4uLgo+IAo+PiBJbmRl
ZWQsIEkgdW5kZXJzdGFuZCB0aGF0IG9uY2UgbGliZ2x2bmQgaXMgZW5hYmxlZCwgdGhlIEdMLXBy
b3ZpZGVyIGlzCj4+IGxpYmdsdm5kLCB3aGljaCBpbiB0aGUgYmFja2dyb3VuZCBpcyB1c2luZyBt
ZXNhM2QuIFRoZSBkYW5jZSB0byBoYW5kbGUKPj4gbGliZ2x2bmQgaW4gbWVzYTNkIGlzIGFscmVh
ZHkgbm90IG5pY2UsIGFuZCB3ZSB3b3VsZCBoYXZlIHRvIGhhdmUgdGhlCj4+IHNhbWUgZGFuY2Ug
aW4gb3RoZXIgR0wgcHJvdmlkZXJzIHRoYXQgc3VwcG9ydCBsaWJnbHZuZC4KPiAKPiBXZWxsLCBp
dCBpcyBub3QgX3NvXyBiYWQuIFdlIGNvdWxkIG1heWJlIG1ha2UgaXQgYSBiaXQgc2ltcGxlciwg
d2l0aDoKPiAKPiAgICAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9PUEVOR0xfR0xYCj4gICAg
ICAgICBib29sICJPcGVuR0wgR0xYIgo+ICAgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0hBU19M
SUJHTAo+IAo+IFdlIHN0aWxsIG5lZWQgdG8gZGVjbGFyZSBlbXNhM2QgYXMgcHJvdmlkaW5nIGxp
YmdsIGRlcGVuZGluZyBvbiB3aGV0aGVyCj4gbGliZ2x2bmQgaXMgZW5hYmxlZCwgYnV0IHdlIGNh
biBtYWtlIGl0IGEgYml0IG1vcmUgImNvbXBhY3QiOgo+IAo+ICAgICBpZiAhQlIyX1BBQ0tBR0Vf
TElCR0xWTkQKPiAKPiAgICAgY29uZmlnIEJSMl9QQUNLQUdFX1BST1ZJREVTX0xJQkdMCj4gICAg
ICAgICBkZWZhdWx0ICJtZXNhM2QiIGlmIEJSMl9QQUNLQUdFX01FU0EzRF9PUEVOR0xfR0xYCj4g
Cj4gICAgIFtFR0wgYW5kIEdMRVMgdG9vIGhlcmVdCj4gCj4gICAgIGVuZGlmCj4gCj4gQW5kIGlu
IG1lc2EzZC5tayB0b286Cj4gCj4gICAgIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5H
TF9HTFgpLHkpCj4gICAgIE1FU0EzRF9QUk9WSURFUyArPSAkKGlmICQoQlIyX1BBQ0tBR0VfTElC
R0xWTkQpLCxsaWJnbCkKPiAgICAgWy4uLl0KPiAgICAgZW5kaWYKPiAKPiBCdXQgbm93LCBpbiBs
aWJnbHZuZCwgd2UgZG9uJ3QgbmVlZCBhbnkgZXh0cmEgc3ltYm9sLCB3ZSBjYW4ganVzdCByZS11
c2UKPiBCUjJfUEFDS0FHRV9QUk9WSURFU19MSUJHTCBldCBhbC46Cj4gCj4gICAgIGNvbmZpZyBC
UjJfUEFDS0FHRV9MSUJHTFZORAo+ICAgICAgICAgYm9vbCAibGliZ2x2bmQiCj4gICAgICAgICBz
ZWxlY3QgQlIyX1BBQ0tBR0VfWExJQl9MSUJYMTEgaWYgQlIyX1BBQ0tBR0VfUFJPVklERVNfTElC
R0wKPiAgICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9YTElCX0xJQlhFWFQgaWYgQlIyX1BBQ0tB
R0VfUFJPVklERVNfTElCR0wKPiAgICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9YTElCX1hPUkdQ
Uk9UTyBpZiBCUjJfUEFDS0FHRV9QUk9WSURFU19MSUJHTAo+ICAgICAgICAgc2VsZWN0IEJSMl9Q
QUNLQUdFX0hBU19MSUJHTCBpZiBCUjJfUEFDS0FHRV9QUk9WSURFU19MSUJHTAo+IAo+ICAgICBp
ZiBCUjJfUEFDS0FHRV9MSUJHTFZORAo+IAo+ICAgICBjb25maWcgQlIyX1BBQ0tBR0VfUFJPVklE
RVNfTElCR0wKPiAgICAgICAgIGRlZmF1bHQgImxpYmdsdm5kIiBpZiBCUjJfUEFDS0FHRV9IQVNf
TElCR0wKPiAKPiAgICAgZW5kaWYKPiAKPiBhbmQgaW4gbGliZ2x2bmQubWs6Cj4gCj4gICAgIGlm
ZXEgKCQoQlIyX1BBQ0tBR0VfUFJPVklERVNfTElCR0wpLHkpCj4gICAgIExJQkdMVk5EX0RFUEVO
REVOQ0lFUyArPSB4bGliX2xpYlhleHQgeG9yZ3Byb3RvCj4gICAgIExJQkdMVk5EX0NPTkZfT1BU
UyArPSAtRGdseD1lbmFibGVkCj4gICAgIExJQkdMVk5EX1BST1ZJREVTICs9IGxpYmdsCj4gICAg
IGVsc2UKPiAgICAgTElCR0xWTkRfQ09ORl9PUFRTICs9IC1EZ2x4PWRpc2FibGVkCj4gICAgIGVu
ZGlmCj4gCj4+IE9LLCBoZXJlIGlzIHNvbWUgdmFndWUgaWRlYSBmb3IgYSBwb3NzaWJsZSBzb2x1
dGlvbjoKPj4gIC0gV2UgaW50cm9kdWNlIGFuIGludGVybWVkaWF0ZSAibGF5ZXIiIGJldHdlZW4g
bGliZ2wgYW5kIEdMIHByb3ZpZGVycy4KPiBbLS1TTklQLS1dCj4+IEkgKnRoaW5rKiB0aGlzIHdv
dWxkIHBlcmhhcHMgYXZvaWQgdGhhdCBjb21wbGV4aXR5IGluIG1lc2EzZC4uLgo+PiBvYnZpb3Vz
bHkgZm9yIGFkZGl0aW9uYWwgY29tcGxleGl0eSBpbiB0ZXJtcyBvZiBob3cgdGhlIHZpcnR1YWwK
Pj4gcGFja2FnZXMgaW4gR0wgd29ybGQgYWxsIHdvcmsgdG9nZXRoZXIuCj4gCj4gWW91IGFyZSBy
ZWludmVudGluZyBsaWJnbHZuZCBpbiBiZXR3ZWVuIGxpYmdsdm5kIGFuZCBhY3R1YWwgcHJvdmlk
ZXJzLCBubz8KPiAKPiBBbHNvLCByZW1lbWJlciB0aGF0IGluZGl2aWR1YWwgR0wgcHJvdmlkZXJz
IHdpbGwgc3RpbGwgaGF2ZSB0byBmdW5jdGlvbgo+IGFzIHByb3ZpZGVycyB3aXRob3V0IGxpYmds
dm5kLCB3aGljaCBpcyBub3QgcmVxdWlyZWQuCj4gCj4gQnV0IEkgd291bGQgbGlrZSB3ZSBwcm9n
cmVzcyBvbiB0aGUgdG9waWMsIGFuZCB3aGVuIHdlIGhhdmUgYSBzZWNvbmQKPiBjYW5kaWRhdGUg
Zm9yIGxpYmdsdm5kIHVzZSwgd2UgY2FuIHJldmlzaXQgdGhlIHRvcGljIGFuZCBzZWUgaWYgd2Ug
Y2FuCj4gb3Zlci1lbmdpbmVlciB0aGUgdGhpbmcuCj4gCj4gVXN1YWxseSwgd2Ugd2FpdCBmb3Ig
dGhyZWUgb3IgZm91ciBjYXNlcyBiZWZvcmUgdHJ5aW5nIHRvIHNvbHZlIHRoZQo+IHByb2JsZW0g
aW4gYSBnZW5lcmljIGZhc2hpb24sIGFuZCBzbyBJJ2QgbGlrZSB0byBkbyBoZXJlIGFzIHdlbGwu
Cj4gQmVjYXVzZSBzbyBmYXIsIG9ubHkgdHdvIHByb3ZpZGVycyBhcmUga25vd24gdG8gd29yayB3
aXRoIGxpYmdsdm5kOgo+IG1ld3NhM2QgYW5kIG52aWRpYS4gQVRJIG1pZ2h0IGJlIGEgdGhpcmQg
b25lLCBidXQgSSBoYXZlIG5vIGNsdWUgYWJvdXQKPiBpdC4gQW5kIGluIHRoZSBTb0MgbGFuZCwg
dGhlcmUgaXMgbm90IG11Y2ggdGhhdCBpcyBsaWJnbHZuZCBjb21wYXRpYmxlCj4gc28gZmFyLCBp
ZiBhdCBhbGwuCj4gCj4gU28sIGluIHRoZSBzaG9ydC10by1tZWRpdW0gdGVybSwgd2UnZCBhdCBi
ZXN0IGhhdmUgdGhyZWUgcHJvdmlkZXJzLiBJcwo+IHRoYXQgZW5vdWdoIHRvIGRlbHZlIGludG8g
YSBnZW5lcmljIGluZnJhIHNvIGZhcj8gTm90IHN1cmUuLi4KCkkgaGFkIGFuIGlzc3VlIHdpdGgg
YSBwYWNrYWdlIChvZ3JlKSB0aGF0IG5vdyB1c2UgT1BFTkdMX2dseF9MSUJSQVJZIHRvIGZpbmQg
dGhlCiJHTFZORCAnR0xYJyBsaWJyYXJ5IgoKaHR0cHM6Ly9naXRodWIuY29tL09HUkVDYXZlL29n
cmUvY29tbWl0L2FhOWZmYTdhNTFlNTJjYjcxNGYxYmY1YTNhMDBiOWVmOWY1YTdkYzIKaHR0cHM6
Ly9jbWFrZS5vcmcvY21ha2UvaGVscC9sYXRlc3QvbW9kdWxlL0ZpbmRPcGVuR0wuaHRtbAoKSSBn
dWVzcyBsaWJnbHZuZCB3aWxsIGJlIHJlcXVpcmVkIGF0IHNvbWUgcG9pbnQuCgpCZXN0IHJlZ2Fy
ZHMsClJvbWFpbgoKCj4gCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
