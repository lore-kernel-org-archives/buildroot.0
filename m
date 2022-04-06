Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC8CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 14:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2866404A5;
	Wed,  6 Apr 2022 14:08:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pF5AyrE2i1Pi; Wed,  6 Apr 2022 14:08:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 773F5401FD;
	Wed,  6 Apr 2022 14:08:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78C991BF5DA
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 14:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67BB6408D7
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 14:07:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sq0czxTUMq_t for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 14:07:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A1B840891
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 14:07:57 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 n19-20020a9d7113000000b005cd9cff76c3so1794709otj.1
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 07:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T2K9xTTmMYeGHzdTK2ze71YS7X7VNgsECJKWTyf3CoI=;
 b=cybnzcKvg0hCX0TrnWyZUju0bRJEIsnPIGgQvEYJeEQPdPeYM9ZUuBx+aylW72Xi/U
 mg7Hzd0VeFKMK+15KnJ0gjfoci16MJC2YpoRYh85/rAtNeShUxWb0QaOQElEJHvNY8jk
 ZLoNy08isrh12hOK4VGfWgxBdQJRdKZ2GBntfHSbvsbFxfKLb5smzEYf+ybdCrlXbdrQ
 xluGvupX9A/6VkgJ8QjXjxWnwYT9R7F8trsYsGjn5jp3mCzVzWUKVO7imVwubcFv8veH
 vj3DIKIGnhnXTbRlI0MwSdJETIuo+8Yhm4/qhizNTcpjn8Ibe6PaQYbBr73GK8hsbm67
 ZKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T2K9xTTmMYeGHzdTK2ze71YS7X7VNgsECJKWTyf3CoI=;
 b=pl5unrfg1UsM7k3odIOQWFwN6oI8LnqyU4NfhK36IHu/PL/L2b6DeRdmGDu95R8lQq
 ERlH3FPs66UWw5f6V9B/dQZVGoXKrveX8Xuwdh8KcBy+xzl6a2Wm5QWAZHw937kV1HyP
 czWl4jr24UHSlqsH+zgCLSmpp1UyDdsMrbwRDJ4ID3QBIppyvbitqOtg3B7cOFmB7bhi
 hbzf2SxBd7R77fG0KFg0hwfXpKh+pPFo6SuEuxuCoNaAGIJUzxVQAGgkeZairkB9SrZl
 R6Yx7rto9Rkle/GsGW7PUIyencQqZFqWj11ypjamD2nsaEQ2SyHymcAi99LG8QdP5ArL
 Ef3Q==
X-Gm-Message-State: AOAM530Go5uOw+5UqImRg11wTFKH7mBMg+GA3BMYw9LreEJFpu5/g3oW
 1wE4jJW1V3BN5RhQhR4SKe0KFLGDxaiDEYcXt0JyvxF0lJY=
X-Google-Smtp-Source: ABdhPJx/sU3oLklR0cYjy2HpRxb9L8TfmKsfzCfcbUlK+hOPMVeBXJQ4PxBuxqBRU9I4qEsbpn0mCQ2yts8Fr+6Xx48=
X-Received: by 2002:a9d:6a84:0:b0:5cd:ad64:a50 with SMTP id
 l4-20020a9d6a84000000b005cdad640a50mr3072280otq.114.1649254076892; Wed, 06
 Apr 2022 07:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <DU0P251MB0779CD19DBCAA7F149788B41E3E49@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
 <CAPi7W83fzfin6_1KXV8BTy=AmcguoAK86mm4bFRrviFHBKmPbw@mail.gmail.com>
 <DU0P251MB07793F7BF68D17755B50F5F1E3E49@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
 <20220405181815.5dd6d85e@gmx.net>
 <GV1P251MB0771B70C2179F1A7FEFD76FBE3E79@GV1P251MB0771.EURP251.PROD.OUTLOOK.COM>
 <CAPi7W81e46JtetOtwT-RX8sJzVmEL_YMZrp89KBn1GCGrJfbyg@mail.gmail.com>
 <DU0P251MB0779CECB98F51521C578D9F2E3E79@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
 <CAPi7W8353UEfJS3YOKxp8OnVQ-HKfBwaujzVn30Hx4jehTmwoA@mail.gmail.com>
