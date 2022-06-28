Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDF4C43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 05:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF50B82D04;
	Tue, 28 Jun 2022 05:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF50B82D04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kv0-KFWq8Kzz; Tue, 28 Jun 2022 05:22:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5DEC82C33;
	Tue, 28 Jun 2022 05:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5DEC82C33
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 806771BF25F
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 05:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6650482C33
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 05:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6650482C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IToOPFg9Sei1 for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 05:22:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D8ED82BEB
Received: from smtpout4.mo529.mail-out.ovh.net
 (smtpout4.mo529.mail-out.ovh.net [217.182.185.173])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D8ED82BEB
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 05:22:54 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.131])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 53F6B11203644;
 Tue, 28 Jun 2022 07:15:21 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 28 Jun
 2022 07:15:20 +0200
X-OVh-ClientIp: 82.64.250.170
Message-ID: <21f76fa5-ea52-0296-46e7-bc0e7242e135@kaod.org>
Date: Tue, 28 Jun 2022 07:15:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, <buildroot@buildroot.org>
References: <20220621203415.3601501-1-clg@kaod.org>
 <20220621203415.3601501-2-clg@kaod.org>
 <ce3f0851-3a29-5d97-152b-b46c289b9139@mind.be>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <ce3f0851-3a29-5d97-152b-b46c289b9139@mind.be>
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fca5ca3f-0fb2-48cf-8df8-1262b7793931
X-Ovh-Tracer-Id: 10261733229369854883
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegiedgleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdpoffvtefjohhsthepmhhohedvle
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0052123310f-88d0-49ae-b89c-5111f374784e,
 366CF7EF17C4C6544BD620BB2F2D78A15BAD5133) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH v3 2/2] configs/aspeed_ast2500evb: new
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
Cc: chin-ting_kuo@aspeedtech.com, troy_lee@aspeedtech.com,
 Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNi8yNy8yMiAyMjo1MiwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4gCj4gCj4gT24g
MjEvMDYvMjAyMiAyMjozNCwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4+IFRoZSBrZXJuZWwg
aXMgZnJvbSB1cHN0cmVhbSB3aXRoIGEgZmV3IGV4dHJhcyB0byByZWR1Y2UgdGhlIHNpemUgb2YK
Pj4gdGhlICdhc3BlZWRfZzUnIHpJbWFnZSBiZWNhdXNlIGl0IGlzIHRvbyBiaWcgZm9yIHRoZSBm
bGFzaCBsYXlvdXQuCj4+IE1haW5saW5lIFUtQm9vdCBoYXMgZW5vdWdoIHN1cHBvcnQgdG8gbG9h
ZCB0aGUga2VybmVsIGZyb20gdGhlIGZsYXNoCj4+IGRldmljZSBhbmQgZnJvbSBuZXR3b3JrIGJ1
dCBpdCBpcyBzdGlsbCBiZWhpbmQgdGhlIE9wZW5CTUMgYnJhbmNoCj4+IHdoZXJlIG1vc3QgdGhl
IGRldmVsb3BtZW50IGlzIGRvbmUuCj4+Cj4+IFRoZSBtYWluIHJlc3VsdGluZyBmaWxlIGZyb20g
dGhlIGJ1aWxkIGlzIGEgZmxhc2ggaW1hZ2UuIFRoZSBwYXJ0aXRpb24KPj4gbGF5b3V0IG1hdGNo
ZXMgdGhlIE9wZW5CTUMgb25lIGZvciAzMk0gY2hpcHMuIEl0IG1ha2VzIGl0IGVhc2llciB0bwo+
PiB1cGRhdGUgdGhlIGRpZmZlcmVudCBwYXJ0aXRpb25zIGZyb20gTGludXguIEludGVybWVkaWF0
ZSBmaWxlcyBjYW4gYmUKPj4gdXNlZCB0byBib290IGZyb20gVS1Cb290IG92ZXIgdGhlIG5ldHdv
cmsgb3IgdG8gYm9vdCBRRU1VIHVzaW5nCj4+IC1rZXJuZWwvLWluaXRyZC8tZHRiLgo+Pgo+PiBS
ZXZpZXdlZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KPj4gU2lnbmVkLW9mZi1i
eTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KPiAKPiBbc25pcF0KPj4gZGlmZiAt
LWdpdCBhL2JvYXJkL2FzcGVlZC9hc3QyNTAwLWV2Yi9saW51eC5mcmFnbWVudCBiL2JvYXJkL2Fz
cGVlZC9hc3QyNTAwLWV2Yi9saW51eC5mcmFnbWVudAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
PiBpbmRleCAwMDAwMDAwMDAwMDAuLjFjZWU5NWY4NDI3Ygo+PiAtLS0gL2Rldi9udWxsCj4+ICsr
KyBiL2JvYXJkL2FzcGVlZC9hc3QyNTAwLWV2Yi9saW51eC5mcmFnbWVudAo+PiBAQCAtMCwwICsx
LDcgQEAKPj4gK0NPTkZJR19LRVJORUxfWFo9eQo+PiArQ09ORklHX0FSQ0hfTVVMVElfVjc9bgo+
IAo+ICDCoE5vcm1hbGx5IHRoaXMgd291bGQgYmUKPiAKPiAjIENPTkZJR19BUkNIX01VTFRJX1Y3
IGlzIG5vdCBzZXQKPiAKPiBidXQgdGhpcyB3b3JrcyBhcyB3ZWxsLiBIb3cgZGlkIHlvdSBnZW5l
cmF0ZSB0aGlzIGNvbmZpZz8gZGlmZmNvbmZpZz8KCm5vLiBNYW51YWxseSwgYWRkaW5nID1uIHVu
dGlsIHRoZSBrZXJuZWwgaW1hZ2UgZmlsZSByZWFjaGVkIGEgc2l6ZSB0aGF0CndhcyBzbWFsbCBl
bm91Z2ggdG8gZml0IHRoZSBmbGFzaCBwYXJ0aXRpb24uCgpIYXZpbmcgMiBkaWZmZXJlbnQgZGVm
Y29uZmlnICBhc3BlZWRfZzUgYW5kIGFzcGVlZF9nNiB3b3VsZCBoZWxwIGJ1dAppdCBpcyBtb3Jl
IHdvcmsgdG8gbWFpbnRhaW4uCgpUaGFua3MsCgpDLgoKCj4gCj4gIMKgQW55d2F5LCBJIGFwcGxp
ZWQgaXQgYXMgaXMuCj4gCj4gIMKgUmVnYXJkcywKPiAgwqBBcm5vdXQKPiAKPj4gK0NPTkZJR19N
QUNIX0FTUEVFRF9HNj1uCj4+ICtDT05GSUdfU01QPW4KPj4gK0NPTkZJR19FWFQ0X0ZTPW4KPj4g
K0NPTkZJR19ERUJVR19GUz1uCj4+ICtDT05GSUdfU1VTUEVORD1uCj4gW3NuaXBdCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
