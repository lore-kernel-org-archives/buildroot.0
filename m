Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063B7C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Mar 2022 21:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9725E60C23;
	Sun,  6 Mar 2022 21:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z0XUY59-chWD; Sun,  6 Mar 2022 21:44:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A094260AAB;
	Sun,  6 Mar 2022 21:44:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DD191BF82C
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 21:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CAA980D69
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 21:44:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1F7SuyhqUFD9 for <buildroot@lists.busybox.net>;
 Sun,  6 Mar 2022 21:44:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0651381347
 for <buildroot@buildroot.org>; Sun,  6 Mar 2022 21:44:35 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id x193so13415398oix.0
 for <buildroot@buildroot.org>; Sun, 06 Mar 2022 13:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BurHdj3InvM4ZDc5a4VmAjyas8jSmzY9Vz10CEE6SsA=;
 b=aXR4jCxeq1OGSI6+ZpzQk1Pt4B0NPvzlmk85fOOiOXFTs6wAOXjR+TIh0ysW5NgfAQ
 0LBltVOG1MZuA1PDrWVCMFYNFsm1UCD1aHNA3wLnVUt4MluSXnPIOCyvN8Q3ouCZ4PM0
 S9GGUDXTd+Oy5PbLjz3kUTicqXYsAHkSFTaKRZhl2FMD+TLWmkYcKR8bTDzSuBCHy9lU
 HZfo8RSRsusIZLQRf4bZ0r7HjuO3yDc/WO0P2JBRpAic9oD8U7ImQrCxiL0RuKRa80wB
 c3X5rEIEtI1zBLM4DUkuvEPYQYkTBIEvGo9bddjqHBm6ybaPUNW3U1pS5qMJH08EfoYf
 snUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BurHdj3InvM4ZDc5a4VmAjyas8jSmzY9Vz10CEE6SsA=;
 b=unUWG5+5Rv6AcTg0x92sVfyoemeO58k3Ngl15SEzzeIKtyuvi/xmsomel8GLMsw9P6
 p8JUv/mEnKrioUjUrB7Z7ayi/EP1JyX8k+wdkEFOaL1djHnWehGIzDWRp9ogll0mh+vb
 OXDoDCaqPZlCj1mqcAOL9qGWTysdmC3pdFxQOfIfg17Vclga+BbdwiwAsQJGSIn1E4oz
 BLLXNWsLTAngDgHKjkToNFrAiW5Jg63kfgNMaiOZ6QI5+hA30WifvmK07GndKubVQC1L
 I6oq5nG8hgeJJ977a964MsZIjOevEZsGP8o53YLpkArCf4ew/avd+ofHKW1BMY7pnNIy
 qyxA==
X-Gm-Message-State: AOAM5310WNQb1Q5IAJMIRHQhYEOuruzv137nB01MahQWn785Y6pW7ci7
 usC1nZsU1njJWZ/fj3pzFDvjo2P4bxFYva4lUxCYzKeOJsU=
X-Google-Smtp-Source: ABdhPJwlRidRg0hxC0q1aB2lK18WQWZk+kZUT/V1Qk2BF41q20g0BCk7jf1FzDaXfKKGvDGfb/vBtBzC6WRG03BwL7M=
X-Received: by 2002:a05:6808:1455:b0:2d9:a01a:4bbd with SMTP id
 x21-20020a056808145500b002d9a01a4bbdmr5202582oiv.228.1646603074997; Sun, 06
 Mar 2022 13:44:34 -0800 (PST)
MIME-Version: 1.0
References: <20220222204034.3139362-1-fontaine.fabrice@gmail.com>
 <20220306213212.GH228549@scaer>
