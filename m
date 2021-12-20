Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62071C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11A1960E67;
	Mon, 20 Dec 2021 22:39:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ExJMQksyGOha; Mon, 20 Dec 2021 22:39:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52B0A60E3C;
	Mon, 20 Dec 2021 22:39:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D29BA1BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEFAF40629
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e4OH8lnN3gsG for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:39:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D98A0405C8
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:38:59 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id z29so44247676edl.7
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 14:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=z1NH9HX57nKTLm5tOiZbRulp0Mxc5HaEjw+0vlmfbmo=;
 b=ES7mjJR3NwS7FxvXR/NXhcHYYJF/rM1+d/3NcqHvw7oF45bkcK/fx8XKWbwFW0y/vp
 OQjVTrsnzGZHtnRVO5CY1APYN2iXYqS7A99wFxIWx0K12wjn3elaRZyazGE0zFBi1UBW
 tAViRvt156H0N9W/GZuAzabCmIjxLPlxHEB5C2/NtkATeshCDgOkejUrNvmreLW1ECs7
 qHe3gY/66Dhnn9vNhV2T0nb/aTE5b2E4cT2rfTksicle8sTA7EOQAS2id0XMNSjQ6+MP
 7WSnWynMMnr+gySprMCN2BqUUWfaJjv8pp4S43KypPaVZ6LdJ8UR34JZN2JTA4wB+5R7
 m4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z1NH9HX57nKTLm5tOiZbRulp0Mxc5HaEjw+0vlmfbmo=;
 b=5cp5CEUA3YmgA8sw20wuNWDV2z4AvhITytSpHKiQuifaYpzOvKOh8hfVrNpEfh1NTK
 tNZnW7lCj+5WAnX71au1Lfh4IG5GSZvXlaznq0DMvyXEZE8u0sGLST2QWj0QORmfaSS2
 wKjGb/WW/Swhm3/KDIcBWgK7VeYJMpV5e5Tp0EaA2NmUCgtG3h3LU1TQgZguxYR6Dtq0
 52kC56NixX5V0MyZQgz1knQvaqn5RNFTwonPkyVy7Ek2GhzlhX0jfO5TNC2kHxK3CMmf
 xycxaAIlVONxW7c7naPPDl3F0ER888uJvZu8Se+e9Dq5fTn9VAj83nPwjFRTii4nTjp9
 UAsw==
X-Gm-Message-State: AOAM53341Z0koC4BZ8h4b+/j7Yw93ltEXOJCETCgRlTfUvq0yoUSzL8Z
 Yuo2rxyDMsQDh20s5Ol0ZtU1v+E7TN3oMY9t+rE8rwTwK3g9SA==
X-Google-Smtp-Source: ABdhPJyIXodry7F1zTteCMTL/81n5E1DazBzbXMvXMsdV0jpwr4ba2Mat/Vle8qOb79hzHRCM7xwinqpi4u2VUEFY3Q=
X-Received: by 2002:a17:907:72c6:: with SMTP id du6mr241159ejc.7.1640039938125; 
 Mon, 20 Dec 2021 14:38:58 -0800 (PST)
MIME-Version: 1.0
References: <20211219160234.1358835-1-fontaine.fabrice@gmail.com>
 <d4ded68f-2bc1-b728-c653-68eabd2fa06c@mind.be>
In-Reply-To: <d4ded68f-2bc1-b728-c653-68eabd2fa06c@mind.be>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Dec 2021 23:38:18 +0100
Message-ID: <CAPi7W81sAFqv7tsPpVd+bfZtBt4Y3xdDxu8Pp8O4PNEQ+HrHDw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/pppd: fix build with kernel >=
 5.15
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

