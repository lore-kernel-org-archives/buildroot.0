Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF10C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 19:19:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2DC061425
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 19:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2DC061425
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xes-inc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D41E400D5;
	Thu, 30 Sep 2021 19:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rSSkG_wvh_ve; Thu, 30 Sep 2021 19:19:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 533B240181;
	Thu, 30 Sep 2021 19:19:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9EC4B1BF3D5
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 19:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87991826BF
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 19:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xes-inc.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iFMsPaEs6BrC for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 19:19:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34DF481C19
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 19:19:05 +0000 (UTC)
Received: from [10.52.16.113] (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id C03AB2065F;
 Thu, 30 Sep 2021 14:19:03 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
 t=1633029543; bh=rsDc+piuiJBJABZ80aVn2Uqv4+7e2ugLMk0AtnXhh0o=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=MNMhihcawZyhyIh6VHZddqUtrmWom2ajrw/gObzM8+Zlys3P3hgd0vLENNw3F8abz
 6Vh8CZVoNp+OL5gQJXt2hdlpT4aqoA7J+IOddwOFGbA0fF3V3EX/DMBASQL8KvegZl
 DpWYydAh9JWPaYxpdA0iymkHuk0qndBZE2LfsQ6M=
From: Vincent Fazio <vfazio@xes-inc.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20210920211328.17526-1-ps.report@gmx.net>
 <20210920211328.17526-2-ps.report@gmx.net>
 <03db0350-bfe4-40ec-c82d-4385fc726b27@xes-inc.com>
 <20210920234122.3cd8ed56@gmx.net>
 <2913d23f-db1a-ce12-8f5b-ffa33911c35d@xes-inc.com>
 <20210921223932.5d85a71d@gmx.net>
 <25e4db09-93fc-43e2-74ae-0efba65fab96@xes-inc.com>
Message-ID: <d61b3361-d5da-d2b5-13af-0b9bec3eb806@xes-inc.com>
Date: Thu, 30 Sep 2021 14:19:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <25e4db09-93fc-43e2-74ae-0efba65fab96@xes-inc.com>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v1 2/4] package/rpi-firmware: bump version
 to 9f97081
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
Cc: Arthur Courtel <arthur.courtel@smile.fr>, Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGV0ZXIsIGFsbCwKCk9uIDkvMjMvMjEgODo1OCBBTSwgVmluY2VudCBGYXppbyB3cm90ZToKPiBB
bGwsCj4KPiBPbiA5LzIxLzIxIDM6MzkgUE0sIFBldGVyIFNlaWRlcmVyIHdyb3RlOgo+PiBIZWxs
byBWaW5jZW50LCBhbGwsCj4+Cj4+IE9uIFR1ZSwgMjEgU2VwIDIwMjEgMDg6MDg6MTAgLTA1MDAs
IFZpbmNlbnQgRmF6aW8gCj4+IDx2ZmF6aW9AeGVzLWluYy5jb20+IHdyb3RlOgo+Pgo+Pj4gUGV0
ZXIsIGFsbCwKPj4+Cj4+PiBPbiA5LzIwLzIxIDQ6NDEgUE0sIFBldGVyIFNlaWRlcmVyIHdyb3Rl
Ogo+Pj4+IEhlbGxvIFZpbmNlbnQsCj4+Pj4KPj4+PiBPbiBNb24sIDIwIFNlcCAyMDIxIDE2OjE5
OjU3IC0wNTAwLCBWaW5jZW50IEZhemlvIAo+Pj4+IDx2ZmF6aW9AeGVzLWluYy5jb20+IHdyb3Rl
Ogo+Pj4+Cj4+Pj4gVGhhbmtzIGZvciB0aGUgaW5mbywgb25seSBkaWQgYSBxdWljayByZWFkIG9m
IHRoZSBQUiAxNjE5LCB0aGUgcHJvYmxlbQo+Pj4+IHNlZW1zIFUtYm9vdCBzcGVjaWZpYyAobm90
IHRoZSBidWlsZHJvb3QgZGVmYXVsdCBjYXNlKSBhbmQgdGhlcmUgaXMKPj4+PiBhbHJlYWR5IGEg
c3VnZ2VzdGVkIFUtYm9vdCBmaXggKHN1Ym1pdHRlZCBieSB5b3UpPwo+Pj4gWWVzLCBzb3JyeSBJ
IHdhcyBub3QgdmVyeSBjbGVhciBpbiBteSBlbWFpbCB5ZXN0ZXJkYXkgKEkgd2FzIHNlbmRpbmcg
aXQKPj4+IG9uIG15IHdheSBvdXQgdGhlIGRvb3IpLgo+PiBObyBwcm9ibGVtIDstKSwgdGhlIGhp
bnQgd2FzL2lzIHZlcnkgdmFsdWFibGUhClRoaXMgbWF5IG5vIGxvbmdlciBiZSBhbiBpc3N1ZSBv
dGhlciBwYWNrYWdlcyBoYXZlIHRvIGRlYWwgd2l0aCBbMV0KPj4KPj4+IFllcywgdS1ib290IGlz
IGFmZmVjdGVkLCB0aG91Z2ggSSB0aGluayBlZGsyIG1heSBhbHNvIGJlIGFmZmVjdGVkLiBUaGUK
Pj4+IHUtYm9vdCBwYXRjaCBoYXMgbm90IHlldCBiZWVuIHJldmlld2VkIGFuZCBtYXkgbm90IG1h
a2UgaXQgZm9yIDIwMjEuMTAKPj4+Cj4+PiBJIGp1c3Qgd2FudGVkIHRvIGdpdmUgYSBoZWFkcyB1
cCB0aGF0IGJ1bXBpbmcgdGhpcyBwYWNrYWdlIGNvdWxkIGhhdmUKPj4+IGNvbnNlcXVlbmNlcyBm
b3Igc29tZSBjb25maWd1cmF0aW9ucy4KPj4gU28gdGhlcmUgYXJlIHRoZSBmb2xsb3dpbmcgcG9z
c2liaWxpdGllczoKPj4KPj4gLSBuZXZlciB1cGRhdGUgcnBpLWZpcm13YXJlIHRvIG5vdCBicmVh
ayBsZWdhY3kgdS1ib290IChhbmQgbWF5YmUgCj4+IGVkazIgYW5kCj4+IMKgwqAgbWF5YmUgbGlu
dXgtbWFpbmxpbmUgYW5kIG1heWJlIC4uLikgc2V0dXBzCj4gRGVmaW5pdGVseSBub3QgcmVjb21t
ZW5kaW5nIHRoaXMuCj4+IC0gZGVsYXkgdGhlIHJwaS1maXJtd2FyZSB1cGRhdGUgdW50aWwgdXAt
dG8tZGF0ZSB1LWJvb3QgKGFuZCBlZGsyIGFuZCAKPj4gLi4uKQo+PiDCoMKgIGFyZSBhdmFpbGFi
bGUgKGFzIHRoaXMgYnVtcCBzZWVtcyB0byBmaXggc29tZSBvdGhlciByZWdyZXNzaW9ucyBlLmcK
Pj4gwqDCoCAna2VybmVsOiBTZWNvbmQgYXR0ZW1wdCB0byBmaXggdGhlIENQVSBzdGFydHVwIGZh
aWx1cmUnIFsxXQo+Pgo+PiAtIGFwcGx5IHRoZSBycGktZmlybXdhcmUgdXBkYXRlIG5vdyBhbmQg
aG9wZSB0aGF0IHRoaXMgZW1haWwgdGhyZWFkIGlzCj4+IMKgwqAgZm91bmQgYnkgYWxsIHBlb3Bs
ZSBhZmZlY3RlZCBieSB0aGUgdS1ib290IChhbmQgLi4uKSBkZWZlY3QsIGJ1dAo+PiDCoMKgIGtl
ZXBzIHRoZSBkZWZhdWx0IGJ1aWxkcm9vdC9ycGkgdXNlcnMgdXAtdG8tZGF0ZSA7LSkKPgo+IFBy
b2JhYmx5IG5vIHJlYXNvbiB0byBkZWxheSBpdCBpZiB0aGVyZSBhcmUgbm8gZGVmYXVsdCBjb25m
aWd1cmF0aW9ucyAKPiB0aGF0IHV0aWxpemUgdGhlIGFmZmVjdGVkIHBhY2thZ2VzLCBidXQgbm90
IHN1cmUgaWYgaXQgZGVzZXJ2ZXMgYSAKPiBtZW50aW9uIHNvbWV3aGVyZSBsaWtlIAo+IGh0dHBz
Oi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvbWFudWFsL21hbnVhbC5odG1sI19rbm93bl9pc3N1
ZXMgc28gCj4gdGhlIGlzc3VlIGlzIG1vcmUgY2xlYXJseSBhZHZlcnRpc2VkIHVudGlsIHRoZXJl
IGFyZSBwYXRjaGVzIHRvIGZpeCAKPiB0aGUgYWZmZWN0ZWQgcGFja2FnZXMuCj4KPiBJJ2xsIGxl
dCB0aGUgbWFpbnRhaW5lcnMgZGVjaWRlIHdoYXQgdG8gZG8uIEFnYWluLCBJIGp1c3Qgd2FudGVk
IHRvIAo+IG1ha2UgcGVvcGxlIGF3YXJlLgo+Cj4+IFJlZ2FyZHMsCj4+IFBldGVyCj4+Cj4+IFsx
XSAKPj4gaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2Zpcm13YXJlL2NvbW1pdC85Zjk3
MDgxOTlmODgwOWVjZjE2MTE5ZDA3MTYzNzViZWU3YjdkOGQ0Cj4+Cj4+Pj4gUmVnYXJkcywKPj4+
PiBQZXRlcgo+Pj4+Cj4+Pj4KWzFdIApodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvZmly
bXdhcmUvY29tbWl0L2I1MjU3ZGE1OGMwZTY1MjYzMzU5MmM2ZmNlMDlhN2YzYjEwMGEyZWIKCi0t
IApWaW5jZW50IEZhemlvCkVtYmVkZGVkIFNvZnR3YXJlIEVuZ2luZWVyIC0gQVRTCkV4dHJlbWUg
RW5naW5lZXJpbmcgU29sdXRpb25zLCBJbmMKaHR0cDovL3d3dy54ZXMtaW5jLmNvbQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
