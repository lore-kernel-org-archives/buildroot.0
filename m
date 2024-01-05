Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33E6C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D56683ECA;
	Fri,  5 Jan 2024 13:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D56683ECA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BKbM6WT7xpqD; Fri,  5 Jan 2024 13:22:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0258483EC8;
	Fri,  5 Jan 2024 13:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0258483EC8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7BE3E1BF841
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53B0A436F1
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53B0A436F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uB3W308FhwnQ for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:22:20 +0000 (UTC)
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C0B3436F8
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C0B3436F8
Received: from smtpclient.apple ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPA
 id Lk9Pr6yWw9CpsLk9QrlqPJ; Fri, 05 Jan 2024 14:22:16 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 5 Jan 2024 14:22:15 +0100
Message-Id: <13943A12-FC50-4F95-B5E8-45941CB925B2@benettiengineering.com>
References: <20240105140611.6a19a037@windsurf>
In-Reply-To: <20240105140611.6a19a037@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (21C66)
X-CMAE-Envelope: MS4xfLQby8mkT3t/xEmlMuaKqiLgpszY1neuDVL/Gqp5kByMyoM00AQAITlkZIh1XTx642DShrhKr4zhx4L4w3QQEp5Sweu/wmBq57MAz3sNWygbmgUAKQPG
 IudvH8lqUonydBZPaSHbOQRAwg48Nc7LouMaMtSEz/lGiRzp/jnP720R7FpJcTDuPzoA82QrJUY1lrucYD7LGQkjAwdxwpkvI99B6NzC6yUFuZxu+KAoDN0N
 ZNBpBxNyHtn89wmx92acQJz0Y03gLtvD2coOmVvgv5Skcjm2W3MsClnPo2+VJSrkBIbNIJj9CHFTgm956yAz5jwEOF+aCoA3fPe9TitkFUQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1704460936; bh=7cJ86CgbvDyVZjokcl2mFsJX3tMfUkhNk+Odc8qM9Lg=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=hR177S+7AJSJWW1UKhNpNHvBf/g+Y9y9GBXZtG92ESmb2XQ9Nn4sKbjI3+YpaJ3fN
 cNzh194nvPccWwL7RglPG7Ln4TODJ5G5UStZ35Ic+b+FYO6nuVc6Vg+4DXSR98Ua3B
 KMsZyq6/wqiScctE2O7cnktRAQOZLStbgbeJgGOtP2Fc4HiKbyrhYNPeLO0UbESFpD
 jt2RGtT6C3y5Jbut+IYfpx5IzHT9JlBVBHL0HkwLUOBxcskzXHFK7BeR8ogo23I1Oe
 bMjGeSlBDmbcK3gO2/pls5MvsmGY/Adurb8ZjcKA3d7yZkcqbG1eLCox3bG91B98aT
 Qa+WXahapREWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=hR177S+7
Subject: Re: [Buildroot] [PATCH v2] package/swugenerator: add missing
 runtime dependencies
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
Cc: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKPiBJbCBnaW9ybm8gNSBnZW4gMjAyNCwgYWxsZSBvcmUgMTQ6MDcsIFRo
b21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGhhIHNjcml0dG86
Cj4gCj4g77u/SGVsbG8gR2l1bGlvLAo+IAo+IFRoYW5rcyBmb3IgdGhlIHYyIQo+IAo+PiBPbiBU
dWUsIDI2IERlYyAyMDIzIDIyOjQwOjM3ICswMTAwCj4+IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8u
YmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPj4gCj4+IEZyb206IEdpdWxp
byBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aSt0ZWt2b3hAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4K
Pj4gCj4+IEF0IHRoZSBtb21lbnQgc3d1Z2VuZXJhdG9yIHBhY2thZ2UgbGFja3MgaG9zdC1vcGVu
c3NsLCBob3N0LWd6aXAgYW5kCj4+IGhvc3QtenN0ZCBydW50aW1lIGRlcGVuZGVuY3kgc28gbGV0
J3MgYWRkIHRoZW0gdG8gcHJldmVudCBzd3VnZW5lcmF0b3IgZnJvbQo+PiBmYWlsaW5nIHRvIHJ1
bi4KPiAKPiBJJ20gZ29pbmcgdG8gbml0cGljayBhIGJpdCAoeWVzLCBJIGFkbWl0KSwgYnV0IHRo
aXMgY29tbWl0IGxvZyBleHBsYWlucwo+IHdoYXQgdGhlIGNvbW1pdCBkb2VzLCBub3Qgd2h5IGl0
IGRvZXMgaXQuIFRoZSAqd2h5KiBpcyBpbXBvcnRhbnQuIFRoZQo+IHByb2JsZW0gaXMgbm90IHRo
YXQgc3d1Z2VuZXJhdG9yIGxhY2tzIGhvc3Qtb3BlbnNzbCwgaG9zdC1nemlwIGFuZAo+IGhvc3Qt
enN0ZC4KCkFic29sdXRlbHksCgo+IAo+IFRoZSBwcm9ibGVtIGlzIHRoYXQgc3d1Z2VuZXJhdG9y
IGNhbiAoYXBwYXJlbnRseSkgdXNlIG9wZW5zc2wsIGd6aXAgYW5kCj4genN0ZCBvbiB0aGUgaG9z
dCAodW5kZXIgd2hpY2ggY29uZGl0aW9ucz8pLCBhbmQgdGhlcmVmb3JlIHdlIHNob3VsZCBhZGQK
PiBob3N0LW9wZW5zc2wsIGhvc3QtZ3ppcCBhbmQgaG9zdC16c3RkIGFzIHJ1bnRpbWUgZGVwZW5k
ZW5jaWVzLgoKWWVzLiBUbyB0ZWxsIHRoZSB0cnV0aCBJIGRvbuKAmXQgZXZlbiByZW1lbWJlciB3
aHkgSSBoYXZlIHNlbnQgVjIgc2luY2UgSSBzdGlsbCBoYXZlIHRvIGFuc3dlciB0byBwcmV2aW91
cyBlbWFpbCwgaW5jbHVkaW5nIHRoZSBydW50aW1lIHRlc3QgdG8gY2hlY2sgZm9yIGhvc3QgZGVw
ZW5kZW5jaWVzLgoKU28gdGhhbmsgeW91IGZvciBwb2ludGluZyBob3cgdG8gaW1wcm92ZSBjb21t
aXQgbG9nLCBJIHdpbGwgdGFrZSBjYXJlIG9mIGFsbC4KCkJlc3QgcmVnYXJkcwpHaXVsaW8KCj4g
Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290
bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcK
PiBodHRwczovL2Jvb3RsaW4uY29tCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