TGUgbHVuLiAyMCBkw6ljLiAyMDIxIMOgIDIzOjMzLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJu
b3V0QG1pbmQuYmU+IGEgw6ljcml0IDoKPgo+Cj4KPiBPbiAxOS8xMi8yMDIxIDE3OjAyLCBGYWJy
aWNlIEZvbnRhaW5lIHdyb3RlOgo+ID4gRml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3
aXRoIGtlcm5lbCA+PSA1LjE1Ogo+ID4KPiA+IHN5cy1saW51eC5jOjE0ODoxMDogZmF0YWwgZXJy
b3I6IGxpbnV4L2lweC5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gPiAgICAxNDggfCAj
aW5jbHVkZSA8bGludXgvaXB4Lmg+Cj4gPiAgICAgICAgfCAgICAgICAgICBefn5+fn5+fn5+fn5+
Cj4gPgo+ID4gVGhpcyBob29rIGNvdWxkIGJlIHJlbW92ZWQgYXMgc29vbiBhcyBhIG5ldyBwcHBk
IHZlcnNpb24gaXMgcmVsZWFzZWQ6Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vcHBwLXByb2plY3Qv
cHBwL3B1bGwvMzI2Cj4KPiAgIEluIHRoYXQgUFIsIHRoZSBtYWludGFpbmVycyBzYXkgdGhhdCBp
bnN0ZWFkIC0tZGlzYWJsZS1pcHhjcCBzaG91bGQgYmUgdXNlZC4KPiBJZiB0aGF0IGRvZXNuJ3Qg
d29yaywgcGxlYXNlIGFkZCBhIGNvbW1lbnQgc28gdGhleSdsbCBhY3R1YWxseSBtZXJnZSBpdC4g
UmlnaHQKPiBub3csIGl0IGxvb2tzIGxpa2UgdGhleSB3b24ndC4KV2UgY2FuJ3QgdXNlIC0tZGlz
YWJsZS1pcHhjcCBhcyB0aGUgbGF0ZXN0IHZlcnNpb24gZG9lcyBub3Qgc2hpcCBhbnkKY29uZmln
dXJlIHNjcmlwdC4KSXQgaGFzIGJlZW4gYWRkZWQgcmVjZW50bHkgaW4gbWFzdGVyIGJ5Cmh0dHBz
Oi8vZ2l0aHViLmNvbS9wcHAtcHJvamVjdC9wcHAvY29tbWl0LzI4ODNkZDA3MTAxYmY4NTFlMmVh
MzY4ZjBjMDRjOTFhZWE4NWNmZjIKSSdtIHByZXR0eSBjb25maWRlbnQgdGhhdCB0aGlzIHdpbGwg
Z2V0IG1lcmdlZCwgc2VlCmh0dHBzOi8vZ2l0aHViLmNvbS9wcHAtcHJvamVjdC9wcHAvaXNzdWVz
LzExMSBvciBsYXRlc3QgY29tbWVudCBvZgpodHRwczovL2dpdGh1Yi5jb20vcHBwLXByb2plY3Qv
cHBwL3B1bGwvMzI2Cj4KPiA+Cj4gPiBGaXhlczoKPiA+ICAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1
aWxkcm9vdC5vcmcvcmVzdWx0cy81YTdmODllNTE3ODczNWY0ZDNlM2YzMzYwZjBmZWIyNjNmNmFj
NDMxCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFi
cmljZUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICAgcGFja2FnZS9wcHBkL3BwcGQubWsgfCA3ICsr
KysrKysKPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL3BwcGQvcHBwZC5tayBiL3BhY2thZ2UvcHBwZC9wcHBkLm1rCj4gPiBp
bmRleCA3MWJmY2ViNjA3Li4xOWI2ZjNjY2NlIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9wcHBk
L3BwcGQubWsKPiA+ICsrKyBiL3BhY2thZ2UvcHBwZC9wcHBkLm1rCj4gPiBAQCAtNTcsNiArNTcs
MTMgQEAgaWZlcSAoJChCUjJfUEFDS0FHRV9QUFBEX09WRVJXUklURV9SRVNPTFZfQ09ORikseSkK
PiA+ICAgUFBQRF9QT1NUX0VYVFJBQ1RfSE9PS1MgKz0gUFBQRF9TRVRfUkVTT0xWX0NPTkYKPiA+
ICAgZW5kaWYKPiA+Cj4gPiAraWZlcSAoJChCUjJfVE9PTENIQUlOX0hFQURFUlNfQVRfTEVBU1Rf
NV8xNSkseSkKPiA+ICtkZWZpbmUgUFBQRF9EUk9QX0lQWAo+ID4gKyAgICAgJChTRUQpICdzLy1E
SVBYX0NIQU5HRS8vJyAkKFBQUERfRElSKS9wcHBkL01ha2VmaWxlLmxpbnV4Cj4KPiAgIEV2ZW4g
dGhvdWdoIGl0J3MgYSBsYXJnZSBwYXRjaCwgSSdkIHByZWZlciB0byB0YWtlIHRoZSBQUiBwYXRj
aCBpbnN0ZWFkIG9mCj4gc2VkJ2luZy4gRWFzaWVyIHRvIGtlZXAgdHJhY2sgb2Ygd2hlbiB1cGRh
dGluZyBJTUhPLgpXZSBjYW4ndCB1c2UgdGhlIFBSIGFzIHdlIGRvbid0IGhhdmUgYW55IGNvbmZp
Z3VyZSBzY3JpcHQgdG8gcGF0Y2guCj4KPgo+ICAgUmVnYXJkcywKPiAgIEFybm91dAo+Cj4gPiAr
ZW5kZWYKPiA+ICtQUFBEX1BPU1RfRVhUUkFDVF9IT09LUyArPSBQUFBEX0RST1BfSVBYCj4gPiAr
ZW5kaWYKPiA+ICsKPiA+ICAgZGVmaW5lIFBQUERfQ09ORklHVVJFX0NNRFMKPiA+ICAgICAgICQo
U0VEKSAncy9GSUxURVI9eS8jRklMVEVSPXkvJyAkKFBQUERfRElSKS9wcHBkL01ha2VmaWxlLmxp
bnV4Cj4gPiAgICAgICAkKFNFRCkgJ3MvaWZuZXEgKCQkKHdpbGRjYXJkIFwvdXNyXC9pbmNsdWRl
XC9wY2FwLWJwZi5oKSwpL2lmZGVmIEZJTFRFUi8nICQoUFBQRF9ESVIpLyovTWFrZWZpbGUubGlu
dXgKPiA+CkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
