Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40491EE4993
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 17:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9583940988;
	Mon, 21 Aug 2023 17:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9583940988
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fbZ0NXZve2rr; Mon, 21 Aug 2023 17:17:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EA0040994;
	Mon, 21 Aug 2023 17:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EA0040994
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8A81BF30E
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 17:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D61B740994
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 17:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D61B740994
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v7vED3dEiAjz for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 17:17:37 +0000 (UTC)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B416E40988
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 17:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B416E40988
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-26f7f71b9a7so366901a91.0
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 10:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692638257; x=1693243057;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hk99HwJ+5lgXEKWyoLAHj/n6G15ib3nEKum7+p7BQHQ=;
 b=QiPe2oIoAOlw5/KHCuGJx/Zr/ILWm4QlRQigUZMW0+1pGSmzzBo0KnbWarv0dLFjKw
 JvEcHh3HtrdYVMJ7PUbiPCy096vuTZl1Ugh3DYGHsBGx8VVAfGw1W6YXb8K6cnstN1F5
 eZY4LtaKet/KPhABdv5Sc6wm3yyqD4wqCsJYkumjjfyZxYXnMOx81x23f5nW9WNh7H5g
 TpbEfeQEPSaSli7QimDRwrIM/1lcXiMgu53nXoT7RW3olxCEMIdJ8GYV1P34as9R1e8H
 inbIOi74iUE/cEkKTfCxDxRoXfz97ZYG+DfvC0mJ/uuXCnVVTrZVVfYiGy73vrwuSbDv
 PSYQ==
X-Gm-Message-State: AOJu0YyR3RCdoeL8hizKsvLFb3+cX4P4c8872vx08wGUmce2E52FkMER
 tuRdMHuENUeq4H/LvcMX6So/C8GFlrxbetH1ojc=
X-Google-Smtp-Source: AGHT+IHLbP6ZRwBSE8EAs0eVYm79nLJi+/XQEGlPXpx6Nk3IPdiqSRITn2smfSgw9Y7Kq5L6r7C/5oJzsfV7hnsklRs=
X-Received: by 2002:a17:90a:bc92:b0:262:ed49:ffe7 with SMTP id
 x18-20020a17090abc9200b00262ed49ffe7mr6870943pjr.25.1692638256852; Mon, 21
 Aug 2023 10:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230819030849.3966233-1-Mr.Bossman075@gmail.com>
 <20230820234926.1dc52113@windsurf> <ZOMxzkz3gZNcs2BN@x1-carbon>
In-Reply-To: <ZOMxzkz3gZNcs2BN@x1-carbon>
From: Jesse T <mr.bossman075@gmail.com>
Date: Mon, 21 Aug 2023 13:17:00 -0400
Message-ID: <CAJFTR8TkogJ8uEt8tK1NDfQWdqn6SADNOk1148mBuq6DZNQB7Q@mail.gmail.com>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692638257; x=1693243057;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hk99HwJ+5lgXEKWyoLAHj/n6G15ib3nEKum7+p7BQHQ=;
 b=Mxjxrn3jSjOCfo6y3p+wat4JSX+axEz0JWFWTkZax88NqLXuDzyrT+0gMmKoEQrJqz
 Yp8c/8y5KSPy9XrjKPODxJ/GLuMSukWnB5FBRESGheY56KoXQFYlonbh0E21hpjb6Mfc
 eBIlvljcfJYHJ/KbgmvrW7qfqt+fiogJYp+FLG5tB/feWdKGU3GPbEHwM0ICzk3o2ZiY
 0mRlTey4NFVioNWfPdIV6SiRzEl5B9lpgWkFwNmPAm3cnFxo/mnOCI144Jlx9lMieVTJ
 mzSzh+1VjtQENsxUL7JDAl9lhkFvlUlIDu7cdrfjkgsUADndDYzyEZG5zIXAtNjIKDYU
 GSDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Mxjxrn3j