In-Reply-To: <20220306213212.GH228549@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 6 Mar 2022 22:43:50 +0100
Message-ID: <CAPi7W81XuPGVGuO4H_BzpRO5NRoDYZ-yUo2FZ0SKJPJNNBzEgQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCkxlIGRpbS4gNiBtYXJzIDIwMjIgw6AgMjI6MzIsIFlhbm4gRS4gTU9SSU4gPHlhbm4u
bW9yaW4uMTk5OEBmcmVlLmZyPiBhIMOpY3JpdCA6Cj4KPiBGYWJyaWNlLCBBbGwsCj4KPiBPbiAy
MDIyLTAyLTIyIDIxOjQwICswMTAwLCBGYWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToKPiA+
IDIuNi4wIGlzIGFuIG1haW50ZW5hbmNlIGFuZCBzZWN1cml0eSByZWxlYXNlLgo+ID4KPiA+IGh0
dHBzOi8vZ2l0aHViLmNvbS9GcmVlUkRQL0ZyZWVSRFAvcmVsZWFzZXMvdGFnLzIuNi4wCj4KPiBZ
b3UgY2xhaW0gJ3NlY3VyaXR5IGJ1bXAnIGluIHRoZSB0aXRsZSwgYnV0IHRoZSBhbm5vdW5jZW1l
bnQgZG9lcyBub3QKPiBzZWVtIHRvIGlkZW50aWZ5IGFueSBhY3R1YWwgc2VjdXJpdHkgZml4LCBh
cyBjb21wYXJlZCB0byAyLjUuMCB3aGljaCBkaWQKPiBleHBsaWNpdGx5IGxpc3Qgc2VjdXJpdHkg
Zml4ZXM6Cj4gICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9GcmVlUkRQL0ZyZWVSRFAvcmVsZWFzZXMv
dGFnLzIuNi4wCj4KPiBTbywgSSBkb247dCB0aGluayB0aGlzIGlzIG1hdGVyaWFsIGZvciBtYXN0
ZXIsIGlzIGl0PwoKSSBkb24ndCBrbm93LCBpbmRlZWQgdGhlIGFubm91bmNlbWVudCBkb2Vzbid0
IGlkZW50aWZ5IHNlY3VyaXR5IGZpeGVzCmJ1dCB0aGUgZmlyc3Qgc2VudGVuY2UgaXMgIjIuNi4w
IGlzIGFuIG1haW50ZW5hbmNlIGFuZCBzZWN1cml0eQpyZWxlYXNlLiIKQXQgbGVhc3QsIGEgY3Jh
c2ggd2l0aCB3YXlsYW5kIGlzIGZpeGVkIHdpdGg6Cmh0dHBzOi8vZ2l0aHViLmNvbS9GcmVlUkRQ
L0ZyZWVSRFAvaXNzdWVzLzc0MjYKClNvIGZlZWwgZnJlZSB0byBhcHBseSBpdCB0byBuZXh0IG9y
IG1hc3Rlci4KCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gLS0t
Cj4gPiAgcGFja2FnZS9mcmVlcmRwL2ZyZWVyZHAuaGFzaCB8IDQgKystLQo+ID4gIHBhY2thZ2Uv
ZnJlZXJkcC9mcmVlcmRwLm1rICAgfCAyICstCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJl
ZXJkcC9mcmVlcmRwLmhhc2ggYi9wYWNrYWdlL2ZyZWVyZHAvZnJlZXJkcC5oYXNoCj4gPiBpbmRl
eCBlMzFiOGQ1Yjk2Li43ODAwNjFiZGJiIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9mcmVlcmRw
L2ZyZWVyZHAuaGFzaAo+ID4gKysrIGIvcGFja2FnZS9mcmVlcmRwL2ZyZWVyZHAuaGFzaAo+ID4g
QEAgLTEsNSArMSw1IEBACj4gPiAtIyBGcm9tIGh0dHBzOi8vcHViLmZyZWVyZHAuY29tL3JlbGVh
c2VzL2ZyZWVyZHAtMi41LjAudGFyLmd6LnNoYTI1Ngo+ID4gLXNoYTI1NiAgMGZkOTM5NjA2OGNk
YThlNmQ4ODRkMDYzYTQ5OTMwMDFmMTQwZjQ2YzM2NDY0Y2NhZTI2MWI5NDc1MDUwY2QyYiAgZnJl
ZXJkcC0yLjUuMC50YXIuZ3oKPiA+ICsjIEZyb20gaHR0cHM6Ly9wdWIuZnJlZXJkcC5jb20vcmVs
ZWFzZXMvZnJlZXJkcC0yLjYuMC50YXIuZ3ouc2hhMjU2Cj4gPiArc2hhMjU2ICBhNGJhMGE3NWUz
MGVkMjVmZmZjNGNkNGU4OWQwZWI5MmU2Njg5NGNhZWI2Yzc4ZGM1ZTIzYjZiN2MwNGY2MGZlICBm
cmVlcmRwLTIuNi4wLnRhci5nego+ID4KPiA+ICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+ID4gIHNo
YTI1NiAgY2ZjNzc0OWI5NmY2M2JkMzFjM2M0MmI1YzQ3MWJmNzU2ODE0MDUzZTg0N2MxMGYzZWIw
MDM0MTdiYzUyM2QzMCAgTElDRU5TRQo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJlZXJkcC9m
cmVlcmRwLm1rIGIvcGFja2FnZS9mcmVlcmRwL2ZyZWVyZHAubWsKPiA+IGluZGV4IGM1MzZmNmNi
MWMuLmVkYmZiNjgwMWEgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL2ZyZWVyZHAvZnJlZXJkcC5t
awo+ID4gKysrIGIvcGFja2FnZS9mcmVlcmRwL2ZyZWVyZHAubWsKPiA+IEBAIC00LDcgKzQsNyBA
QAo+ID4gICMKPiA+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4KPiA+IC1GUkVFUkRQX1ZF
UlNJT04gPSAyLjUuMAo+ID4gK0ZSRUVSRFBfVkVSU0lPTiA9IDIuNi4wCj4gPiAgRlJFRVJEUF9T
SVRFID0gaHR0cHM6Ly9wdWIuZnJlZXJkcC5jb20vcmVsZWFzZXMKPiA+ICBGUkVFUkRQX0RFUEVO
REVOQ0lFUyA9IGxpYmdsaWIyIG9wZW5zc2wgemxpYgo+ID4gIEZSRUVSRFBfTElDRU5TRSA9IEFw
YWNoZS0yLjAKPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4g
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Lgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJ
QkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2Fy
ZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8
ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAg
fCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8
IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS0tLScKCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
