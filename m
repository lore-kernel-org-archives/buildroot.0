Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C907CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 21:05:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 057DB61074
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 21:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 057DB61074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3E0C605A9;
	Mon, 27 Sep 2021 21:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ffn8Qspb82h; Mon, 27 Sep 2021 21:05:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDE3F606F3;
	Mon, 27 Sep 2021 21:05:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C99E1BF48B
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 21:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C3A740417
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 21:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LPb335on97pi for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 21:05:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BB8A4040C
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 21:05:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9ded:7cc8:164a:d8a6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 40BC37802D6;
 Mon, 27 Sep 2021 23:05:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632776751;
 bh=k8XabL6uoXQxsx/KjA7AXaLpbJZqbQzr/xVlrZyjVD8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Iw/q4zMSrRbXN/QRJbeiOJSxs9rrm4F3SaLLirfsiV7+S73cML5fYB2V1Apsv/m8h
 mzF7uqCo6M2sHU1qQOgLGF8RKCNHaZAzoTQd1HgJ9wnhgwxJRskypHWg50DHu98fX0
 /et60OMoYCHUzrR1WPp5xAvnvJMvxkkO3vRnwzbgvs+ehu/48hX8ncs7PvXYIUrdbj
 4tPf9RcAPSAI2ON7mi9KBlSEv9kmmyZIdqfIJARJfOl+TP3xt6z/Nw4RRnsh7bUMCg
 33rEuuQ39kCp4y5dcyCqAxnGbOq/8tL44EyMNRGq6XCic4DfPFugytmPu3GD81EptJ
 +6Uh7PQ8jfOgw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Sep 2021 23:05:14 +0200
