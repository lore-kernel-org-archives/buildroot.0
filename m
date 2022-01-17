Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761E2C433F5
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 10:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05DD9605A7;
	Mon, 17 Jan 2022 10:18:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qnAJCGB0WzF1; Mon, 17 Jan 2022 10:18:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EEF860B02;
	Mon, 17 Jan 2022 10:18:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A13021BF3D7
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 10:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E70081342
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 10:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SbSSELE-FLX7 for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 10:18:10 +0000 (UTC)
X-Greylist: delayed 00:19:58 by SQLgrey-1.8.0
Received: from 2.mo575.mail-out.ovh.net (2.mo575.mail-out.ovh.net
 [46.105.52.162])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63E0E80EE8
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 10:18:10 +0000 (UTC)
Received: from player695.ha.ovh.net (unknown [10.108.20.39])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 72A4221F36
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 09:39:10 +0000 (UTC)
Received: from armadeus.com (areims-654-1-107-29.w92-131.abo.wanadoo.fr
 [92.131.114.29])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player695.ha.ovh.net (Postfix) with ESMTPSA id 77A40263ED396;
 Mon, 17 Jan 2022 09:39:06 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0045eb1d20b-ff6d-40c9-bed9-24fc1370706f,
 190E9D14A8F051DDBC87158B6E68C1947A42AE77)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 92.131.114.29
Message-ID: <63ff839c-c7e1-f228-8658-dde65a4d215a@armadeus.com>
Date: Mon, 17 Jan 2022 10:37:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>
References: <20220112094250.27022-1-sebastien.szymanski@armadeus.com>
 <20220112094250.27022-3-sebastien.szymanski@armadeus.com>
 <20220114184433.687ebc15@bootlin.com>
From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
In-Reply-To: <20220114184433.687ebc15@bootlin.com>
X-Ovh-Tracer-Id: 4124452836552862627
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddugddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpefurogsrghsthhivghnpgfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeefvdetfeeuuedvuedtleevjeegveehheevtefhueejueffhedttdffueekteelhfenucfkpheptddrtddrtddrtddpledvrddufedurdduudegrddvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrieelhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
Subject: Re: [Buildroot] [PATCH 3/3] package/gstreamer1/gst1-imx2: new
 package
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSGVydsOpLAoKT24gMS8xNC8yMiAxODo0NCwgSGVydmUgQ29kaW5hIHdyb3RlOgo+IEhpIFPD
qWJhc3RpZW4sIGFsbAo+IAo+IE9uIFdlZCwgMTIgSmFuIDIwMjIgMTA6NDI6NTAgKzAxMDAKPiBT
w6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+IHdy
b3RlOgo+IAo+PiBUaGlzIGlzIHZlcnNpb24gMiBvZiBnc3QxLWlteC4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMu
Y29tPgo+PiAtLS0KPj4gICBwYWNrYWdlL2dzdHJlYW1lcjEvQ29uZmlnLmluICAgICAgICAgICAg
ICAgIHwgIDEgKwo+PiAgIHBhY2thZ2UvZ3N0cmVhbWVyMS9nc3QxLWlteDIvQ29uZmlnLmluICAg
ICAgfCA3NSArKysrKysrKysrKysrKysrKysrKysKPj4gICBwYWNrYWdlL2dzdHJlYW1lcjEvZ3N0
MS1pbXgyL2dzdDEtaW14Mi5oYXNoIHwgIDMgKwo+PiAgIHBhY2thZ2UvZ3N0cmVhbWVyMS9nc3Qx
LWlteDIvZ3N0MS1pbXgyLm1rICAgfCA3NSArKysrKysrKysrKysrKysrKysrKysKPj4gICA0IGZp
bGVzIGNoYW5nZWQsIDE1NCBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2UvZ3N0cmVhbWVyMS9nc3QxLWlteDIvQ29uZmlnLmluCj4+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvZ3N0cmVhbWVyMS9nc3QxLWlteDIvZ3N0MS1pbXgyLmhhc2gKPj4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtaW14Mi9nc3QxLWlteDIubWsK
Pj4KPiAKPiBUaGlzIHBhY2thZ2Ugc2VlbXMgYW4gdXBkYXRlIG9mIHRoZSBleGlzdGluZyBnc3Qx
LWlteCBwYWNrYWdlLgo+IAo+IFdoeSBhZGQgYSBuZXcgcGFja2FnZSBpbnN0ZWFkIG9mIGJ1bXBp
bmcgZ3N0MS1pbXggPwoKSXQncyBhIHJld3JpdGUsIGFzIHRoZSBDaGFuZ0xvZyBzYXlzOgoKKiBD
b21wbGV0ZSByZXdyaXRlIGJhc2VkIG9uIEdTdHJlYW1lciAxLjE0LCBsaWJpbXh2cHVhcGkgMi4x
LjIsIGFuZCB0aGUgCm5ldyBsaWJpbXhkbWFidWZmZXIgbGlicmFyeS4gVGhpcyBuZXcgcmV3cml0
ZSBpcyByZWZlcnJlZCB0byBhcyAidjIiIAoodmVyc2lvbiAyKSwgd2hpbGUgdGhlIG9sZCBjb2Rl
IGlzIHJlZmVycmVkIHRvIGFzICJ2MSIgKHZlcnNpb24gMSkuIHYxIAppcyBubyBsb25nZXIgYmVp
bmcgZGV2ZWxvcGVkOyB3b3JrIGlzIGZvY3VzZWQgb24gdjIuCgpJIHRoaW5rIHdlIHNob3VsZCBr
ZWVwIGdzdDEtaW14IHYxIGZvciBjb21wYXRpYmlsaXR5LgoKQmVzdCByZWdhcmRzLAoKPiAKPiBC
ZXN0IHJlZ2FyZHMsCj4gSGVydsOpCj4gCgoKLS0gClPDqWJhc3RpZW4gU3p5bWFuc2tpLCBBcm1h
ZGV1cyBTeXN0ZW1zClNvZnR3YXJlIGVuZ2luZWVyCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
