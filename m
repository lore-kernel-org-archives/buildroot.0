Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A656DC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53E0C60A7B;
	Wed, 16 Apr 2025 21:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzafXYvFuZoK; Wed, 16 Apr 2025 21:26:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9947F6F730
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9947F6F730;
	Wed, 16 Apr 2025 21:26:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2704411B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 181B74254A
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezC079x1vi1C for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:26:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4441F41E66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4441F41E66
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4441F41E66
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:26:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6B6481C00C0; Wed, 16 Apr 2025 23:26:09 +0200 (CEST)
Message-ID: <59de77b1-4ac8-4456-95fd-9f788f755b74@rnout.be>
Date: Wed, 16 Apr 2025 23:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: gilles.bardoux@sagemcom.com, buildroot@buildroot.org
References: <76dd8fca-f33f-4c74-a36c-d2f91e1d9102@sagemcom.com>
Content-Language: en-GB
In-Reply-To: <76dd8fca-f33f-4c74-a36c-d2f91e1d9102@sagemcom.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838769; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8Q8JFN6Hev47u0PQ1Yvr8Sd76XYze5ZizMwiuI1opUg=;
 b=Tdd0Q/vPqCc3B+c0R/3c/PyoLKLa61FaC6Aaknu888469DYEAGlX6sgqH+3lsBvxJv+aRu
 wc7R3lXJW+CQb8QJAdCl2GMH+nSWjaQ/acYBH/cykV9inKUM2BDBtTPpq3iQFnsg/Yqdz5
 UKF16phDfx3gc1imXg4k32Md5Y8xtX+kR+4j0VeHwkWrCjgjbpSCQ+Y9QqwifC1Qcel6RS
 f0E6DPQ/LEXkGWeQ4ctJnwwu23+I5rT0YtzABc+9NJ74zf52pltEhjeCdwCQjSpxLes9mD
 q3KYznxiovTUG3OJCHXGksitD6q7uy4p1TQH1SHvkggveWR84AqgyfVVxzdT1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/python-fastapi: fix cpe id vendor
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

