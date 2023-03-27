Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EAFC7619A
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 13:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 510D9402FD;
	Mon, 27 Mar 2023 13:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 510D9402FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M7sJYoX_-1gY; Mon, 27 Mar 2023 13:11:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2972640331;
	Mon, 27 Mar 2023 13:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2972640331
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E81C91BF37B
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 13:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C194D81973
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 13:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C194D81973
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A4EZcUzqBPIX for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 13:11:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60ADA8196A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60ADA8196A
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 13:11:28 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F105F240007;
 Mon, 27 Mar 2023 13:11:24 +0000 (UTC)
Date: Mon, 27 Mar 2023 15:11:23 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20230327151123.14c46304@booty>
In-Reply-To: <B1C2F9E6-C87B-4B1A-A6F9-9A312663D946@amd.com>
References: <20230326220543.057f381d@windsurf>
 <B1C2F9E6-C87B-4B1A-A6F9-9A312663D946@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679922685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cqiM8/wzNSmV3wtE1SHfHEXt+LAXs4XlZKM4aLnVNjw=;
 b=LbfpVGNrytEeqlhTgQ9z5t/fxlWXyXU5xdwLkAklEQJH762impujDyX9MC8EkbQrvG45F1
 +vfsAyu2i5IUQHA5ODyR9N9PsmqG9cjaLVZOZoFjCfgBRFN0YvSPF+Voe5f7fDvVsLOXa9
 LXwwNNEgA/GxnShaH9RAoY2m05m+aiqT4cX1LfqCw4o5YfotYtTC0S5P9qrcGVklrx/1N9
 pifhs9+ICgEgjyBTG1wP0w8x7zCB+AvC8+4VPRw3LKK151R9bydBTIJub21/QEcLlNuDe+
 DNfhNby4sB50M2lP2cNRehYBWGi1cBtg2m9mh8cNT3ZueM9bSlx9NW6WsXamAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LbfpVGNr
