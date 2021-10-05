Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBD6C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 20:01:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54EF36141B
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 20:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 54EF36141B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20B6B80E2A;
	Tue,  5 Oct 2021 20:01:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NzkKoyMJAc_p; Tue,  5 Oct 2021 20:01:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5093683ADF;
	Tue,  5 Oct 2021 20:01:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4922C1BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 20:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 381FC40857
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 20:01:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iGa3wfpQTeAJ for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 20:01:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9C7A40855
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 20:01:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:34a8:272d:5e6c:adb8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6F6B35FF88;
 Tue,  5 Oct 2021 22:01:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633464077;
 bh=eH5iHf2eiYeyZkZQfBXC7GwQ72HMTeQLu2OiP5hKKas=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LGJg92h4bDTx1S+tQevJcwaCSkQLRZVReloKlXt81abMloStcPCh2SJeChGzcvkQy
 ExaYk6kCb3+U8Z7zlQTdIwPpRZ9bcZBxApv5jS6883trDC60nVNir/PNjBkpt/w4uu
 l8DkXFxxb8NLPStXi+sBq6nltMNagk0BpIiGPNckj5prMQ/KU8H6MPQvWTBdExiboM
 xa7jrKlJtcxl2+mmzyGmqN7//aTB53u8XnInJ8BHskVn5cvfeMa5WVJ7trQXmndziQ
 UdwsObEaT4Upq1DnKai2zCJ4MKtIp6vj6rnY/Ib22aVvbzLcZyox9v11mHIPxoXYAN
 YZQUeNAwFdUDA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 05 Oct 2021 22:01:11 +0200
