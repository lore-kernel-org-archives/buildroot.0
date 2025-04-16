Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC94C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B72C761AD1;
	Wed, 16 Apr 2025 21:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WSiZl6i7fQl; Wed, 16 Apr 2025 21:00:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA5F461B2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA5F461B2D;
	Wed, 16 Apr 2025 21:00:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4C7C159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A68E9409FD
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2Dhfpsy-cq9 for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:00:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5368D423F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5368D423F6
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5368D423F6
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:00:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 644701C1026; Wed, 16 Apr 2025 23:00:04 +0200 (CEST)
Message-ID: <11973454-29db-4280-8873-e12fc07b1bea@rnout.be>
Date: Wed, 16 Apr 2025 23:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250317221828.3061240-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20250317221828.3061240-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744837204; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=+lewLcPG1tp8bwQw+Q6DqpjWuRQzIk699JuMNAP+5hQ=;
 b=AeBseDGFTlr2EhaajTfYA+5jcIDI+uf4FRyF7b8Ldo2MptWLndeLQhRy3ZuzPNdvk+B+FB
 GtHzPbGOrc4O7UbBUBYMVfgd9Qzdkj7GX8RHG3WBCyeDDcA4P+eufbBTiejjqdZIErfI1O
 uKgrRTmhfkfgvx/zKkO72FqpVYWnXVNvkQ5RVsX9w61R1+VdquT4G6tOSxv95SF+BMkOmv
 HC0qUlZj3v+kmBxvd4sB4BamsA7/rHQg3LLo4snrkS28rXcZcsvSEuPbYgf4vl/NPvfEPK
 J0veTwj6nucx4fOpYq/k68hmvjt/KCe4ItsquhhBa4kOJsy8p7HMmFhLxrs4UA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: bump to
 version 0.24.2
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

Ck9uIDE3LzAzLzIwMjUgMjM6MTgsIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+IFNpZ25lZC1vZmYt
Ynk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKIMKgQXBwbGll
ZCB0byAyMDI1LjAyLngsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAtLS0KPiAg
IHBhY2thZ2UvcHl0aG9uLXRvcnRvaXNlLW9ybS9weXRob24tdG9ydG9pc2Utb3JtLmhhc2ggfCA0
ICsrLS0KPiAgIHBhY2thZ2UvcHl0aG9uLXRvcnRvaXNlLW9ybS9weXRob24tdG9ydG9pc2Utb3Jt
Lm1rICAgfCA0ICsrLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXRvcnRvaXNlLW9ybS9w
eXRob24tdG9ydG9pc2Utb3JtLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi10b3J0b2lzZS1vcm0vcHl0
aG9uLXRvcnRvaXNlLW9ybS5oYXNoCj4gaW5kZXggOTNhNGZhYjdkOS4uZGI3ZTM3YzEzZSAxMDA2
NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi10b3J0b2lzZS1vcm0vcHl0aG9uLXRvcnRvaXNlLW9y
bS5oYXNoCj4gKysrIGIvcGFja2FnZS9weXRob24tdG9ydG9pc2Utb3JtL3B5dGhvbi10b3J0b2lz
ZS1vcm0uaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+ICAgIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBz
Oi8vcHlwaS5vcmcvcHlwaS90b3J0b2lzZS1vcm0vanNvbgo+IC1tZDUgIDFmMzVlMjkyZjg2YzVm
MGJjYzcxN2Q1YzZlZjQxZjQ5ICB0b3J0b2lzZV9vcm0tMC4yNC4wLnRhci5nego+IC1zaGEyNTYg
IGFlMDcwNGE5M2VhMjc5MzE3MjRmYzg5OWU1NzI2OGM4MDgxYWZjZTNiMzJiMTEwYjAwMDM3ZWMy
MDY1NTNlN2QgIHRvcnRvaXNlX29ybS0wLjI0LjAudGFyLmd6Cj4gK21kNSAgZmEzMTc3YWNmY2Qx
ODZjY2RlZjA5MzZkYWJjNzlmOTAgIHRvcnRvaXNlX29ybS0wLjI0LjIudGFyLmd6Cj4gK3NoYTI1
NiAgODNkMjM3M2VmYWZjMWM1ZDY2OGMzYzViZDRlMWU3ZjRhMjE5NTI2ZTg1MDkwOWZmZTg4ZjE4
NGRhMzgwOGZkYiAgdG9ydG9pc2Vfb3JtLTAuMjQuMi50YXIuZ3oKPiAgICMgTG9jYWxseSBjb21w
dXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gICBzaGEyNTYgIGY5NTVkMzQ3Yjk3NWQ1ODY3ZWUzNjRm
OTc4NDc2YjMwMTI4NzhhNzA2ZDQ2ODU3MWI5NzU4Y2FjNzRkZTYwNDEgIExJQ0VOU0UudHh0Cj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXRvcnRvaXNlLW9ybS9weXRob24tdG9ydG9pc2Ut
b3JtLm1rIGIvcGFja2FnZS9weXRob24tdG9ydG9pc2Utb3JtL3B5dGhvbi10b3J0b2lzZS1vcm0u
bWsKPiBpbmRleCBhZTUxZmQ0OTQ3Li5lM2MxZmQ1ZDkwIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
cHl0aG9uLXRvcnRvaXNlLW9ybS9weXRob24tdG9ydG9pc2Utb3JtLm1rCj4gKysrIGIvcGFja2Fn
ZS9weXRob24tdG9ydG9pc2Utb3JtL3B5dGhvbi10b3J0b2lzZS1vcm0ubWsKPiBAQCAtNCw5ICs0
LDkgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAtUFlUSE9OX1RP
UlRPSVNFX09STV9WRVJTSU9OID0gMC4yNC4wCj4gK1BZVEhPTl9UT1JUT0lTRV9PUk1fVkVSU0lP
TiA9IDAuMjQuMgo+ICAgUFlUSE9OX1RPUlRPSVNFX09STV9TT1VSQ0UgPSB0b3J0b2lzZV9vcm0t
JChQWVRIT05fVE9SVE9JU0VfT1JNX1ZFUlNJT04pLnRhci5nego+IC1QWVRIT05fVE9SVE9JU0Vf
T1JNX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvNjQvODEv
OTczYjYyOWY4YTcwZmM5MjgzNDNmNGY4YmU2MTIxMDIzYjZjNmYwZWUwYWU0NTY5NTk1NWRiODJh
ZjQ3Cj4gK1BZVEhPTl9UT1JUT0lTRV9PUk1fU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9z
dGVkLm9yZy9wYWNrYWdlcy80OS9lOC9hYzdjYzQxYzI5N2YyMGIzNjQyMzUxZTVmZjE2ZjUzYmVk
ZGVhMzdiZTI4NWYzM2YzMDMwODgzOGQ3MDQKPiAgIFBZVEhPTl9UT1JUT0lTRV9PUk1fU0VUVVBf
VFlQRSA9IHBvZXRyeQo+ICAgUFlUSE9OX1RPUlRPSVNFX09STV9MSUNFTlNFID0gQXBhY2hlLTIu
MAo+ICAgUFlUSE9OX1RPUlRPSVNFX09STV9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
