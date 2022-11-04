Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC054C4332F
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 08:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CF9E610BE;
	Fri,  4 Nov 2022 08:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CF9E610BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DNcnRCcGUmON; Fri,  4 Nov 2022 08:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AEB46109A;
	Fri,  4 Nov 2022 08:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AEB46109A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7EAC1BF2AB
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 08:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A320361092
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 08:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A320361092
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cuG2Ajw-oGau for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 08:54:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23E91610A6
Received: from mail.h6t.eu (cloud.h6t.eu [IPv6:2a01:4f8:1c1e:8216::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23E91610A6
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 08:54:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 93BF3214E99; Fri,  4 Nov 2022 09:54:09 +0100 (CET)
Message-ID: <5a4d2c3c-384c-c94a-4fae-6c1da619b19d@h6t.eu>
Date: Fri, 4 Nov 2022 09:54:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20221103224539.692322-1-thomas.petazzoni@bootlin.com>
 <20221103224539.692322-2-thomas.petazzoni@bootlin.com>
In-Reply-To: <20221103224539.692322-2-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=h6t.eu; s=dkim; 
 t=1667552050; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=SIyIN8VIEicxVFj56ySkGeDydo1Or67hA3VQumj/fsE=;
 b=gncqAfOqoIJ85LOjk3eYucNSIX5rLrQ6ohQag8V55OFeJPywDRvYDX/rhIOzg9pFu45qN0
 yLe5FTmwyJhYRcOMgrgZUbyYb+X7modrX+mDPSRabIztzvrK9RkVNMvwSOepWDv7H3NXX3
 nL0Z9Ear2juUXyWdCVUiMnDogKH/GYqHbgyP6pQpRQatOH7LigbsBQ6wu738hCGgQdo3yq
 Rgtq4BLffxi033i4jETXwX68zvsy0Qw0JY6Soh7ofEr8c2dn2kbgEYjCv63Dgc+k75/dRV
 u/KGGLl8U6xndyXS6HG0hnHWpMy3YmMl3vjky5asuJBYeQNPoz+rLpTbZ73+kQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=h6t.eu header.i=@h6t.eu header.a=rsa-sha256
 header.s=dkim header.b=gncqAfOq
Subject: Re: [Buildroot] [PATCH next 2/2] package/pkg-cargo: move CARGO_HOME
 into DL_DIR
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
From: Moritz Bitsch via buildroot <buildroot@buildroot.org>
Reply-To: Moritz Bitsch <moritz@h6t.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMDMuMTEuMjIgdW0gMjM6NDUgc2NocmllYiBUaG9tYXMgUGV0YXp6b25pOgo+IENBUkdPX0hP
TUUgaXMgd2hlcmUgQ2FyZ28gc3RvcmVzIGl0cyBkb3dubG9hZGVkIGFydGVmYWN0cy4gU2VlCj4g
aHR0cHM6Ly9kb2MucnVzdC1sYW5nLm9yZy9jYXJnby9yZWZlcmVuY2UvZW52aXJvbm1lbnQtdmFy
aWFibGVzLmh0bWw6Cj4gCj4gICAgQ0FSR09fSE9NRSDigJQgQ2FyZ28gbWFpbnRhaW5zIGEgbG9j
YWwgY2FjaGUgb2YgdGhlIHJlZ2lzdHJ5IGluZGV4IGFuZAo+ICAgIG9mIGdpdCBjaGVja291dHMg
b2YgY3JhdGVzLiBCeSBkZWZhdWx0IHRoZXNlIGFyZSBzdG9yZWQgdW5kZXIKPiAgICAkSE9NRS8u
Y2FyZ28gKCVVU0VSUFJPRklMRSVcLmNhcmdvIG9uIFdpbmRvd3MpLCBidXQgdGhpcyB2YXJpYWJs
ZQo+ICAgIG92ZXJyaWRlcyB0aGUgbG9jYXRpb24gb2YgdGhpcyBkaXJlY3RvcnkuIE9uY2UgYSBj
cmF0ZSBpcyBjYWNoZWQgaXQKPiAgICBpcyBub3QgcmVtb3ZlZCBieSB0aGUgY2xlYW4gY29tbWFu
ZC4gRm9yIG1vcmUgZGV0YWlscyByZWZlciB0byB0aGUKPiAgICBndWlkZS4KPiAKPiBXZSBjdXJy
ZW50bHkgbWFrZSBpdCBwb2ludCB0byAkKEhPU1RfRElSKS9zaGFyZS9jYXJnbywgYnV0IHRoaXMg
aGFzIGEKPiBudW1iZXIgb2YgZHJhd2JhY2tzOgo+IAo+ICAgKDEpIEl0IGlzIG5vdCBzaGFyZWQg
YmV0d2VlbiBCdWlsZHJvb3QgYnVpbGRzLiBFYWNoIEJ1aWxkcm9vdCBidWlsZAo+ICAgICAgIHdp
bGwgcmUtZG93bmxvYWQgdGhlIGNyYXRlcyBpbmRleCwgYW5kIHRoZSBjcmF0ZXMgdGhlbXNlbHZl
cywKPiAgICAgICB1bmxlc3Mgb2YgY291cnNlIHRoZSBmaW5hbCB2ZW5kb3JlZCB0YXJiYWxsIGlz
IGFscmVhZHkgdGhlcmUuCj4gCj4gICAoMikgV2l0aCBCUjJfUEVSX1BBQ0tBR0VfRElSRUNUT1JJ
RVM9eSwgaXQgaXMgZXZlbiB3b3JzZTogQ0FSR09fSE9NRQo+ICAgICAgIGlzIG5vdCBldmVuIHNo
YXJlZCBiZXR3ZWVuIHBhY2thZ2VzLCBhcyAkKEhPU1RfRElSKS9zaGFyZS9jYXJnbwo+ICAgICAg
IGlzIHBlciBwYWNrYWdlLiBTbyBlYWNoIHBhY2thZ2UgaW4gdGhlIGJ1aWxkIHRoYXQgbmVlZHMg
dmVuZG9yaW5nCj4gICAgICAgb2YgQ2FyZ28gY3JhdGVzIHdpbGwgZG93bmxvYWQgdGhlIGNyYXRl
cyBpbmRleCBhbmQgdGhlIGNyYXRlcyBpbgo+ICAgICAgIGl0cyBvd24gQ0FSR09fSE9NRSBsb2Nh
dGlvbi4KPiAKPiBUbyBzb2x2ZSB0aGlzLCB0aGlzIGNvbW1pdCBtb3ZlcyBDQVJHT19IT01FIGlu
dG8gJChETF9ESVIpLCBzbyB0aGF0IGl0Cj4gaXMgc2hhcmVkIGJldHdlZW4gYnVpbGRzIGFuZCBw
YWNrYWdlcy4KPiAKPiBFdmVuIHRob3VnaCBub3QgdGhlIGJlc3QvbW9zdCBhdXRob3JpdGF0aXZl
IHNvdXJjZSwKPiBodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL2NhcmdvL2lzc3Vlcy82OTMw
IGluZGljYXRlcyB0aGF0IHRoZXJlIGlzCj4gYSBsb2NrIHdoZW4gYWNjZXNzaW5nIENBUkdPX0hP
TUUsIGJlY2F1c2UgYSB1c2VyIGV2ZW4gY29tcGxhaW5zIHRoYXQKPiB0aGlzIGxvY2sgaGFzIGV2
ZW4gYmVjb21lIG1vcmUgY29hcnNlLWdyYWluZWQgdGhhbiBpdCB1c2VkIHRvIGJlCj4gKHdoaWNo
IGZvciB1cyBpcyBmaW5lLCBpdCBqdXN0IG1lYW5zIHRoYXQgdHdvIENhcmdvIGZldGNoIG9wZXJh
dGlvbnMKPiBmcm9tIHR3byBkaWZmZXJlbnQgcGFja2FnZXMgd2lsbCBiZSBzZXJpYWxpemVkLCBu
b3QgYSBiaWcgZGVhbCkuCgpGb3IgbXkgYnVpbGRzL3Rlc3RjYXNlcyB0aGUgc2hhcmVkIGNhY2hl
IGltcHJvdmVzIGRvd25sb2FkcywgZXZlbiB3aXRoIAp0aGUgbG9ja2luZy4gKFRlc3RlZCB3aXRo
IGdpZ2FiaXQgY29ubmVjdGlvbiBhbmQgLWogMjQgb24gYSBmYXN0IE5WTWUgCnN5c3RlbSkKClRl
c3RlZC1ieTogTW9yaXR6IEJpdHNjaCA8bW9yaXR6QGg2dC5ldT4KPiBTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+IC0tLQo+ICAg
cGFja2FnZS9wa2ctY2FyZ28ubWsgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctY2FyZ28u
bWsgYi9wYWNrYWdlL3BrZy1jYXJnby5tawo+IGluZGV4IDU5MjM3MjVmNWUuLmMzZDFlMzQzMDkg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wa2ctY2FyZ28ubWsKPiArKysgYi9wYWNrYWdlL3BrZy1j
YXJnby5tawo+IEBAIC0yMCw3ICsyMCw3IEBACj4gICAjCj4gICAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+ICAgCj4gLUJSX0NBUkdPX0hPTUUgPSAkKEhPU1RfRElSKS9zaGFyZS9jYXJnbwo+ICtC
Ul9DQVJHT19IT01FID0gJChETF9ESVIpLy5jYXJnbwo+ICAgCj4gICBQS0dfQ09NTU9OX0NBUkdP
X0VOViA9IFwKPiAgIAlDQVJHT19IT01FPSQoQlJfQ0FSR09fSE9NRSkKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