Date: Tue, 5 Oct 2021 22:01:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <20211005200111.GC2081069@scaer>
References: <914a4374-e517-b730-c45f-f37ec8147649@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <914a4374-e517-b730-c45f-f37ec8147649@grenoble.cnrs.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] support/testing/infra/emulator.py:
 prevent the commands from wrapping
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RWRnYXIsIEFsbCwKCitUaG9tYXMKCk9uIDIwMjEtMTAtMDUgMTk6MTcgKzAyMDAsIEVkZ2FyIEJv
bmV0IHNwYWtlIHRodXNseToKPiBUcmFkaXRpb25hbCBWVC0xMHggdGVybWluYWxzIChhbmQgdGhl
aXIgZW11bGF0b3JzKSBoYXZlIGEgIm1hZ2ljCj4gbWFyZ2lucyIgZmVhdHVyZSB0aGF0IGVuYWJs
ZXMgdGhlIGxhc3QgY2hhcmFjdGVyIHBvc2l0aW9uIHRvIGJlIHVwZGF0ZWQKPiB3aXRob3V0IHNj
cm9sbGluZyB0aGUgc2NyZWVuOiB3aGVuZXZlciBhIGNoYXJhY3RlciBpcyBwcmludGVkIG9uIHRo
ZQo+IGxhc3QgY29sdW1uLCB0aGUgY3Vyc29yIHN0YXlzIG92ZXIgdGhlIGNoYXJhY3RlciwgaW5z
dGVhZCBvZiBtb3ZpbmcgdG8KPiB0aGUgbmV4dCBsaW5lLgo+IAo+IFRoZSBCdXN5Ym94IHNoZWxs
LCBhc2gsIGF0dGVtcHRzIHRvIGRlZmVhdCB0aGlzIGZlYXR1cmUgYnkgcHJpbnRpbmcKPiBDRixM
RiByaWdodCBhZnRlciBlY2hvaW5nIGEgY2hhcmFjdGVyIHRvIHRoZSBsYXN0IGNvbHVtbi5bMV0g
VGhpcwo+IGRvZXNuJ3QgcGxheSB3ZWxsIHdpdGggZW11bGF0b3IucHkuIFRoZSBydW4oKSBtZXRo
b2Qgb2YgdGhlIEVtdWxhdG9yCj4gY2xhc3MgY2FwdHVyZXMgdGhlIG91dHB1dCBvZiB0aGUgZW11
bGF0ZWQgc3lzdGVtIGFuZCBhc3N1bWVzIHRoZSBmaXJzdAo+IGxpbmUgaXQgcmVhZHMgaXMgdGhl
IGVjaG8gb2YgdGhlIGNvbW1hbmQsIGFuZCBhbGwgc3Vic2VxdWVudCBsaW5lcyBhcmUKPiB0aGUg
Y29tbWFuZCdzIG91dHB1dC4gSWYgdGhlIGxpbmUgbWFkZSBieSB0aGUgY29tbWFuZCArIHNoZWxs
IHByb21wdCBpcwo+IGxvbmdlciB0aGFuIDgwIGNoYXJhY3RlcnMsIHRoZW4gaXQgaXMgZWNob2Vk
IGFzIHR3byBvciBtb3JlIGxpbmVzLCBhbmQKPiBhbGwgYnV0IHRoZSBmaXJzdCBvbmUgYXJlIG1p
c3Rha2VuIGZvciB0aGUgY29tbWFuZCdzIG91dHB1dC4KPiAKPiBXZSBmaXggdGhpcyBieSB0ZWxs
aW5nIHRoZSBlbXVsYXRlZCBzeXN0ZW0gdGhhdCB3ZSBhcmUgdXNpbmcgYW4KPiB1bHRyYS13aWRl
IHRlcm1pbmFsIHdpdGggMjk5OTkgY29sdW1ucy4gTGFyZ2VyIHZhbHVlcyB3b3VsZCBiZSBpZ25v
cmVkCj4gYW5kIHJlcGxhY2VkIGJ5IHRoZSBkZWZhdWx0LCBuYW1lbHkgODAgY29sdW1ucy5bMl0K
PiAKPiBbMV0gaHR0cHM6Ly9naXQuYnVzeWJveC5uZXQvYnVzeWJveC90cmVlL2xpYmJiL2xpbmVl
ZGl0LmM/aD0xXzM0XzAjbjQxMgo+IFsyXSBodHRwczovL2dpdC5idXN5Ym94Lm5ldC9idXN5Ym94
L3RyZWUvbGliYmIveGZ1bmNzLmM/aD0xXzM0XzAjbjI1OAoKV29vdCEgVmVyeSwgdmVyeSBnb29k
IGNvbW1pdCBsb2csIHRoYW5rcyEKClNvIEkgZGVjaWRlZCB0byBpbnZlc3RpZ2F0ZSB0aG9zZSAi
bWFnaWMgbWFyZ2lucyIgKEknbSBhIGdyZXkgYmVhcmQsCmJ1dCBub3QgdGhhdCBncmV5IHlldCwg
c28gSSBtaXNzZWQgdGhhdCBpbmZvKS4gQW5kIHRodXMgSSBzdHVtYmxlZCBvbgp0aGF0IChhbmQg
eWVzLCBJJ3ZlIG5vdyBib29rbWFya2VkIHRoYXQgZm9yIGZ1dHVyZSByZWZlcmVuY2U7IEknbSBq
dXN0CnRvcm4gYmV0d2VlbiBib29rbWFya2luZyBpbiB0aGUgInNvZnR3YXJlIiBvciAiaGFyZHdh
cmUiIGNhdGVnb3JpZXMuLi4KOi1dICk6CgogICAgaHR0cHM6Ly92dDEwMC5uZXQvZG9jcy92dDEw
MC11Zy9jaGFwdGVyMy5odG1sCgogICAgREVDQVdNIOKAkyBBdXRvd3JhcCBNb2RlIChERUMgUHJp
dmF0ZSkKCiAgICBUaGUgcmVzZXQgc3RhdGUgY2F1c2VzIGFueSBkaXNwbGF5YWJsZSBjaGFyYWN0
ZXJzIHJlY2VpdmVkIHdoZW4gdGhlCiAgICBjdXJzb3IgaXMgYXQgdGhlIHJpZ2h0IG1hcmdpbiB0
byByZXBsYWNlIGFueSBwcmV2aW91cyBjaGFyYWN0ZXJzCiAgICB0aGVyZS4gVGhlIHNldCBzdGF0
ZSBjYXVzZXMgdGhlc2UgY2hhcmFjdGVycyB0byBhZHZhbmNlIHRvIHRoZSBzdGFydAogICAgb2Yg
dGhlIG5leHQgbGluZSwgZG9pbmcgYSBzY3JvbGwgdXAgaWYgcmVxdWlyZWQgYW5kIHBlcm1pdHRl
ZC4KCkJ1dCB0aGF0IHNlZW1zIHRvIGJlIERFQy1vbmx5LCBhbmQgSSBjb3VsZCBub3QgZ2V0IGEg
YmV0dGVyLCBtb3JlCmdlbmVyaWMgaGl0LgoKPiBTaWduZWQtb2ZmLWJ5OiBFZGdhciBCb25ldCA8
Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KPiBSZXBvcnRlZC1ieTogVGhvbWFzIFBldGF6em9uaSA8
dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPiBDby1hdXRob3JlZC1ieTogWWFubiBFLiBN
T1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+Cj4gLS0tCj4gIHN1cHBvcnQvdGVzdGluZy9p
bmZyYS9lbXVsYXRvci5weSB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQo+IAo+IE5vdGUgdGhhdCBJIHRlc3RlZCB0aGF0IHRoZSBjb21tYW5kCj4gCj4gICAgIHN0dHkg
Y29sdW1ucyAyOTk5OQo+IAo+IGRvZXMgZml4IHRoZSB3cmFwcGluZyBiZWhhdmlvciBvbiBhbiBh
Y3R1YWwgYm9hcmQsIHdoaWxlIHVzaW5nIGEgc2VyaWFsCj4gY29ubmVjdGlvbi4gSSBkaWQgbm90
IHRlc3QgdGhlIHNjcmlwdCBlbXVsYXRvci5weSwgYXMgSSBhbSB1bmZhbWlsaWFyCj4gd2l0aCB0
aGUgdGVzdGluZyBpbmZyYXN0cnVjdHVyZS4gV291bGQgc29tZW9uZSB2b2x1bnRlZXIgdG8gZG8g
dGhhdAo+IHRlc3Q/CgpUaGUgdGhpbmcgaXMsIGFzIFRob21hcyBzYWlkLCBoZSBoYWQgdGhlIGlz
c3VlIHdpdGggbmV3IHRlc3RzIGhlIHdhcwphZGRpbmcgdG8gdGhlIGluZnJhOyB3ZSBjdXJyZW50
bHkgZG8gbm90IGhhdmUgdGVzdHMgd2l0aCBjb21tYW5kcyB0aGF0CmFyZSB0b28gbG9uZyB0byBi
ZSB3cmFwcGVkLgoKVGhvbWFzPwoKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL2luZnJh
L2VtdWxhdG9yLnB5IGIvc3VwcG9ydC90ZXN0aW5nL2luZnJhL2VtdWxhdG9yLnB5Cj4gaW5kZXgg
MGE3N2ViODBmYy4uZjFmNWVhYzNhOCAxMDA2NDQKPiAtLS0gYS9zdXBwb3J0L3Rlc3RpbmcvaW5m
cmEvZW11bGF0b3IucHkKPiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0b3IucHkK
PiBAQCAtMTAwLDYgKzEwMCw4IEBAIGNsYXNzIEVtdWxhdG9yKG9iamVjdCk6Cj4gICAgICAgICAg
aWYgaW5kZXggIT0gMDoKPiAgICAgICAgICAgICAgcmFpc2UgU3lzdGVtRXJyb3IoIkNhbm5vdCBs
b2dpbiIpCj4gICAgICAgICAgc2VsZi5ydW4oImRtZXNnIC1uIDEiKQo+ICsgICAgICAgICMgUHJl
dmVudCB0aGUgc2hlbGwgZnJvbSB3cmFwcGluZyB0aGUgY29tbWFuZHMgYXQgODAgY29sdW1ucy4K
PiArICAgICAgICBzZWxmLnJ1bigic3R0eSBjb2x1bW5zIDI5OTk5IikKCkkgd291bGQgZG8gdGhh
dCBldmVuIGJlZm9yZSBydW5uaW5nIGRtZXNnLiBObyBuZWVkIHRvIHJlc2VuZCwgd2UgY2FuCmNo
YW5nZSB3aGVuIGFwcGx5aW5nLCB1bmxlc3MgdGhlcmUgaXMgYSBnb29kIHJlYXNvbiBub3QgdG8u
CgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAgICAgICMgUnVuIHRoZSBnaXZlbiAnY21kJyB3
aXRoIGEgJ3RpbWVvdXQnIG9uIHRoZSB0YXJnZXQKPiAgICAgICMgcmV0dXJuIGEgdHVwbGUgKG91
dHB1dCwgZXhpdF9jb2RlKQo+IC0tIAo+IDIuMjUuMQo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBF
LiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3Mn
IGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBc
IC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0Mjcg
YC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMg
bm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBN
QUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
