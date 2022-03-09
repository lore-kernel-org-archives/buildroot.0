Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E339C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 13:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E3B58426F;
	Wed,  9 Mar 2022 13:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kij3UohzZgST; Wed,  9 Mar 2022 13:52:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 397CD8425F;
	Wed,  9 Mar 2022 13:52:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 885251BF869
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 13:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76F208425F
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 13:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A48rJynDTcUX for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 13:52:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCFDB83366
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 13:52:35 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id o64so2689434oib.7
 for <buildroot@buildroot.org>; Wed, 09 Mar 2022 05:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Sv/YgyDaN/syWh0GL5fRuxZR0Vdvc5zYMN8bIEfJQik=;
 b=qZFSSrGW4Mi9deCn2H+2OvdxOuSpPBRTmC0XboIvQMPov9JQ9p+rTPT3Xj5rv3Ia8m
 G0JJrxJeNzwjA8nAFep2fsCJEIM4R1OpPMmQWAwNAi3pyY4bo30jIWyK+GmPG4UMKo7A
 6r1CExf4+QCqTUjS0MsiqDBNWY9LdKH8MhwDU6aXUKu3XBNpaxhacoko1x89iV/YZZQ3
 edoEjNBNDxhHTy7V8kiZs3yyDIBALZfeHKYwlHL+zPNWm5PpJTePWuG9cR/Z96Qt2fq5
 HhV3jcqDxWkaghxFbGLovhAfsNoCoxa9nmHwbsv5xeNRy+ji4fQtcLI0XWNvMKeLxm7x
 oi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Sv/YgyDaN/syWh0GL5fRuxZR0Vdvc5zYMN8bIEfJQik=;
 b=Kbjjb8y24mEnTdgXe75GvFI7rc0rSGHuAPq+cGdXNnbeJ+f8uP1EtY+Rgb+Wc3gguH
 tZ66/zSWt5X6+YQ7FFx/H2a0KT6HGfGXzM0Bxn76wv+oWWFm46mzLAE+cnMRE7Mg5t9I
 uSzrEWP81sTxPNVM1pB4V+btwxy1U5kMTSDkcdqfG6nZL0zpHSrqAkMefB4dc6yeadBU
 +LrR5Kpv2v96MHUfdU/lg9MHcmc+yhdfNkPQAkIyHyV7dIWbmfm1jSdXD+1DP2pavcJt
 m2ub/xwD9U8sLjHFbiGDDXN6+4jnDduRsqolWFXz/yUfi25FON8b2NYTgaUcjt5XkIBc
 I4/g==
X-Gm-Message-State: AOAM5310QqFiwuUai5Cg8zM98cHOV/iQmChXs4sLpH9FdUapZRgKNvV0
 Kf14rHTyGA0ls0eGXJ3osbzWwxooCMq6+3wYyj8=
X-Google-Smtp-Source: ABdhPJzsz/a+SvSGrlIsFecOaes34fwX3ycW7t73jn11NfkqoknKRSw/ElYV8u+OawKQDS8zCyNtwOOgpf+a2nkBxi4=
X-Received: by 2002:a05:6808:2181:b0:2d9:f364:b4fb with SMTP id
 be1-20020a056808218100b002d9f364b4fbmr6101709oib.206.1646833954789; Wed, 09
 Mar 2022 05:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20220215124619.563502-1-nolange79@gmail.com>
 <2086ffec-82b8-ec71-41f0-55253c3cd8eb@mind.be>
