Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E06C54754
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 18:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F8CD61370;
	Fri, 16 May 2025 18:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tND9VpLYFYu; Fri, 16 May 2025 18:00:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D527612EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D527612EA;
	Fri, 16 May 2025 18:00:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B56D4185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B92661312
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lnq-Pr1uB_l0 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B646F6130C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B646F6130C
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B646F6130C
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8A22F1C1014; Fri, 16 May 2025 19:59:53 +0200 (CEST)
Message-ID: <7e5f55d3-81cf-4e10-9c39-fa4075ca42a4@rnout.be>
Date: Fri, 16 May 2025 19:39:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@cairnwater.com, Buildroot <buildroot@buildroot.org>
References: <ddcd553b270f9e9a628ad8470be48c48@cairnwater.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <ddcd553b270f9e9a628ad8470be48c48@cairnwater.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418393; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=t4OAOHkZ9wEwdwTIJBoYvcCSYK9ovTkDLeOBcC/HixQ=;
 b=FOvwC61KLscD5SZtTsSYkjpasCz2rUhwmR1ewfDei5/ZKnmX9Z5TdA3qs0uoQO9a0kB9W5
 zlInSCA9nfr/b5gk6OgDmBhB8GxPOu8y61MlO9pIk6szPWfuTsQ7s/Tw0Ip7Jkx4jJKmGJ
 Y/p+0TVX41lyoSv2hfyzfjFSP24eNUC++RoXncXn0b7LYOVRThiKzPaxSNl6Bj+DRSKXuZ
 1ybFObm842Rdih2pjaBovNPJ59rWFtIeUTHRhnvBQbMjm92cYitn8ih5O5hVV1UdDzwC6T
 ALPrbDvzP3nsBq7GfEUc8f8zt6THVkyzJRrfeJDNkOfMPRQOtul4Ydtrg8ie9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=FOvwC61K
