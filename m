Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C8AC46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 20:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9A1C83DE8;
	Tue, 30 Jan 2024 20:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9A1C83DE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LTO2Oyhwfcd4; Tue, 30 Jan 2024 20:12:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C51C983E1E;
	Tue, 30 Jan 2024 20:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C51C983E1E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A1821BF340
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 20:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F9DA83E01
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 20:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F9DA83E01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KCKBi8qINquY for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 20:12:22 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43D4283DE8
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 20:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43D4283DE8
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e7065b7bdso50303925e9.3
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 12:12:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706645540; x=1707250340;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uGhF40IOxj+R7o5YO3e24jbRKDGXgmEt9GZEYu28h3s=;
 b=ajY2n1MqP8tVfxGwBCXnRYWg5a6GU9U9PS7Xld4eVYrgSVuxH7sozIVdxuWII0gavy
 bVXoi+v9onTDGbeAh0ZN2KqigwvI7EEZPgB8jwd603RY9ItobGYJ3MndEchvoXXCHuXC
 ZrLZVjI1YCP/hAqC2CS1jhWB9tyPVDi9DVD/2XZ+Ke2wXljs3tkRJeEtFSFJJhr5wb4U
 1riz1G7FIUf9HkMw2cqrDhOQlzq1DF8GCKXn/okv3aNK836ndLvKNh3OTKcXHjfC/SdS
 RRPHGSKXZOqKxJDYbmDeZyrdTPQRoRtnQRPg0g+K+/KHHNNZltEqahRhrImxMqS0PRAW
 b9CA==
X-Gm-Message-State: AOJu0YyclGaSjDv7oojQ9OYCeF/EgU23q5oQf3n8ViUDXJWOK2YAf/L2
 nVMPWlJKvaOMRDaeL+iLIbULQrdgAcs+97stimBdnUxdBFz/9sm5dGEwM1BsKaQ=
X-Google-Smtp-Source: AGHT+IFFTkx4GOCprKzW3IpzD3KbwX8lpzTqaozq6vV0RyZ3nlb5VruGLhLP3eOWMpHqH1wZwP/qZg==
X-Received: by 2002:a05:600c:474f:b0:40e:fb76:5344 with SMTP id
 w15-20020a05600c474f00b0040efb765344mr4127244wmo.11.1706645540258; 
 Tue, 30 Jan 2024 12:12:20 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b0040ebf603a89sm17692544wmq.11.2024.01.30.12.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 12:12:19 -0800 (PST)
Message-ID: <da453aba-37a0-464c-86a9-3b05f7f1fe79@mind.be>
Date: Tue, 30 Jan 2024 21:12:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Didier Trosset <didier.trosset@acqiris.com>, buildroot@buildroot.org
References: <3c2e39b3-e19d-44ba-a46d-95d768516c59@acqiris.com>
In-Reply-To: <3c2e39b3-e19d-44ba-a46d-95d768516c59@acqiris.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1706645540; x=1707250340; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uGhF40IOxj+R7o5YO3e24jbRKDGXgmEt9GZEYu28h3s=;
 b=GfjeiO7J8sA/t/tuFA236yBanURhVsRddniNudwrVtsBS5IetSsNyg8SzII0EGfRcw
 UFMyFoa2sfP+HcCW9nqxzdHAqr4/5Hqs5CpUoO9e+uIf2ayjQaVp+QgozEytcagZ8FLp
 OavLThXcy5rxJ62E3oyryptDwU8+81foGbCYAc9/3Q694ZnKVXQoMgY2rM848xELvp8W
 3X1jTyt7ZdVUB5Nc6V7dd7uMQsY2EWwi9+8vjCvaOTn1EPlOJc9NcLZ6hfQTarkHmwbZ
 rcaN8EQeaQ6fTxXojdK5rd5T4Q1+XK2iv0tfQtUNmHrFhCbV2OGn4+bZdk/uOHWgKguP
 TwGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GfjeiO7J
