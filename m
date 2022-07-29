Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B679C19F2A
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 06:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFB0383FAE;
	Fri, 29 Jul 2022 06:58:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFB0383FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HNswRk0SkvcX; Fri, 29 Jul 2022 06:58:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE86D83EE7;
	Fri, 29 Jul 2022 06:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE86D83EE7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0D0F1BF3B9
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 06:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC005408F3
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 06:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC005408F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nvdlV6o_Xs64 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 06:58:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57BE840179
Received: from 8.mo552.mail-out.ovh.net (8.mo552.mail-out.ovh.net
 [46.105.37.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57BE840179
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 06:58:13 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.19])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 09E7B2589C;
 Fri, 29 Jul 2022 06:52:16 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 29 Jul
 2022 08:52:15 +0200
X-OVh-ClientIp: 90.89.72.120
Message-ID: <b1b0b11a-6c49-9d7c-5d1b-b6ec8e6a2966@kaod.org>
Date: Fri, 29 Jul 2022 08:52:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-4-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220729000904.1295295-4-joel@jms.id.au>
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: f7d7ef56-abcd-4099-a1d9-5ed2f4ef2a7c
X-Ovh-Tracer-Id: 9484299342743505702
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduiedgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhheeijeelfffgkeetudelvdffieeigfduheefudekieejvefhtdevhfeftdfftdenucffohhmrghinhepsghuihhlughrohhothdrnhgvthenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdpoffvtefjohhsthepmhhoheehvd
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003747d629c-85e2-46c3-8a52-eecef334950a,
 FAFF5065920E43DA0D2CF6C40E58A39B80E28978) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH 3/9] arch/powerpc: Enable powerpc64le only
 on CPUs that support it
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
 Michael Ellerman <mpe@ellerman.id.au>, Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNy8yOS8yMiAwMjowOCwgSm9lbCBTdGFubGV5IHdyb3RlOgo+IEludmFsaWQgY29uZmlndXJh
