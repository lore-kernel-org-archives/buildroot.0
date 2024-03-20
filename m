Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF199CD11DC
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 15:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 277D140933;
	Wed, 20 Mar 2024 15:47:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EmtUctklSS5o; Wed, 20 Mar 2024 15:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E70240919
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E70240919;
	Wed, 20 Mar 2024 15:47:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC6F31BF57B
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 15:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B952440919
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 15:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aaVLaeCzFJgx for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 15:47:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F3C8C40737
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3C8C40737
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3C8C40737
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 15:47:04 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([212.114.183.116]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBlxM-1rd6me1DjQ-00CAJ2; Wed, 20
 Mar 2024 16:47:00 +0100
Date: Wed, 20 Mar 2024 16:46:59 +0100
To: Shafqat Abbas <shafqat.abbas@skyelectric.com>, buildroot@buildroot.org
Message-ID: <20240320164659.08cd8673@gmx.net>
In-Reply-To: <CAL5xJooTe=qF8ngXTP45Uge0=ck546OnEzr2EaH4Qq5wrEj7rw@mail.gmail.com>
References: <CAL5xJopYY+47g9XAwr=9WDBrYBTPB4ycnh0ODy45+jNsP8WfFg@mail.gmail.com>
 <20240319232723.70ebf43c@gmx.net>
 <CAL5xJooTe=qF8ngXTP45Uge0=ck546OnEzr2EaH4Qq5wrEj7rw@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:nP3Npht5DUXl30iVCLYOSuc42Epf8JvylysVfUvl/EMd6GaELsQ
 Mk9XVnfiRCdhSLwf+y5J8aXyB3Wh7r3LGOC2UN2VJO5OQdBD0DFCsq9AIfgHPe4UilhMgMj
 yJBtw4JeoYZ31jeHft83BM0SeGGErbJlgjxggr04xgNvggXnHaOJuUfTiDhf+SmcYpWCVfm
 qmikJ6NAinlPd2xUd14yQ==
UI-OutboundReport: notjunk:1;M01:P0:K70RS+Ps+/Y=;HJtKAZb+G0VMHjDchZgcV8pyiJJ
 54cgDUNUINfRoTHIiLJOhIWIlJmk6gI5/4J62QSVlCsMMX+jahJRsNouk6akKwJ3JYWx6NPHS
 I07hiaPP4rnoShz3ny63kFpbwIpM9bsFWzBMPFSkIZILRqOqbILByAL01Lvjs1K5BSDP7qGHf
 NupWieVUiHjeCM9zNjLZsUGjWFJnZQW1GVs/BTl9rnjRLwJl/e4no4ZrEcPI7JtBbbeOUB0Po
 WA6Z36bIx6Ibkj/vpgnfsWSdR8srYky8XSGOdnbRNDf5pP8P9o4rcYKIaCZDVbMtwhYmtr2CB
 80goUCuabCJGL4KBBOBehaEiLX6f0MNyC2YNjc2HvstN2jddetfOL+P9M9CNeGhnjDr6IMD8Z
 084jlPFco7yQvdAfTf6dnyxgyM487M8MY9McgENQDMaRi4dE8uxykeDaIQNN/VCoZTAe8Y+kd
 St8G5DhD+IGpK5tEDcdRmryNTvX4sF5+atydaz6x5q3XWmcCaY6j2SC/dM2rWEgssSLRFarjN
 OBudUZvqie0N9JPfI3mOvopVvVGHMktUxIRCn3kG5DH+AYXjppk66/1f9xF0IL8LuOW2GIAAa
 ahQDeF4lfLEQgZL1sSRYEYBEjkD9oZb3b9d6d0Sv6pJn0waniL2PkUvs3EIbbFVhPWBZiXwJn
 tdGEE/4OpfBxNIJy2Swiunoe/HVOjzv461WA7J7ZRw+Bwdf/SDMUuRPBHqm49SaJxnOw07XGr
 fyyVP7ta/B26VapGANzsB7bjB6jFGJQRi7tRsu6rWvgLL5sxb3RmHFwrqN1liDDeTcTq/U9rr
 +UlJpBS+Hg3Be3Kc7G7Q74weg4z24g88nDgDcvYzYVc0c=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1710949620; x=1711554420; i=ps.report@gmx.net;
 bh=bXzb5d5+hnaG1zN7mwlNejVumZ/V3ARNvdYVjVnCHa8=;
 h=X-UI-Sender-Class:Date:From:To:Subject:In-Reply-To:References;
 b=Nv9FwQYb0crNUOjHuUryL3gm89LBkYXhDpYW+QmYPVKdVL1dK9Cp7MMRpFwy9PMf
 +IWVv6CgCHUsuOwZNR7ZQT8tLMGCkgn+Ul3ShLjUBVISA71k1wLyTe+u2NB0bfAkn
 z2s4vAoawe6B1mCFK9yIFaUjy2Rvp3cYfU/4bBpQCUWXv1INCoJKZOlJt/ZDf2zMP
 lUGPsX+1rmmuhjv8UrbqplYy6ovHKF98RE7lbFVdgTqGBoXLIzY6ThExmrG9nsdTM
 p4+TGnWL9eNY4VX36UAh5C3xSF3mxiGXqBoIttv2GAB7uE26f/GTLo0Vs3mlhZSRk
 xvQZ4vMWzc+yDiAi5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=Nv9FwQYb
Subject: Re: [Buildroot] Information Required for Buildroot Image Issue
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gU2hhZnFhdCwKCnBsZWFzZSBrZWVwIGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnIGluIEND
Li4uCgpPbiBXZWQsIDIwIE1hciAyMDI0IDEwOjQ4OjE4ICswNTAwLCBTaGFmcWF0IEFiYmFzIDxz
aGFmcWF0LmFiYmFzQHNreWVsZWN0cmljLmNvbT4gd3JvdGU6Cgo+IEhpIFBldGVyLAo+IAo+IEkg
dHJpZWQgc2V0dGluZyAvZGV2IG1hbmFnZW1lbnQgKER5bmFtaWMgdXNpbmcgZGV2dG1wZnMgKyBl
dWRldiksIGJ1dCBpdAo+IGRpZCBub3Qgd29yay4gSSBhbSBzdGlsbCBmYWNpbmcgdGhlIHNhbWUg
aXNzdWUuIFRoZSBVU0Iga2V5Ym9hcmQgaXMgbm90Cj4gd29ya2luZy4gSXMgdGhlcmUgYW55dGhp
bmcgZWxzZSB0aGF0IHdlIG5lZWQgdG8gc2V0IGJlc2lkZQo+IEJSMl9ST09URlNfREVWSUNFX0NS
RUFUSU9OX0RZTkFNSUNfRVVERVY9eT8KCk5vdCB0aGF0IEkgYW0gYXdhcmUgb2YgKGJlc2lkZXMg
ZGlzY29ubmVjdCBtaWNybyBVU0IgcG9ydCAoSjExIFVTQiBzbGF2ZSkKeW91IGNvbm5lY3RlZCBm
b3IgZmxhc2hpbmcgYXMgZGVzY3JpYmVkIGluIHRoZSBidWcgcmVwb3J0KSwgZGlkIHlvdSBkbyBh
CmZ1bGwgcmUtYnVpbGQgb2YgdGhlIHdob2xlIHN5c3RlbT8gRG8geW91IGhhdmUgYSBzZXJpYWwg
Y29uc29sZSBhdHRhY2hlZApmb3IgZnVydGhlciBkZWJ1Z2dpbmc/CgpSZWdhcmRzLApQZXRlcgoK
PiAKPiBSZWdhcmRzLgo+IAo+IFJlZ2FyZHMsCj4gKlNIQUZRQVQgQUJCQVMqCj4gQ3liZXJzZWN1
cml0eSBFbmdpbmVlcgo+IFNreUVsZWN0cmljIEluYy4KPiAKPiAKPiBPbiBXZWQsIE1hciAyMCwg
MjAyNCBhdCAzOjI34oCvQU0gUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PiB3cm90
ZToKPiAKPiA+IE9uIFR1ZSwgMTkgTWFyIDIwMjQgMTQ6MTg6MjMgKzA1MDAsIFNoYWZxYXQgQWJi
YXMgPCAgCj4gPiBzaGFmcWF0LmFiYmFzQHNreWVsZWN0cmljLmNvbT4gd3JvdGU6ICAKPiA+ICAK
PiA+ID4gSGksCj4gPiA+Cj4gPiA+IEkgaG9wZSB5b3UgYXJlIGRvaW5nIHdlbGwuIEkgaGF2ZSBi
ZWVuIHRyeWluZyB0byBjb21waWxlIHRoZSBMaW51eCBPUyBmb3IKPiA+ID4gUmFzcGJlcnJ5IFBp
IDQgKENvbXB1dGUgTW9kdWxlIC8gQ000KSB1c2luZyBidWlsZHJvb3QuIEkgaGF2ZSB0cmllZCBh
bGwgIAo+ID4gdGhlICAKPiA+ID4gZGVmYXVsdCBjb25maWd1cmF0aW9ucyBhdmFpbGFibGUgZm9y
IHJhc3BiZXJyeSBwaSBzeXN0ZW1zLiBBZnRlciB3cml0aW5nCj4gPiA+IHRoZSBpbWFnZSB0byB0
aGUgcGksIHRoZSBzeXN0ZW0gYm9vdHMgdXAgcHJvcGVybHksIGhvd2V2ZXIsIGl0IGRvZXMgbm90
Cj4gPiA+IHJlYWQgaW5wdXQgZnJvbSB0aGUga2V5Ym9hcmQuIEkgYW0gZmFjaW5nIHRoaXMgaXNz
dWUgb24gYWxsIGJ1aWxkcy4gSSAgCj4gPiBoYXZlICAKPiA+ID4gYWxzbyB0cmllZCBjaGFuZ2lu
ZyB0aGUgYm9hcmQgYnV0IHRoYXQgYWxzbyByZXN1bHRlZCBpbiB0aGUgc2FtZSBpc3N1ZS4KPiA+
ID4KPiA+ID4gSSBhbSB1c2luZyB0aGUgZm9sbG93aW5nIHN0ZXBzIHRvIGdlbmVyYXRlIGJ1aWxk
czoKPiA+ID4KPiA+ID4gMS4gYGBgbWFrZSByYXNwYmVycnlwaV9kZWZjb25maWdgYGAKPiA+ID4g
Mi4gYGBgbWFrZWBgYAo+ID4gPgo+ID4gPiBJIGhhdmUgdXNlZCB0aGlzIG1ldGhvZCBmb3IgY29t
cGlsaW5nIGJ1aWxkcyBmb3IgYWxsIGRlZmNvbmZpZ3MsICAKPiA+IGluY2x1ZGluZyAgCj4gPiA+
IHRoZSBmb2xsb3dpbmc6Cj4gPiA+IDEuIEJ1aWxkIGZvciAqUmFzcGJlcnJ5IFBpKgo+ID4gPiAy
LiBCdWlsZCBmb3IgKlJhc3BiZXJyeSBQaSA0Kgo+ID4gPiAzLiBCdWlsZCBmb3IgKlJhc3BiZXJy
eSogKlBpIDQgKDY0IGJpdCkqCj4gPiA+IDQuIEJ1aWxkIGZvciAqUmFzcGJlcnJ5IFBpIENNNCBJ
TyoKPiA+ID4gNS4gQnVpbGQgZm9yICpSYXNwYmVycnkgUGkgQ000IElPICg2NCBiaXQpKgo+ID4g
Pgo+ID4gPiBUaGUga2V5Ym9hcmQgZG9lcyBub3Qgd29yayBhdCBhbGwuIEV2ZW4gdGhlIGxpZ2h0
cyBkbyBub3Qgd29yaywgd2hpY2ggIAo+ID4gc2hvd3MgIAo+ID4gPiB0aGF0IHRoZSBrZXlib2Fy
ZCBpcyBub3QgY29ubmVjdGVkLCBob3dldmVyIHRoZSBzYW1lIGtleWJvYXJkIHdvcmtzIGZpbmUg
IAo+ID4gb24gIAo+ID4gPiBvdGhlciBzeXN0ZW1zLgo+ID4gPgo+ID4gPiBTbywgdGhlIGFzc3Vt
cHRpb24gaXMgdGhhdCB0aGUga2V5Ym9hcmQgaXMgZmluZSwgdGhlIGJvYXJkIGlzIGZpbmUsIHRo
ZSAgCj4gPiBSUGkgIAo+ID4gPiBpcyBmaW5lLCBhbmQgdGhlIGlzc3VlIGxpZXMgaW4gdGhlIGJ1
aWxkIGNvbXBpbGVkIGJ5IGJ1aWxkcm9vdC4KPiA+ID4KPiA+ID4gSSBraW5kbHkgcmVxdWVzdCB0
aGUgY29tbXVuaXR5IHRvIGhlbHAgbWUgc29ydCBvdXQgdGhpcyBpc3N1ZS4gVGhhbmtzIGEgIAo+
ID4gbG90Cj4gPgo+ID4gU2VlICdCdWcgMTU5MTAgLSBVU0Iga2V5Ym9hcmQgaXMgbm90IHdvcmtp
bmcgYnkgZGVmYXVsdAo+ID4gInJhc3BiZXJyeXBpY200aW9fNjRfZGVmY29uZmlnIicKPiA+IChb
MV0pIGZvciB0aGUgc2FtZSBwcm9ibGVtIGFuZCBkaWZmZXJlbnQgc29sdXRpb25zLi4uCj4gPgo+
ID4gUmVnYXJkcywKPiA+IFBldGVyCj4gPgo+ID4gWzFdIGh0dHBzOi8vYnVncy5idXN5Ym94Lm5l
dC9zaG93X2J1Zy5jZ2k/aWQ9MTU5MTAKPiA+ICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