Date: Mon, 27 Sep 2021 23:05:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20210927210514.GF1504958@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-5-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210923155726.87851-5-kory.maincent@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 4/7] fs/iso9660: add support for hybrid
 image using Grub bootloader on BIOS and EFI
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjEtMDktMjMgMTc6NTcgKzAyMDAsIEtvcnkgTWFpbmNlbnQgc3Bh
a2UgdGh1c2x5Ogo+IEFkZCBzdXBwb3J0IGZvciBidWlsZGluZyBhbiBoeWJyaWQgSVNPOTY2MCBp
bWFnZSBjb21wYXRpYmxlIHdpdGggbGVnYWN5Cj4gYW5kIFVFRkkgQklPUy4KPiBUaGUgb3B0aW9u
IC1lbHRvcml0by1hbHQtYm9vdCBuZWVkIHRvIGJlIHVzZWQgaW4gdGhlIHhvcnJpc28gY29tbWFu
ZAo+IHRvIGdlbmVyYXRlIHRoZSBoeWJyaWQgaW1hZ2UuCgpTbyBJIHdhcyB3b25kZXJpbmcgd2h5
IHlvdSBoYWQgdG8gcmVuYW1lIHRoZSB2YXJpYWJsZXMsIGFuZCB3aHkgeW91CnNwbGl0IHRoZSB2
YWx1ZXMgd2l0aCAtZWx0b3JpdG8tYWx0LWJvb3QgcmlnaHQgaW4gYmV0d2Vlbi4uLgoKQXMgSSB1
bmRlcnN0YW5kIGl0IGZyb20gdGhlIHhvcnJpc28gY29tbWFuZCBsaW5lLCAtZWx0b3JpdG8tYWx0
LWJvb3QKYmFzaWNhbGx5IG1lYW5zICJPSywgd2UncmUgZG9uZSB3aXRoIHRoZSBwcmV2aW91cyBi
b290IHBhcmFtZXRlcnMsIG5vdwp3ZSBzdGFydCBhIG5ldyBzZXQgb2YgYm9vdCBwYXJhbWV0ZXJz
Iiwgc28gdGhlIG9yZGVyIG9mIG9wdGlvbnMgKmlzKgppbXBvcnRhbnQuCgpSaWdodD8KCkZ1cnRo
ZXJtb3JlLCAtZWx0b3JpdG8tYWx0LWJvb3QgYW5kIC1uby1lbXVsLWJvb3QgYXJlIG5vdCBjb25m
bGljdGluZywKYmVjYXVzZSB0aGUgZm9ybWVyIGlzIHJlYWxseSB0aGlzIHNlcGFyYXRvciBhcyBk
aXNjdXNzZWQgYWJvdmUsIHdoaWxlCnRoZSBsYXR0ZXIgc3BlY2lmaWVzIHRoZSB0eXBlIG9mIHRo
ZSBjdXJyZW50IGJvb3QgaW1hZ2UuCgpSaWdodD8KCihGb3IgbXkgaW5mb3JtYXRpb246IGhvdyBt
YW55IHN1Y2ggYWx0ZXJuYXRlIGJvb3QgcGFyYW1ldGVycyBjYW4gd2UKZGVmaW5lOiBpcyBpdCBs
aW1pdGVkIHRvIGp1c3QgdHdvLCBvciBjYW4gd2UgYWRkIG1vcmU/KQoKPiBTaWduZWQtb2ZmLWJ5
OiBLb3J5IE1haW5jZW50IDxrb3J5Lm1haW5jZW50QGJvb3RsaW4uY29tPgo+IC0tLQpbLS1TTklQ
LS1dCj4gZGlmZiAtLWdpdCBhL2ZzL2lzbzk2NjAvaXNvOTY2MC5tayBiL2ZzL2lzbzk2NjAvaXNv
OTY2MC5tawo+IGluZGV4IDkyMWVmYTFiMDIuLjljMjUzNWQxMDIgMTAwNjQ0Cj4gLS0tIGEvZnMv
aXNvOTY2MC9pc285NjYwLm1rCj4gKysrIGIvZnMvaXNvOTY2MC9pc285NjYwLm1rClstLVNOSVAt
LV0KPiBAQCAtMTUxLDI0ICsxNTYsMzIgQEAgZW5kaWYgIyBST09URlNfSVNPOTY2MF9VU0VfSU5J
VFJECj4gIAo+ICBST09URlNfSVNPOTY2MF9PUFRTICs9IFwKPiAgCS1KIFwKPiAtCS1SIFwKPiAt
CS1uby1lbXVsLWJvb3QKPiArCS1SCj4gIAo+IC1pZmVxICgkKEJSMl9UQVJHRVRfUk9PVEZTX0lT
Tzk2NjBfQklPU19CT09UTE9BREVSKSx5KQo+IC1ST09URlNfSVNPOTY2MF9PUFRTICs9IFwKPiAr
Uk9PVEZTX0lTTzk2NjBfQk9PVExPQURFUl9PUFRTX0JJT1MgPSBcCgogICAgUk9PVEZTX0lTTzk2
NjBfT1BUU19CSU9TCgo+ICsJLWIgJChST09URlNfSVNPOTY2MF9CT09UX0lNQUdFKSBcCj4gKwkt
bm8tZW11bC1ib290IFwKPiAgCS1ib290LWxvYWQtc2l6ZSA0IFwKPiAtCS1ib290LWluZm8tdGFi
bGUgXAo+IC0JLWIgJChST09URlNfSVNPOTY2MF9CT09UX0lNQUdFKQo+IC1lbmRpZgo+ICsJLWJv
b3QtaW5mby10YWJsZQoKWW91IGFyZSBhbHNvIHJlb3JkZXJpbmcgdGhlIHJlbWFpbmluZyBvcHRp
b25zLiBJcyB0aGF0IHJlYWxseSBuZWNlc3Nhcnk/Ck9yIGlzIGl0IGZvciBzeW1tZXRyeSB3aXRo
IHRoZSBFRkkgY2FzZSB3aGVyZSB0aGUgImltYWdlIiBvcHRpb24gY29tZXMKZmlyc3Q/Cgo+IC1p
ZmVxICgkKEJSMl9UQVJHRVRfUk9PVEZTX0lTTzk2NjBfRUZJX0JPT1RMT0FERVIpLHkpCj4gLVJP
T1RGU19JU085NjYwX09QVFMgKz0gXAo+IC0JLS1lZmktYm9vdCAkKFJPT1RGU19JU085NjYwX0VG
SV9QQVJUSVRJT04pCj4gK1JPT1RGU19JU085NjYwX0JPT1RMT0FERVJfT1BUU19FRkkgPSBcCgog
ICAgUk9PVEZTX0lTTzk2NjBfT1BUU19FRkkKCj4gKwktLWVmaS1ib290ICQoUk9PVEZTX0lTTzk2
NjBfRUZJX1BBUlRJVElPTikgXAo+ICsJLW5vLWVtdWwtYm9vdAo+ICsKPiAraWZlcSAoJChCUjJf
VEFSR0VUX1JPT1RGU19JU085NjYwX0JJT1NfQk9PVExPQURFUikkKEJSMl9UQVJHRVRfUk9PVEZT
X0lTTzk2NjBfRUZJX0JPT1RMT0FERVIpLHl5KQo+ICtST09URlNfSVNPOTY2MF9CT09UTE9BREVS
X09QVFMgPSAkKFJPT1RGU19JU085NjYwX0JPT1RMT0FERVJfT1BUU19CSU9TKQo+ICtST09URlNf
SVNPOTY2MF9CT09UTE9BREVSX09QVFMgKz0gLWVsdG9yaXRvLWFsdC1ib290Cj4gK1JPT1RGU19J
U085NjYwX0JPT1RMT0FERVJfT1BUUyArPSAkKFJPT1RGU19JU085NjYwX0JPT1RMT0FERVJfT1BU
U19FRkkpCgpIbW1tIFRoaXMgaXMgcHJldHR5IHVnbHkuLi4gV2hhdCBhYm91dDoKCiAgICBST09U
RlNfSVNPOTY2MF9PUFRTICs9IFwKICAgICAgICAkKFJPT1RGU19JU085NjYwX09QVFNfQklPUykg
XAogICAgICAgIC1lbHRvcml0by1hbHQtYm9vdCBcCiAgICAgICAgJChST09URlNfSVNPOTY2MF9P
UFRTX0VGSSkKCkFsc28sIGRvZXMgQklPUyByZWFsbHkgaGFzIHRvIGNvbWUgYmVmb3JlIEVGST8g
SWYgc28sIHdoeT8KCj4gK2Vsc2UgaWZlcSAoJChCUjJfVEFSR0VUX1JPT1RGU19JU085NjYwX0JJ
T1NfQk9PVExPQURFUikseSkKPiArUk9PVEZTX0lTTzk2NjBfQk9PVExPQURFUl9PUFRTID0gJChS
T09URlNfSVNPOTY2MF9CT09UTE9BREVSX09QVFNfQklPUykKCiAgICBST09URlNfSVNPOTY2MF9P
UFRTICs9ICQoUk9PVEZTX0lTTzk2NjBfT1BUU19CSU9TKQoKPiArZWxzZSBpZmVxICgkKEJSMl9U
QVJHRVRfUk9PVEZTX0lTTzk2NjBfRUZJX0JPT1RMT0FERVIpLHkpCj4gK1JPT1RGU19JU085NjYw
X0JPT1RMT0FERVJfT1BUUyA9ICQoUk9PVEZTX0lTTzk2NjBfQk9PVExPQURFUl9PUFRTX0VGSSkK
CiAgICBST09URlNfSVNPOTY2MF9PUFRTICs9ICQoUk9PVEZTX0lTTzk2NjBfT1BUU19FRkkpCgo+
ICBlbmRpZgo+ICAKPiAgZGVmaW5lIFJPT1RGU19JU085NjYwX0NNRAo+ICAJJChIT1NUX0RJUikv
YmluL3hvcnJpc28gLWFzIG1raXNvZnMgXAo+ICAJCSQoUk9PVEZTX0lTTzk2NjBfT1BUUykgXAo+
ICsJCSQoUk9PVEZTX0lTTzk2NjBfQk9PVExPQURFUl9PUFRTKSBcCgpBbmQgdGh1cyB5b3UgZG9u
J3QgbmVlZCB0aGUgbmV3IHZhcmlhYmxlIGhlcmUuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoK
PiAgCQktbyAkQCAkKFJPT1RGU19JU085NjYwX1RNUF9UQVJHRVRfRElSKQo+ICBlbmRlZgo+ICAK
PiAtLSAKPiAyLjI1LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAbGlzdHMuYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4g
IHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGly
YWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBB
SUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0t
LS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cnwg
aHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8
ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
