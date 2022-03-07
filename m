Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E2AC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02EF941742;
	Mon,  7 Mar 2022 22:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AfGrKpZCaFzL; Mon,  7 Mar 2022 22:08:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BD344173F;
	Mon,  7 Mar 2022 22:08:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C9441BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57D2C40734
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:08:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l6nJ_fF9R6d1 for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:08:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C0E2404F3
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:08:30 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id r13so35083366ejd.5
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 14:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=C/bAIDtXCp4alz7xH1pg44T502tdb3P0ITYu4FSei5c=;
 b=QdyU+/RrlaV7iHZCYlhfmIJEeWTN9cIwV/WQibLt085GgtplzuWXVQXlDktgCGZHqY
 ubcIgemn7XPx347zhuOcbTFGznTMK2h8r6LHn+BzpouTxVJixLqzoflTc2rMzDq+bgfH
 3m8DuasWTS7zXdp1zvJs90+7WIkRKndpSB4v4IDHOl2XDeuhVBqFaTtXDcpA2f24874J
 cTSRlG2JaKDjGFFDQoxenqS+mggIssaY19Cn4Hmk9XAwOuwlYaNnf6WHICd+sMN4W+r1
 WZsdewF3M9zUWWp6+4SKSUk9/h77iYncq8thJOV6DPDAIMefVqtEKD8+g/6TxjDHsG0F
 eS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=C/bAIDtXCp4alz7xH1pg44T502tdb3P0ITYu4FSei5c=;
 b=SPReVUxIeTyxrCUEUETBDeSfQ+ddPWLHHpcTfIqe/48EWG8oToz55XLj1HIGNK6IBV
 +qYeZ4mPs6ZWu1P176JeUU8iMrEjE2BLxrJfkEL2IiamQM8kGCEbg633572S+HF3aC2D
 I3Mbq90995nVNHsAvhLL+dQLkf+xUQ1htdQ1J/393H5SVpus05ksZrcDOO6lv1wvjmVK
 f7gvW0oT9IMQx4Xk6RSHBUTTZxQ+EjqYoLPrMbS/oTs6cN4tAt2Kh20uohd7Xdeqp8Ul
 BDogFL7lPDnzpPs335evcm8vZgDN7nx8Vjeh3Btm0v+SdANG9NRro/6Xmc0FsHWObbVr
 NMtQ==
X-Gm-Message-State: AOAM532N64bcLoHN/5CIX6A3tUHFBiGzEfhW0HWEqy2RVPSUFFXGcIIs
 AGdoWjgJHhJlqyc8MZAG/XF/Mg==
X-Google-Smtp-Source: ABdhPJwlX6c3VkATlnf+K7JNOw7R3DLMEsHnvNY86vQSD7wjVRBq7Fpmd3ufAoindSqY9oE1rq1L9g==
X-Received: by 2002:a17:907:160d:b0:6db:49bb:2c7a with SMTP id
 hb13-20020a170907160d00b006db49bb2c7amr308583ejc.228.1646690909240; 
 Mon, 07 Mar 2022 14:08:29 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 cc20-20020a0564021b9400b00412f2502469sm6855193edb.23.2022.03.07.14.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 14:08:28 -0800 (PST)