In-Reply-To: <2086ffec-82b8-ec71-41f0-55253c3cd8eb@mind.be>
From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 9 Mar 2022 14:52:23 +0100
Message-ID: <CADYdroPz7ptgdwEuLC1MFpLOHX3g7sAS1vbuV8WdsSuV=j=Z_A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/2] toolchain: support mismatched merged usr
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gU2EuLCA1LiBNw6RyeiAyMDIyIHVtIDE2OjA5IFVociBzY2hyaWViIEFybm91dCBWYW5kZWNh
cHBlbGxlIDxhcm5vdXRAbWluZC5iZT46Cj4KPgo+Cj4gT24gMTUvMDIvMjAyMiAxMzo0NiwgTm9y
YmVydCBMYW5nZSB3cm90ZToKPiA+IExvb2sgYXQgdGhlIGNhc2Ugd2hlcmUgdGhlIHNvdXJjZSB0
b29sY2hhaW4gaGFzIG5vbi1tZXJnZWQgdXNyLAo+ID4geWV0IHRoZSB0YXJnZXQgd2lsbCBoYXZl
IG1lcmdlZCB1c3IuCj4gPgo+ID4gc3lzcm9vdC9saWIvbGQtbXVzbC14ODZfNjQuc28uMSAtPiAu
Li91c3IvbGliL2xpYmMuc28KPiA+IHN5c3Jvb3QvdXNyL2xpYi9saWJjLnNvCj4KPiAgIFdoZXJl
IGRvIHlvdSBnZXQgYW4gZXh0ZXJuYWwgdG9vbGNoYWluIHdpdGggc3VjaCBhIHdlaXJkIGxheW91
dD8gTm9ybWFsbHkgbGliYwo+IGlzIGluIHN5c3Jvb3QvbGliIGFuZCBsZC1tdXNsKi5zby4xIGlz
IGEgc3ltbGluayB0byBlaXRoZXIgL2xpYi9saWJjLnNvIG9yCj4gLi4vbGliL2xpYmMuc28uCj4K
Pgo+ICAgUmVnYXJkcywKPiAgIEFybm91dAo+Cgp0aGUgdG9vbGNoYWluIGlzIGJ1aWx0IHdpdGgg
Y3Jvc3N0b29sLW5nCgo+ID4KPiA+IFdoYXQgaGFwcGVucyBpcyB0aGF0IGJ1aWxkcm9vdCBjb3Bp
ZXMgdGhlIGxkLSpzbyogc3ltbGluawo+ID4gaW50byB1c3IvbGliLCBhdCB3aGljaCBwb2ludCBp
dCBiZWNvbWVzIGJyb2tlbi4KPiA+Cj4gPiBXZSBub3cgZGV0ZWN0IHRoZXNlIGJyb2tlbiBzeW1s
aW5rcywgdGhlbiB0cnkgdG8gZmluZCB0aGUgdGFyZ2V0Cj4gPiBiaW5hcnkgaW4gdGhlIGxpYnJh
cnkgZGlyZWN0b3JpZXMgYW5kIGZpeCB0aGUgbGluay4KPiA+Cj4gPiBGaXggdGhlIGNhc2Ugd2hl
cmUgdGhlIGxpYiBkaXJlY3RvcnkgaXMgYSBzeW1saW5rLCBhbmQgbm8gbGQtKnNvKgo+ID4gaXMg
aW5zdGFsbGVkIGJ5IGFkZGluZyAtSCB0byBmaW5kLgo+ID4KPiA+IEFsc28gdXNlIGBjcCAtdGAg
aW5zdGVhZCBvZiBzb21lIHJhcmVseSB1c2VkIHhhcmdzIHRyaWNrcy4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBOb3JiZXJ0IExhbmdlIDxub2xhbmdlNzlAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAg
IHRvb2xjaGFpbi9oZWxwZXJzLm1rIHwgMTMgKysrKysrKysrKystLQo+ID4gICAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvdG9vbGNoYWluL2hlbHBlcnMubWsgYi90b29sY2hhaW4vaGVscGVycy5tawo+ID4gaW5kZXgg
ZWY4ZTlhNWY2NC4uYWFmMmFlY2Q4MCAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xjaGFpbi9oZWxwZXJz
Lm1rCj4gPiArKysgYi90b29sY2hhaW4vaGVscGVycy5tawo+ID4gQEAgLTEzNSw4ICsxMzUsMTcg
QEAgY29weV90b29sY2hhaW5fc3lzcm9vdCA9IFwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAk
KGNhbGwgc2ltcGxpZnlfc3ltbGluaywkJGksJChTVEFHSU5HX0RJUikpIDsgXAo+ID4gICAgICAg
ICAgICAgICBkb25lIDsgXAo+ID4gICAgICAgZmkgOyBcCj4gPiAtICAgICBpZiBbWyAhICQkKGZp
bmQgJChTVEFHSU5HX0RJUikvbGliIC1uYW1lICdsZCouc28uKicgLXByaW50IC1xdWl0KSBdXTsg
dGhlbiBcCj4gPiAtICAgICAgICAgICAgIGZpbmQgJCR7QVJDSF9TWVNST09UX0RJUn0vbGliIC1u
YW1lICdsZCouc28uKicgLXByaW50MCB8IHhhcmdzIC0wIC1JICUgY3AgJSAkKFNUQUdJTkdfRElS
KS9saWIvOyBcCj4gPiArICAgICBmb3IgaSBpbiAkJChmaW5kIC1IICQoU1RBR0lOR19ESVIpL2xp
YiAtbmFtZSAnbGQqLnNvLionIC14dHlwZSBsKTsgZG8gXAo+ID4gKyAgICAgICAgICAgICBMSU5L
VEFSR0VUPWByZWFkbGluayAkJGlgOyBcCj4gPiArICAgICAgICAgICAgIHJtICQkaTsgXAo+ID4g
KyAgICAgICAgICAgICBORVdMSU5LVEFSR0VUPSQkKGZpbmQgLUggJChTVEFHSU5HX0RJUikvJCR7
QVJDSF9MSUJfRElSfSAkKFNUQUdJTkdfRElSKS9saWIgJChTVEFHSU5HX0RJUikvdXNyLyQke0FS
Q0hfTElCX0RJUn0gJChTVEFHSU5HX0RJUikvdXNyL2xpYiAtbmFtZSAiYGJhc2VuYW1lICQke0xJ
TktUQVJHRVR9YCIgLXByaW50IC1xdWl0KTsgXAo+ID4gKyAgICAgICAgICAgICBpZiBbIC1uICIk
JHtORVdMSU5LVEFSR0VUfSIgLWEgLWUgIiQke05FV0xJTktUQVJHRVR9IiBdOyB0aGVuIFwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICBsbiAtc3IgJCR7TkVXTElOS1RBUkdFVH0gJCRpOyBcCj4g
PiArICAgICAgICAgICAgICAgICAgICAgZWNobyAiU3ltbGlua2luZyAkJGkgLT4gYHJlYWRsaW5r
ICQkaWAiIDsgXAo+ID4gKyAgICAgICAgICAgICBmaTsgXAo+ID4gKyAgICAgZG9uZTsgXAo+ID4g
KyAgICAgaWYgW1sgISAkJChmaW5kIC1IICQoU1RBR0lOR19ESVIpL2xpYiAtbmFtZSAnbGQqLnNv
LionIC1wcmludCAtcXVpdCkgXV07IHRoZW4gXAo+ID4gKyAgICAgICAgICAgICBmaW5kICQke0FS
Q0hfU1lTUk9PVF9ESVJ9L2xpYiAtbmFtZSAnbGQqLnNvLionIC1wcmludDAgfCB4YXJncyAtMCBj
cCAtdCAkKFNUQUdJTkdfRElSKS9saWIvOyBcCj4gPiAgICAgICBmaSA7IFwKPiA+ICAgICAgIGlm
IFsgYHJlYWRsaW5rIC1mICQke1NZU1JPT1RfRElSfWAgIT0gYHJlYWRsaW5rIC1mICQke0FSQ0hf
U1lTUk9PVF9ESVJ9YCBdIDsgdGhlbiBcCj4gPiAgICAgICAgICAgICAgIGlmIFsgISAtZCAkJHtB
UkNIX1NZU1JPT1RfRElSfS91c3IvaW5jbHVkZSBdIDsgdGhlbiBcCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
