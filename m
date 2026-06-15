Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7D0CD98DA
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 20:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEA8C84509;
	Mon, 15 Jun 2026 20:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id unZV9MBNXMiu; Mon, 15 Jun 2026 20:26:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4476184501
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781555215;
	bh=AOXGM+xslc3LSGrV62hFehrMEzJVim7tJLViemt5e/E=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KC5baT6SpYOMTSlvBp/jEb8TO0KFlJaVtAXsnp8waw7P3uB4GL7Vrd0XDH9XnB+9W
	 mSbnTDG74/OTtcYGyztDnLZqWjz3rdMbiw8sxznpEkTKNs1jglqCYaT+SbE5Fa9Ydj
	 Hiy9U/tb0pqH12UabfktGEcoe5MAe7lGN8cZfqcIMF7RW9GyBwweXe8eeVHOuMeenc
	 sm43VTyFi4C+116LFBwGJBlocOSbcSDXywOiCJ/SL+U0n2mKj6UfhqkQ3BjtNmQPB0
	 KEBPps25xAtFFZ4yuTdTdrwAKEqaP58/U4l0wtlJuSwWuCG3PV29qtgAn4zBrATd1b
	 hDr/g+A0yqnUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4476184501;
	Mon, 15 Jun 2026 20:26:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35DD72B8
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27F3941444
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1yoj2gY6Z00t for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 20:26:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 299E04012B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 299E04012B
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 299E04012B
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:26:51 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id B2B0F2C891D3;
 Mon, 15 Jun 2026 22:26:49 +0200 (CEST)
Message-ID: <fb186248-7df4-4f73-94a2-c9b2ebefa843@bubu1.eu>
Date: Mon, 15 Jun 2026 22:26:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
References: <20260529213651.548156-1-buildroot@bubu1.eu>
 <CADvTj4rJmsU8Q235UNjQT0Pu8sm4T7AomFJa7tqHbHuxqWs4aA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CADvTj4rJmsU8Q235UNjQT0Pu8sm4T7AomFJa7tqHbHuxqWs4aA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1781555209; bh=64GR90CEs/VvCSctXd0cHa++wL0VaNaUsKI7xFBQtlk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=KDOn3z8kbIRaaSBpJxhxJ3EttyXk+aE/r3gbN8Q1I1ERlAboLaMI32a/gpGpW01pj
 twrlU0rOyJCBJqFIbUGnMhNxh0/9Z4UyhUvkvm6mAoeTk2gfaEaxkbpQv+4XFcQp7I
 ASN5SFb8RxIYaUws4KKzjGrthBtmEJEVzO+2Lbbksu+7VK5my3MOmEY91qwA9ywzSb
 yihGAnyGnU/L1JoJEhOlcIuPKCIaOO2KICxyl0Gt1FEFHOlFaduTBEUixpZVnyfkDy
 kKCO+xKOLysdgxxS11T1qwkC0g5iZ5vZqf/KMzXNWhME8rGag1W3s10P+RS1vl+0sA
 HACReZiiuVR4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=KDOn3z8k
Subject: Re: [Buildroot] [next 1/2] package/pkg-download: add pypi helper
 for downloading packages from pypi.org
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

