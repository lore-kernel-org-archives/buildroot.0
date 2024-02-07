Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CAAC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 10:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5F34402E6;
	Wed,  7 Feb 2024 10:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jcs1p8wZe-YU; Wed,  7 Feb 2024 10:10:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E5A9404B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E5A9404B1;
	Wed,  7 Feb 2024 10:10:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75B9E1BF255
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 626BC402E6
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANLlyLTZP2DH for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 10:10:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 046F140136
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 046F140136
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 046F140136
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 10:10:18 +0000 (UTC)
Received: from [10.0.0.63] (unknown [109.133.241.250])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 99ECB2C83776;
 Wed,  7 Feb 2024 11:10:16 +0100 (CET)
Message-ID: <42b067d8-57ff-4cb8-836b-d8449226ec8a@bubu1.eu>
Date: Wed, 7 Feb 2024 11:10:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231126180840.2081945-1-james.hilliard1@gmail.com>
 <20231126180840.2081945-5-james.hilliard1@gmail.com>
 <6049c19d-3ba6-4991-b47f-72b5d46c1e91@bubu1.eu>
In-Reply-To: <6049c19d-3ba6-4991-b47f-72b5d46c1e91@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707300617; bh=89ERLTepfSVJcVc76UppAfNFkY+wlgGBSee0jzwYg1Y=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To;
 b=EZf4OBwYAwD4n5pnnkMfHkQAzavKP+MQW6/mcYxVLkkqadjDLPHamYZefRefcdy02
 Mvufwh3gt00x/RLkcxx/gGG1JBlpBXlkDLys/t3BYfVv4KPR3xVsHYP3Ddu9HgmNrK
 wKFUzokOhaFKeN3eqDGVFxPHXeOQP/00gC6QmVzMIXGy02GvqsOx+nwARbtTYUUPoW
 TDUBCzzmqHAhk+RO9f/8imsNQqFg2v5kIcrYSBlavvQLH4v9dzq2z6h0jwbToFFuGR
 Nj/GHVUwcF+ixwmqpK9/ttMPE2D6LUvkhFMBBGEVZamvSpGyes2taF/GC9yDY5Bw3a
 NsUhMVr7xMDCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=EZf4OBwY
