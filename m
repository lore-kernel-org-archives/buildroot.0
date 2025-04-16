Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925B6C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C9F4606AF;
	Wed, 16 Apr 2025 21:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIP9iNYgRr2D; Wed, 16 Apr 2025 21:11:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A11060D72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A11060D72;
	Wed, 16 Apr 2025 21:11:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FE4611B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41A58400BD
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NiNqhtaV3ceJ for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:11:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3E88E41009
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E88E41009
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E88E41009
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:11:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D13A11C00C0; Wed, 16 Apr 2025 23:11:15 +0200 (CEST)
Message-ID: <7555396d-0027-4904-90bb-805378b255a4@rnout.be>
Date: Wed, 16 Apr 2025 23:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
References: <20250314210313.775885-1-ju.o@free.fr>
 <20250314210313.775885-2-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20250314210313.775885-2-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744837882; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Lh6ZUnJVp9ud5vWRa+DHHzKg/0Q88VpTO4wj7M2k5K8=;
 b=iHqPjv947obnvuCLHtiwwJkLan8p0UKzrZqcK77o5SGxAWSspFsfxFOCcuOKGMzB+Ra0HN
 J9qytMhsTkIsHe0p1a9WGijIDf3ZaWcJ8Ambo6x8Ep3EP2YybWT8caVzqq0k159miCsYE/
 04JrJBgm0zDKBYfBJVHyqRbtZylwRuJ8rCJVPUvLtGkzdIGgaauazyvHfq7QC7QXnNLpDy
 vKiAF2WYjmbG7mJsIScBthX6KLEA6khPj8uaTKMjLTxpr0R8WzknYkHPBrxbUJ0PrQ99Cv
 NqhWQJFJs4m0Z1ei3VEGQnOY+zeiDP9jbDVNaUX5RlN8371H8qNEht3J3RxlbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 2/2] support/testing: test_gstreamer1: fix
 test by using bootlin toolchain
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

Ck9uIDE0LzAzLzIwMjUgMjI6MDMsIEp1bGllbiBPbGl2YWluIHdyb3RlOgo+IFNpbmNlIEJ1aWxk
cm9vdCBjb21taXQgWzFdLCB0aGUgdGVzdF9nc3RyZWFtZXIxIHJ1bnRpbWUgdGVzdCBpcwo+IGZh
aWxpbmcgdG8gYnVpbGQgdGhlIHRlc3NlcmFjdC1vY3IgcGFja2FnZS4gVGhlIHJvb3QgY2F1c2Ug
aXMgdGhhdAo+IHRoZSB0ZXN0IHVzZXMgdGhlIGRlZmF1bHQgYXJtIGV4dGVybmFsIHRvb2xjaGFp
biwgd2hpY2ggaXMgdGhlIExpbmFybwo+IEFSTSAyMDE4LjA1IGJhc2VkIG9uIGdjYyA3LjMuMS4K
Pgo+IFNpbmNlIFsxXSwgdGVzc2VyYWN0LW9yYyBubyBsb25nZXIgY29tcGlsZXMgd2l0aCBnY2Mg
NyAoaXQgcmVxdWlyZXMgYXQKPiBsZWFzdCBnY2MgOCkuCj4KPiBUaGlzIGNvbW1pdCBmaXhlcyB0
aGUgaXNzdWUgYnkgc3dpdGNoaW5nIHRoZSB0b29sY2hhaW4gdG8gdGhlCj4gYm9vdGxpbiB2ZXJz
aW9ucyAoYmFzZWQgb24gZ2NjIDE0IGF0IHRoZSB0aW1lIG9mIHRoaXMgY29tbWl0KS4KPgo+IEFs
c28sIGNoYW5naW5nIHRoZSBjb21waWxlciB2ZXJzaW9uIHNsaWdodGx5IHNsb3dlZCBkb3duIHRo
ZSB2aWRlbwo+IGVuY29kaW5nLiBUaGlzIGNvbW1pdCBhbHNvIGluY3JlYXNlcyB0aGUgZW5jb2Rp
bmcgY29tbWFuZCB0aW1lb3V0Lgo+Cj4gRml4ZXM6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxk
cm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy85NDA3ODQ2MjMyCj4KPiBbMV0gaHR0cHM6Ly9naXRs
YWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2YzMmRhOGI5ODQ0YWU1ZjFi
OWRjNmI3YTg5ZDdkOWJkOWQxOTRmNTUKPgo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWlu
IDxqdS5vQGZyZWUuZnI+CgogwqBBcHBsaWVkIHRvIDIwMjUuMDIueCwgdGhhbmtzLgoKIMKgUmVn
YXJkcywKIMKgQXJub3V0Cgo+IC0tLQo+IFBhdGNoIHRlc3RlZCBpbjoKPiBodHRwczovL2dpdGxh
Yi5jb20vam9saXZhaW4vYnVpbGRyb290Ly0vam9icy85NDE4NzA1NTc5Cj4gLS0tCj4gICBzdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2dzdHJlYW1lcjEucHkgfCAzICsrLQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZ3N0cmVhbWVyMS5weSBi
L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZ3N0cmVhbWVyMS5weQo+IGluZGV4
IGFhNGI2N2QxYTYuLmZmMDMwMmE4YTYgMTAwNjQ0Cj4gLS0tIGEvc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2UvdGVzdF9nc3RyZWFtZXIxLnB5Cj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2UvdGVzdF9nc3RyZWFtZXIxLnB5Cj4gQEAgLTE1LDYgKzE1LDcgQEAgY2xhc3Mg
VGVzdEdzdHJlYW1lcjEoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKPiAgICAgICAgICAgQlIyX2Nv
cnRleF9hOT15Cj4gICAgICAgICAgIEJSMl9BUk1fRU5BQkxFX1ZGUD15Cj4gICAgICAgICAgIEJS
Ml9UT09MQ0hBSU5fRVhURVJOQUw9eQo+ICsgICAgICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxf
Qk9PVExJTj15Cj4gICAgICAgICAgIEJSMl9QQUNLQUdFX0RFSkFWVT15Cj4gICAgICAgICAgIEJS
Ml9QQUNLQUdFX0dTVFJFQU1FUjE9eQo+ICAgICAgICAgICBCUjJfUEFDS0FHRV9HU1QxX1BMVUdJ
TlNfQkFTRT15Cj4gQEAgLTYwLDcgKzYxLDcgQEAgY2xhc3MgVGVzdEdzdHJlYW1lcjEoaW5mcmEu
YmFzZXRlc3QuQlJUZXN0KToKPiAgICAgICAgICAgICAgIGYidGltZW92ZXJsYXkgdGV4dD1cIntt
c2dfcHJlZml4fVwiIGZvbnQtZGVzYz1cIlNhbnMsIDI0XCIgISAiIFwKPiAgICAgICAgICAgICAg
IGYidGhlb3JhZW5jICEgb2dnbXV4ICEgZmlsZXNpbmsgbG9jYXRpb249e3ZpZGVvX2ZpbGV9Igo+
ICAgICAgICAgICBjbWQgPSBmImdzdC1sYXVuY2gtMS4wIC12IHtlbmNfcGlwZWxpbmV9Igo+IC0g
ICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soY21kKQo+ICsgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2so
Y21kLCB0aW1lb3V0PTE1KQo+ICAgCj4gICAgICAgICAgICMgV2UgZGVjb2RlIG91ciBwcmV2aW91
cyB2aWRlbyBmaWxlIGFuZCBzdG9yZSBlYWNoIGZyYW1lIGluIGEKPiAgICAgICAgICAgIyBQTkcg
aW1hZ2UgZmlsZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
