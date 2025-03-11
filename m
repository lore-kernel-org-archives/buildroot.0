Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABF7C282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 15:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CD8A60BAF;
	Tue, 11 Mar 2025 15:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id quEwyEMY-goE; Tue, 11 Mar 2025 15:31:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8572060BAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8572060BAA;
	Tue, 11 Mar 2025 15:31:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF2F11DA
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 15:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1D92410C5
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 15:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcEo1HZvb3iK for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 15:31:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 505EA410D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 505EA410D2
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 505EA410D2
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 15:31:15 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 435732C89074;
 Tue, 11 Mar 2025 16:31:13 +0100 (CET)
Message-ID: <212b850e-938e-471b-90d0-e9976c2ebf25@bubu1.eu>
Date: Tue, 11 Mar 2025 16:31:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yegor Yefremov <yegorslists@googlemail.com>, Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20250307140407.4091221-1-buildroot@bubu1.eu>
 <9d45738738592229d4409ed9200977f1@free.fr>
 <CAGm1_kv0CGjoyEPv=7eEPqV3hukab-p=mUSO82QQHPoiKDJRxQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAGm1_kv0CGjoyEPv=7eEPqV3hukab-p=mUSO82QQHPoiKDJRxQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1741707073; bh=MRuRzV7HUNMHMYYWTcEtJtx3Wgxo0OsPfOOWW+/7Q54=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=IdhDco9tptSCa8dQK/vrmbT3XiRFVrnqV4+Nql9LNJkQyJkAunZOctYWMXqxHv/sX
 E0rZEbeYm5H8i5hVcrmKDFEKwqOGXpK5eohpcLBrSzG12lxjAURJEsJpdlxKRzgY+x
 lfieqTmwon4mK0W+6lpEC3nTD3vORh1ahPs+QWskxXZGAzB6MGHRL8SCvfIPk9avvs
 I/l+AXr/ihwF0qevK2KwHk3wi9OmotLbe7PetWmugfGMnMyygYKrKj/hTGpWRVUrln
 gyUyc8YtozHrD4w4XCiSUhgL9Gm5j+RUHu2xrtdXB8C85A6OhxkCre8F8aYjhuAz89
 3Ga7SsSEnTjGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=IdhDco9t
Subject: Re: [Buildroot] [PATCH] package/can-utils: bump to v2025.01
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWVnb3IsCgpPbiAwOC4wMy4yNSAwMDoxMywgWWVnb3IgWWVmcmVtb3Ygd3JvdGU6Cj4gSGkK
PiAKPiBPbiBGcmksIE1hciA3LCAyMDI1IGF0IDk6NTfigK9QTSBKdWxpZW4gT2xpdmFpbiA8anUu
b0BmcmVlLmZyPiB3cm90ZToKPj4KPj4gSGkgTWFyY3VzLAo+Pgo+PiBPbiAwNy8wMy8yMDI1IDE1
OjA0LCBNYXJjdXMgSG9mZm1hbm4gdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4+IFBhdGNoZXMgYXJl
IG5vdyBpbmNsdWRlZCBpbiB1cHN0cmVhbSByZWxlYXNlLgo+Pj4gUGFja2FnZSBzd2l0Y2hlZCBm
cm9tIGF1dG90b29scyB0byBjbWFrZSBiYXNlZCBidWlsZC4KPj4+Cj4+PiBSZWxlYXNlIE5vdGVz
Ogo+Pj4gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LWNhbi9jYW4tdXRpbHMvcmVsZWFzZXMvdGFn
L3YyMDI1LjAxCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWFyY3VzIEhvZmZtYW5uIDxidWlsZHJv
b3RAYnVidTEuZXU+Cj4+Cj4+IFRlc3RpbmcgdGhpcyBwYXRjaCBvbiB0aGUgbmV4dCBicmFuY2gg
d2l0aCAidGVzdC1wa2cgLWEiIGdlbmVyYXRlcwo+PiBmZXcgYnVpbGQgZmFpbHVyZXM6Cj4+IGh0
dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9waXBlbGluZXMvMTcwNTU0ODc5
MAo+Pgo+PiBDb3VsZCB5b3UgaGF2ZSBhIGxvb2sgcGxlYXNlPwo+IAo+IFRoaXMgcGF0Y2ggaXMg
bWlzc2luZzoKPiBodHRwczovL2dpdGh1Yi5jb20vbGludXgtY2FuL2Nhbi11dGlscy9jb21taXQv
MmI4YzdjNWY0YjcxNzI2ODA2ZGUwZDcxOGM0YzU2ZWViYTJjNzMzMgoKVGhpcyBpbmRlZWQgZml4
ZXMgdGhlIG11c2wgZXJyb3JzIGFzIG1lbnRpb25lZCBpbiBbMV0gYnV0IHRoYXQgbGVhdmVzIAp0
aHJlZSBkaWZmZXJlbnQgZXJyb3JzIGZvcgoKKiBib290bGluLWFybXY3bS11Y2xpYmMKKiBib290
bGluLW02OGstNTIwOC11Y2xpYmMKKiBici1hcm0tZnVsbC1zdGF0aWMKCkFsbCB0aG9zZSBhcmUg
cHJlc2VudCBpbiBKdWxpZW4ncyB0ZXN0IHJ1biBhcyB3ZWxsLgoKSSB0aGluayB0aGUgZmlyc3Qg
YW5kIHRoaXJkIGFyZSBiZWNhdXNlIGlzb2J1c2ZzIGlzIHVuY29uZGl0aW9uYWxseSAKYnVpbHQg
YXMgYSBzaGFyZWQgbGlicmFyeSB3aGljaCBpc24ndCBzdXBwb3J0ZWQgb24gdGhvc2UgcGxhdGZv
cm1zLiBUaGUgCnNlY29uZCBvbmUsIG5vIGlkZWEsIGJ1dCBwb3NzaWJseSBhbHNvIHJlbGF0ZWQ/
CgpUaGVyZSdzIHNvbWUgZGlzY3Vzc2lvbiBpbiBbMl0gYXJvdW5kIG1vdmluZyBzb21lIGNvZGUg
aW50byBhIHBvc3NpYmx5IApkaWZmZXJlbnQgcHJvamVjdC4gSSdsbCBhZGQgYSBjb21tZW50IGFz
a2luZyBhYm91dCB0aGUgZnVsbCBzdGF0aWMgCnVzZWNhc2UgdGhlcmUuCgoKWzFdIGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzExNTQ3
NQpbMl0gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LWNhbi9jYW4tdXRpbHMvaXNzdWVzLzU4NwoK
PiAKPiBZZWdvcgoKCk1hcmN1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