Ck9uIDIxLzAzLzIwMjUgMTI6MzMsIEdpbGxlcyBCYXJkb3V4IHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gZmFzdGFwaV9wcm9qZWN0IGlzIGRlcHJlY2F0ZWQsIHRpYW5nb2xvIGlzIHRoZSBjdXJyZW50
IGNwZSBpZCB2ZW5kb3IgZm9yIAo+IHB5dGhvbi1mYXN0YXBpCj4gU2lnbmVkLW9mZi1ieTogZ2ls
bGVzLmJhcmRvdXhAc2FnZW1jb20uY29tCgogwqBBcHBsaWVkIHRvwqAyMDI1LjAyLngsIDIwMjQu
MTEueCBhbmQgMjAyNC4wMi54LCB0aGFua3MuCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCj4gLS0t
Cj4gwqBwYWNrYWdlL3B5dGhvbi1mYXN0YXBpL3B5dGhvbi1mYXN0YXBpLm1rwqB8wqAywqArLQo+
IMKgMcKgZmlsZcKgY2hhbmdlZCzCoDHCoGluc2VydGlvbigrKSzCoDHCoGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZmFzdGFwaS9weXRob24tZmFzdGFwaS5tayAK
PiBiL3BhY2thZ2UvcHl0aG9uLWZhc3RhcGkvcHl0aG9uLWZhc3RhcGkubWsKPiBpbmRleMKgMDhm
ZTU2MjNjYi4uMjY2MmYzZGRhZsKgMTAwNjQ0Cj4gLS0twqBhL3BhY2thZ2UvcHl0aG9uLWZhc3Rh
cGkvcHl0aG9uLWZhc3RhcGkubWsKPiArKyvCoGIvcGFja2FnZS9weXRob24tZmFzdGFwaS9weXRo
b24tZmFzdGFwaS5tawo+IEBAIC0xMCw3ICsxMCw3IEBAIFBZVEhPTl9GQVNUQVBJX1NJVEUgPSAK
PiBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvYTIvYjIvNWE1ZGM0YWZm
ZGI2Cj4gwqBQWVRIT05fRkFTVEFQSV9TRVRVUF9UWVBFwqA9wqBwZXA1MTcKPiDCoFBZVEhPTl9G
QVNUQVBJX0xJQ0VOU0XCoD3CoE1JVAo+IMKgUFlUSE9OX0ZBU1RBUElfTElDRU5TRV9GSUxFU8Kg
PcKgTElDRU5TRQo+IC1QWVRIT05fRkFTVEFQSV9DUEVfSURfVkVORE9SwqA9wqBmYXN0YXBpX3By
b2plY3QKPiArUFlUSE9OX0ZBU1RBUElfQ1BFX0lEX1ZFTkRPUsKgPcKgdGlhbmdvbG8KPiDCoFBZ
VEhPTl9GQVNUQVBJX0NQRV9JRF9QUk9EVUNUwqA9wqBmYXN0YXBpCj4gwqBQWVRIT05fRkFTVEFQ
SV9ERVBFTkRFTkNJRVPCoD3CoGhvc3QtcHl0aG9uLXBkbS1iYWNrZW5kCj4KPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBDZSBjb3VycmllbCBldCBsZXMgZG9jdW1lbnRzIHF1aSBsdWkgc29udCBqb2ludHMg
c29udCwgc2F1ZiBtZW50aW9uIGNvbnRyYWlyZSwgCj4gcHLDqXN1bcOpcyBkZSBuYXR1cmUgY29u
ZmlkZW50aWVsbGUgZXQgZGVzdGluw6llcyDDoCBsJ3VzYWdlIGV4Y2x1c2lmIGR1IG91IGRlcyAK
PiBkZXN0aW5hdGFpcmUocykgbWVudGlvbm7DqShzKS4gU2kgdm91cyBuJ8OqdGVzIHBhcyBsZSBv
dSBsZXMgZGVzdGluYXRhaXJlKHMpLCAKPiB2b3VzIMOqdGVzIGluZm9ybcOpKGUpIHF1ZSB0b3V0
ZSBkaXZ1bGdhdGlvbiwgcmVwcm9kdWN0aW9uLCBkaXN0cmlidXRpb24sIHRvdXRlIAo+IGF1dHJl
IGRpZmZ1c2lvbiBvdSB1dGlsaXNhdGlvbiBkZSBjZXR0ZSBjb21tdW5pY2F0aW9uIG91IGRlIHRv
dXQgb3UgcGFydGllIGRlIAo+IGNlcyBpbmZvcm1hdGlvbnMgZXN0IHN0cmljdGVtZW50IGludGVy
ZGl0ZSwgc2F1ZiBhY2NvcmQgcHLDqWFsYWJsZSBkZSAKPiBs4oCZZXhww6lkaXRldXIuIFNpIGNl
IG1lc3NhZ2Ugdm91cyBhIMOpdMOpIHRyYW5zbWlzIHBhciBlcnJldXIsIG1lcmNpIAo+IGTigJlp
bW3DqWRpYXRlbWVudCBlbiBpbmZvcm1lciBsJ2V4cMOpZGl0ZXVyIGV0IHN1cHByaW1lciBkZSB2
b3RyZSBzeXN0w6htZSAKPiBpbmZvcm1hdGlxdWUgY2UgY291cnJpZWwgYWluc2kgcXVlIHRvdXMg
bGVzIGRvY3VtZW50cyBxdWkgeSBzb250IGF0dGFjaMOpcy4gRW4gCj4gdm91cyByZW1lcmNpYW50
IGRlIHZvdHJlIGNvb3DDqXJhdGlvbi4KPgo+IFRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2hlZCBk
b2N1bWVudHMgYXJlLCB1bmxlc3Mgb3RoZXJ3aXNlIHN0YXRlZCwgcHJlc3VtZWQgCj4gdG8gYmUg
Y29uZmlkZW50aWFsIGFuZCBpbnRlbmRlZCBmb3IgdGhlIGV4Y2x1c2l2ZSB1c2Ugb2YgdGhlIHJl
Y2lwaWVudChzKSAKPiBtZW50aW9uZWQuIElmIHlvdSBhcmUgbm90IHRoZSByZWNpcGllbnQocyks
IHlvdSBhcmUgaW5mb3JtZWQgdGhhdCBhbnkgCj4gZGlzY2xvc3VyZSwgcmVwcm9kdWN0aW9uLCBk
aXN0cmlidXRpb24sIGFueSBvdGhlciBkaXNzZW1pbmF0aW9uIG9yIHVzZSBvZiB0aGlzIAo+IGNv
bW11bmljYXRpb24gb3IgYWxsIG9yIHBhcnQgb2YgdGhpcyBpbmZvcm1hdGlvbiBpcyBzdHJpY3Rs
eSBwcm9oaWJpdGVkLCAKPiB1bmxlc3MgYWdyZWVkIGJlZm9yZWhhbmQgYnkgdGhlIHNlbmRlci4g
SWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gCj4gZXJyb3IsIHBsZWFzZSBpbW1l
ZGlhdGVseSBhZHZpc2UgdGhlIHNlbmRlciBhbmQgZGVsZXRlIHRoaXMgZS1tYWlsIGFuZCBhbGwg
dGhlIAo+IGF0dGFjaGVkIGRvY3VtZW50cyBmcm9tIHlvdXIgY29tcHV0ZXIgc3lzdGVtLiBUaGFu
a2luZyB5b3UgZm9yIHlvdXIgY29vcGVyYXRpb24uCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