In-Reply-To: <CAPi7W8353UEfJS3YOKxp8OnVQ-HKfBwaujzVn30Hx4jehTmwoA@mail.gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 6 Apr 2022 16:06:06 +0200
Message-ID: <CAPi7W81W6iAJOpuEM21V2ADbx+tBS7G9yARN7iuAi5p4fN6HPw@mail.gmail.com>
To: Tim Hammer <Tim.Hammer@orolia.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWVyLiA2IGF2ci4gMjAyMiDDoCAxNTozMCwgRmFicmljZSBGb250YWluZQo8Zm9udGFpbmUu
ZmFicmljZUBnbWFpbC5jb20+IGEgw6ljcml0IDoKPgo+IExlIG1lci4gNiBhdnIuIDIwMjIgw6Ag
MTQ6NTgsIFRpbSBIYW1tZXIgPFRpbS5IYW1tZXJAb3JvbGlhLmNvbT4gYSDDqWNyaXQgOgo+ID4K
PiA+IE9uIFdlZCwgQXByIDA2LCAyMDIyIGF0IDA5OjA4OjU4QU0gKzAyMDAsIEZhYnJpY2UgRm9u
dGFpbmUgd3JvdGU6Cj4gPiA+IExlIG1lci4gNiBhdnIuIDIwMjIgw6AgMDM6NTgsIFRpbSBIYW1t
ZXIgPFRpbS5IYW1tZXJAb3JvbGlhLmNvbT4gYSDDqWNyaXQgOgo+ID4gPiA+Cj4gPiA+ID4gT24g
VHVlLCBBcHIgMDUsIDIwMjIgYXQgMDY6MTg6MTVQTSArMDIwMCwgUGV0ZXIgU2VpZGVyZXIgd3Jv
dGU6Cj4gPiA+ID4gPiBIZWxsbyBUaW0sCj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gVHVlLCA1IEFw
ciAyMDIyIDEyOjE1OjE0ICswMDAwLCBUaW0gSGFtbWVyIDxUaW0uSGFtbWVyQG9yb2xpYS5jb20+
IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gT24gVHVlLCBBcHIgMDUsIDIwMjIgYXQgMDg6
MTk6MDhBTSArMDIwMCwgRmFicmljZSBGb250YWluZSB3cm90ZToKPiA+ID4gPiA+ID4gPiBEZWFy
IFRpbSwKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IExlIG1hci4gNSBhdnIuIDIwMjIgw6Ag
MDU6NTQsIFRpbSBIYW1tZXIgPFRpbS5IYW1tZXJAb3JvbGlhLmNvbT4gYSDDqWNyaXQgOgo+ID4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IE9uIFN1biwgQXByIDAzLCAyMDIyIGF0IDEyOjAz
OjE4UE0gKzAyMDAsIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiA+IFVz
ZSBpbnRlcm5hbCBiaW5kIGFzIGRoY3AgZG9lc24ndCBidWlsZCBzaW5jZSBidW1wIG9mIGJpbmQg
dG8gdmVyc2lvbgo+ID4gPiA+ID4gPiA+ID4gPiA5LjE2LjI2IGluIGNvbW1pdCA4YWRlYWVjOGFm
YWNiYzY4MGVkZWJhZTkxNTI0ZjYxNDQ5MjZhYzkyIGFuZCB1cHN0cmVhbQo+ID4gPiA+ID4gPiA+
ID4gPiBkb2Vzbid0IHBsYW4gdG8gZml4IGl0IGFueSB0aW1lIHNvb246Cj4gPiA+ID4gPiA+ID4g
PiA+IGh0dHBzOi8vZ2l0bGFiLmlzYy5vcmcvaXNjLXByb2plY3RzL2RoY3AvLS9pc3N1ZXMvMjMz
I25vdGVfMjc2ODgzCj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiAuLi4KPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiBIb3dldmVyLCBJIGFzc3VtZSB0aGF0IEJVSUxEX0NDIGFuZCBC
VUlMRF9DRkxBR1MgaW4gYmluZC5tayBzaG91bGQKPiA+ID4gPiA+ID4gPiBhbHNvIGJlIHVwZGF0
ZWQ/Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEkgZG8gbm90IGhhdmUgdGhlIGlzc3VlIGJ1aWxk
aW5nIGJpbmQgKDkuMTYuMjYpLCB0aGVyZSBsaWIvZG5zL01ha2VmaWxlLmluIHNlZW1zIHRvIGJl
IGJldHRlciB3cml0dGVuOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAgICAgIGdlbjogZ2VuLmMK
PiA+ID4gPiA+ID4gICAgICR7SE9TVENDfSAke0hPU1RfQ0ZMQUdTfSAtSSR7dG9wX3NyY2Rpcn0v
bGliL2lzYy9pbmNsdWRlIFwKPiA+ID4gPiA+ID4gICAgICR7SE9TVF9MREZMQUdTfSAtbyAkQCAk
e3NyY2Rpcn0vZ2VuLmMKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gUGVyaGFwcyB3ZSBzaG91bGQg
YmUgcGF0Y2hpbmcgdGhhdCBmaWxlIGluc3RlYWQgb2YgdGhlIGNvbmZpZz8KPiA+ID4gPiA+Cj4g
PiA+ID4gPiBTZWUgaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvdHJlZS9wYWNr
YWdlL2JpbmQvMDAwMS1jcm9zcy5wYXRjaAo+ID4gPiA+ID4KPiA+ID4gPiA+IFJlZ2FyZHMsCj4g
PiA+ID4gPiBQZXRlcgo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IFllcywgdGhhdCByZWluZm9y
Y2VzIG15IHRoaW5raW5nLiBVbmZvcnR1bmF0ZWx5LCB0aGUgYnVuZGxlZCBiaW5kIGlzIG5vdCB1
bnppcHBlZCB1bnRpbCB0aGUgYnVpbGQgc3RlcAo+ID4gPiA+IGFuZCBJIGhhdmUgbm90IGZpZ3Vy
ZWQgb3V0IGEgZ29vZCB3YXkgdG8gZ2V0IHRoaXMgZGlmZiBpbiBwbGFjZS4KPiA+ID4gPiBQZXJo
YXBzIHNvbWVvbmUgd2l0aCBtb3JlIGV4cGVyaWVuY2UgY2FuIHNlZSB0aGUgc29sdXRpb24gdGhh
dCBpcyBlbHVkaW5nIG1lPwo+ID4gPgo+ID4gPiBNeSBiYWQsIEkgbWFkZSBhIHR5cG8gaW4gbXkg
Zmlyc3QgbWFpbCwgeW91IHNob3VsZCB1c2UgJChIT1NUQ0MpIGFuZAo+ID4gPiBub3QgJChIT1NU
X0NDKS4KPiA+Cj4gPiBXb3csIGhvdyBtYW55IHRpbWVzIGRpZCBJIGxvb2sgYXQgdGhvc2UgbGlu
ZXMgYW5kIG5vdCBzZWUgdGhlIGRpZmZlcmVuY2UhIDstKAo+ID4gVGhhbmtzIGZvciBjYXRjaGlu
ZyB0aGF0IQo+ID4KPiA+ID4gUGF0Y2hpbmcgYmluZCBpcyBub3QgbmVlZGVkLgo+ID4gPiBJIGNh
biBzZW5kIHRoZSBwYXRjaCBvciBsZXQgeW91IGhhbmRsZSBpdC4KPiA+Cj4gPiBJIGFtIHN0aWxs
IGNvbmNlcm5lZCBhYm91dCBteSBhYmlsaXR5IHRvIHZlcmlmeS0KPiA+IEkgYWRkZWQgImNvcnJl
Y3Rpb25zIiBmb3IgQlVJTERfQ0ZMQUdTICYgQlVJTERfTERGTEFHUyBzbyB0aG9zZSBtYXRjaCB0
aGUgY2hhbmdlcyBpbiBiaW5kLm1rLAo+ID4gICAgICAgICAtREhDUF9CSU5EX0VYVFJBX0NPTkZJ
RyA9IEJVSUxEX0NDPSckKFRBUkdFVF9DQyknCj4gPiAgICAgICAgICsKPiA+ICAgICAgICAgK0RI
Q1BfQklORF9FWFRSQV9DT05GSUcgPSBCVUlMRF9DQz0nJChIT1NUQ0MpJwo+ID4gICAgICAgICAr
REhDUF9CSU5EX0VYVFJBX0NPTkZJRyArPSBCVUlMRF9DRkxBR1M9JyQoSE9TVF9DRkxBR1MpJwo+
ID4gICAgICAgICArREhDUF9CSU5EX0VYVFJBX0NPTkZJRyArPSBCVUlMRF9MREZMQUdTPSckKEhP
U1RfTERGTEFHUyknCj4gPiBidXQgSSBhbSB1bnN1cmUgYWJvdXQgdGhlIG90aGVycyB1c2VkIChC
VUlMRF9DUFBGTEFHUywgQlVJTERfTElCUywgTEZTXyopLi4uCj4gPiAgICAgICAgICR7QlVJTERf
Q0N9ICR7QlVJTERfQ0ZMQUdTfSAtSSR7dG9wX3NyY2Rpcn0vbGliL2lzYy9pbmNsdWRlIFwKPiA+
ICAgICAgICAgJHtMRlNfQ0ZMQUdTfSAke0xGU19MREZMQUdTfSBcCj4gPiAgICAgICAgICR7QlVJ
TERfQ1BQRkxBR1N9ICR7QlVJTERfTERGTEFHU30gLW8gJEAgJHtzcmNkaXJ9L2dlbi5jIFwKPiA+
ICAgICAgICAgJHtCVUlMRF9MSUJTfSAke0xGU19MSUJTfQo+ID4gU2hvdWxkIHRob3NlIGJlIHNl
dCB0byBlbXB0eSBzdHJpbmdzPyBPciBpcyBpdCBzYWZlIHRvIGFzc3VtZSB0aGV5IGFyZSB1bmRl
ZmluZWQgYnkgZGVmYXVsdD8KPgo+IEJVSUxEX0NQUEZMQUdTIHNob3VsZCBiZSBzZXQgdG8gSE9T
VF9DUFBGTEFHUy4KPiBJTUhPIGl0IGlzIHNhZmUgdG8gYXNzdW1lIHRoYXQgQlVJTERfTElCUyBh
bmQgTEZTXyogYXJlIGVtcHR5Lgo+Cj4gRmVlbCBmcmVlIHRvIHNlbmQgeW91ciBwYXRjaCB3aXRo
IGEgbGluayB0byB0aGUgYXV0b2J1aWxkZXIgZmFpbHVyZSBzdWNoIGFzOgo+Cj4gRml4ZXM6Cj4g
IC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvN2E1Y2RmMzA4ODFkMjA4
ODA3OTc2Y2Y5ODk2MGM1ZmUyYWJmZWQ1MAoKVGhlIGNvcnJlY3QgbGluayBpcwpodHRwOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9kYTZmZDkwNGQxYTZiYWU3M2I2ZmY4OWRkMDA4
ZGUxZjQ1OWJiN2Q3CgpUaGUgcHJldmlvdXMgb25lIGlzIGFib3V0IHpsaWIsIEknbGwgaW52ZXN0
aWdhdGUgaXQuCgoKPgo+IEFybm91dCBvciB0aGUgb3RoZXJzIHdpbGwgbWFrZSBhIHNlY29uZCBy
ZXZpZXcgYW5kIHNwb3QgYW55IHJlbWFpbmluZyBpc3N1ZXMuCj4KPiA+Cj4gPiA+Cj4gPiAuLi4K
PiA+ID4KPiA+ID4gQmVzdCBSZWdhcmRzLAo+ID4gPgo+ID4gPiBGYWJyaWNlCj4gPgo+ID4gLlRp
bQo+ID4gVGltIEQuIEhhbW1lcgo+ID4gdGltLmhhbW1lckBvcm9saWEuY29tCj4gPgo+ID4KPgo+
IEJlc3QgUmVnYXJkcywKPgo+IEZhYnJpY2UKCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
