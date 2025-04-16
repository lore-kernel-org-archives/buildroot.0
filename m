Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A521AC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7490560D72;
	Wed, 16 Apr 2025 21:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YsoAdB0nePBY; Wed, 16 Apr 2025 21:23:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59CDA61263
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59CDA61263;
	Wed, 16 Apr 2025 21:23:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB5D6159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCAB0405D7
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABidrPQ99s94 for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:23:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7DCA041E7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DCA041E7A
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DCA041E7A
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:23:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F2B5F1C0083; Wed, 16 Apr 2025 23:23:05 +0200 (CEST)
Message-ID: <81661768-34d1-400f-8679-5a2774e5249d@rnout.be>
Date: Wed, 16 Apr 2025 23:23:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <Z-qD3_HeHh2U40Po@waldemar-brodkorb.de>
Content-Language: en-GB
In-Reply-To: <Z-qD3_HeHh2U40Po@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838586; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=COzz7iCSJSwE7UL/Bni8X0sgjo2CbWXuybaQ/gtEThw=;
 b=naBZnB9XG6D6IWCiAUq5FV6A625C1MTKMGI6/xqfeoWwJ9UyW4HgtaTudO/5IcT5VH3798
 G2z48sHbL37dzHQwglN+uhu4hxdmZYwsw1TAfDRuqok3+LafP+j8925jDi8KZj6rZN3y7h
 P2JC1MNuJVce3fs+8G3D4gQwGkOP5lySgZ6enoWWvh9ZSCGQCPVljBNJ66rYpBmAJ4oAK+
 YE0lJ9TqhCImcFErfEzcDa6xThwjw2enOgujtRL//ZQ5sQhgxa6J6zKvsVKJQBcWQDbVnY
 PBmQjOgqCOCGzFFR2+r5NMEMq7EAP6eKGsybruWlpH2RRfTc5eMAqv6BmLhDHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/zabbix: update to 7.2.5
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

Ck9uIDMxLzAzLzIwMjUgMTQ6MDAsIFdhbGRlbWFyIEJyb2Rrb3JiIHdyb3RlOgo+IFNlZSBoZXJl
IGZvciBhIGNoYW5nZWxvZzoKPiBodHRwczovL3d3dy56YWJiaXguY29tL3JuL3JuNy4yLjUKPiBo
dHRwczovL3d3dy56YWJiaXguY29tL3JuL3JuNy4yLjQKPgo+IFNpZ25lZC1vZmYtYnk6IFdhbGRl
bWFyIEJyb2Rrb3JiIDx3YnhAb3BlbmFkay5vcmc+CgogwqBBcHBsaWVkIHRvIDIwMjUuMDIueCwg
dGhhbmtzLgoKIMKgUmVnYXJkcywKIMKgQXJub3V0Cgo+IC0tLQo+ICAgcGFja2FnZS96YWJiaXgv
emFiYml4Lmhhc2ggfCAyICstCj4gICBwYWNrYWdlL3phYmJpeC96YWJiaXgubWsgICB8IDIgKy0K
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvemFiYml4L3phYmJpeC5oYXNoIGIvcGFja2FnZS96YWJiaXgv
emFiYml4Lmhhc2gKPiBpbmRleCBmYTIyOWFmMDBlLi45NzliNmM4ZTNmIDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvemFiYml4L3phYmJpeC5oYXNoCj4gKysrIGIvcGFja2FnZS96YWJiaXgvemFiYml4
Lmhhc2gKPiBAQCAtMSwzICsxLDMgQEAKPiAgICMgTG9jYWxseSBjb21wdXRlZAo+IC1zaGEyNTYg
IGZhOTU3YzUzM2YwNDJlZjliMzc3MTBiMDBhZGE5YzhlNGM4MDYzODE5ZDg3YzgwMjEyMTAzYWJk
NTNlZDEwYjUgIHphYmJpeC03LjIuMy50YXIuZ3oKPiArc2hhMjU2ICAwZDAxYjM5M2RkMjJiMmE2
MGIzNmZiMzdhOThmY2YxMDgxYzY4M2FkOTg4MzJhMmRkZDg3OTQzYTEyMDA4MzllICB6YWJiaXgt
Ny4yLjUudGFyLmd6Cj4gICBzaGEyNTYgIDBkOTZhNGZmNjhhZDZkNGI2ZjFmMzBmNzEzYjE4ZDUx
ODQ5MTJiYThkZDM4OWY4NmFhNzcxMGRiMDc5YWJjYjAgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS96YWJiaXgvemFiYml4Lm1rIGIvcGFja2FnZS96YWJiaXgvemFiYml4Lm1rCj4gaW5k
ZXggYWZmYWRlZjM2NS4uM2U2ODVmMWVhMiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3phYmJpeC96
YWJiaXgubWsKPiArKysgYi9wYWNrYWdlL3phYmJpeC96YWJiaXgubWsKPiBAQCAtNSw3ICs1LDcg
QEAKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAgIFpBQkJJWF9WRVJTSU9OX01B
Sk9SID0gNy4yCj4gLVpBQkJJWF9WRVJTSU9OID0gJChaQUJCSVhfVkVSU0lPTl9NQUpPUikuMwo+
ICtaQUJCSVhfVkVSU0lPTiA9ICQoWkFCQklYX1ZFUlNJT05fTUFKT1IpLjUKPiAgIFpBQkJJWF9T
SVRFID0gaHR0cHM6Ly9jZG4uemFiYml4LmNvbS96YWJiaXgvc291cmNlcy9zdGFibGUvJChaQUJC
SVhfVkVSU0lPTl9NQUpPUikKPiAgIFpBQkJJWF9TRUxJTlVYX01PRFVMRVMgPSB6YWJiaXgKPiAg
IFpBQkJJWF9MSUNFTlNFID0gQUdQTC0zLjAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
