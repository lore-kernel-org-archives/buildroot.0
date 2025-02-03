Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F4AC02196
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 15:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CAD660E59;
	Mon,  3 Feb 2025 15:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dghZ5U6Y-GN; Mon,  3 Feb 2025 15:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81BE360EBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81BE360EBA;
	Mon,  3 Feb 2025 15:18:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E0FD12A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 121B880F51
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j728gfuiKHe3 for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 15:17:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A01180E34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A01180E34
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A01180E34
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:17:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.178]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFbVu-1teQF43eqU-00GMPI; Mon, 03
 Feb 2025 16:17:52 +0100
Message-ID: <bf504c35-cbe4-40dd-b56d-bfa3b62e552c@gmx.de>
Date: Mon, 3 Feb 2025 16:17:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20250203120130.2332720-1-fiona.klute@gmx.de>
 <3dfa6faa-9307-4091-9a8b-f327a0be19be@mind.be>
 <434ed0ef-17b5-48af-9c93-1c7bb75c857f@gmx.de>
 <087a8c52-81f6-4031-b0ce-712fc8857034@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <087a8c52-81f6-4031-b0ce-712fc8857034@mind.be>
X-Provags-ID: V03:K1:l57KVEe55PaPty/SkQduka2d2ZIW57mdLL27WbjZXunQjk9H9pW
 Uw/jXDRuJ9GVW7imemcBfp/iiBinFEPqVtBOysuiB5biwUWtctcHLbIGI0STaOqQqKnlFos
 O1BV9hbMRgKNUHEQYkrQMDGtzlv7W1qeTgoMUoJGG7IE2JdADzbNBcc0LT0VvuBJNnvS1mb
 VVtBOBqWTXIy7c8nWexOw==