SGkgSmFtZXMsCgpPbiA1LzMxLzI2IDIzOjI3LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBPbiBG
cmksIE1heSAyOSwgMjAyNiBhdCAzOjM34oCvUE0gTWFyY3VzIEhvZmZtYW5uIHZpYSBidWlsZHJv
b3QKPiA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+Pgo+PiBQeXBpIHByb3ZpZGVz
IHBhY2thZ2VzIHVuZGVyIGEgc3RhYmxlIHVybCAoaW5zdGVhZCBvZiB0aGUgaGFzaCBiYXNlZCBv
bmUKPj4gdGhhdCBjaGFuZ2VzIGV2ZXJ5IHZlcnNpb24pIGJ1dCB3ZSBkb24ndCBjdXJyZW50bHkg
bWFrZSB1c2Ugb2YgdGhhdCBhIGxvdC4KPiAKPiBPZmZpY2lhbCBndWlkYW5jZSBhcHBlYXJzIHRv
IHJlY29tbWVuZCB1c2luZyB0aGUgaGFzaCBiYXNlZCB1cmwncwo+IHJldHVybmVkIGJ5IHRoZSBB
UEknczogaHR0cHM6Ly9kb2NzLnB5cGkub3JnL2FwaS8jb2ZmaWNpYWwtZ3VpZGFuY2UKPiAKPiAg
RnJvbSBteSByZWFkaW5nIHByZWRpY3RhYmxlIHVybHMgYXJlIG1vcmUgb2YgYSBmYWxsYmFjayBv
cHRpb24gYnV0IGFyZQo+IG9ubHkgcmVjb21tZW5kZWQgaWYgdXNpbmcgdGhlIGhhc2ggYmFzZWQg
dXJscyBpcyBub3QgcHJhY3RpY2FsL3Bvc3NpYmxlOgo+IGh0dHBzOi8vZG9jcy5weXBpLm9yZy9h
cGkvI3ByZWRpY3RhYmxlLXVybHMKClllcywgdW5kZXJzdG9vZC4gSSdkIGFyZ3VlIHRoYXQgbm90
IHVzaW5nIHRoZSBoYXNoIGJhc2VkIHVybCBpcyBpbmRlZWQgCnF1aXRlIGEgYml0IG1vcmUgcHJh
Y3RpY2FsIGZvciB1cy4gOikKQnV0IHRoZXJlIGlzIGFub3RoZXIgb3B0aW9uIHBvc3NpYmx5LCBz
ZWUgYmVsb3cuCgo+IAo+ICBGcm9tIG15IHVuZGVyc3RhbmRpbmcgdXNpbmcgcHJlZGljdGFibGUg
dXJscyBpbnRyb2R1Y2VzIGEgZGVwZW5kZW5jeQo+IG9uIHRoZSBjb252ZXlvciBzZXJ2aWNlIGFu
ZCBpbnRyb2R1Y2VzIGFuIGFkZGl0aW9uYWwgcmVxdWVzdCBkdWUgdG8KPiBoYXZpbmcgdG8gZm9s
bG93IGEgMzAyIHJlZGlyZWN0IHNpbmNlIHRoZSBzdGFibGUgdXJsIGlzIG5vdCB0aGUgcmVhbCBD
RE4gdXJsLgoKWWVzLCB0aGF0J3MgbmVpdGhlciAibmljZSIgbm90ICJpZGVhbCIgYnV0IGFsc28g
bm90IHRoYXQgbXVjaCBvZiBhIApwcm9ibGVtIGluIHByYWN0aWNlIElNTy4KCj4gCj4+IEludHJv
ZHVjZSBhIHB5cGkgaGVscGVyIGZ1bmN0aW9uIGFuYWxvdWdvdXMgdG8gdGhlIGdpdGh1YiBhbmQg
Z2l0bGFiCj4+IGhlbHBlcnMgdG8gbWFrZSBpdCBlYXNpZXIgdG8gZG93bmxvYWQgcGFja2FnZXMg
ZnJvbSBweXBpIHVzaW5nIHRoaXMgdXJsCj4+IHNjaGVtZS4KPiAKPiBUaGVyZSBhcmUgb3RoZXIg
ZG93bnNpZGVzIHRvIHRoZSBjb252ZXlvciBzZXJ2aWNlIHN1Y2ggYXMgbGVzcyBzdGFiaWxpdHkK
PiBndWFyYW50ZWVzIGZvciBkb3dubG9hZCBhdmFpbGFiaWxpdHkgZHVlIHRvIGl0IGVzc2VudGlh
bGx5IGJlaW5nIGEgcHlwaSBBUEkKPiBkZXBlbmRlbnQgc2VydmljZSBmcm9tIG15IHVuZGVyc3Rh
bmRpbmcuCj4gCj4gRm9yIGV4YW1wbGUgZm9yIHB5bWF6ZGEtMC4zLjExLnRhci5neiB0aGUgbm9y
bWFsIGhhc2ggYmFzZWQgQ0ROIHVybAo+IHdvcmtzOgo+IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9z
dGVkLm9yZy9wYWNrYWdlcy9jOC85OC82ZGE3NWVhOTI2ZTRiMzU2NjgyM2ZjZjE2NDExNGI5MzJk
OWM0ZGU5MTVlMTQxMmYxZTBmYTAxNmFiNTgvcHltYXpkYS0wLjMuMTEudGFyLmd6Cj4gCj4gVGhl
IGVxdWl2YWxlbnQgcHJlZGljdGFibGUgdXJsIGdpdmVzIGEgNDA0IGR1ZSB0byB0aGUgcGFja2Fn
ZSBiZWluZwo+IHVuYXZhaWxhYmxlIGZyb20gdGhlIGNvbnZleW9yIHNlcnZpY2UgZHVlIHRvIHRo
ZSBwYWNrYWdlIGF1dGhvciBkZWxldGluZwo+IHRoZSBwYWNrYWdlIGF0IHNvbWUgcG9pbnQod2hp
Y2ggbWFrZXMgaXQgdW5zZWFyY2hhYmxlIGJ1dCBrZWVwcyB0aGUKPiBzb3VyY2VzIGl0c2VsZiBh
dmFpbGFibGUgaW4gdGhlIENETik6Cgo+IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9w
YWNrYWdlcy9zb3VyY2UvcC9weW1hemRhL3B5bWF6ZGEtMC4zLjExLnRhci5negoKSW50ZXJlc3Rp
bmcsIEkgZGlkbid0IGtub3cgcHlwaSBiZWhhdmVkIGxpa2UgdGhhdC4gSSBzdXBwb3NlIHRoYXQg
bWlnaHQgCmJlIGEgc29tZXdoYXQgc3Ryb25nIHJlYXNvbiB0byBrZWVwIHByZWZlcnJpbmcgdGhl
IGhhc2ggYmFzZWQgdXJscy4gClRob3VnaCB3ZSdsbCBhbHNvIHN0aWxsIGhhdmUgc291cmNlcy5i
dWlsZHJvb3Qub3JnLCB3aGljaCBJIGd1ZXNzIGluIAp0aGlzIGNhc2UgYWN0cyBpbiBhIHNpbWls
YXIgbWFubmVyIHRvIGtlZXAgdGhlIHNvdXJjZXMgYXZhaWxhYmxlIGV2ZW4gaWYgCnVwc3RyZWFt
IGRlbGV0ZWQgdGhlIHByb2plY3QuCgo+IAo+IEZvciBidWlsZHJvb3QgSSB0aGluayBpdCBtYWtl
cyBzZW5zZSB0byB1c2UgdGhlIG1vcmUgc3RhYmxlIGhhc2ggYmFzZWQKPiBDRE4gdXJsJ3MgYXMg
dGhvc2Ugc2hvdWxkIGJlIHVuYWZmZWN0ZWQgYnkgcHJvamVjdC9weXBpIHBhY2thZ2UgZGVsZXRp
b24KPiBhbmQgYXZvaWQgYW4gdW5uZWNlc3NhcnkgcmVkaXJlY3QgYXMgd2VsbCBhcyBiZWluZyB0
aGUgcmVjb21tZW5kZWQgdXJsCj4gdG8gdXNlIGJ5IHB5cGkuCgpUaGUgcmVhc29uIGZvciB3b3Jr
aW5nIG9uIHRoaXMgaXMgdGhhdCAqbm90KiBoYXZpbmcgdGhpcyBldmVyIGNoYW5naW5nIApoYXNo
IGJhc2VkIHBhY2thZ2UgdXJsIGluIHRoZSAubWsgZmlsZSBzaWduaWZpY2FudGx5IGxlc3NlbnMg
dGhlIAphbm5veWFuY2Ugb2YgdXBkYXRpbmcgKGFuZCBiYWNrcG9ydGluZyB1cGRhdGVzISkgcHl0
aG9uIHBhY2thZ2VzLCBzbyBJIAp0aGluayB3ZSBzaG91bGQgc3RpbGwgc3RyaXZlIGZvciB0aGF0
LgoKTm93IGlmIHdlIGludHJvZHVjZSB0aGUgYmxhY2syYi0yNTYgaGFzaCBtZXRob2QgdG8gYnVp
bGRyb290LCB3ZSBjYW4gCm1vdmUgdGhlIChleGlzdGluZyBhbmQgbmV3KSBoYXNoZXMgdG8gdGhl
IC5oYXNoIGZpbGUgYW5kIGluc3RydWN0IHRoZSAKcHlwaSBkb3dubG9hZCBoZWxwZXIgdG8gdXNl
IHRoaXMgaGFzaCBmb3IgY29uc3RydWN0aW5nIHRoZSBkb3dubG9hZCBVUkwuIApBbmQgYXMgb3Ro
ZXJzIGhhdmUgYWxyZWFkeSBub3RlZCBpbiB0aGUgY29tbWVudHMgaGVyZSwgdGhpcyBkb3dubG9h
ZCAKaGVscGVyIGNhbiBiZSB0aGUgZGVmYXVsdCBmb3IgcHl0aG9uIGJhc2VkIHBhY2thZ2VzIGlm
IHlvdSBkb24ndCBzcGVjaWZ5IAphbnl0aGluZyBlbHNlLiBUaG91Z2h0cz8KCj5bLi4uXQoKQmVz
dCwKTWFyY3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