Message-ID: <776aff8d-84bc-4611-8ead-cdb1bb752234@mind.be>
Date: Mon, 7 Mar 2022 23:08:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220222204034.3139362-1-fontaine.fabrice@gmail.com>
 <20220306213212.GH228549@scaer>
 <CAPi7W81XuPGVGuO4H_BzpRO5NRoDYZ-yUo2FZ0SKJPJNNBzEgQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAPi7W81XuPGVGuO4H_BzpRO5NRoDYZ-yUo2FZ0SKJPJNNBzEgQ@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/freerdp: security bump to
 version 2.6.0
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNi8wMy8yMDIyIDIyOjQzLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IFlhbm4sCj4g
Cj4gTGUgZGltLiA2IG1hcnMgMjAyMiDDoCAyMjozMiwgWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+IGEgw6ljcml0IDoKPj4KPj4gRmFicmljZSwgQWxsLAo+Pgo+PiBPbiAy
MDIyLTAyLTIyIDIxOjQwICswMTAwLCBGYWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToKPj4+
IDIuNi4wIGlzIGFuIG1haW50ZW5hbmNlIGFuZCBzZWN1cml0eSByZWxlYXNlLgo+Pj4KPj4+IGh0
dHBzOi8vZ2l0aHViLmNvbS9GcmVlUkRQL0ZyZWVSRFAvcmVsZWFzZXMvdGFnLzIuNi4wCj4+Cj4+
IFlvdSBjbGFpbSAnc2VjdXJpdHkgYnVtcCcgaW4gdGhlIHRpdGxlLCBidXQgdGhlIGFubm91bmNl
bWVudCBkb2VzIG5vdAo+PiBzZWVtIHRvIGlkZW50aWZ5IGFueSBhY3R1YWwgc2VjdXJpdHkgZml4
LCBhcyBjb21wYXJlZCB0byAyLjUuMCB3aGljaCBkaWQKPj4gZXhwbGljaXRseSBsaXN0IHNlY3Vy
aXR5IGZpeGVzOgo+PiAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9GcmVlUkRQL0ZyZWVSRFAvcmVs
ZWFzZXMvdGFnLzIuNi4wCj4+Cj4+IFNvLCBJIGRvbjt0IHRoaW5rIHRoaXMgaXMgbWF0ZXJpYWwg
Zm9yIG1hc3RlciwgaXMgaXQ/Cj4gCj4gSSBkb24ndCBrbm93LCBpbmRlZWQgdGhlIGFubm91bmNl
bWVudCBkb2Vzbid0IGlkZW50aWZ5IHNlY3VyaXR5IGZpeGVzCj4gYnV0IHRoZSBmaXJzdCBzZW50
ZW5jZSBpcyAiMi42LjAgaXMgYW4gbWFpbnRlbmFuY2UgYW5kIHNlY3VyaXR5Cj4gcmVsZWFzZS4i
Cj4gQXQgbGVhc3QsIGEgY3Jhc2ggd2l0aCB3YXlsYW5kIGlzIGZpeGVkIHdpdGg6Cj4gaHR0cHM6
Ly9naXRodWIuY29tL0ZyZWVSRFAvRnJlZVJEUC9pc3N1ZXMvNzQyNgo+IAo+IFNvIGZlZWwgZnJl
ZSB0byBhcHBseSBpdCB0byBuZXh0IG9yIG1hc3Rlci4KCiAgSXQncyBpbmRlZWQgbWFpbnRlbmFu
Y2UgYnJhbmNoLCBub3QgbWFpbiBkZXZlbG9wbWVudCwgc28gZ29vZCBmb3IgbWFzdGVyLgoKICBJ
J3ZlIHJlbW92ZWQgdGhlICJzZWN1cml0eSIgcGFydCB0aG91Z2guCgogIEFwcGxpZWQgdG8gbWFz
dGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+Pgo+PiBSZWdhcmRzLAo+PiBZ
YW5uIEUuIE1PUklOLgo+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9u
dGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4+PiAtLS0KPj4+ICAgcGFja2FnZS9mcmVlcmRwL2Zy
ZWVyZHAuaGFzaCB8IDQgKystLQo+Pj4gICBwYWNrYWdlL2ZyZWVyZHAvZnJlZXJkcC5tayAgIHwg
MiArLQo+Pj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcmVlcmRwL2ZyZWVyZHAuaGFzaCBiL3Bh
Y2thZ2UvZnJlZXJkcC9mcmVlcmRwLmhhc2gKPj4+IGluZGV4IGUzMWI4ZDViOTYuLjc4MDA2MWJk
YmIgMTAwNjQ0Cj4+PiAtLS0gYS9wYWNrYWdlL2ZyZWVyZHAvZnJlZXJkcC5oYXNoCj4+PiArKysg
Yi9wYWNrYWdlL2ZyZWVyZHAvZnJlZXJkcC5oYXNoCj4+PiBAQCAtMSw1ICsxLDUgQEAKPj4+IC0j
IEZyb20gaHR0cHM6Ly9wdWIuZnJlZXJkcC5jb20vcmVsZWFzZXMvZnJlZXJkcC0yLjUuMC50YXIu
Z3ouc2hhMjU2Cj4+PiAtc2hhMjU2ICAwZmQ5Mzk2MDY4Y2RhOGU2ZDg4NGQwNjNhNDk5MzAwMWYx
NDBmNDZjMzY0NjRjY2FlMjYxYjk0NzUwNTBjZDJiICBmcmVlcmRwLTIuNS4wLnRhci5nego+Pj4g
KyMgRnJvbSBodHRwczovL3B1Yi5mcmVlcmRwLmNvbS9yZWxlYXNlcy9mcmVlcmRwLTIuNi4wLnRh
ci5nei5zaGEyNTYKPj4+ICtzaGEyNTYgIGE0YmEwYTc1ZTMwZWQyNWZmZmM0Y2Q0ZTg5ZDBlYjky
ZTY2ODk0Y2FlYjZjNzhkYzVlMjNiNmI3YzA0ZjYwZmUgIGZyZWVyZHAtMi42LjAudGFyLmd6Cj4+
Pgo+Pj4gICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+Pj4gICBzaGEyNTYgIGNmYzc3NDliOTZmNjNi
ZDMxYzNjNDJiNWM0NzFiZjc1NjgxNDA1M2U4NDdjMTBmM2ViMDAzNDE3YmM1MjNkMzAgIExJQ0VO
U0UKPj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVyZHAvZnJlZXJkcC5tayBiL3BhY2thZ2Uv
ZnJlZXJkcC9mcmVlcmRwLm1rCj4+PiBpbmRleCBjNTM2ZjZjYjFjLi5lZGJmYjY4MDFhIDEwMDY0
NAo+Pj4gLS0tIGEvcGFja2FnZS9mcmVlcmRwL2ZyZWVyZHAubWsKPj4+ICsrKyBiL3BhY2thZ2Uv
ZnJlZXJkcC9mcmVlcmRwLm1rCj4+PiBAQCAtNCw3ICs0LDcgQEAKPj4+ICAgIwo+Pj4gICAjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIwo+Pj4KPj4+IC1GUkVFUkRQX1ZFUlNJT04gPSAyLjUuMAo+Pj4g
K0ZSRUVSRFBfVkVSU0lPTiA9IDIuNi4wCj4+PiAgIEZSRUVSRFBfU0lURSA9IGh0dHBzOi8vcHVi
LmZyZWVyZHAuY29tL3JlbGVhc2VzCj4+PiAgIEZSRUVSRFBfREVQRU5ERU5DSUVTID0gbGliZ2xp
YjIgb3BlbnNzbCB6bGliCj4+PiAgIEZSRUVSRFBfTElDRU5TRSA9IEFwYWNoZS0yLjAKPj4+IC0t
Cj4+PiAyLjM0LjEKPj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+Pj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+Pj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo+Pgo+PiAtLQo+PiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+PiB8ICBZYW5u
IEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmlj
cycgY29uc3BpcmFjeTogfAo+PiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25l
ciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+PiB8ICszMyA1NjEg
MDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBU
aGVyZSBpcyBubyAgfAo+PiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8
IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+PiAnLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLS0tJwo+IAo+IEJlc3QgUmVnYXJkcywKPiAKPiBGYWJyaWNlCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBs
aXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