Subject: Re: [Buildroot] [PATCH] package/elf2flt: Fix build by updating to
 v2023.04
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Greg Ungerer <gerg@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Romain Naour <romain.naour@smile.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBBdWcgMjEsIDIwMjMgYXQgNTo0M+KAr0FNIE5pa2xhcyBDYXNzZWwgPE5pa2xhcy5D
YXNzZWxAd2RjLmNvbT4gd3JvdGU6Cj4KPiBPbiBTdW4sIEF1ZyAyMCwgMjAyMyBhdCAxMTo0OToy
NlBNICswMjAwLCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOgo+ID4gSGVsbG8gSmVzc2UsCj4gPgo+
ID4gT24gRnJpLCAxOCBBdWcgMjAyMyAyMzowODo0OSAtMDQwMAo+ID4gSmVzc2UgVGF1YmUgPG1y
LmJvc3NtYW4wNzVAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiA+IEluIGVsZjJmbHQgR3JlZyBV
bmdlcmVyIGNvbW1pdHRlZCAiZWxmMmZsdDogcmVtb3ZlIHVzZSBvZiBCRkRfVk1BX0ZNVCI6Cj4g
PiA+Cj4gPiA+ICJJbiBiaW51dGlscy0yLjQwIHRoZSBCRkRfVk1BX0ZNVCBkZWZpbml0aW9uIHVz
ZWQgZm9yIHByaW50ZiBzdHlsZQo+ID4gPiBmb3JtYXR0aW5nIHNwZWNpZmllcnMgaGFzIGJlZW4g
cmVtb3ZlZC4gRm9yIHJlZmVyZW5jZSB0aGlzIHdhcyBkb25lIGluCj4gPiA+IGNvbW1pdCBiODI4
MTc2NzRmNDYgKCJEb24ndCB1c2UgQkZEX1ZNQV9GTVQgaW4gYmludXRpbHMiKSBpbiB0aGUKPiA+
ID4gYmludXRpbHMgZ2l0IGRldmVsb3BtZW50IHRyZWUuCj4gPiA+Cj4gPiA+IEJGRF9WTUFfRk1U
IGlzIHVzZWQgaW4gYSBudW1iZXIgb2YgcGxhY2VzIGluIHRoZSBlbGYyZmx0IGNvZGUgdG8gb3V0
cHV0Cj4gPiA+IGJmZCBvZmZzZXRzLCB2YWx1ZXMgYW5kIHRoZSBsaWtlLiBTbyBpdCBpcyBicm9r
ZW4gd2hlbiB1c2luZyB0aGUgYmZkCj4gPiA+IGNvZGUgZnJvbSBiaW51dGlscy0yLjQwIGFuZCBu
ZXdlci4KPiA+ID4KPiA+ID4gQWNjb3JkaW5nIHRvIHRoZSBiaW51dGlscyBjaGFuZ2UgUFJJeDY0
IChhbmQgZnJpZW5kcykgaXMgdXNlZCB0byByZXBsYWNlCj4gPiA+IGl0LCB3aXRoIGFwcHJvcHJp
YXRlIGNhc3RzIHRvIGtlZXAgaXQgY2xlYW4gZm9yIDMyIGFuZCA2NCBiaXQgcGxhdGZvcm1zLgo+
ID4gPiBDaGFuZ2UgdGhlIGVsZjJmbHQuYyB1c2Ugb2YgaXQgaW4gdGhlIHNhbWUgd2F5IHRvIGZp
eC4iCj4gPiA+Cj4gPiA+IFRoaXMgcGF0Y2ggdXBkYXRlcyBlbGYyZmx0IHRvIHZlcnNpb24gdjIw
MjMuMDQsIGFuZCByZWJhc2VzIGFsbCB0aGUKPiA+ID4gQnVpbGRyb290IHBhdGNoZXMuCj4gPiA+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEplc3NlIFRhdWJlIDxNci5Cb3NzbWFuMDc1QGdtYWlsLmNv
bT4KPiA+Cj4gPiBDb3VsZCB5b3UgY2xhcmlmeSB3aGljaCBidWlsZCBmYWlsdXJlIHRoaXMgaXMg
Zml4aW5nPyBUaGUgY29tbWl0IHRpdGxlCj4gPiBzYXlzICJmaXggYnVpbGQiIGJ1dCB5b3UgZG9u
J3QgZXhwbGFpbiB3aGljaCBidWlsZCBmYWlsdXJlIGlzIGJlaW5nCj4gPiBmaXhlZC4KPiA+Cj4g
PiBJZiBpdCdzIHRoZSBCRkRfVk1BX0ZNVCBpc3N1ZSwgaXQgaGFzIGFscmVhZHkgYmVlbiBmaXhl
ZCBieSBjb21taXQKPiA+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9v
dC8tL2NvbW1pdC9kNzlmOWM5ZjQxNmFjNWRhOTBjZDQyODkxNmNmZjBiNTI4OGNiMDNhCj4gPiBp
biB3aGljaCB3ZSBoYXZlIGJhY2twb3J0ZWQgdGhlIHVwc3RyZWFtIGNvbW1pdCB5b3UncmUgcmVm
ZXJyaW5nIHRvLgoKQWggeWVzLCB5b3Ugc2VlbSB0byBoYXZlIGZpeGVkIHRoZSBidWlsZCBmYWls
dXJlIHdpdGggdGhhdCBwYXRjaC4KU29ycnkgZm9yIG1pc3NpbmcgaXQuCgo+ID4gVGhhdCBiZWlu
ZyBzYWlkLCBidW1waW5nIHRoZSB2ZXJzaW9uIG9mIGVsZjJmbHQgaXMgY2VydGFpbmx5IGEgZ29v
ZAo+ID4gaWRlYSBtb3ZpbmcgZm9yd2FyZC4gSG93ZXZlciwgd2Ugc2hvdWxkIGJlIGNhcmVmdWwg
d2hlbiBkb2luZyB0aGlzLCBhcwo+ID4gdXBkYXRpbmcgZWxmMmZsdCBoYXMgc2V2ZXJhbCB0aW1l
cyBpbiB0aGUgcGFzdCBwcm92ZW4gdG8gY29tZSB3aXRoIGEKPiA+IG51bWJlciBvZiByZWdyZXNz
aW9ucy4KPgo+IElmIHlvdSBjYW4gYnVpbGQgYW5kIGJvb3QgdGVzdDoKPiByaXNjdjY0LCB4dGVu
c2EsIGFuZCBtNjhrIHRoZW4gSSdtIHZlcnkgbXVjaCBpbiBmYXZvciBvZiBhIGJ1bXAhCj4KPiAo
UGVyc29uYWxseSwgSSBoYXZlIGtpbmQgb2YgZ2l2ZW4gdXAgaG9wZSBvZiB1cHN0cmVhbSBlbGYy
Zmx0LAo+IGJ1dCBpdCdzIG5pY2UgdG8gc2VlIHNvbWUgYWN0aXZpdHkgYWZ0ZXIgYWxtb3N0IDIg
eWVhcnMgb2Ygc29tZQo+IG9mIHRoZXNlIGlzc3VlcyBiZWluZyBrbm93biBhbmQgaGF2aW5nIG9w
ZW4gcHVsbCByZXF1ZXN0cy4KPiBOb3cgaWYgdGhleSB3b3VsZCBtZXJnZSB0aGUgcmlzY3YgcGF0
Y2hlcywgdGhlbiBJIHdvdWxkIGJlIGV2ZW4KPiBtb3JlIHN1cnByaXNlZCA6cCkKClVuZm9ydHVu
YXRlbHkgdGhleSBkaWRuJ3QgaG9wZWZ1bGx5IHNvbWUgZGF5LgoKPgo+IEZvciByaXNjdiB5b3Ug
Y2FuIGJvb3QgdGVzdCB1c2luZyB0aGUgZGVmY29uZmlnOgo+IHFlbXVfcmlzY3Y2NF9ub21tdV92
aXJ0X2RlZmNvbmZpZwoKSSB3aWxsIHRlc3QgdGhpcywgSSBoYXZlIGFscmVhZHkgdGVzdGVkIEFS
TSBvbiBzdG0zMiBhbmQgaW14cnQuCgo+IFVuZm9ydHVuYXRlbHksIEkgZG9uJ3QgcmVtZW1iZXIg
d2hpY2ggZGVmY29uZmlnIEkgdXNlZCB0byB0ZXN0IG02OGsgYW5kCj4geHRlbnNhLgoKSSB3aWxs
IHRyeQoKPgo+IEkgZG8gcmVtZW1iZXIgdGhhdCBUaG9tYXMgcmVwb3J0ZWQgYSBidWlsZCBlcnJv
ciB0aGF0IHdhcyBvbmx5IHNlZW4gd2hlbgo+IGV4cGxpY3RseSBlbmFibGluZyBCUjJfUEFDS0FH
RV9HREIsIHNvIGl0IHdvdWxkIGJlIG5pY2UgaWYgeW91IGNvdWxkIGVuYWJsZQo+IHRoYXQgYXMg
d2VsbC4gKEl0IHdhc24ndCBlbmFibGVkIGJ5IGRlZmF1bHQgaW4gc29tZSBvZiB0aGUgZGVmY29u
Zmlncy4pCj4KPgo+IEtpbmQgcmVnYXJkcywKPiBOaWtsYXMKPj4KPj4gQWxzbywgSmVzc2U6IHlv
dXIgYnVtcCBpcyBub3Qgb25seSByZWJhc2luZyBhbGwgQnVpbGRyb290IHBhdGNoZXMsIHNvbWUK
Pj4gYXJlIGRyb3BwZWQuIEl0IHdvdWxkIGJlIGdvb2QgdG8gbWVudGlvbiB3aGljaCBwYXRjaGVz
IGFyZSBkcm9wcGVkIChhbmQKPj4gd2hhdCBpcyB0aGUgY29ycmVzcG9uZGluZyB1cHN0cmVhbSBj
b21taXQpLCBhbmQgd2hpY2ggcGF0Y2hlcyBhcmUKPj4gcmViYXNlZC4KClllcywgSSBwdXQgc29t
ZSBub3RlcyBhYm91dCB0aGF0IGluIGJldHdlZW4gdGhlIGAtLS1gLgpUaGlzIHByb2JhYmx5IHNo
b3VsZCBoYXZlIGJlZW4gYW4gUkZDIHRoYW4gYSBwYXRjaC4KCkhvcGVmdWxseSwgSSBmb3JtYXR0
ZWQgdGhpcyByZXNwb25zZSBjb3JyZWN0bHkuLi4KClRoYW5rcywKSmVzc2UgVGF1YmUKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
