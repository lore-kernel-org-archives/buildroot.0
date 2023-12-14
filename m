Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F36C4167B
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 09:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80695436F4;
	Thu, 14 Dec 2023 09:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80695436F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YeHqS1PvHjDh; Thu, 14 Dec 2023 09:15:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F48E436F2;
	Thu, 14 Dec 2023 09:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F48E436F2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ACB1D1BF376
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 09:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74E3C61AF3
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 09:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74E3C61AF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wbkFAudsAEIV for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 09:15:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3113361AF1
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 09:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3113361AF1
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2389FF815;
 Thu, 14 Dec 2023 09:15:05 +0000 (UTC)
Date: Thu, 14 Dec 2023 10:15:05 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20231214101505.3dcac5e7@windsurf>
In-Reply-To: <D15E2E86-61C5-4344-8669-FDE201516BF5@amd.com>
References: <20231204073443.1543587-1-neal.frager@amd.com>
 <20231213232854.5242117f@windsurf>
 <5EB6E748-BA27-414C-9AB0-434429B724BF@amd.com>
 <20231214084116.48e04ecf@windsurf>
 <CH2PR12MB5004DAEB064E623D3575D3A2F08CA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231214085854.558ce0c1@windsurf>
 <D15E2E86-61C5-4344-8669-FDE201516BF5@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702545306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KLAdefVmtw4Y923SDULF9msKtHsQfUzgO3Lj9/XKnFc=;
 b=Q/gu2gJvjBT8e/sv8Ma6NODbE3/SD49SuhPlA3lxAwtVywuCKBA8r9h0wNCvVrjhXyR9Ga
 JTcO510FhnZVIVx988IiepkfyrMNW6v3G8/xDfkMq2re0sPSF8Hyv6UJD9UvE1RzgbrwmZ
 tP3CHrPfZHz6M9O8K3VmS4sp36rOmJAh56gef46hOzgwaHzNb2J7keBiSL5ALzJGFjdJWq
 aPR8pKSyxTv9RX/7NTvPC2jYqsPYhIvCEaBXh2HDQ9EnoaPjgKkg4lei1glC/XWVNtjmP9
 QIAH7usdkeSi/Gq0RTlYuCewzmdHsdKoHolv3hRVNruSPTkGEkRPBm/9aIDT9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q/gu2gJv