dGlvbnMgbGVhZCB0byBidWlsZCBmYWlsdXJlcywgc3VjaCBhcyB0cnlpbmcgdG8gZW5hYmxlCj4g
cHBjNjRsZSBmb3IgdGhlIHBwYzk3MDoKPiAKPiAgICBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9v
dC5uZXQvcmVzdWx0cy9mZGE4ODY3NjhmY2UyNWNjZDliNTJiNjM1ZmY1YjEzZGE3YmEyZDBjLwo+
IAo+IEluIG9yZGVyIHRvIHJ1biBhIHBwYzY0bGUgdXNlcnNwYWNlIGEga2VybmVsIHRoYXQgcnVu
cyBpbiB0aGlzIG1vZGUgaXMKPiByZXF1aXJlZC4gVGhlIG9ubHkgQ1BVIHN1cHBvcnRlZCBpbiBi
dWlsZHJvb3QgdGhhdCBjYW4gYm9vdCBhIHBwYzY0bGUKPiBrZXJuZWwgaXMgUG93ZXI4LCBzbyBt
YXJrIGFsbCBvZiB0aGUgb3RoZXIgNjQtYml0IGNhcGFibGUgQ1BVcyBhcyBub3QKPiBzdXBwb3J0
aW5nIHBwYzY0bGUuCgpJIGRvbid0IHRoaW5rIHdlIGNhcmUgbXVjaCBidXQgUG93ZXI3IGNvdWxk
IHJ1biBhbHNvIGluIExFLgoKUmV2aWV3ZWQtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2Fv
ZC5vcmc+CgpUaGFua3MsCgpDLgoKPiAKPiBUaGlzIGRyb3BzIHRoZSBjb21tZW50IGFib3V0IGxp
YmMsIHdoaWNoIGlzIHRydWUgYnV0IGRvZXNuJ3QgdGVsbCB0aGUKPiB3aG9sZSBzdG9yeS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pgo+IC0tLQo+ICAg
YXJjaC9Db25maWcuaW4ucG93ZXJwYyB8IDExICsrKysrKystLS0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNo
L0NvbmZpZy5pbi5wb3dlcnBjIGIvYXJjaC9Db25maWcuaW4ucG93ZXJwYwo+IGluZGV4IDhkMzky
YmZkZTgxNC4uN2M2YWU4NDM0OGU5IDEwMDY0NAo+IC0tLSBhL2FyY2gvQ29uZmlnLmluLnBvd2Vy
cGMKPiArKysgYi9hcmNoL0NvbmZpZy5pbi5wb3dlcnBjCj4gQEAgLTcxLDExICs3MSw5IEBAIGNv
bmZpZyBCUjJfcG93ZXJwY182MDRlCj4gICAJZGVwZW5kcyBvbiAhQlIyX0FSQ0hfSVNfNjQKPiAg
IGNvbmZpZyBCUjJfcG93ZXJwY182MjAKPiAgIAlib29sICI2MjAiCj4gLQkjIE5vIEMgbGlicmFy
eSBzdXBwb3J0cyB0aGlzIHZhcmlhbnQgb24gcHBjNjRsZQo+ICAgCWRlcGVuZHMgb24gIUJSMl9w
b3dlcnBjNjRsZQo+ICAgY29uZmlnIEJSMl9wb3dlcnBjXzYzMAo+ICAgCWJvb2wgIjYzMCIKPiAt
CSMgTm8gQyBsaWJyYXJ5IHN1cHBvcnRzIHRoaXMgdmFyaWFudCBvbiBwcGM2NGxlCj4gICAJZGVw
ZW5kcyBvbiAhQlIyX3Bvd2VycGM2NGxlCj4gICBjb25maWcgQlIyX3Bvd2VycGNfNzQwCj4gICAJ
Ym9vbCAiNzQwIgo+IEBAIC0xMDIsNiArMTAwLDcgQEAgY29uZmlnIEJSMl9wb3dlcnBjXzg2MAo+
ICAgCWRlcGVuZHMgb24gIUJSMl9BUkNIX0lTXzY0Cj4gICBjb25maWcgQlIyX3Bvd2VycGNfOTcw
Cj4gICAJYm9vbCAiOTcwIgo+ICsJZGVwZW5kcyBvbiAhQlIyX3Bvd2VycGM2NGxlCj4gICAJc2Vs
ZWN0IEJSMl9QT1dFUlBDX0NQVV9IQVNfQUxUSVZFQwo+ICAgY29uZmlnIEJSMl9wb3dlcnBjXzg1
NDAKPiAgIAlib29sICI4NTQwIC8gZTUwMHYxIgo+IEBAIC0xMjksMjEgKzEyOCwyNSBAQCBjb25m
aWcgQlIyX3Bvd2VycGNfZTY1MDAKPiAgIAlzZWxlY3QgQlIyX1BPV0VSUENfQ1BVX0hBU19BTFRJ
VkVDCj4gICBjb25maWcgQlIyX3Bvd2VycGNfcG93ZXI0Cj4gICAJYm9vbCAicG93ZXI0Igo+IC0J
IyBObyBDIGxpYnJhcnkgc3VwcG9ydHMgdGhpcyB2YXJpYW50IG9uIHBwYzY0bGUKPiAgIAlkZXBl
bmRzIG9uICFCUjJfcG93ZXJwYzY0bGUKPiAgIGNvbmZpZyBCUjJfcG93ZXJwY19wb3dlcjUKPiAg
IAlib29sICJwb3dlcjUiCj4gLQkjIE5vIEMgbGlicmFyeSBzdXBwb3J0cyB0aGlzIHZhcmlhbnQg
b24gcHBjNjRsZQo+ICAgCWRlcGVuZHMgb24gIUJSMl9wb3dlcnBjNjRsZQo+ICsJZGVwZW5kcyBv
biBCUjJfQVJDSF9JU182NAo+ICAgY29uZmlnIEJSMl9wb3dlcnBjX3Bvd2VyNgo+ICAgCWJvb2wg
InBvd2VyNiIKPiArCWRlcGVuZHMgb24gIUJSMl9wb3dlcnBjNjRsZQo+ICsJZGVwZW5kcyBvbiBC
UjJfQVJDSF9JU182NAo+ICAgCXNlbGVjdCBCUjJfUE9XRVJQQ19DUFVfSEFTX0FMVElWRUMKPiAg
IGNvbmZpZyBCUjJfcG93ZXJwY19wb3dlcjcKPiAgIAlib29sICJwb3dlcjciCj4gKwlkZXBlbmRz
IG9uICFCUjJfcG93ZXJwYzY0bGUKPiArCWRlcGVuZHMgb24gQlIyX0FSQ0hfSVNfNjQ+Cj4gICAJ
c2VsZWN0IEJSMl9QT1dFUlBDX0NQVV9IQVNfQUxUSVZFQwo+ICAgCXNlbGVjdCBCUjJfUE9XRVJQ
Q19DUFVfSEFTX1ZTWAo+ICAgY29uZmlnIEJSMl9wb3dlcnBjX3Bvd2VyOAo+ICAgCWJvb2wgInBv
d2VyOCIKPiArCWRlcGVuZHMgb24gQlIyX0FSQ0hfSVNfNjQKPiAgIAlzZWxlY3QgQlIyX1BPV0VS
UENfQ1BVX0hBU19BTFRJVkVDCj4gICAJc2VsZWN0IEJSMl9QT1dFUlBDX0NQVV9IQVNfVlNYCj4g
ICBlbmRjaG9pY2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
