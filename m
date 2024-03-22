Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A517ACD11BF
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 08:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56DEA4000B;
	Fri, 22 Mar 2024 08:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oAvUEwWstcIt; Fri, 22 Mar 2024 08:35:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CEDF400B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CEDF400B5;
	Fri, 22 Mar 2024 08:35:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E0CB1BF315
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 08:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F812416BE
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 08:35:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ix61jChEoEON for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 08:35:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BA149416AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA149416AE
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA149416AE
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 08:35:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2EACF6134F;
 Fri, 22 Mar 2024 08:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44893C433F1;
 Fri, 22 Mar 2024 08:35:07 +0000 (UTC)
Message-ID: <72edf77b90bc03df925a5b3116c981e90a868e7e.camel@kernel.org>
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefan Berger <stefanb@linux.ibm.com>, buildroot@buildroot.org
Date: Fri, 22 Mar 2024 10:35:05 +0200
In-Reply-To: <a043db624b2d3c57bf6f43c949b63e1b0d1dfbe9.camel@kernel.org>
References: <20240321182126.24115-1-jarkko@kernel.org>
 <20240321182126.24115-3-jarkko@kernel.org>
 <be88778f-53fc-493b-829a-2434ea0782ef@linux.ibm.com>
 <a043db624b2d3c57bf6f43c949b63e1b0d1dfbe9.camel@kernel.org>
User-Agent: Evolution 3.50.3-1 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1711096508;
 bh=OK9cXZoiID1o7SIKqYctUrM7WjIAxjp6xn/auR29gZM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=dv2ufTu0r4zLRI0cEefsUj+Qe+fccgtJUxz2LJMamiuLBkG+QYDbgVH2hLGQkW/uh
 gx8d+vER2uVbXmd2SdcOUns61A5w3q1iNUJW94am3X5AOrP+p61Ya7e4Zpeyw4XXbe
 dNOopUFl3E2KXJdg0v19SZdAbjC7pTpgOo3SCs3vY2ft71XlA5Za3w/GeGQWu+3kP9
 fhIecPsarOIIWxlPLK7Vu4C3ts1xSL0IAxlgdIZukVu9obIkiK2fuEPw6Xta94CSud
 tIWb568zSQFvcyidByzm+wGp0ldGXAA97pTPI+KTjejRVKrxDLSjIh8y909/OJO6kh
 G/5TfG7vRY26w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=dv2ufTu0
