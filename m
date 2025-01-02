Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E75E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 18:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBC0C4032C;
	Thu,  2 Jan 2025 18:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGNzjGVDDKhh; Thu,  2 Jan 2025 18:35:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FBA840334
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FBA840334;
	Thu,  2 Jan 2025 18:35:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15C9BF24
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 18:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0411980C29
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 18:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kICB50rQpACD for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 18:35:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C45080B5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C45080B5C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C45080B5C
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 18:35:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 67AB519F5AF;
 Thu,  2 Jan 2025 19:35:28 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:37966])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 02 Jan 2025 19:35:28 +0100
MIME-Version: 1.0
Date: Thu, 02 Jan 2025 19:35:28 +0100
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <Z3ZodlNb+JEvB9ub@yd-6wlzhs3>
References: <20241227130231.862029-1-ju.o@free.fr>
 <Z3ZodlNb+JEvB9ub@yd-6wlzhs3>
User-Agent: Webmail Free/1.6.9
Message-ID: <13c01459d9d370980e80ec154dc391ad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735842929;
 bh=0QB/83Wv+ao86fHnEIn6CB5SWKIJAdJjsfw73LD5MKU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=O04xtDvF9DbWsBSZVTzxGCZK1dOBYHJrsnK7eY/GhHw8AdeYx6XN8zO5fBFFHwY9M
 KGAxJ5Opuu8oPBugSEyrxZh/eEchlTWJA0xWZtzuP+HiMsl1pY/gK5G3hBIXRKiNOg
 7dDsxDKtW8S1Dya+9k+ZwaAzXm5M85DP2p4cf0NtCLvLK0Jwdp37YZPY8SDS71G4fy
 0DCfgdrzI0VIfRoPr9LJPUaEgUv/5sNuj6r0Hke7dlDjJoD7UR4sjCYwAX/fgbJ79N
 h+FuzwHanOzsxKZhWzBJsNaFs7Csl3IpgxYbtn/2g4LYEG/jVKdU7AD+FL94t5D3I3
 rxSp1Z3EbrGDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=O04xtDvF
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new usbip runtime test
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIDAyLzAxLzIwMjUgMTE6MjAsIHlhbm4ubW9yaW5Ab3JhbmdlLmNvbSB3cm90
ZToKPiBKdWxpZW4sIEFsbCwKPiAKPiBPbiAyMDI0LTEyLTI3IDE0OjAyICswMTAwLCBKdWxpZW4g
T2xpdmFpbiBzcGFrZSB0aHVzbHk6Cj4+IENvbW1pdCBbMV0gaW50cm9kdWNlZCB0aGUgdXNiaXAg
cGFja2FnZS4gVGhpcyBjb21taXQgYWRkcyBhIG5ldyAKPj4gcnVudGltZQo+PiB0ZXN0IHRvIGNo
ZWNrIHRoaXMgZnVuY3Rpb25hbGl0eS4KPj4gCj4+IFsxXSAKPj4gaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2YwNWYyYzFhZDcxN2I3Y2RhMDY1ZWUw
NmZjMWRhYTgwY2QwOWQ4NTkKPj4gCj4+IENjOiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluQG9y
YW5nZS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+
Cj4gWy0tU05JUC0tXQo+PiBkaWZmIC0tZ2l0IAo+PiBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfdXNiaXAvbGludXgtdXNiaXAuZnJhZ21lbnQgCj4+IGIvc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF91c2JpcC9saW51eC11c2JpcC5mcmFnbWVudAo+PiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwLi41OTJmNDYxMTQ1Cj4+IC0tLSAv
ZGV2L251bGwKPj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF91c2Jp
cC9saW51eC11c2JpcC5mcmFnbWVudAo+PiBAQCAtMCwwICsxLDUgQEAKPj4gK0NPTkZJR19VU0I9
eQo+PiArQ09ORklHX1VTQl9FSENJX0hDRD15Cj4+ICtDT05GSUdfVVNCSVBfQ09SRT15Cj4gCj4g
SSB3YXMgd29uZGVyaW5nIHdoeSB5b3UgbmVlZGVkIHRvIHJlcGVhdCBVU0JJUF9DT1JFIGhlcmUs
IGFsdGhvdWdoIGl0Cj4gaXMgcGFydCBvZiB0aGUgZml4dXBzIGluIFVTQklQX0xJTlVYX0NPTkZJ
R19GSVhVUFMuLi4KPiAKPiBUdXJucyBvdXQgdGhhdCB0aGUgZnJhZ21lbnRzIGFyZSBhcHBsaWVk
IGJlZm9yZSB0aGUgcGFja2FnZXMgZml4dXBzLAo+IHNvIHllYWgsIHdlIG5lZWQgVVNCSVBfQ09S
RSAoYW5kIFVTQiB0b28gZXZlbiB3aXRoIG15IHBhdGNoIGFwcGxpZWQpLgoKSSBjb25maXJtIHRo
YXQgdGhvc2UgY29uZmlncyBhcmUgc3RpbGwgbmVlZGVkLCBmb3IgdGhlIHJlYXNvbiB5b3UgCm1l
bnRpb24uCgpJIHRlc3RlZCB3aXRoIHlvdXIgcGF0Y2ggYWRkaW5nIHRob3NlIGtjb25maWcgZml4
dXBzIGFuZCByZW1vdmluZyB0aG9zZQppbiBteSBmcmFnbWVudC4gVGhlIHRlc3QgaXMgZmFpbGlu
ZyBkdWUgdG8gbWlzc2luZyAKQ09ORklHX1VTQklQX1ZIQ0lfSENELi4uCgo+IFJldmlld2VkLWJ5
OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+Cj4gVGVzdGVkLWJ5OiBZYW5u
IEUuIE1PUklOIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+CgpUaGFua3MgZm9yIHJldmlld2luZyBh
bmQgdGVzdGluZy4gIEknbGwgYXBwbHkgdGhpcyBwYXRjaCBhcyBpcy4KCj4gVGhhbmsgeW91IGZv
ciB0aGlzIHJ1bnRpbWUgdGVzdCEg8J+RjQo+IAo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4K
CkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
