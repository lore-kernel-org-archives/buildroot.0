Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2B2C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 10:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCC7980D59;
	Tue, 23 Jul 2024 10:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_9Uo5eeHeYM; Tue, 23 Jul 2024 10:22:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99D7280EE0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99D7280EE0;
	Tue, 23 Jul 2024 10:22:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A67F91BF20F
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92A3E402AA
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bl4Z9CdY6Toc for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 10:21:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 15E4740288
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15E4740288
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15E4740288
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 10:21:58 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id EEAEB2C83BD6;
 Tue, 23 Jul 2024 12:21:55 +0200 (CEST)
Message-ID: <b2385554-a98b-4bc2-9c30-d893eb407ff9@bubu1.eu>
Date: Tue, 23 Jul 2024 12:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <170715461915.13905.5968173515742280918-0@git.sr.ht>
 <170715461915.13905.5968173515742280918-1@git.sr.ht>
 <20240722145236.4e7ec0bf@windsurf>
 <99a9d884-8052-4128-8f4e-f68517d80a65@bubu1.eu>
 <20240722180634.0bb07726@windsurf>
 <CADvTj4o7gnjhSheMmrd5Dp-6Wug4ohBoRFpJb+Q4R8ow=KeH3g@mail.gmail.com>
 <20240722183829.76708213@windsurf>
 <CADvTj4rwUSVjWAN-5ekBg0tXWO=QzkOkOMTVhfcdjmgQ1KXn=A@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CADvTj4rwUSVjWAN-5ekBg0tXWO=QzkOkOMTVhfcdjmgQ1KXn=A@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1721730116; bh=wFJwmUQDE1yIT/odtu2ByhcPW4NzrjqJZdX3qXNi2TY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=H6f8RtB6h8IRLy+OwpBhnDCEnlrUTfa2132iZGFJnTGLa2Kd6UO8+F+lN8RgAe1xO
 tjbIVUPOQ2FY0DvovF4POFU83H1IfrdJPdjcMYaGppJQun6vDuV7IURg56L583qaXY
 avJeqEkXNCkYD0BgRT8CGkN+MISpHP3NeSHp8c9sdwYCXNPG2HuMrBPMG1cF9SVdur
 IDi/rlKWtftrKYRB5P8roYifq65HOU4qNWC+HwHp93HJPxTBI4aoMNQ8JT2Yp1t5S5
 m/8rC3z8b6WdPrWkHhtTrGbAuFXKWMSxLnhVXojIKJv361+vCPAGwPsXcXenl9MZnr
 M/BasqeYzK51w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=H6f8RtB6
Subject: Re: [Buildroot] [PATCH buildroot v2 2/2] support/testing: add
 fastapi runtime test
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
Cc: ~bubu <bubu@git.sr.ht>, Asaf Kahlon <asafka7@gmail.com>,
 ~bubu <bubu@bubu1.eu>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpPbiAyMi4wNy4yNCAxOToyMSwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gT24gTW9uLCBK