Subject: Re: [Buildroot] [PATCH RFC 2/2] package/swtpm: add host package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAyMDI0LTAzLTIyIGF0IDEwOjIyICswMjAwLCBKYXJra28gU2Fra2luZW4gd3JvdGU6
Cj4gT24gVGh1LCAyMDI0LTAzLTIxIGF0IDE2OjMwIC0wNDAwLCBTdGVmYW4gQmVyZ2VyIHdyb3Rl
Ogo+ID4gCj4gPiAKPiA+IE9uIDMvMjEvMjQgMTQ6MjEsIEphcmtrbyBTYWtraW5lbiB3cm90ZToK
PiA+ID4gQWRkIHN3dHBtIGFuZCBpdHMgZGVwZW5kZW5jeSBsaWJ0cG1zIHRvIGhvc3QgcGFja2Fn
ZXMuIFRoZXNlIGFyZQo+ID4gPiB1c2VmdWwKPiA+ID4gZm9yIGVtdWxhdGluZyBUUE0gaW4gUUVN
VSBlbnZpcm9ubWVudC4KPiA+ID4gCj4gPiA+IExpbms6IGh0dHBzOi8vZ2l0bGFiLmNvbS9qYXJr
a29qcy9saW51eC10cG1kZC10ZXN0Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEphcmtrbyBTYWtraW5l
biA8amFya2tvQGtlcm5lbC5vcmc+Cj4gPiA+IC0tLQo+ID4gCj4gPiA+ICstLS0KPiA+ID4gKyBj
b25maWd1cmUuYWMgfCAxNiArKysrKysrKy0tLS0tLS0tCj4gPiA+ICsgMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+ID4gKwo+ID4gPiArZGlmZiAtLWdp
dCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwo+ID4gPiAraW5kZXggNDljYWY5Ni4uNGFj
Yzc2MyAxMDA2NDQKPiA+ID4gKy0tLSBhL2NvbmZpZ3VyZS5hYwo+ID4gPiArKysrIGIvY29uZmln
dXJlLmFjCj4gPiA+ICtAQCAtMzk0LDIwICszOTQsMjAgQEAgQVNfSUYoW3Rlc3QgIngkZW5hYmxl
X2RlZmF1bHRfcGNyX2JhbmtzIgo+ID4gPiAhPQo+ID4gPiAieCJdLFsKPiA+ID4gKyBwY3JfYmFu
a19jaGVja3MKPiA+ID4gKyBBQ19TVUJTVChbREVGQVVMVF9QQ1JfQkFOS1NdKQo+ID4gPiArCj4g
PiA+ICstQUNfUEFUSF9QUk9HKFtFWFBFQ1RdLCBleHBlY3QpCj4gPiA+ICstaWYgdGVzdCAieCRF
WFBFQ1QiID0gIngiOyB0aGVuCj4gPiA+ICstCUFDX01TR19FUlJPUihbZXhwZWN0IGlzIHJlcXVp
cmVkOiBleHBlY3QgcGFja2FnZV0pCj4gPiA+ICstZmkKPiA+ID4gKysjIEFDX1BBVEhfUFJPRyhb
RVhQRUNUXSwgZXhwZWN0KQo+ID4gPiArKyMgaWYgdGVzdCAieCRFWFBFQ1QiID0gIngiOyB0aGVu
Cj4gPiA+ICsrI8KgCUFDX01TR19FUlJPUihbZXhwZWN0IGlzIHJlcXVpcmVkOiBleHBlY3QgcGFj
a2FnZV0pCj4gPiA+ICsrIyBmaQo+ID4gPiArCj4gPiA+ICsgQUNfUEFUSF9QUk9HKFtHQVdLXSwg
Z2F3aykKPiA+ID4gKyBpZiB0ZXN0ICJ4JEdBV0siID0gIngiOyB0aGVuCj4gPiA+ICvCoAlBQ19N
U0dfRVJST1IoW2dhd2sgaXMgcmVxdWlyZWQ6IGdhd2sgcGFja2FnZV0pCj4gPiA+ICsgZmkKPiA+
ID4gKwo+ID4gPiArLUFDX1BBVEhfUFJPRyhbU09DQVRdLCBzb2NhdCkKPiA+ID4gKy1pZiB0ZXN0
ICJ4JFNPQ0FUIiA9ICJ4IjsgdGhlbgo+ID4gPiArLQlBQ19NU0dfRVJST1IoW3NvY2F0IGlzIHJl
cXVpcmVkOiBzb2NhdCBwYWNrYWdlXSkKPiA+ID4gKy1maQo+ID4gPiArKyMgQUNfUEFUSF9QUk9H
KFtTT0NBVF0sIHNvY2F0KQo+ID4gPiArKyMgaWYgdGVzdCAieCRTT0NBVCIgPSAieCI7IHRoZW4K
PiA+ID4gKysjwqAJQUNfTVNHX0VSUk9SKFtzb2NhdCBpcyByZXF1aXJlZDogc29jYXQgcGFja2Fn
ZV0pCj4gPiA+ICsrIyBmaQo+ID4gCj4gPiAKPiA+IGNhdCBhbmQgZXhwZWN0IGFyZSB1c2VkIGZv
ciBydW5uaW5nIHRoZSB0ZXN0IGNhc2VzLiBXaGVuIG5vdAo+ID4gcnVubmluZyAKPiA+IHRoZSB0
ZXN0cyB0aGVuIGFuIGFsdGVybmF0aXZlIHRvIGNvbW1lbnRpbmcgdGhlIGFib3ZlIG91dCBtYXkg
YmUgdG8KPiA+IGRvIAo+ID4gdGhlIGZvbGxvd2luZyBiZWZvcmUgcnVubmluZyBhdXRvZ2VuLnNo
Ogo+ID4gCj4gPiB0bXBkaXI9JChta3RlbXAgLWQpIHx8IGV4aXQgMQo+ID4gY3AgL3Vzci9iaW4v
dHJ1ZSAiJHt0bXBkaXJ9L3NvY2F0Igo+ID4gY3AgL3Vzci9iaW4vdHJ1ZSAiJHt0bXBkaXJ9L2V4
cGVjdCIKPiA+IAo+ID4gUEFUSD0kUEFUSDoke3RtcGRpcn0KPiA+IC4vYXV0b2dlbiAtLXByZWZp
eD0uLi4KPiA+IHJtIC1yZiAiJHt0bXBkaXJ9Igo+ID4gCj4gPiDCoMKgwqDCoCBTdGVmYW4KPiAK
PiAuLi4gd2hpY2ggd291bGQgYmUgbW9yZSB0ZWRpb3VzIHRoYW4gc2ltcGx5IGNvbW1lbnRpbmcg
dGhlbSBvdXQKPiBiZWNhdXNlIHRoZW4geW91IHdvdWxkIGhhdmUgdG8gdHdlYWsgdGhlIGJ1aWxk
IGl0c2VsZiB3aXRoIG1hbnVhbAo+IHN0ZXBzIGluc3RlYWQgb2YgdXNpbmcgYXV0b3Rvb2xzIGJ1
aWxkIGNvbW1hbmQuCj4gCj4gVXAgdW50aWwgdGhpcyBpcyBmaXhlZCBpbiB0aGUgdXBzdHJlYW0g
cHJvamVjdCwgd2UgYXJlIGJldHRlciBvZmYKPiBzaW1wbHkgY29tbWVudGluZyB0aGVtIG91dCwg
YXMgdGhleSBhcmUgdGVzdCBkZXBlbmRlbmN5LCBub3QgYSBidWlsZAo+IGRlcGVuZGVuY3kgZm9y
IGJ1aWxkaW5nIGUuZy4gaW5pdHJhbWZzIGltYWdlIG9yIHNvbWUgb3RoZXIgdHlwZSBvZgo+IE9T
IGltYWdlLgoKQW5kIHRoZXJlJ3MgYSBsb3Qgb2Ygc2hlbmFuaWdhbnMgcmVsYXRlZCB0byB0aGUg
Y3Jvc3MtY29tcGlsYXRpb24KZW52aXJvbm1lbnQsIHdoaWNoIHJlbmRlciBvdXQgdGhlIHN1Z2dl
c3Rpb24gYW55d2F5IGluIHRoYXQgZm9ybS4KCkl0J3MgYSBidWcgYmVjYXVzZSBuZWl0aGVyIHNv
Y2F0IG5vciBleHBlY3QgYXJlIGFjdHVhIGJ1aWxkCmRlcGVuZGVuY2llcywgYW5kIHRoZSBwYXRj
aCB3b3JrcyBhcm91bmQgdGhlIGJ1Zy4KCkJSLCBKYXJra28KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