Subject: Re: [Buildroot] Failed to start Remount Root and Kernel File
 Systems.
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBEaWRpZXIsCgpPbiAyNC8wMS8yMDI0IDE3OjIxLCBEaWRpZXIgVHJvc3NldCB3cm90ZToK
PiBJJ20gc2V0dGluZyB1cCBhIGJ1aWxkcm9vdCBmb3IgYW4geDg2XzY0IHN5c3RlbSB0aGF0IEkn
ZCB3YW50IG9uIGEgVVNCIHN0aWNrLgo+IAo+IEkndmUgc2V0dXAgYnVpbGRyb290IHRvIGJ1aWxk
IHg4Nl82NCwgd2l0aCBpbml0aWFsIFJBTSBmaWxlc3lzdGVtIGxpbmtlZCBpbnRvIAo+IGtlcm5l
bCBhcyBjcGlvLgo+IEJvb3Rsb2FkZXIgaXMgZ3J1YjIgYXMgeDY0LWVmaS4KPiAKPiBUaGUgVVNC
IHN0aWNrIGhhcyB0aHJlZSBwYXJ0aXRpb25zOgo+IC0gc2R4MTogRUZJIHdpdGggYm9vdGxvYWRl
ciBhbmQgZ3J1Yi5jZmcKPiAtIHNkeDI6IGV4dDIgd2l0aCBiekltYWdlIChhbmQgaW5pdGlhbCBy
b290ZnMpCj4gLSBzZHgzOiBleHQ0IHdpdGggZnVsbCByb290IGZpbGVzeXN0ZW0KCiAgVGhlcmUg
aXMgbm90aGluZyBpbiBCdWlsZHJvb3QgdGhhdCBoZWxwcyB5b3UgdG8gc3VwcG9ydCBhIHNjZW5h
cmlvIHdpdGggYW4gCmluaXRpYWwgcm9vdGZzIHRoYXQgbGF0ZXIgZ2V0cyByZXBsYWNlZCBieSBh
IGZ1bGwgcm9vdCBmaWxlc3lzdGVtLiAoQWN0dWFsbHkgSSdtIApseWluZyAtIHRoZXJlIGlzIGRy
YWN1dCwgYnV0IHlvdSBkb24ndCBtZW50aW9uIGl0IHNvIEkgYXNzdW1lIHlvdSdyZSBub3QgdXNp
bmcgaXQuKQoKICBUaGVyZWZvcmUsIHlvdSBtdXN0IGJlIHVzaW5nIHNvbWV0aGluZyBlbHNlIHRo
YXQgZG9lcyB0aGUgbmVjZXNzYXJ5IHBpdm90X3Jvb3QgCm1hZ2ljLiBQZXJoYXBzIHRoZXJlJ3Mg
c29tZXRoaW5nIGJ1aWx0IGluIGluIHN5c3RlbWQgdGhhdCBkb2VzIGl0PyBUaGVuIHlvdSdsbCAK
bmVlZCB0byBjb25zdWx0IHN5c3RlbWQncyBtYW51YWwgdG8gZmluZCBob3cgdGhhdCB3b3JrcyBl
eGFjdGx5Li4uCgogIEhvdyB0byB5b3UgZ2VuZXJhdGUgdGhlIGluaXRpYWwgcm9vdGZzIGFuZCB0
aGUgZnVsbCByb290ZnM/Cgo+IAo+IFRoZSBzeXN0ZW0gYm9vdHMgY29ycmVjdGx5LCB3aXRoaW4g
Z3J1Yi5jZmcsIGxpbnV4IGhhcyB0aGUgY29ycmVjdCAKPiAicm9vdD0vZGV2L3NkeDMiIChhbHNv
IHRyaWVkICJyb290PVVVSUQ9eHh4Li4uIikuCj4gSSBjYW4gcmVhZCBpdCBmcm9tIC9wcm9jL2Nt
ZGxpbmUKPiAKPiBNeSB0cm91YmxlIGlzIHRoZSBzeXN0ZW1kIGVycm9yIGluIHRpdGxlOiAiW0ZB
SUxFRF0gRmFpbGVkIHRvIHN0YXJ0IFJlbW91bnQgUm9vdCAKPiBhbmQgS2VybmVsIEZpbGUgU3lz
dGVtcy4iCgogIEluIHN5c3RlbWQgdGhlcmUgYXJlIHVuaXRzIGZvciBldmVyeXRoaW5nLiBZb3Ug
c2hvdWxkIGJlIGFibGUgdG8gcmVtb3ZlIHRoZSAKcm9vdD0uLi4uIG9wdGlvbiBlbnRpcmVseSwg
d2hpY2ggcHJvYmFibHkgdHJpZ2dlcnMgc3lzdGVtZCB0byBza2lwIHRoYXQgc2VydmljZS4gClRo
YXQgc2hvdWxkIGFsbG93IHlvdSB0byBib290IHdpdGgganVzdCB0aGUgaW5pdGlhbCByb290ZnMs
IGFuZCB0aGVuIHlvdSBjYW4gdXNlIApzeXN0ZW1jdGwgdG8gc2VhcmNoIHRoZSBzZXJ2aWNlIHRo
YXQgZG9lcyB0aGlzIHJlbW91bnQgYW5kIGdldCBtb3JlIGluZm8gZnJvbSBpdC4KCj4gVGhlIHN5
c3RlbSBrZWVwcyB0aGUgaW5pdGlhbCByb290ZnMgYXMgLy4gSXQgZGlkIG5vdCBjaGFuZ2UgdG8g
L2Rldi9zZHgzCj4gCj4gV2l0aGluIHRoZSBib290IGxvZywgSSBjYW4gc2VlIHRoYXQgbXkgVVNC
IHN0aWNrIHBhcnRpdGlvbnMgYXJlIGRpc2NvdmVyZWQgYWZ0ZXIgCj4gdGhlIHJlbW91bnQgcm9v
dCBlcnJvci4KCiAgVGhhdCBzb3VuZHMgbGlrZSB0aGVyZSdzIHNvbWV0aGluZyB3cm9uZyBpbiB0
aGF0IFJlbW91bnQgUm9vdCBzZXJ2aWNlIHRoZW4gLSAKaXQgc2hvdWxkIGhhdmUgYSBkZXBlbmRl
bmN5IG9uIHRoZSBtb3VudCB1bml0IGZvciB0aGF0IHBhcnRpdGlvbiwgYW5kIHRoYXQgCml0c2Vs
ZiBoYXMgYSBkZXBlbmRlbmN5IG9uIHRoZSB1ZGV2IGRpc2NvdmVyeSBvZiB0aGUgcGFydGl0aW9u
LgoKICBQZXJoYXBzIHRoZSBtb3VudCB1bml0IGhhcyBhIHRpbWVvdXQgdGhhdCBpcyB0b28gc21h
bGw/IEJ1dCB0aGUgZGVmYXVsdCB3b3VsZCAKdHlwaWNhbGx5IG9uZSBtaW51dGUgb3IgbW9yZS4u
LgoKPiBGdXJ0aGVybW9yZSwgdGhleSBhcHBlYXIgd2l0aCBhIHRpbWVzdGFtcCBbwqAgNS45MTIx
XSBpbnN0ZWFkIG9mIFsgT0vCoCBdLgo+IEkgdHJpZWQgdG8gYWRkIHJvb3RkZWxheT0xMCB0byBs
aW51eCBjbWRsaW5lIHdpdGhvdXQgc3VjY2Vzcy4KCiAgcm9vdGRlbGF5IGlzIHByb2JhYmx5IG5v
dCBnb2luZyB0byBoZWxwIC0gaXQncyBvbmx5IHVzZWQgYnkgdGhlIGtlcm5lbCdzIAptb3VudGlu
ZyBvZiB0aGUgcm9vdCBmaWxlc3lzdGVtLCBidXQgdGhlIGtlcm5lbCBkb2Vzbid0IG1vdW50IGEg
cm9vdGZpbGVzeXN0ZW0gCmJ5IGl0c2VsZiB3aGVuIHRoZXJlJ3MgYW4gaW5pdHJkLgoKICBSZWdh
cmRzLAogIEFybm91dAoKPiAKPiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhlIHJlbW91bnQg
Y2Fubm90IGJlIHN1Y2Nlc3NmdWwgYmVjYXVzZSB0aGUgVVNCIAo+IHBhcnRpdGlvbiBpcyBub3Qg
a25vd24gdG8gdGhlIGtlcm5lbCBhdCB0aGUgdGltZSB0aGUgcmVtb3VudCBpcyBkb25lLgo+IE15
IG1haW4gcXVlc3Rpb24gaXMgaG93IHRvIHNvbHZlIHRoaXM/IChBbHNvOiBEb2VzIHN5c3RlbWQg
cmVhbGx5IHN0YXJ0IGJlZm9yZSAKPiB0aGUga2VybmVsIGhhcyBmaW5pc2hlZCBkaXNjb3Zlcmlu
ZyBldmVyeXRoaW5nPykKPiAKPiBUaGFua3MgZm9yIHlvdXIgaGVscC4KPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
