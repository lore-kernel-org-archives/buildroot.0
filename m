Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD16CA1012
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 19:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 551364064E;
	Thu,  4 Sep 2025 19:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0j0ElDfb7PoG; Thu,  4 Sep 2025 19:30:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56E3340647
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56E3340647;
	Thu,  4 Sep 2025 19:30:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DF049B69
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0ABA400A1
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5OxDulSE3TVV for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 19:30:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C0535400AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0535400AA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0535400AA
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:30:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 638BEB00539;
 Thu,  4 Sep 2025 21:30:46 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 04 Sep 2025 21:30:46 +0200
MIME-Version: 1.0
Date: Thu, 04 Sep 2025 21:30:46 +0200
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
In-Reply-To: <7a1c152c-c9b9-4cac-a985-bd30f3254feb@kaod.org>
References: <20250831123953.391803-1-clg@kaod.org>
 <20250831123953.391803-2-clg@kaod.org>
 <CACPK8XdQnx822DzoWLGrE6PyfcL=e=ZP4kAaAgOE40+Zazpctg@mail.gmail.com>
 <6e35067b-0403-49d9-b706-d47ca3eb519b@kaod.org>
 <CACPK8XeRG6AaF9TzjNqG7-UyEHECKfL9usPP--_owwDixsXJZw@mail.gmail.com>
 <7a1c152c-c9b9-4cac-a985-bd30f3254feb@kaod.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <4235294b2056dd33990f232858bfb52c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757014248;
 bh=oCeOODCg8a9gbBQj8MSL1U8ac/NtjRcLMpc1RJXO1w0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vFaYRNvvVh6XGb0n5v1S5xrfPQ+2gH3OXEyc+yQCufMQ/DS6wvRgvBfojRxWjqit7
 vAtxf6wGmT/wDcpQL5xkREaQ5VQfapTB4CVARUnQrUsGzsUuuE+pPQMiNmL8ljFdvE
 yv6CWnzg4LpqMM+ZBQdLkfT5JZWTvZut4sxJdW6oGL+VmGs9LJQgXqXLLcRcu07Ry7
 j30eqGv+RtmrHhDE7KSEFSeMswcie4RiyRc2mS2/KhQ7poVTr99/Qr1HZJoHPD3D6q
 9nkXzszJMuh1T0P7PLNI814+kLNm+s/f9zkkM25XBTPKurfrbRgKVZQIIFiMyCR35i
 p33chwbagwh0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vFaYRNvv