Subject: Re: [Buildroot] [PATCH v1 1/2] package/zynqmp-firmware: new package
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTmVhbCwKCk9uIE1vbiwgMjcgTWFyIDIwMjMgMDU6NDU6NDUgKzAwMDAKIkZyYWdlciwgTmVh
bCIgPG5lYWwuZnJhZ2VyQGFtZC5jb20+IHdyb3RlOgoKPiBIaSBUaG9tYXMsCj4gCj4gPiBMZSAy
NiBtYXJzIDIwMjMgw6AgMjI6MDUsIFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlA
Ym9vdGxpbi5jb20+IGEgw6ljcml0IDoKPiA+IAo+ID4g77u/SGVsbG8gTmVhbCwKPiA+ICAgCj4g
Pj4gT24gU3VuLCAyNiBNYXIgMjAyMyAxNTowOTo0OCArMDEwMAo+ID4+IE5lYWwgRnJhZ2VyIHZp
YSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKPiA+PiAKPiA+PiBU
aGlzIHBhdGNoIGFkZHMgYSBuZXcgcGFja2FnZSB0byBidWlsZHJvb3QgZm9yIGJ1aWxkaW5nIHRo
ZSB6eW5xbXAgcG11ZncKPiA+PiB3aXRoIHRoZSByZXF1aXJlbWVudCB0aGF0IHRoZSB1c2VyIG11
c3QgcHJvdmlkZSBhbiBleHRlcm5hbCBtaWNyb2JsYXplCj4gPj4gdG9vbGNoYWluLiAgCj4gPiAK
PiA+IFRoaXMgaXMgbm90IHJlYWxseSBuaWNlIDotLyBXYXMgdGhpcyB0aGUgY29uY2x1c2lvbiBv
ZiB0aGUgZGlzY3Vzc2lvbgo+ID4gd2UgaGFkIG9uIHRoaXMgdG9waWM/ICAKPiAKPiBJIHdvdWxk
IG5vdCBzYXkgdGhpcyBpcyB0aGUgY29uY2x1c2lvbiBvZiBvdXIgZGlzY3Vzc2lvbiwgYnV0IHJh
dGhlciBhIG5leHQgc3RlcC4gIE9uY2Ugd2UgaGF2ZSBhIG1pY3JvYmxhemUgY29tcGlsZXIgcGFj
a2FnZSwgd2UgY2FuIHVwZGF0ZSB0aGUgenlucW1wLWZpcm13YXJlIHBhY2thZ2UgdG8gdXNlIHRo
ZSBpbmNsdWRlZCBjb21waWxlciBieSBkZWZhdWx0IG9yIGFsbG93IHVzZXJzIHRvIHNlbGVjdCBh
biBleHRlcm5hbCBvbmUsIGluIGNhc2UgdGhleSBwcmVmZXIgdG8gdXNlIHRoZSBYaWxpbnggZGlz
dHJpYnV0ZWQgY29tcGlsZXIuCj4gCj4gPiAgIAo+ID4+ICtjb25maWcgQlIyX1BBQ0tBR0VfWllO
UU1QX0ZJUk1XQVJFX0tSSUFfSzI2Cj4gPj4gKyAgICBib29sICJrcmlhLWsyNiIKPiA+PiArICAg
IGhlbHAKPiA+PiArICAgICAgQWRkcyBhZGRpdGlvbmFsIENGTEFHUyBmb3IgS3JpYSBLMjYgU09N
cy4gIAo+ID4gCj4gPiBUaGlzIGRvZXNuJ3QgbG9vayBzdXBlciBleHRlbnNpYmxlLiBXaHkgYXJl
IHRoZXNlIENGTEFHUyBuZWVkZWQgaW4KPiA+IHBhcnRpY3VsYXIgZm9yIHRoaXMgcGxhdGZvcm0/
IElzIHRoaXMgYSBwZXItU29DIG9yIHBlci1ib2FyZAo+ID4gY29uZmlndXJhdGlvbj8gRG8gd2Ug
ZXhwZWN0IG1vcmUgcGxhdGZvcm1zIHRvIG5lZWQgY3VzdG9tIENGTEFHUz8gIAo+IAo+IFRoZXNl
IENGTEFHUyBhcmUgbmVlZGVkIGZvciB0aGUgazI2IFNPTXMsIHNvIHdlIHdpbGwgbmVlZCB0byBp
bmNsdWRlIHRoZW0gZm9yIHRoZSBrdjI2MCBhbmQga3IyNjAgZGVmY29uZmlncy4gIEkgYWdyZWUg
d2l0aCB5b3UgdGhhdCBjdXN0b20gZmxhZ3MgYXJlIG5vdCBzbyBuaWNlLCBhbmQgaG9wZWZ1bGx5
IFhpbGlueCB3aWxsIGZpbmQgYSBiZXR0ZXIgc29sdXRpb24gZm9yIHRoaXMgaW4gZnV0dXJlIHZl
cnNpb25zLgo+IAo+IEZvciBub3csIEkgdGhpbmsgd2UgaGF2ZSB0byBsaXZlIHdpdGggaXQuCj4K
PiA+ICAgCj4gPj4gK1pZTlFNUF9GSVJNV0FSRV9WRVJTSU9OID0gJChjYWxsIHFzdHJpcCwkKEJS
Ml9QQUNLQUdFX1pZTlFNUF9GSVJNV0FSRV9WRVJTSU9OKSkKPiA+PiArWllOUU1QX0ZJUk1XQVJF
X1NPVVJDRSA9IHhpbGlueF8kKFpZTlFNUF9GSVJNV0FSRV9WRVJTSU9OKS50YXIuZ3oKPiA+PiAr
WllOUU1QX0ZJUk1XQVJFX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vWGlsaW54L2VtYmVkZGVk
c3cvYXJjaGl2ZS9yZWZzL3RhZ3MgIAo+ID4gCj4gPiBVc2UgJChjYWxsIGdpdGh1YiwuLi4pIGlu
c3RlYWQKPiA+ICAgCj4gCj4gT2sKPiAKPiA+PiAraWZlcSAoJChCUjJfUEFDS0FHRV9aWU5RTVBf
RklSTVdBUkVfS1JJQV9LMjYpLHkpCj4gPj4gK1pZTlFNUF9DRkxBR1MgPSAiLU9zIC1mbHRvIC1m
ZmF0LWx0by1vYmplY3RzIC1EQk9BUkRfU0hVVERPV05fUElOPTIgLURCT0FSRF9TSFVURE9XTl9Q
SU5fU1RBVEU9MCBcCj4gPj4gKyAgICAgICAgLURFTkFCTEVfRU0gLURFTkFCTEVfTU9EX09WRVJU
RU1QIC1ERU5BQkxFX0RZTkFNSUNfTUlPX0NPTkZJRyAtREVOQUJMRV9JT0NUTCBcCj4gPj4gKyAg
ICAgICAgLURDT05ORUNUX1BNVV9HUE9fMl9WQUw9MCIgIAo+ID4gCj4gPiBBbGwgdGhlc2UgQ0ZM
QUdTIGFyZSByZWFsbHkgd2VpcmQuLi4gd2h5IGlzbid0IHRoaXMgcGFydCBvZiB0aGUKPiA+IHp5
bnFtcC1maXJtd2FyZSBidWlsZCBzeXN0ZW0gaXRzZWxmPwoKR2l2ZW4geW91IChOZWFsKSBhcmUg
d29ya2luZyBvbiB0aGlzLCBhbmQgeW91IGFyZSBhbHJlYWR5IGFjdGl2ZSBpbiBmaXhpbmcKc29t
ZSBpc3N1ZXMgaW4gdGhlIGVtYmVkZGVkc3cgcmVwb3NpdG9yeSAod2hpY2ggaXMgZ3JlYXRseSBh
cHByZWNpYXRlZApoZXJlISksIHdoeSBub3QgdHJ5aW5nIHRvIGhhdmUgYSBwcm9wZXIgc29sdXRp
b24gaW4gdGhlcmUgaW4gdGhlIGZpcnN0CnBsYWNlPwoKRml4aW5nIHRoaW5ncyB1cHN0cmVhbSBj
YW4gcG9zc2libHkgdGFrZSB0aW1lLCBidXQgaW4gdGhlIGVuZCBpdCB3aWxsIGF2b2lkCmFkZGlu
ZyBjcnVmdCZoYWNrcyBpbiB2YXJpb3VzIHBsYWNlcywgb2Ygd2hpY2ggSSBjYW4gY291bnQgMyBu
b3c6IHlvY3RvLAp6eW5xbXAtcG11ZnctYnVpbGRlciwgYW5kIGhvcGVmdWxseSBzb29uIEJ1aWxk
cm9vdC4KCj4gPj4gK2Vsc2UKPiA+PiArWllOUU1QX0NGTEFHUyA9ICItT3MgLWZsdG8gLWZmYXQt
bHRvLW9iamVjdHMiCj4gPj4gK2VuZGlmICAKPiA+IAo+ID4gSW4gYW55IGNhc2UsIHRoaXMgc2hv
dWxkIGJlOgo+ID4gCj4gPiBaWU5RTVBfQ0ZMQUdTID0gLU9zIC1mbHRvIC1mZmF0LWx0by1vYmpl
Y3RzCj4gPiAKPiA+IGlmZXEgKCQoQlIyX1BBQ0tBR0VfWllOUU1QX0ZJUk1XQVJFX0tSSUFfSzI2
KSx5KQo+ID4gWllOUU1QX0NGTEFHUyArPSBcCj4gPiAgICAtREJPQVJEX1NIVVRET1dOX1BJTj0y
IFwKPiA+ICAgIC1EQk9BUkRfU0hVVERPV05fUElOX1NUQVRFPTAgXAo+ID4gICAgLURFTkFCTEVf
RU0gXAo+ID4gICAgLURFTkFCTEVfTU9EX09WRVJURU1QIFwKPiA+ICAgIC1ERU5BQkxFX0RZTkFN
SUNfTUlPX0NPTkZJRyBcCj4gPiAgICAtREVOQUJMRV9JT0NUTCBcCj4gPiAgICAtRENPTk5FQ1Rf
UE1VX0dQT18yX1ZBTD0wCj4gPiBlbmRpZgo+ID4gICAKPiAKPiBPawo+IAo+ID4+ICsKPiA+PiAr
ZGVmaW5lIFpZTlFNUF9GSVJNV0FSRV9CVUlMRF9DTURTCj4gPj4gKyAgICBjZCAkKEBEKS9saWIv
c3dfYXBwcy96eW5xbXBfcG11Zncvc3JjICYmIG1ha2UgXAo+ID4+ICsgICAgICAgIENPTVBJTEVS
PSQoWllOUU1QX0ZJUk1XQVJFX1RPT0xDSEFJTl9QQVRIKS8kKFpZTlFNUF9GSVJNV0FSRV9UT09M
Q0hBSU5fUFJFRklYKWdjYyBcCj4gPj4gKyAgICAgICAgQVJDSElWRVI9JChaWU5RTVBfRklSTVdB
UkVfVE9PTENIQUlOX1BBVEgpLyQoWllOUU1QX0ZJUk1XQVJFX1RPT0xDSEFJTl9QUkVGSVgpZ2Nj
LWFyIFwKPiA+PiArICAgICAgICBDQz0kKFpZTlFNUF9GSVJNV0FSRV9UT09MQ0hBSU5fUEFUSCkv
JChaWU5RTVBfRklSTVdBUkVfVE9PTENIQUlOX1BSRUZJWClnY2MgXAo+ID4+ICsgICAgICAgIENG
TEFHUz0kKFpZTlFNUF9DRkxBR1MpICAKPiA+IAo+ID4gUGxlYXNlIHVzZToKPiA+IAo+ID4gICAg
JChNQUtFKSAtQyAkKEBEKS9saWIvc3dfYXBwcy96eW5xbXBfcG11Zncvc3JjIFwKPiA+ICAgICAg
ICAuLi4KPiA+ICAgCgpFdmVuIGJldHRlcjogc2hvdWxkIHlvdSB1c2UgJChNQUtFMSkgaGVyZSwg
d291bGQgaXQgYmUgcG9zc2libGUgdG8gZ2V0CnJpZCBvZiB0aGUgJ21ha2UgLWoxJyBwYXRjaD8K
Ci0tIApMdWNhIENlcmVzb2xpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