Subject: Re: [Buildroot] [PATCH v8 01/10] package/binutils-bare-metal: new
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTmVhbCwKCihJdCB3b3VsZCBiZSBnb29kIGlmIHlvdSBjb3VsZCBjb25maWd1cmUgeW91
ciBlLW1haWwgY2xpZW50IHRvIHdyYXAgbGluZXMpLgoKT24gVGh1LCAxNCBEZWMgMjAyMyAwODox
MjozNSArMDAwMAoiRnJhZ2VyLCBOZWFsIiA8bmVhbC5mcmFnZXJAYW1kLmNvbT4gd3JvdGU6Cgo+
ID4gVGhpbmcgaXMgeW91IHdpbGwgaGF2ZSB0byBleHBsYWluIHZlcnkgY2xlYXJseSB3aGF0IHdl
IG5lZWQgYQo+ID4gZGlmZmVyZW50IHZhbHVlLCBhbmQgSSdtIG5vdCBzdXJlIHdlIGhhdmUgc3Vj
aCBhIGNsZWFyIGV4cGxhbmF0aW9uCj4gPiAoYXQgbGVhc3QgSSBkb24ndCBoYXZlIGl0KS4gIAo+
IAo+IFRoZSBjbGVhciBleHBsYW5hdGlvbiBpcyB0aGF0IGdjYyBkb2VzIG5vdCBmaW5kIG5ld2xp
YiBpbiB0aGUgc3lzcm9vdAo+IGRpcmVjdG9yeSB3aXRob3V0IHRoaXMgY2hhbmdlLiAgSSBkb27i
gJl0IGtub3cgaG93IGl0IHdvcmtzIHdpdGggYQo+IHN5c3Jvb3QgYXMgY3VycmVudGx5IHdyaXR0
ZW4uCgpXZWxsLCBidXQgaXQncyBsaWtlIHRoYXQgaW4gbmV3bGliLCBhbmQgaXQncyBiZWVuIGxp
a2UgdGhhdCBmb3IgeWVhcnMsCnNvIGl0IG11c3Qgd29yayBmb3Igb3RoZXJzLiBGb3IgZXhhbXBs
ZSwgQ3Jvc3N0b29sLU5HIGRvZXMgbm90IHNlZW0gdG8KYmUgcGF0Y2hpbmcgbmV3bGliIG9uIHRo
aXMgYXNwZWN0LCB5ZXQgaXQgaXMgYWJsZSB0byBnZW5lcmF0ZQpmdW5jdGlvbmFsIGJhcmUtbWV0
YWwgdG9vbGNoYWlucywgc29tZWhvdy4KCj4gPj4gSWYgdGhlcmUgaXMgYSByZWFzb24sIHBlcmhh
cHMgdGhleSBjYW4gaGVscCB1cyB3aXRoIGltcGxlbWVudGluZyBhCj4gPj4gY29uZmlndXJhYmxl
IHNvbHV0aW9uLCBhcyB5b3Ugc3VnZ2VzdC4gIEluIGFueSBjYXNlLCBJIHRoaW5rCj4gPj4gd29y
a2luZyB0byB1cHN0cmVhbSBhIHByb3BlciBzb2x1dGlvbiBpcyBzdGlsbCBiZXR0ZXIgdGhhbiBt
eQo+ID4+IGZpeHVwIHNvbHV0aW9uLiBJIG9ubHkgaW1wbGVtZW50ZWQgdGhlIGZpeHVwIHNvbHV0
aW9uIGFzIGl0IHdhcwo+ID4+IHF1aWNrZXIgdGhhbiBzcGVuZGluZyBtYW55IGhvdXJzIGxlYXJu
aW5nIHRoZSBuZXdsaWIgY29uZmlndXJlCj4gPj4gc2NyaXB0LiAgTm93IHRoYXQgeW91IGhhdmUg
Zm91bmQgdGhlIHJvb3Qgb2YgdGhlIHByb2JsZW0sIEkgdGhpbmsKPiA+PiBwYXRjaGluZyBpdCB1
cHN0cmVhbSBpcyB0aGUgYmVzdCBvcHRpb24uICAKPiA+IAo+ID4gTWFueSBob3VycyB0byBhZGQg
YSAtLXdpdGgtb3B0aW9uPyBJdCBzaG91bGQgdGFrZSAxMCBtaW51dGVzIG9yIHNvLgo+IAo+IDEw
IG1pbnV0ZXMgbm93IHRoYXQgd2Uga25vdyBleGFjdGx5IHdoZXJlIHRoZSBpc3N1ZSBpcyBjb21p
bmcgZnJvbS4KPiBNeSBjb21tZW50IGFib3V0IG1hbnkgaG91cnMgd2FzIGJhc2VkIG9uIG5vdCBr
bm93aW5nIGFueSBwYXRjaAo+IGFscmVhZHkgZXhpc3RlZC4gIENyZWF0aW5nIGEgcGF0Y2ggdG8g
dGhlIGNvbmZpZ3VyZSBzY3JpcHQgZnJvbQo+IHNjcmF0Y2ggd291bGQgaGF2ZSB0YWtlbiBtZSBh
IGZldyBob3Vycy4gIFRoaXMgaXMgd2h5IEkgZGlkIHRoZSBmaXgKPiB1cC4KCkknbSBub3Qgc3Vy
ZSB3ZSdyZSB0YWxraW5nIGFib3V0IHRoZSBzYW1lIHRoaW5nLiBJJ20gbm90IHRhbGtpbmcgYWJv
dXQKdGhlIHRpbWUgbmVlZGVkIHRvIGZpbmQgdGhlIHJvb3QgY2F1c2Ugb2YgdGhlIGlzc3VlLCBi
dXQgcmF0aGVyIHRoZQp0aW1lIHRvIHdyaXRlIGEgcGF0Y2ggdGhhdCBhY3R1YWxseSBoYXMgYSBj
aGFuY2UgdG8gYmUgYWNjZXB0ZWQKdXBzdHJlYW0uIFRoZSBwYXRjaCB0aGF0IHlvdSBoYXZlIGZv
ciBub3cgaGFzIGFic29sdXRlbHkgMCBjaGFuY2VzIG9mCmJlaW5nIGFjY2VwdGVkIHVwc3RyZWFt
LCBhcyBpdCBicmVha3MgZXhpc3RpbmcgYmVoYXZpb3IgdGhhdCBwcmVzdW1hYmx5CndvcmtzIGZv
ciB1c2VycyB0b2RheS4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5k
IENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0
cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