Subject: Re: [Buildroot] buildroot Dockerfile $TARGETPLATFORM Attribute
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBXaWxsLAoKT24gMDgvMDUvMjAyNSAxODowMSwgYnVpbGRyb290QGNhaXJud2F0ZXIuY29t
IHdyb3RlOgo+IEhpLAo+IAo+IEknbSB3b3JraW5nIG9uIGEgbmV3IGZ1bGx5IG9wZW4gc291cmNl
IHdpbGRsaWZlIGNhbWVyYSBzeXN0ZW0gYW5kIHRvIGtlZXAgCj4gZXZlcnl0aGluZyBhcyBvcGVu
IGFuZCB3ZWxsIGRvY3VtZW50ZWQgYXMgcG9zc2libGUgSSdtIHBsYW5uaW5nIHRvIHVzZSB0aGUg
Cj4gYnVpbGRyb290IERvY2tlcmZpbGUgZm9yIHRoZSBidWlsZCBlbnZpcm9ubWVudC4KPiAKPiBo
dHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iL21hc3Rlci9z
dXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxlCgogIFRoYXQgRG9ja2VyZmlsZSBpcyBtZWFudCBtb3Jl
IGZvciB0ZXN0aW5nIHRoYW4gZm9yIGFjdHVhbGx5IHVzaW5nLCBidXQgT0suCgogIEluc3RlYWQg
b2YgYnVpbGRpbmcgaXQsIHlvdSBjYW4gYWxzbyBzaW1wbHkgcHVsbApyZWdpc3RyeS5naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290L2Jhc2U6MjAyNTAyMTguMjExMAoKKHdoaWNoIGlz
IG5vdCBzb21ldGhpbmcgd2UgYW5ub3VuY2UgcHVibGljbHkgYmVjYXVzZSB0aGUgaW1hZ2UgaXNu
J3QgcmVhbGx5IAptZWFudCBmb3IgdGhhdCwgYnV0IHlvdSBjYW4gYWN0dWFseSB1c2UgaXQuKQoK
ICBFdmVuIHNpbXBsZXIgaXMgdXNpbmcgdXRpbHMvZG9ja2VyLXJ1biwgd2hpY2ggd2lsbCBkbyB0
aGUgZG9ja2VyIHJ1biBjYWxsIHdpdGggCnRoZSBuZWNlc3Nhcnkgdm9sdW1lcyBtb3VudGVkLgoK
PiBXaGVuIGJ1aWxkaW5nIHRoZSBEb2NrZXIgY29udGFpbmVyIGlzIGl0IE9LIGZvciBtZSBub3Qg
dG8gc3BlY2lmeSB0aGUgCj4gVEFSR0VUUExBVEZPUk0gYXR0cmlidXRlIC0gZm9yIGV4YW1wbGU6
CgogIFRBUkdFVFBMQVRGT1JNIGlzIHNldCBhdXRvbWF0aWNhbGx5IGJ5IGRvY2tlciwgeW91J3Jl
IG5vdCBzdXBwb3NlZCB0byBvdmVycmlkZSBpdC4KCgo+IHN1ZG8gZG9ja2VyIGJ1aWxkIC10IGJ1
aWxkcm9vdC1kZW1vLTAxCj4gCj4gSSdtIGJ1aWxkaW5nIGZvciB0aGUgTlhQIGkuTVggOCBNIFBs
dXMgU29DIG9uIHRoZSBEZWJpeCBNb2RlbCBBIGJvYXJkIC0gdGhlIE5YUCAKPiBpLk1YIDggTSBQ
bHVzIGhhcyAyIG9yIDQgQXJtIENvcnRleC1BNTMgNjQgYml0IGNvcmVzIHNvIEkgd2FzIGd1ZXNz
aW5nIHRoYXQgaXQgCj4gd291bGQgYmUgYW4gYXJtNjQgcGxhdGZvcm0gbm90IGFuIGFybTY0IHBs
YXRmb3JtPwoKICBObywgdGhlIFRBUkdFVFBMQVRGT1JNIGlzIHRoZSBfZG9ja2VyXyB0YXJnZXQs
IG5vdCB0aGUgQnVpbGRyb290IHRhcmdldC4KCgo+IFRoZSBUQVJHRVRQTEFURk9STSBhdHRyaWJ1
dGUgb25seSBzZWVtcyB0byBiZSB1c2VkIGluIHR3byBpZiBzdGF0ZW1lbnRzIHdoaWNoIAo+IHJ1
biBpZiBpdCdzIHNldCB0byAibGludXgvYW1kNjQiOgo+IAo+ICMgSW5zdGFsbCAzMmJpdCB2YXJp
YW50IG9uIHg4Nl82NCBpbWFnZS4KPiBSVU4gaWYgWyAiJFRBUkdFVFBMQVRGT1JNIiA9ICJsaW51
eC9hbWQ2NCIgXTsgdGhlbiBcCj4gIMKgwqDCoCBkcGtnIC0tYWRkLWFyY2hpdGVjdHVyZSBpMzg2
OyBcCj4gZmkKPiAKPiAjIFRoZSBjb250YWluZXIgaGFzIG5vIHBhY2thZ2UgbGlzdHMsIHNvIG5l
ZWQgdG8gdXBkYXRlIGZpcnN0Cj4gUlVOIGFwdC1nZXQgLW8gQVBUOjpSZXRyaWVzPTMgdXBkYXRl
IC15Cj4gCj4gUlVOIGlmIFsgIiRUQVJHRVRQTEFURk9STSIgPSAibGludXgvYW1kNjQiIF07IHRo
ZW4gXAo+ICDCoMKgwqAgYXB0LWdldCAtbyBBUFQ6OlJldHJpZXM9MyBpbnN0YWxsIC15IC0tbm8t
aW5zdGFsbC1yZWNvbW1lbmRzIFwKPiAgwqDCoMKgwqDCoMKgwqAgZysrLW11bHRpbGliIFwKPiAg
wqDCoMKgwqDCoMKgwqAgbGliYzY6aTM4NjsgXAo+IGZpCj4gCj4gVGhlIGNvbW1hbmRzIEknbSB1
c2luZyBhdCB0aGUgbW9tZW50IGFyZToKPiAKPiBzdWRvIGdpdCBjbG9uZSBodHRwczovL2dpdC5i
dWlsZHJvb3QubmV0L2J1aWxkcm9vdAoKICBUaGlzIGlzIGFscmVhZHkgYSBiYWQgc3RhcnQsIHlv
dSBzaG91bGQgZG8gaXQgYXMgYSBub3JtYWwgdXNlciwgbm90IGFzIHJvb3QuIApTbyBkcm9wIHRo
ZSBzdWRvLgoKICBOb3JtYWxseSwgYWZ0ZXIgdGhhdCwgaXQgc2hvdWxkIGJlIHN1ZmZpY2llbnQg
ZG8gcnVuIGBtYWtlYC4gWW91IGRvbid0IAphY3R1YWxseSBfbmVlZF8gdG8gYnVpbGQgaW4gZG9j
a2VyLgoKPiAKPiBjZCAvYnVpbGRyb290L3N1cHBvcnQvZG9ja2VyCj4gCj4gc3VkbyBkb2NrZXIg
YnVpbGQgLXQgYnVpbGRyb290LWRlbW8tMDEKPiAKPiBzdWRvIGRvY2tlciBydW4gLS1uYW1lIGJ1
aWxkcm9vdC1idWlsZC1tYWNoaW5lMDIgLWl0IGJ1aWxkcm9vdC1kZW1vLTAxIGJhc2gKPiAKPiBn
aXQgY2xvbmUgaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290LmdpdAoK
ICBXaXRoIHV0aWxzL2RvY2tlci1ydW4sIHlvdSB3aWxsCi0gcHVsbCB0aGUgaW1hZ2UgZnJvbSB0
aGUgZ2l0bGFiIHJlZ2lzdHJ5IGluc3RlYWQgb2YgYnVpbGRpbmcgbG9jYWxseTsKLSBtb3VudCB0
aGUgbG9jYWwgZGlyZWN0b3J5IGFzIGEgdm9sdW1lIHNvIHlvdSBkb24ndCBuZWVkIHRvIHJlLWNs
b25lOwotIHNldCB0aGUgdXNlciB0byB5b3VyIHVzZXJuYW1lIG91dHNpZGUgb2YgZG9ja2VyIHNv
IGZpbGVzIGhhdmUgdGhlIGNvcnJlY3QgCnBlcm1pc3Npb25zLgoKICBMb29rIGF0IHRoZSBzY3Jp
cHQgdG8gc2VlIGhvdyBpdCBpcyBhbGwgc2V0IHVwLgoKCj4gCj4gY2QgYnVpbGRyb290Cj4gCj4g
Z2l0IHB1bGwKPiAKPiBtYWtlIHBvbHloZXhfZGViaXhfbW9kZWxfYV9kZWZjb25maWcKPiAKPiAj
IFRoaXMgY2FuIGJlIHVzZWQgdG8gY3VzdG9taXNlCj4gI21ha2UgbWVudWNvbmZpZwo+IAo+IG1h
a2UKCgogIFNvIGl0J3MgZW5vdWdoIHRvIGRvCgpnaXQgY2xvbmUgaHR0cHM6Ly9naXQuYnVpbGRy
b290Lm5ldC9idWlsZHJvb3QKY2QgYnVpbGRyb290CnV0aWxzL2RvY2tlci1ydW4gbWFrZSBwb2x5
aGV4X2RlYml4X21vZGVsX2FfZGVmY29uZmlnCiMgVGhpcyBjYW4gYmUgdXNlZCB0byBjdXN0b21p
c2UKI3V0aWxzL2RvY2tlci1ydW4gbWFrZSBtZW51Y29uZmlnCgp1dGlscy9kb2NrZXItcnVuIG1h
a2UKCgoKICBSZWdhcmRzLAogIEFybm91dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