Subject: Re: [Buildroot] [PATCH 1/4] configs/aspeed-*: bump Linux to 6.16.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQ8OpZHJpYywgSm9lbCwKCk9uIDA0LzA5LzIwMjUgMTc6NDYsIEPDqWRyaWMgTGUgR29hdGVy
IHdyb3RlOgo+IE9uIDkvNC8yNSAwNjo1OSwgSm9lbCBTdGFubGV5IHdyb3RlOgo+PiBPbiBXZWQs
IDMgU2VwdCAyMDI1IGF0IDE0OjMyLCBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPiB3
cm90ZToKPj4+IAo+Pj4gT24gOS8zLzI1IDAxOjAxLCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4+Pj4g
T24gU3VuLCAzMSBBdWcgMjAyNSBhdCAyMjoxMSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9k
Lm9yZz4gd3JvdGU6Cj4+Pj4+IAo+Pj4+PiBTaW5jZSBMaW51eCA2LjUgbW92ZWQgLmR0cyBmaWxl
cyB0byB2ZW5kb3Igc3ViLWRpcmVjdG9yaWVzLCBhZGp1c3QgCj4+Pj4+IHRoZQo+Pj4+PiBwb3N0
LWltYWdlLnNoIHNjcmlwdCB0byB0YWtlIGludG8gYWNjb3VudCB0aGUgJ2FzcGVlZC8nIHByZWZp
eCBpbiAKPj4+Pj4gLmR0cwo+Pj4+PiBmaWxlIG5hbWVzLgo+Pj4+PiAKPj4+Pj4gU2lnbmVkLW9m
Zi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KPj4+PiAKPj4+PiBJcyBpdCBj
dXN0b21hcnkgdG8gdXNlIGEgc3BlY2lmaWMgdmVyc2lvbj8gSWYgbm90LCBsZWF2aW5nIHRoZXNl
Cj4+Pj4gYm9hcmRzIHRvIHVzZSB0aGUgZGVmYXVsdHMgd291bGQgbWFrZSBzZW5zZSBhbmQgc2F2
ZSBoYXZpbmcgdG8gCj4+Pj4gdXBkYXRlCj4+Pj4gdGhlbSBpbiB0aGUgZnV0dXJlLgo+Pj4gCj4+
PiBBbGwga2VybmVscyBhYm92ZSB2Ni41IG5lZWQgaXQgYW5kIEkgZG91YnQgb25lIHdvdWxkIHdh
bnQgdG8gdXNlCj4+PiBhbnl0aGluZyBiZWxvdyB2Ni42LiB2Ni42IGhhcyBiZWVuIHRoZSBiYXNl
IHZlcnNpb24gb2YgdGhlIFNESwo+Pj4gYW5kIE9wZW5CTUMga2VybmVsIGZvciBhIHdoaWxlIG5v
dy4KPj4gCj4+IEkgd2FzIHN1Z2dlc3Rpbmcgd2UgZG9uJ3Qgc3BlY2lmeSB0aGUgdmVyc2lvbiBp
biB0aGUgYXNwZWVkIGNvbmZpZ3MuCj4+IEl0IHdvdWxkIHRoZW4gcGljayB1cCB0aGUgZGVmYXVs
dCB3aGljaCBpcyA2LjE2IGF0IHRoZSBtb21lbnQsIGJ1dAo+PiB3b3VsZCBtb3ZlIGZvcndhcmQg
d2l0aG91dCBpbnRlcnZlbnRpb24gKGEgcG9zaXRpdmUgdGhpbmcpLgo+IAo+IG9oLiB5ZXMuIFRo
YXQgd29ya3MgdG9vIGJ1dCBJIGRpZG4ndCBzZWUgYW55IG90aGVyIGNvbmZpZ3MgKm5vdCoKPiBz
cGVjaWZ5aW5nIGEgTGludXggdmVyc2lvbiwgb2ZmaWNpYWwgb3IgY3VzdG9tLiBUaGUgbWFpbnRh
aW5lcnMKPiBzaG91bGQgdGVsbCB1cyBpZiB0aGlzIGlzIHBvc3NpYmxlLgoKRm9yIHRoZSBkZWZj
b25maWdzIG1haW50YWluZWQgaW4gdGhlIEJ1aWxkcm9vdCByZXBvc2l0b3J5LAp3ZSBpbmRlZWQg
YXNrIHRvIGFsd2F5cyBoYXZlIGZpeGVkIHVib290IGFuZCBrZXJuZWwgdmVyc2lvbgoodXN1YWxs
eSBMVFMgZm9yIHRoZSBrZXJuZWwpLgoKV2UgbGV0IGVhY2ggZGVmY29uZmlnIG1haW50YWluZXIg
dGVzdCBhbmQgdXBkYXRlIHdoZW4gdGhleSB3YW50LgoKU2VlIHRoZSBkZWZjb25maWdzIGd1aWRl
bGluZXM6Cmh0dHBzOi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvbWFudWFsL21hbnVhbC5odG1s
I2FkZGluZy1ib2FyZC1zdXBwb3J0Cmh0dHBzOi8vZWxpbnV4Lm9yZy9CdWlsZHJvb3Q6RGV2ZWxv
cGVyRGF5c0VMQ0UyMDI0I1J1bGVzX2Zvcl9kZWZjb25maWdzCgo+IFRoYW5rcywKPiAKPiBDLgoK
QmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
