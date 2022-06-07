Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17789C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 07:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1D25613DB;
	Tue,  7 Jun 2022 07:05:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IkmYl7vDLjAA; Tue,  7 Jun 2022 07:05:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C599E60BFD;
	Tue,  7 Jun 2022 07:05:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7CED41BF2C1
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 07:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6602060BFD
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 07:05:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aEbUda7_vspf for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 07:05:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from 8.mo552.mail-out.ovh.net (8.mo552.mail-out.ovh.net
 [46.105.37.156])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10A5B60BBD
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 07:05:31 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.188])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 4DDAA2548F;
 Tue,  7 Jun 2022 07:05:28 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 7 Jun 2022
 09:05:28 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00212643641-2d0d-481b-b495-3fd9e12b7b95,
 B3A9F5ABA359FFEAA5F192A1B4EC97B2EEB111D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ca9b4df4-6d1c-5f51-244a-41c748292494@kaod.org>
Date: Tue, 7 Jun 2022 09:05:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220606135756.2264709-1-clg@kaod.org>
 <CACPK8Xe=3ifKNZxs5GSaHtgYONPy-_w9m8_cSkR3Rya2KkZS7Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8Xe=3ifKNZxs5GSaHtgYONPy-_w9m8_cSkR3Rya2KkZS7Q@mail.gmail.com>
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8f5c6466-3632-45bd-be45-97d9f13d94d6
X-Ovh-Tracer-Id: 17922074718190013408
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddtgedguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegthhhinhdqthhinhhgpghkuhhosegrshhpvggvughtvggthhdrtghomhdpoffvtefjohhsthepmhhoheehvd
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/aspeed_ast2600evb: new
 defconfig
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
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Troy Lee <troy_lee@aspeedtech.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNi83LzIyIDAwOjU3LCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4gT24gTW9uLCA2IEp1biAyMDIy
IGF0IDEzOjU4LCBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPiB3cm90ZToKPj4KPj4g
VGhlIGtlcm5lbCBpcyBmcm9tIHVwc3RyZWFtIGFuZCBVLUJvb3QgaXMgZnJvbSB0aGUgT3BlbkJN
QyBicmFuY2gKPj4gd2hlcmUgbW9zdCBvZiBkZXZlbG9wbWVudCBpcyBkb25lLiBNYWlubGluZSBk
b2Vzbid0IGhhdmUgdGhlIHJlcXVpcmVkCj4+IHN1cHBvcnQgZm9yIEhXLgo+Pgo+PiBUaGUgbWFp
biByZXN1bHRpbmcgZmlsZSBmcm9tIHRoZSBidWlsZCBpcyBhIGZsYXNoIGltYWdlLiBUaGUgcGFy
dGl0aW9uCj4+IGxheW91dCBtYXRjaGVzIHRoZSBPcGVuQk1DIG9uZSBmb3IgNjRNIGNoaXBzLiBJ
dCBtYWtlcyBpdCBlYXNpZXIgdG8KPj4gdXBkYXRlIHRoZSBkaWZmZXJlbnQgcGFydGl0aW9ucyBm
cm9tIExpbnV4LiBJbnRlcm1lZGlhdGUgZmlsZXMgY2FuIGJlCj4+IHVzZWQgdG8gYm9vdCBmcm9t
IFUtYm9vdCBvdmVyIHRoZSBuZXR3b3JrIG9yIHRvIGJvb3QgUUVNVSB1c2luZwo+PiAta2VybmVs
Ly1pbml0cmQvLWR0Yi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNs
Z0BrYW9kLm9yZz4KPj4gLS0tCj4+Cj4+ICAgQ2hhbmdlcyBpbiB2MjoKPj4KPj4gICAtIEFkZCBK
b2VsIHRvIHRoZSBsaXN0IG9mIGRldmVsb3BlcnMKPj4gICAtIFJlbW92ZWQgdW51c2VkIENPTkZJ
RyBmcm9tIGxpbnV4LmZyYWdtZW50IGJ1dCBhZGRlZAo+PiAgICAgQ09ORklHX0kyQ19TTEFWRV9F
RVBST00gd2hpY2ggaXMgdXNlZnVsIGZvciB0ZXN0cwo+PiAgIC0gbWlub3IgY2xlYW51cHMgaW4g
cmVhZG1lLnR4dAo+Pgo+PiAgIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICA0ICsrCj4+ICAgYm9hcmQvYXNwZWVkL2FzdDI2MDAtZXZiL2dlbmltYWdlLmNmZyAgIHwg
NDAgKysrKysrKysrKysrKwo+PiAgIGJvYXJkL2FzcGVlZC9hc3QyNjAwLWV2Yi9saW51eC5mcmFn
bWVudCB8ICAxICsKPj4gICBib2FyZC9hc3BlZWQvYXN0MjYwMC1ldmIvcmVhZG1lLnR4dCAgICAg
fCA4MCArKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAgYm9hcmQvYXNwZWVkL2NvbW1vbi9p
bWFnZS5pdHMudGVtcGxhdGUgIHwgNTYgKysrKysrKysrKysrKysrKysKPj4gICBib2FyZC9hc3Bl
ZWQvY29tbW9uL3Bvc3QtaW1hZ2Uuc2ggICAgICAgfCAyNyArKysrKysrKysKPj4gICBjb25maWdz
L2FzcGVlZF9hc3QyNjAwZXZiX2RlZmNvbmZpZyAgICAgfCA1NiArKysrKysrKysrKysrKysrKwo+
PiAgIDcgZmlsZXMgY2hhbmdlZCwgMjY0IGluc2VydGlvbnMoKykKPj4gICBjcmVhdGUgbW9kZSAx
MDA2NDQgYm9hcmQvYXNwZWVkL2FzdDI2MDAtZXZiL2dlbmltYWdlLmNmZwo+PiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBib2FyZC9hc3BlZWQvYXN0MjYwMC1ldmIvbGludXguZnJhZ21lbnQKPj4gICBj
cmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvYXNwZWVkL2FzdDI2MDAtZXZiL3JlYWRtZS50eHQKPj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvYXNwZWVkL2NvbW1vbi9pbWFnZS5pdHMudGVtcGxh
dGUKPj4gICBjcmVhdGUgbW9kZSAxMDA3NTUgYm9hcmQvYXNwZWVkL2NvbW1vbi9wb3N0LWltYWdl
LnNoCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmZpZ3MvYXNwZWVkX2FzdDI2MDBldmJfZGVm
Y29uZmlnCj4+Cj4+IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+PiBpbmRl
eCA3MWNjM2RhNmQ3MGIuLjNhN2Y2N2FlZTIzMCAxMDA2NDQKPj4gLS0tIGEvREVWRUxPUEVSUwo+
PiArKysgYi9ERVZFTE9QRVJTCj4+IEBAIC01MDEsOCArNTAxLDEwIEBAIEY6IHBhY2thZ2Uvem5j
Lwo+PiAgIE46ICAgICBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgo+PiAgIEY6ICAg
ICBib2FyZC9xZW11L3BwYy1iYW1ib28vCj4+ICAgRjogICAgIGJvYXJkL3FlbXUvcHBjNjRsZS1w
b3dlcm52OC9yZWFkbWUudHh0Cj4+ICtGOiAgICAgYm9hcmQvYXNwZWVkLwo+PiAgIEY6ICAgICBj
b25maWdzL3FlbXVfcHBjX2JhbWJvb19kZWZjb25maWcKPj4gICBGOiAgICAgY29uZmlncy9xZW11
X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmlnCj4+ICtGOiAgICAgY29uZmlncy9hc3BlZWQqCj4+
Cj4+ICAgTjogICAgIENoYXJsZXMgSGFyZGluIDxja2hhcmRpbkBnbWFpbC5jb20+Cj4+ICAgRjog
ICAgIHBhY2thZ2UvYWxzYS1wbHVnaW5zLwo+PiBAQCAtMTQ1MSw2ICsxNDUzLDggQEAgRjogICAg
ICAgIGJvYXJkL3FlbXUvcHBjNjRsZS1wc2VyaWVzLwo+PiAgIEY6ICAgICBjb25maWdzL3FlbXVf
cHBjNjRsZV9wc2VyaWVzX2RlZmNvbmZpZwo+PiAgIEY6ICAgICBib2FyZC9xZW11L3BwYy1tYWM5
OS8KPj4gICBGOiAgICAgY29uZmlncy9xZW11X3BwY19tYWM5OV9kZWZjb25maWcKPj4gK0Y6ICAg
ICBib2FyZC9hc3BlZWQvCj4+ICtGOiAgICAgY29uZmlncy9hc3BlZWQqCj4+Cj4+ICAgTjogICAg
IEpvaGFuIERlcnlja2UgPGpvaGFuZGVyeWNrZUBnbWFpbC5jb20+Cj4+ICAgRjogICAgIHBhY2th
Z2UvcHl0aG9uLWxpYmNvbmZpZy8KPj4gZGlmZiAtLWdpdCBhL2JvYXJkL2FzcGVlZC9hc3QyNjAw
LWV2Yi9nZW5pbWFnZS5jZmcgYi9ib2FyZC9hc3BlZWQvYXN0MjYwMC1ldmIvZ2VuaW1hZ2UuY2Zn
Cj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNTY5MzJkNDc4
NzU2Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvYm9hcmQvYXNwZWVkL2FzdDI2MDAtZXZiL2dl
bmltYWdlLmNmZwo+PiBAQCAtMCwwICsxLDQwIEBACj4+ICsjCj4+ICsjIFRoaXMgY29uZmlnIHJl
cHJvZHVjZXMgdGhlIE9wZW5CTUMgZmxhc2ggbGF5b3V0IGRlZmluZWQgaW4gTGludXggOgo+PiAr
Iwo+PiArIyAgICBhcmNoL2FybS9ib290L2R0cy9vcGVuYm1jLWZsYXNoLWxheW91dC02NC5kdHNp
Cj4+ICsjCj4+ICsjIGFuZCBpbmNsdWRlZCBieSBhc3BlZWQtYXN0MjYwMC1ldmIuZHRzCj4+ICsj
Cj4+ICtmbGFzaCBub3ItNjRNLTI1NiB7Cj4+ICsgICAgICAgcGVic2l6ZSA9IDRLCj4+ICsgICAg
ICAgbnVtcGVicyA9IDE2Swo+PiArICAgICAgIG1pbmltdW0taW8tdW5pdC1zaXplID0gMjU2Cj4+
ICt9Cj4+ICsKPj4gK2ltYWdlIGZsYXNoLmltZyB7Cj4+ICsgICAgICAgZmxhc2ggewo+PiArICAg
ICAgIH0KPj4gKyAgICAgICBmbGFzaHR5cGUgPSAibm9yLTY0TS0yNTYiCj4+ICsKPj4gKyAgICAg
ICBwYXJ0aXRpb24gdWJvb3Qgewo+PiArICAgICAgICAgICAgICAgaW1hZ2UgPSAidS1ib290LmJp
biIKPj4gKyAgICAgICAgICAgICAgIHNpemUgPSA4OTZLCj4+ICsgICAgICAgfQo+PiArCj4+ICsg
ICAgICAgcGFydGl0aW9uIHVib290ZW52IHsKPj4gKyAgICAgICAgICAgICAgIC8qIFRPRE8gKi8K
Pj4gKyAgICAgICAgICAgICAgIG9mZnNldCA9IDg5NksKPj4gKyAgICAgICAgICAgICAgIHNpemUg
PSAxMjhLCj4+ICsgICAgICAgfQo+PiArCj4+ICsgICAgICAgcGFydGl0aW9uIGZpdGltYWdlIHsK
Pj4gKyAgICAgICAgICAgICAgIGltYWdlID0gImltYWdlLml0YiIKPj4gKyAgICAgICAgICAgICAg
IG9mZnNldCA9IDFNCj4+ICsgICAgICAgICAgICAgICBzaXplID0gOU0KPj4gKyAgICAgICB9Cj4+
ICsKPj4gKyAgICAgICBwYXJ0aXRpb24gc3BhcmUgewo+IAo+IEl0IG9jY3VyZWQgdG8gbWUgdGhh
dCB3ZSBjb3VsZCBwdXQgdGhlIHJvb3RmcyBoZXJlIGluc3RlYWQsIHdoaWNoCj4gd291bGQgdGVz
dCB0aGUgZmlsZXN5c3RlbSBnZW5lcmF0aW9uIGluc3RlYWQgb2YgaW5pdHJkLiBTb21ldGhpbmcg
dG8KPiB0aGluayBhYm91dCBmb3IgdGhlIGZ1dHVyZSBwZXJoYXBzLgoKeWVzLgoKSXQgd2lsbCBy
ZXF1aXJlIGEgY2hhbmdlIG9mIHRoZSBkZWZhdWx0IGtlcm5lbCBjb21tYW5kIGxpbmUgVS1ib290
LgpOb3RoaW5nIG1ham9yLgogIAo+IAo+PiArICAgICAgICAgICAgICAgb2Zmc2V0ID0gMTBNCj4+
ICsgICAgICAgICAgICAgICBzaXplID0gNTRNCj4+ICsgICAgICAgfQo+PiArfQo+PiBkaWZmIC0t
Z2l0IGEvYm9hcmQvYXNwZWVkL2FzdDI2MDAtZXZiL2xpbnV4LmZyYWdtZW50IGIvYm9hcmQvYXNw
ZWVkL2FzdDI2MDAtZXZiL2xpbnV4LmZyYWdtZW50Cj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+
IGluZGV4IDAwMDAwMDAwMDAwMC4uOGRkNDYwODcwNzk5Cj4+IC0tLSAvZGV2L251bGwKPj4gKysr
IGIvYm9hcmQvYXNwZWVkL2FzdDI2MDAtZXZiL2xpbnV4LmZyYWdtZW50Cj4+IEBAIC0wLDAgKzEg
QEAKPj4gK0NPTkZJR19JMkNfU0xBVkVfRUVQUk9NPXkKPiAKPiBJJ2xsIHRha2UgYSBwYXRjaCB0
byBwdXQgdGhhdCBpbiB0aGUgdXBzdHJlYW0gZGVmY29uZmlnIGlmIHlvdSB3YW50LgoKVGhpcyBp
cyBtb3N0bHkgZm9yIHRlc3QgYnV0IHllcywgaXQgd291bGQgYmUgdXNlZnVsLgoKPiAKPiBUaGlz
IGxvb2tzIGdvb2QgdG8gZ28gaW4gYXMgaXQgaXMgZnJvbSBhbiBhc3BlZWQva2VybmVsL3UtYm9v
dCBwZXJzcGVjdGl2ZS4KPiAKPiBSZXZpZXdlZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5p
ZC5hdT4KClRoYW5rcywKCkMuCgo+IAo+IENoZWVycywKPiAKPiBKb2VsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