dWwgMjIsIDIwMjQgYXQgMTA6MzjigK9BTSBUaG9tYXMgUGV0YXp6b25pCj4gPHRob21hcy5wZXRh
enpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Pgo+PiBPbiBNb24sIDIyIEp1bCAyMDI0IDEwOjEx
OjMxIC0wNjAwCj4+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3
cm90ZToKPj4KPj4+PiBXZSBoYXZlIHNvbWUgdXBkYXRlcyB0byBweWRhbnRpYy1jb3JlL3B5ZGFu
dGljIHBlbmRpbmc6Cj4+Pj4KPj4+PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvYnVpbGRyb290L3BhdGNoLzIwMjQwNzE5MDQzNzM5LjMyNDEzNzItMS1qYW1lcy5oaWxsaWFy
ZDFAZ21haWwuY29tLwo+Pj4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9i
dWlsZHJvb3QvcGF0Y2gvMjAyNDA3MTkwNDI2MzIuMzIyNzI0Mi0xLWphbWVzLmhpbGxpYXJkMUBn
bWFpbC5jb20vCj4+Pj4KPj4+PiAoSSB3YXMgYWJvdXQgdG8gbWVyZ2UgdGhlbSkKPj4+Pgo+Pj4+
IE5vdCBzdXJlIGlmIHRoZXkgYXJlIHJlbGF0ZWQgLyBzb2x2ZSB0aGUgaXNzdWU/Cj4+Pgo+Pj4g
VGhlc2Ugc2V0dXB0b29scy9zZXR1cHRvb2xzLXJ1c3QvbWF0dXJpbiBwYXRjaGVzIG1pZ2h0IGFs
c28gaGVscDoKPj4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJv
b3QvcGF0Y2gvMjAyNDA3MTkwNDU2MzkuMzMzNjU0MS0xLWphbWVzLmhpbGxpYXJkMUBnbWFpbC5j
b20vCj4+PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3Bh
dGNoLzIwMjQwNzE5MDUwMTM0LjMzMzgxMTctMS1qYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLwo+
Pj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8y
MDI0MDcxOTA1MjcwMC4zNDI3ODMwLTEtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8KPj4KPj4g
SSBhcHBsaWVkIHRoZW0uIEJ1dCBjb3VsZCB3ZSBoYXZlIHNvbWUgYmV0dGVyIGFuc3dlciB0aGFu
ICJtaWdodCBhbHNvCj4+IGhlbHAiPyBMaWtlIGFjdHVhbGx5IHRlc3Rpbmcgd2hpY2ggdGhpbmcg
aXMgZml4aW5nIHdoYXQ/Cj4gCj4gV2VsbC4uLnRob3NlIGFyZSBhbGwgaW4gdGhlIGJ1aWxkIGRl
cGVuZGVuY3kgdHJlZSBmb3IgcHlkYW50aWMtY29yZSwgc28KPiBJIGlmIHRoZXJlIHdhcyBzb21l
dGhpbmcgdGhlcmUgdGhhdCBuZWVkZWQgdG8gYmUgdXBkYXRlZCB3YXMgdGhpbmtpbmcgdGhhdAo+
IG1pZ2h0IGhlbHAuCgpJdCdzIHN0aWxsIGZhaWxpbmcgYWZ0ZXIgYWxsIHRoZSBidW1wcyBidXQg
cmV2ZXJ0aW5nIAphMTRjODYyYzA4ODY1ZTA1M2Q1ZmNlOTBhMGQwMzIzYjhmOWU0YmMwCiJDcmVh
dGUgYSAuZ2l0aWdub3JlIGZpbGUgaW4gdGhlIENBTk9OSUNBTF9PIGRpcmVjdG9yeSIgZml4ZXMg
aXQuCgpGb3VuZCBhIGhpbnQgaGVyZSAKaHR0cHM6Ly9naXRodWIuY29tL2NvbmRhLWZvcmdlL3B5
ZGFudGljLWNvcmUtZmVlZHN0b2NrL3B1bGwvODIvY29tbWl0cy9mNWMwOTA5Yzc5ZGZmMzU2YzU1
MmI2ZGFjZjlkZDYyYTYyMDEzYzZhI2RpZmYtZjM3MjVhNTViZjMzOTU5NWJmODY1ZmVjNzNiZGE4
YWM5OWYyODNiMDgxMGMyMDU0NDIwMjFmMjljMDZlZWE5YVIxNy1SMjAKCkFuZCBhbHNvIHNvbWVv
bmUgc2VudCBhIG1haWwgdG8gdGhlIGxpc3QgdG9kYXkgY29tcGxhaW5pbmcgYWJvdXQgYSAKc2lt
aWxhciBwcm9ibGVtLgoKU28gdGhlIGN1bHByaXQgc2VlbXMgdG8gYmUgaHR0cHM6Ly9naXRodWIu
Y29tL1B5TzMvbWF0dXJpbi9pc3N1ZXMvMTkxMQoKTWFyY3VzCgo+IAo+Pgo+PiBUaG9tYXMKPj4g
LS0KPj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+PiBFbWJl
ZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+PiBodHRwczov
L2Jvb3RsaW4uY29tCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
