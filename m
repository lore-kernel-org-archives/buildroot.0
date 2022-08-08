Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77010C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 14:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09CF282A0B;
	Mon,  8 Aug 2022 14:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09CF282A0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8BigJsnRtZwd; Mon,  8 Aug 2022 14:39:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 996C082542;
	Mon,  8 Aug 2022 14:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 996C082542
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2742C1BF2A5
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 14:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F0B360E4F
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 14:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F0B360E4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8L6hn_F48iNg for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 14:39:22 +0000 (UTC)
X-Greylist: delayed 00:30:01 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7481760E48
Received: from 4.mo550.mail-out.ovh.net (4.mo550.mail-out.ovh.net
 [46.105.76.26])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7481760E48
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 14:39:22 +0000 (UTC)
Received: from player737.ha.ovh.net (unknown [10.108.1.112])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id B011F21EDB
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 13:59:31 +0000 (UTC)
Received: from armadeus.com (lfbn-str-1-761-150.w92-148.abo.wanadoo.fr
 [92.148.248.150])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player737.ha.ovh.net (Postfix) with ESMTPSA id C05D423E9C9DA;
 Mon,  8 Aug 2022 13:59:27 +0000 (UTC)
X-OVh-ClientIp: 92.148.248.150
Message-ID: <1a994afd-314e-9a03-0da2-784c2318637e@armadeus.com>
Date: Mon, 8 Aug 2022 15:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20220112094250.27022-1-sebastien.szymanski@armadeus.com>
 <ce7f0bb1-7e3d-a2d5-457a-7f1ba8218a92@mind.be>
From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
In-Reply-To: <ce7f0bb1-7e3d-a2d5-457a-7f1ba8218a92@mind.be>
X-Ovh-Tracer-Id: 1640154690574871459
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefkedgjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfvfevfhfhufgjtgfgsehtkeertddtfeejnecuhfhrohhmpefurogsrghsthhivghnpgfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeefueffkeffleeuteeivdfhhfeiveetueetuefftddvuedvudfgvefhhfeuvdeiueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdelvddrudegkedrvdegkedrudehtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjeefjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehhedt
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0054d1ff173-89c6-4511-af81-08e7ad2dce27,
 C7DFD7296E8B39ED6C12865552AAEA79E5DE0621)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH 1/3] package/libimxdmabuffer: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKdGhhbmsgeW91IGZvciB0aGUgcmV2aWV3ICEKCk9uIDcvMjgvMjIgMTA6MjMs
IEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+ICDCoEhpIFNlYmFzdGllbiwKPiAKPiAgwqBT
b3JyeSB0aGF0IGl0IHRvb2sgdXMgc28gbG9uZyB0byBnZXQgYXJvdW5kIHRvIHJldmlld2luZyB0
aGlzIHBhdGNoLiAKPiBUaGVyZSBhcmUgc29tZSBtYWpvciBjaGFuZ2VzIHRoYXQgd2Ugd291bGQg
bGlrZSB5b3UgdG8gbWFrZSB0byB0aGUgCj4gYXBwcm9hY2gsIHNvIEkndmUgbWFya2VkIHRoZSBz
ZXJpZXMgYXMgQ2hhbmdlcyBSZXF1ZXN0ZWQuIFBsZWFzZSByZWFkIG9uIAo+IGZvciB0aGUgZGV0
YWlscy4KPiAKPiBPbiAxMi8wMS8yMDIyIDEwOjQyLCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90
ZToKPj4gTGlicmFyeSBmb3IgYWxsb2NhdGluZyBhbmQgbWFuYWdpbmcgcGh5c2ljYWxseSBjb250
aWd1b3VzIG1lbW9yeSAoIkRNQQo+PiBtZW1vcnkiIG9yICJETUEgYnVmZmVycyIpIG9uIGkuTVgg
ZGV2aWNlcy4KPj4gTmVlZGVkIGZvciBsaWJpbXh2cHVhcGkyIGFuZCBnc3QxLWlteDIuCj4+IFRo
ZSB1c2VyIGhhcyB0byBjaG9vc2UgYW4gYWxsb2NhdG9yIGRlcGVuZGluZyBvbiB0aGUgaS5NWCBk
ZXZpY2UuCj4gCj4gIMKgVGhpcyBpcyB0aGUgcGFydCB0aGF0IHdlIGRvbid0IGxpa2UuIEluIAo+
IHBhY2thZ2UvZnJlZXNjYWxlLWlteC9Db25maWcuaW4sIHdlIGFscmVhZHkgaGF2ZSBhIGNob2lj
ZSBiZXR3ZWVuIGFsbCAKPiB0aGUgZGlmZmVyZW50IENQVXMuIElmIHRoZXJlIGlzIHNvbWUgbW9y
ZSBmaW5lLWdyYWluIGRpc3RpbmN0aW9uIHRoYXQgCj4gbmVlZHMgdG8gYmUgbWFkZSBmb3IgdGhp
cywgd2Ugc2hvdWxkIGFkZCBhIENQVSBvcHRpb24gdG8gdGhhdCBsaXN0Lgo+IAo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1h
ZGV1cy5jb20+Cj4+IC0tLQo+PiDCoCBwYWNrYWdlL0NvbmZpZy5pbsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArCj4+IMKgIHBhY2th
Z2UvbGliaW14ZG1hYnVmZmVyL0NvbmZpZy5pbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA1OSAr
KysrKysrKysrKysrKysrKysrKwo+PiDCoCBwYWNrYWdlL2xpYmlteGRtYWJ1ZmZlci9saWJpbXhk
bWFidWZmZXIuaGFzaCB8wqAgMyArCj4+IMKgIHBhY2thZ2UvbGliaW14ZG1hYnVmZmVyL2xpYmlt
eGRtYWJ1ZmZlci5ta8KgwqAgfCA1MSArKysrKysrKysrKysrKysrKwo+PiDCoCA0IGZpbGVzIGNo
YW5nZWQsIDExNCBpbnNlcnRpb25zKCspCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L2xpYmlteGRtYWJ1ZmZlci9Db25maWcuaW4KPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvbGliaW14ZG1hYnVmZmVyL2xpYmlteGRtYWJ1ZmZlci5oYXNoCj4+IMKgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL2xpYmlteGRtYWJ1ZmZlci9saWJpbXhkbWFidWZmZXIubWsKCi4uLgoK
Pj4gKwo+PiAraWYgQlIyX1BBQ0tBR0VfTElCSU1YRE1BQlVGRkVSX0RXTAo+PiArY2hvaWNlCj4+
ICvCoMKgwqAgcHJvbXB0ICJIYW50cm8gZGVjb2RlciB2ZXJzaW9uIgo+PiArCj4+ICtjb25maWcg
QlIyX1BBQ0tBR0VfTElCSU1YRE1BQlVGRkVSX0RXTF9HMQo+PiArwqDCoMKgIGJvb2wgIkcxIgo+
PiArCj4+ICtjb25maWcgQlIyX1BBQ0tBR0VfTElCSU1YRE1BQlVGRkVSX0RXTF9HMgo+PiArwqDC
oMKgIGJvb2wgIkcyIgo+PiArZW5kY2hvaWNlCj4gCj4gIMKgVGhpcyBvbmUgc2hvbGQgYmUgZnVs
bHkgZGVwZW5kZW50IG9uIHRoZSB0YXJnZXQgQ1BVLgo+IAo+ICDCoE5vdGUgdGhhdCB3ZSBoYXZl
IHNvbWUgc3ltYm9scyBsaWtlIAo+IEJSMl9QQUNLQUdFX0ZSRUVTQ0FMRV9JTVhfSEFTX1ZQVV9I
QU5UUk8sIGl0IG1heSBiZSB1c2VmdWwgdG8gYWRkIG1vcmUgCj4gb2YgdGhlbSB0byBkaXN0aW5n
dWlzaCBHMSBhbmQgRzI6Cj4gCj4gY29uZmlnIEJSMl9QQUNLQUdFX0ZSRUVTQ0FMRV9JTVhfSEFT
X1ZQVV9IQU5UUk9fRzEKPiAgwqDCoMKgwqDCoMKgwqAgYm9vbAo+ICDCoMKgwqDCoMKgwqDCoCBk
ZWZhdWx0IHkgaWYgQlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9QTEFURk9STV8uLi4KPiAKPiBj
b25maWcgQlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9IQVNfVlBVX0hBTlRST19HMgo+ICDCoMKg
wqDCoMKgwqDCoCBib29sCj4gIMKgwqDCoMKgwqDCoMKgIGRlZmF1bHQgeSBpZiBCUjJfUEFDS0FH
RV9GUkVFU0NBTEVfSU1YX1BMQVRGT1JNXy4uLgo+IAo+IGNvbmZpZyBCUjJfUEFDS0FHRV9GUkVF
U0NBTEVfSU1YX0hBU19WUFVfSEFOVFJPCj4gIMKgwqDCoMKgwqDCoMKgIGJvb2wKPiAgwqDCoMKg
wqDCoMKgwqAgZGVmYXVsdCB5IGlmIEJSMl9QQUNLQUdFX0ZSRUVTQ0FMRV9JTVhfSEFTX1ZQVV9I
QU5UUk9fRzEgfHwgXAo+ICDCoMKgwqDCoMKgwqDCoCBCUjJfUEFDS0FHRV9GUkVFU0NBTEVfSU1Y
X0hBU19WUFVfSEFOVFJPX0cyCgoKQWxsIGkuTVg4IHdpdGggaGFudHJvIFZQVSBpbiBCdWlsZHJv
b3QgKGkuTVg4TSwgaS5NWDhNTSBhbmQgaS5NWDhNUCkgCmhhdmUgYm90aCBHMSBhbmQgRzIgZGVj
b2Rlci4KbGliaW14ZG1hYnVmZmVyIHJlcXVpcmVzIHRvIGNob29zZSBvbmU6CgpodHRwczovL2dp
dGh1Yi5jb20vRnJlZXNjYWxlL2xpYmlteGRtYWJ1ZmZlci9ibG9iL21hc3Rlci93c2NyaXB0I0wy
MjgKClJlZ2FyZHMsCgo+IAo+IAo+PiArCj4+ICtjb25maWcgQlIyX1BBQ0tBR0VfTElCSU1YRE1B
QlVGRkVSX0RXTF9IQU5UUk9fREVDX1ZFUlNJT04KPj4gK8KgwqDCoCBzdHJpbmcKPj4gK8KgwqDC
oCBkZWZhdWx0ICJHMSIgaWYgQlIyX1BBQ0tBR0VfTElCSU1YRE1BQlVGRkVSX0RXTF9HMQo+PiAr
wqDCoMKgIGRlZmF1bHQgIkcyIiBpZiBCUjJfUEFDS0FHRV9MSUJJTVhETUFCVUZGRVJfRFdMX0cy
Cj4+ICtlbmRpZgo+PiArCj4+ICtlbmRpZgoKLS0gClPDqWJhc3RpZW4gU3p5bWFuc2tpLCBBcm1h
ZGV1cyBTeXN0ZW1zClNvZnR3YXJlIGVuZ2luZWVyCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