Subject: Re: [Buildroot] [PATCH v6 5/5] package/pkg-python.mk: migrate
 setuptools to pep517
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Gustavo Heinz <gustavo@gsthnz.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDYuMDIuMjQgMjM6MzEsIE1hcmN1cyBIb2ZmbWFubiB3cm90ZToKPiBIaSBKYW1lcywgYWxs
Cj4KClsuLi5dCgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tdXZsb29wL3B5dGhvbi11
dmxvb3AubWsgCj4+IGIvcGFja2FnZS9weXRob24tdXZsb29wL3B5dGhvbi11dmxvb3AubWsKPj4g
aW5kZXggMjg1ODg0YTJiYi4uNzA1MDhmYjZkZSAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9weXRo
b24tdXZsb29wL3B5dGhvbi11dmxvb3AubWsKPj4gKysrIGIvcGFja2FnZS9weXRob24tdXZsb29w
L3B5dGhvbi11dmxvb3AubWsKPj4gQEAgLTEwLDggKzEwLDEwIEBAIFBZVEhPTl9VVkxPT1BfU0lU
RSA9IAo+PiBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvOWMvMTYvNzI4
Y2M1ZGRlMzY4ZQo+PiDCoCBQWVRIT05fVVZMT09QX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4+
IMKgIFBZVEhPTl9VVkxPT1BfTElDRU5TRSA9IEFwYWNoZS0yLjAsIE1JVAo+PiDCoCBQWVRIT05f
VVZMT09QX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLUFQQUNIRSBMSUNFTlNFLU1JVAo+PiAtUFlU
SE9OX1VWTE9PUF9CVUlMRF9PUFRTID0gYnVpbGRfZXh0IC0taW5wbGFjZSAtLXVzZS1zeXN0ZW0t
bGlidXYKPj4gLVBZVEhPTl9VVkxPT1BfSU5TVEFMTF9UQVJHRVRfT1BUUyA9IGJ1aWxkX2V4dCAt
LWlucGxhY2UgCj4+IC0tdXNlLXN5c3RlbS1saWJ1dgo+PiDCoCBQWVRIT05fVVZMT09QX0RFUEVO
REVOQ0lFUyA9IGxpYnV2Cj4gCj4gVGhpcyBuZWVkcyBhIG5ldyBkZXBlbmRlbmN5IG9uIGhvc3Qt
cHl0aG9uLWN5dGhvbiBub3cuIE90aGVyd2lzZSBpdCAKPiBmYWlscyB3aXRoIHRoZSBmb2xsb3dp
bmcgZXJyb3I6Cj4gCj4gRVJST1IgTWlzc2luZyBkZXBlbmRlbmNpZXM6Cj4gIMKgwqDCoMKgQ3l0
aG9uPDAuMzAuMCw+PTAuMjkuMzYKClRvIHRyeSBhbmQgIGNsYXJpZnkgd2h5IHRoaXMgaXMgcmVs
YXRlZCB0byB0aGUgcGVwNTE3IHN3aXRjaDoKVGhpcyBkZXBlbmRlbmN5IGlzIGFsc28gbWVudGlv
bmVkIGluIHRoZSBweXByb2plY3QudG9tbCBbMV0uCgpXaGVuIHVzaW5nIHRoZSBvbGQgc2V0dXAu
cHkgdGhpcyB3YXkgdG8gYnVpbGQgdGhlIHByb2plY3QgdGhpcyB3YXMgb25seSAKc29tZXRpbWVz
IHJlcXVpcmVkLiBJLmUuIHdoZW4geW91IGVpdGhlciBleHBsaWNpdGx5IGZvcmNlZCBhIHJlYnVp
bGQgb2YgCnRoZSBjeXRob24tZ2VuZXJhdGUgZmlsZXMgb3Igd2VyZSBidWlsZGluZyBmcm9tIGEg
Z2l0IGNoZWNrb3V0IGluc3RlYWQgCm9mIHRoZSBweXBpIHNvdXJjZSB0YXJiYWxsLiBJIGRvbid0
IGtub3cgd2h5IHRoaXMgbG9naWMgZGlkbid0IGNhcnJ5IApvdmVyIHRvIHRoZSBwZXA1MTcgd29y
bGQuCgpASmFtZXMsIGNhbiB3ZSBzeXN0ZW1hdGljYWxseSBjaGVjayBmb3IgcGFja2FnZXMgdGhh
dCBtaWdodCBub3cgcmVxdWlyZSAKY3l0aG9uPyBEaWQgeW91IGJ1aWxkIGFsbCBzZXR1cHRvb2xz
IHBhY2thZ2VzIHdpdGggdGhpcyBwYXRjaCBhdCBzb21lIApwb2ludCBhbmQgb25seSBtc2dwYWNr
IGNhbWUgdXAgd2l0aCB0aGUgc2FtZSBwcm9ibGVtPwoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9N
YWdpY1N0YWNrL3V2bG9vcC9ibG9iL3YwLjE4LjAvcHlwcm9qZWN0LnRvbWwjTDU5Cgo+PiArUFlU
SE9OX1VWTE9PUF9CVUlMRF9PUFRTID0gXAo+PiArwqDCoMKgIC1DLS1idWlsZC1vcHRpb249YnVp
bGRfZXh0IFwKPj4gK8KgwqDCoCAtQy0tYnVpbGQtb3B0aW9uPS0taW5wbGFjZSBcCj4+ICvCoMKg
wqAgLUMtLWJ1aWxkLW9wdGlvbj0tLXVzZS1zeXN0ZW0tbGlidXYKPj4gwqAgJChldmFsICQocHl0
aG9uLXBhY2thZ2UpKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