UI-OutboundReport: notjunk:1;M01:P0:KMXQiu2ptOk=;xpXU7NKmArx38VXk5qYEfMdv2eM
 gN0V2LpYlJHU0ykbrNqWlrSeDTVnw2pVwQWGOVTkL6GbFCW16ZGIogKH1rzvhu9sTpMoE7jEr
 jON4DwzbJ+N518m2N2zy/kjriwn5U01L1aXlboNWZQVebJUImaJR+aozzHJVz5n+oI5NKjLpJ
 eFz75CGD/2P1Ba9dR9a/+Gg9HMPzH1n6PxOrJRkU2T8pRZJPzrXkT4Q54evOgCFk0ASa38sAl
 9zuIDasu3a5xUyTGjFQuCcHAmsb68F6dWfF2kte7kWribyFc+jJg4vgmENQ6t76BHWxabvqBF
 cu2fve8FStfH0VpcZg9ewz2Uro+ixByHUDyWwqnbogP/OrtQvdhJu+JdmAEyIBsBxK+Dv2Opv
 rg4HDFwfokkUUFjdwGjlVkanJeX6njRHc0oisb5c1oR/fj/1EPYLuisH8l6C3acWnjmK7btsR
 c1xj8E0mp3QlCbp/cL/d9bQODHwwRKOKxl/aCjwoHm1Psqao/O/1gciau30H5sa2eDtfor/Ch
 PYcvunUm0U5Ck0awwrPoSp2t09zTNbp+QieTsrGxSm43kRnFGMBmJcZ2bClbEaTL9swTctzyt
 jWolyI3YsFp6ZIp8eTMts9BsYL6X0n5zP6PvAHApNPUnm8r7QbVIcpv5Kt9rXEF8/o8ZoCAK5
 36mF9bJ2eO0qSEeUrpntNch9NiORUmff7tZHtaGynFtHHsv4fvQrqxX3R/Zv1tpdqeJl92QTu
 RLSEjAChBC7lhZpjrsA4LZm8/UHvLW8U23ZOTyDySr9QBYrKhmSX8X0XqV9JGVJExWm7RMA8s
 Ce9SCr/g+UzhEr06dP2cq6F9qKQcl3VPRiAL6WlPRUj0kZyb6COwcpE41QrxfKrdWp3b05Wwa
 6BRxCKVWExmbUkHe4dUs9MO0GfE+7atHE9yPUytMst9a7UHdXji856takEs/S9Ee522KPOyxm
 Ud1ToSUfXthr8SrrMMGHQpwuwh/lSU45JDNtycvcD40fzpVcB6Hth7yBjyWAE79Yj8SbgRa9Y
 HbY1+VF6vqor6d9/0zsUL48pALNCEfUUQhAxAUDHz8vA2pgT3Pr16hZYgTifWd9yjBYpa9+qA
 8cuWyKd8cdTqmXl/DH+6qMXCIx2xgtYtnx7EzZV6rnpVKDlWxDPkX5jIy8a5xVnDqz0sjc06Q
 gc9Gwir373DeWci/PuYIpFY40DkOaTWio4vJLeQ1l5DHZIHYFPl8XmAAXGIS9HyFrazNsZU0X
 b2srjLaMQ+O4BpG4ygMX4GsApy4iqQWBq7poFeDo5abJdba5mdAyQGDDKcbJe2sTKW8ixiFe/
 AH9g0XFMUCCezFxHbW9zUhBakT8ODp97dyoIXcK8zZ9Fk2DePsumr6u59Bq7aeILR830omwIH
 RiVEfaaW+Z0MhzeWLn4IxQ/9de9U1qv4r5g9w=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738595873; x=1739200673; i=fiona.klute@gmx.de;
 bh=K5HXQG/6GkmvX2N0BNdL/saBhjEinmC/3SXbsvM5mMY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=taN+699+fzC9upYhQ4OiWMEXbyBS9ZzIhjKAECFgIBJHXNd+byXFQJY5KlMeu+4d
 5BP2c5HTMST7r2ch4oGBA4c5ndAloWbrJ3aOn4H0z2ISqcTcmSrLH0hYQmzjjnEAM
 dh+krhCRwl9qt1xtMfzXzTBsO00bbh/741jlIKjGLRVdqQDLulzGra/pqQr/fxKK9
 3NJx1jB9bUAk9MT8QOvndvyMAsbcLulVSLF3u1jTml/2Rf+osOKdQHYirH8E/oVEb
 aRXI7riTi0zqAhoz35H/7n8eP3CTbg97jKiLX8w30D7yD9PCmivadlxG/dv6a9fW8
 URf/vexb8Zj1S/eHYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=taN+699+
