Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B248AC71141
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 10:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2925B60AD7;
	Sat, 14 Jun 2025 10:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmPh300YA7BV; Sat, 14 Jun 2025 10:51:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4337E608C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4337E608C6;
	Sat, 14 Jun 2025 10:51:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E01E1177
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 10:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1F2A4060E
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 10:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEg2r0ulR8oJ for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 10:51:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B1EA0405E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1EA0405E2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1EA0405E2
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 10:51:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 0265978050B;
 Sat, 14 Jun 2025 12:51:04 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Jun 2025 12:51:04 +0200
MIME-Version: 1.0
Date: Sat, 14 Jun 2025 12:51:04 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Heiko Thiery <heiko.thiery@gmail.com>
In-Reply-To: <20250611111640.702572-3-alex.bennee@linaro.org>
References: <20250611111640.702572-1-alex.bennee@linaro.org>
 <20250611111640.702572-3-alex.bennee@linaro.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <1215059662f277baf90c9d16a7edac02@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749898267;
 bh=eYMoaxmavh6yyzo1ABQHP0L8wb69ROF0lE3BJPP1Hdo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RlLIKxVYVb9MbZ9CYI6vDtCeokQL9WdQEoX4DxNrP2suR4eTmlDUgxfyX+UcZU+w+
 5wb4gVVLVzXC0R0RlpAumHwwteUacH45P50wgwIx0NxvTO3e4BJ90A+QblltUvLNd5
 YsChCCaKrB9W/RNoVFwB+kgXzNV5eDsmF9LA28cVitPdOFSRKoyh6wKH89msxFzbzM
 60DVaa8FkX5rkW6YKc+T4HrIdOOZAJ4P3NgG4cS9ABHpua0X60JgEcMnE3j3Mks2GH
 wz1t2icRdzrlCq6cxUtLu/Ex3CDWJPj8r81rGeEu9wJfgwGiMdt38TkeBsqJ5WL5YD
 XH9hdd1/z7rTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RlLIKxVY
Subject: Re: [Buildroot] [PATCH v6 2/5] package/vulkan-sdk: new package
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

SGkgQWxleCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoISAgSSBoYXZlIGZldyBjb21tZW50cywgc2Vl
IGJlbG93LgoKT24gMTEvMDYvMjAyNSAxMzoxNiwgQWxleCBCZW5uw6llIHdyb3RlOgo+IFRoZSBw
cmluY2lwbGUgY29tcG9uZW50IG9mIHRoaXMgaXMgdGhlIG5ldyB2b2xrIG1ldGEtbG9hZGVyIHdo
aWNoIGlzCj4gcmVxdWlyZWQgZm9yIG1vcmUgcmVjZW50IHZlcnNpb25zIG9mIHZ1bGthbi10b29s
cy4gVGhlcmUgZG9lcyBzZWVtIHRvCj4gYmUgYSBsaXR0bGUgY29uZnVzaW9uIHdpdGggZ2l0aHVi
IFJlbGVhc2VzIGxhZ2dpbmcgYmVoaW5kIHRhZ2dlZAo+IHZlcnNpb25zIG9mIHRoZSBzZGsuIEkn
dmUgZ29uZSBmb3IgdGhlIGxhdGVzdCBTREsgdmVyc2lvbiB0byBzdGF5IGFzCj4gY2xvc2VseSBh
bGlnbmVkIHRvIHRoZSByZXN0IG9mIHRoZSBzeXN0ZW0gYXMgSSBjYW4uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgo+IAo+IC0tLQo+IHY2
Cj4gICAtIGJ1bXAgdG8gdnVsa2FuLXNkay0xLjQuMzEzLjAKPiAtLS0KWy4uLl0KPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS92dWxrYW4tc2RrL0NvbmZpZy5pbiAKPiBiL3BhY2thZ2UvdnVsa2FuLXNk
ay9Db25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjA1
YmRhMjM3YmIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS92dWxrYW4tc2RrL0NvbmZp
Zy5pbgo+IEBAIC0wLDAgKzEsOCBAQAo+ICtjb25maWcgQlIyX1BBQ0tBR0VfVlVMS0FOX1NESwo+
ICsJYm9vbCAidnVsa2FuLXNkayIKCldoZW4gdGVzdGluZyB3aXRoIHRoZSBjb21tYW5kOgoKdXRp
bHMvdGVzdC1wa2cgLWEgLXAgdnVsa2FuLXNkawoKVGhlcmUgaXMgZmV3IGJ1aWxkIGZhaWx1cmVz
IHJlcG9ydGVkOgoKICAgICAgICAgICAgICAgICAgICBib290bGluLWFybXY3bS11Y2xpYmMgWyA2
LzQwXTogRkFJTEVECiAgICAgICAgICAgICAgICAgYm9vdGxpbi1tNjhrLTUyMDgtdWNsaWJjIFsg
OC80MF06IEZBSUxFRAogICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyLWFybS1iYXNpYyBb
MjgvNDBdOiBGQUlMRUQKICAgICAgICAgICAgICAgICAgICAgICBici1hcm0tZnVsbC1zdGF0aWMg
WzMwLzQwXTogRkFJTEVECgpUaGVyZSBpcyBwb3NzaWJseSBhIG1pc3NpbmcgZGVwZW5kZW5jeSBt
aXNzaW5nIGhlcmUsIGxpa2U6CgogICAgIGRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUyAjIGRs
ZmNuLmgKCkNvdWxkIHlvdSBhbHNvIGFkZCB0aGUgY29ycmVzcG9uZGluZyBjb21tZW50IChzZWUg
b3RoZXIgcGFja2FnZXMKZm9yIGV4YW1wbGUpLgoKVG8gYmV0dGVyIGtlZXAgdHJhY2sgb2YgdGhv
c2UgZGVwZW5kZW5jaWVzLCB5b3Ugc2hvdWxkIGFsc28gdXBkYXRlCnRoZSBjb21tZW50IGluIHBh
Y2thZ2UvdnVsa2FuLXRvb2xzL0NvbmZpZy5pbiwgdG86CgogICAgIGRlcGVuZHMgb24gIUJSMl9T
VEFUSUNfTElCUyAjIHZ1bGthbi1sb2FkZXIsIHZ1bGthbi1zZGsKCj4gKwlzZWxlY3QgQlIyX1BB
Q0tBR0VfVlVMS0FOX0hFQURFUlMKPiArCgpUbyBrZWVwIHNvbWUgY29uc2lzdGVuY3kgd2l0aCBh
bGwgb3RoZXIgcGFja2FnZXMgaW4gQnVpbGRyb290LCBjb3VsZAp5b3UgcmVtb3ZlIHRoaXMgbmV3
IGxpbmUsIHBsZWFzZT8KCj4gKwloZWxwCj4gKwkgIFRoZSBWdWxrYW4gbWV0YS1sb2FkZXIKPiAr
Cj4gKwkgIGh0dHBzOi8vZ2l0aHViLmNvbS96ZXV4L3ZvbGsKCkNvdWxkIHlvdSBzZW5kIGFuIHVw
ZGF0ZWQgcGF0Y2ggZml4aW5nIHRob3NlIGlzc3VlLCBwbGVhc2U/CgpCZXN0IHJlZ2FyZHMsCgpK
dWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