Subject: Re: [Buildroot] [PATCH 1/1] package/go/go-src: stop forcing
 binutils-gold dependency on aarch64
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0IQoKQW0gMDMuMDIuMjUgdW0gMTU6MTMgc2NocmllYiBBcm5vdXQgVmFuZGVjYXBw
ZWxsZToKPgo+Cj4gT24gMDMvMDIvMjAyNSAxNDowNCwgRmlvbmEgS2x1dGUgd3JvdGU6Cj4+IEhp
IEFybm91dCEKPj4KPj4gQW0gMDMuMDIuMjUgdW0gMTM6NDggc2NocmllYiBBcm5vdXQgVmFuZGVj
YXBwZWxsZToKPj4+IMKgwqBIaSBGaW9uYSwKPj4+Cj4+PiBPbiAwMy8wMi8yMDI1IDEzOjAxLCBG
aW9uYSBLbHV0ZSB3cm90ZToKPj4+PiBGcm9tOiAiRmlvbmEgS2x1dGUgKFdJV0EpIiA8ZmlvbmEu
a2x1dGVAZ214LmRlPgo+Pj4+Cj4+Pj4gR28gZm9yY2VzIHRoZSBHT0xEIGxpbmtlciB3aGVuIGR5
bmFtaWNhbGx5IGxpbmtpbmcgR28gY29kZSwgYmVjYXVzZQo+Pj4+IG9sZCB2ZXJzaW9ucyBvZiBC
RkQgY2F1c2VkIGVycm9ycy4gVGhlIGlzc3VlIGhhcyBiZWVuIGZpeGVkIGluCj4+Pj4gQmludXRp
bHMgc2luY2UgYXQgbGVhc3QgMi40MSBhY2NvcmRpbmcgdG8gdGhlIHVwc3RyZWFtIGRlc2NyaXB0
aW9uIG9mCj4+Pj4gdGhlIHBhdGNoIGFkZGVkIHdpdGggdGhpcyBjb21taXQgWzFdLCBhbmQgbm93
IGZvcmNpbmcgR09MRCBjYXVzZXMKPj4+PiBsaW5raW5nIGZhaWx1cmUgaWYgbGQuZ29sZCBpcyBu
b3QgYXZhaWxhYmxlLiBUaGUgYXNzb2NpYXRlZCBHb2xhbmcKPj4+PiBpc3N1ZSBbMl0gaXMgc3Rp
bGwgb3Blbi4KPj4+Pgo+Pj4+IEltcG9ydCB0aGUgcGF0Y2ggdG8gc3RvcCBmb3JjaW5nIEdPTEQu
Cj4+Pgo+Pj4gwqDCoFRoaXMgZml4ZXMgdGhlIGlzc3VlIGZvciBnby1zcmMsIGJ1dCBub3QgZm9y
IGdvLWJpbiB1bmZvcnR1bmF0ZWx5Li4uCj4+PiBBbmQgZ28tYmluIGlzIHRoZSBkZWZhdWx0Li4u
Cj4+Cj4+IEknbSBhZnJhaWQgSSBjYW4ndCBwYXRjaCB0aGUgR28gYmluYXJpZXMsIGF0IGxlYXN0
IG5vdCB3aXRoIHJlYXNvbmFibGUKPj4gZWZmb3J0Lgo+Cj4gIMKgT2ggY29tZSBvbiwgaG93IGhh
cmQgY2FuIGl0IGJlIDotKQo+Cj4KPj4+IMKgwqBPbiB0aGUgb3RoZXIgaGFuZCwgd2UgZG9uJ3Qg
aGF2ZSBhbnkgYXV0b2J1aWxkZXIgZmFpbHVyZXMgeWV0LCBzbwo+Pj4gbWF5YmUgaXQncyBhIGNv
cm5lciBjYXNlIHByb2JsZW0gYW5kIHdlIGNhbiBsaXZlIHdpdGggaXQgdW50aWwgZ28tYmluCj4+
PiBnZXRzIGJ1bXBlZCB0byAxLjIzLjYgKGFzc3VtaW5nIHVwc3RyZWFtIGFwcGxpZXMgdGhlIGZp
eCB0byB0aGVpciBzdGFibGUKPj4+IGJyYW5jaCBvZiBjb3Vyc2UpLgo+Pgo+PiBBcyBJIHVuZGVy
c3RhbmQgdGhlIGNvZGUsIHRoZSBmb3JjZWQgb3B0aW9uIGlzIG9ubHkgYXBwbGllZCB3aGVuCj4+
IGJ1aWxkaW5nIGEgZHluYW1pY2FsbHkgbGlua2VkIGxpYnJhcnksIHdoaWNoIGlzIHByb2JhYmx5
IG5vdCB2ZXJ5IGNvbW1vbgo+PiB3aXRoIEdvLiBJIGhhdmVuJ3QgbG9va2VkIG1vcmUgZGVlcGx5
IGludG8gaXQsIGJ1dCBteSBjdXJyZW50IGFzc3VtcHRpb24KPj4gaXMgdGhhdCBjb250YWluZXJk
IHN0YXJ0ZWQgZG9pbmcgdGhhdCB3aXRoIHRoZSAyLjAgcmVsZWFzZSwgYmVjYXVzZQo+PiB0aGVy
ZSBoYXZlbid0IGJlZW4gYW55IHJlY2VudCBjaGFuZ2VzIHRvIHBhY2thZ2UvYmludXRpbHMgKGFu
ZAo+PiBkZWZpbml0ZWx5IG5vbmUgZGlzYWJsaW5nIEdvbGQpLiBPdGhlcndpc2UgdGhlIGVycm9y
IHNob3VsZCd2ZSBzaG93biB1cAo+PiBlYXJsaWVyLgo+Cj4gIMKgR3JlYXQhIEluIHRoYXQgY2Fz
ZSwgd2UgY2FuIGVpdGhlciBwYXRjaCBjb250YWluZXJkIHRvIG5vdCBkbyB0aGF0LCBvcgo+ICh0
ZW1wb3JhcmlseSkgbWFrZSBjb250YWluZXJkIGRlcGVuZCBvbiBob3N0LWdvLXNyYyAod2l0aCBh
IGJpZyBjb21tZW50Cj4gZXhwbGFpbmluZyB3aHkpLgo+Cj4gIMKgSG93ZXZlciwgSSB0aGluayBp
dCdzIGJlc3QgdG8gYXBwbHkgdGhpcyBwYXRjaCBhbmQgbGVhdmUgY29udGFpbmVyZCArCj4gZ28t
YmluIGFzIGJyb2tlbiBmb3IgYSB3aGlsZS4gSWYgdGhlcmUgd2lsbCBiZSBhIEdvIDEuMjMuNiB0
aGF0IGZpeGVzCj4gdGhlIGlzc3VlLCB0aGVuIGp1c3QgYnVtcGluZyBHbyAoYm90aCBiaW4gYW5k
IHNyYykgaXMgYSBtdWNoIGVhc2llciBwYXRoCj4gZm9yd2FyZC4KCkkgbW9zdGx5IGFncmVlLCB0
aG91Z2ggdGhlcmUncyBvbmUgY2F0Y2g6IEkgaGF2ZSBubyBpZGVhIGlmIHRoZSBwYXRjaAp3aWxs
IGJlIG1lcmdlZCB1cHN0cmVhbSBzb29uLiBUaGUgcGF0Y2ggaXMgYWxtb3N0IDMgeWVhcnMgb2xk
IGJ5IG5vdywKYW5kIHRoZSBpc3N1ZSBkaXNjdXNzaW9uIGRvZXNuJ3QgaW5kaWNhdGUgYSBwbGFu
LgoKSWYgd2UgbmVlZCBhIHdvcmthcm91bmQgZW5hYmxpbmcgR29sZCBpbiB0aGUgQmludXRpbHMg
YnVpbGQgZm9yIHRoZQpjcm9zcyB0b29sY2hhaW4gbWlnaHQgYWxzbyBiZSBhbiBvcHRpb24sIGJ1
dCBoYXMgdHdvIGRpc2FkdmFudGFnZXM6CgphKSBJdCdzIG5vdCBnb2luZyB0byBoZWxwIHBlb3Bs
ZSB1c2luZyBhIHByZS1idWlsdCB0b29sY2hhaW4uCmIpIFRoZSBCaW51dGlscyBkZXZlbG9wZXJz
IHNlZW0gdG8gYmUgcGxhbm5pbmcgdG8gZGVwcmVjYXRlIEdvbGQ6Cmh0dHBzOi8vc291cmNld2Fy
ZS5vcmcvcGlwZXJtYWlsL2JpbnV0aWxzLzIwMjQtT2N0b2Jlci8xMzczMTkuaHRtbCAoVGhlCkRl
YmlhbiBwYWNrYWdlIGNoYW5nZWxvZyBpcyBhIGxvdCBtb3JlIGRpcmVjdCBhYm91dCB0aGF0LikK
CkkgaG9wZSB0aGF0IHBvaW50IGIpIGh1cnJpZXMgdGhpbmdzIGFsb25nIG9uIHRoZSBHbyBzaWRl
LCBzbyBJIG1lbnRpb25lZAppdCBpbiB0aGUgaXNzdWUgWzFdLgoKQmVzdCByZWdhcmRzLApGaW9u
YQoKClsxXSBodHRwczovL2dpdGh1Yi5jb20vZ29sYW5nL2dvL2lzc3Vlcy8yMjA0MCNpc3N1ZWNv
bW1lbnQtMjYzMDg0ODc3NwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
