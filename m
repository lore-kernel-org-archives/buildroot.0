Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CB7CCFA03
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 21:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D119406E6;
	Mon,  3 Nov 2025 21:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sb4rQb26sE2F; Mon,  3 Nov 2025 21:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99CAE40722
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99CAE40722;
	Mon,  3 Nov 2025 21:32:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DE5C278
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6000240610
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZgdJf9gOOmf for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 21:32:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 87B7C405C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87B7C405C7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87B7C405C7
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:32:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 64B8413F88F;
 Mon,  3 Nov 2025 22:32:02 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 03 Nov 2025 22:32:02 +0100
MIME-Version: 1.0
Date: Mon, 03 Nov 2025 22:32:02 +0100
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251103110211.1092844-1-vincent.stehle@arm.com>
References: <20251103110211.1092844-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <2b89fb977868a2b92525c44f979b454c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762205523;
 bh=OzITJp12Ta+Ku1Rl9UswoLTgqfU9Cyo46vyJP/i7Obw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kQ+5wy5oHOLaUCkOKpiYCFkwQAPJn+tYlP0EFVYmM9NCgr3yrc5NjXL3Hg0g/6qq4
 qkRh8zg5brv5ZMh7EjsJRKd6F+5Uyx845fbwYWZhZKQDzrjRhC8LBRMxYea80g81pY
 PjYWeTX0U8Ddhi7P5zwcbXSwzOgBr53F6V4p2lJiC7mqTKwfTUUn2GXU/QUOcBFSkc
 m+Z6B/NFOAS2zvluyPTiFudoSrem8FacRrMiDxDMuJ52A1Rxcts0g5cN4KP5RWWDn/
 UDwaVeWrI1TgMCC6g6GhQy8yOM8pJVG6ragJyFZmuKBBdO3yssHJIt879/9fZtQ+qx
 KzDywjxzj5nzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kQ+5wy5o
Subject: Re: [Buildroot] [PATCH] support/testing: test_xen: more robust
 network
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

T24gMDMvMTEvMjAyNSAxMjowMiwgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IFRoZSB0ZXN0IHRl
c3RzLnBhY2thZ2UudGVzdF94ZW4uVGVzdFhlbkFybXY3IGhhcyBiZWNvbWUgdW5zdGFibGUgYWZ0
ZXIKPiBjb21taXQgMjRmZjI1ODkwNWRmICgic3VwcG9ydC90ZXN0aW5nOiB0ZXN0X3hlbjogYWRk
IG5ldHdvcmtpbmciKSwKPiBsZWFkaW5nIHRvIGEgfjUwJSBjaGFuY2Ugb2YgZmFpbHVyZSBvbiBn
aXRsYWIgQ0kuCj4gCj4gVGhpcyBzZWVtcyB0byBoYXBwZW4gb25seSB3aXRoIDMyYiAobm90IHdp
dGggdGhlIDY0YiBUZXN0WGVuQWFyY2g2NCksCj4gb25seSB3aXRoIFFlbXUgPCA5LjEsIGFuZCB3
aGVuIHRoaXMgaGFwcGVucyB0aGUgdGVzdCB3aWxsIGhhbmcgZHVyaW5nIGEKPiBzdGVwIGludm9s
dmluZyB0aGUgc2ltdWxhdGVkIG5ldHdvcmsgYW5kIHRoZSBkb20xIChESENQIG9yIHBpbmcpLgo+
IAo+IFRoZSByb290IGNhdXNlIGlzIHN1c3BlY3RlZCB0byBiZSBhIGJ1ZyBpbiB0aGUgdmlydGlv
LW5ldCBoYXJkd2FyZQo+IGVtdWxhdGlvbiBvZiB0aGUgcWVtdSB2ZXJzaW9uIDcuMi4xNSBpbmNs
dWRlZCBpbiB0aGUgQnVpbGRyb290IGRvY2tlcgo+IGltYWdlLgo+IAo+IEFzIGEgd29ya2Fyb3Vu
ZCwgcmVtb3ZlIGFsbCBuZXR3b3JrIGludGVyYWN0aW9ucyBiZXR3ZWVuIGRvbTEgYW5kIHRoZQo+
IHNpbXVsYXRlZCBuZXR3b3JrOgo+IC0gSW5zdGVhZCBvZiB0aGUgZ2F0ZXdheSwgcGluZyBkb20w
IGZyb20gZG9tMS4KPiAtIEluc3RlYWQgb2YgdXNpbmcgREhDUCwgY29uZmlndXJlIHRoZSBuZXR3
b3JrIHdpdGggZml4ZWQgSVAgYWRkcmVzc2VzLAo+ICAgc28gdGhhdCB3ZSBrbm93IHRoZSBJUCBh
ZGRyZXNzIG9mIHRoZSBkb20wLgo+IAo+IEEgcG9zc2libGUgc29sdXRpb24gY291bGQgaGF2ZSBi
ZWVuIHRvIGNvbXBpbGUgYSBob3N0LXFlbXUgd2l0aGluIHRoZQo+IHRlc3QsIGJ5IGFkZGluZyBC
UjJfUEFDS0FHRV9IT1NUX1FFTVU9eSBhbmQKPiBCUjJfUEFDS0FHRV9IT1NUX1FFTVVfU1lTVEVN
X01PREU9eSBpbiB0aGUgdGVzdCBjb25maWd1cmF0aW9uLgo+IFRoaXMgd291bGQgaGF2ZSB1c2Vk
IHRoZSBjdXJyZW50IEJ1aWxkcm9vdCB2ZXJzaW9uICgxMC4xLjApIG5vdCAKPiBhZmZlY3RlZAo+
IGJ5IHRoaXMgaXNzdWUsIGJ1dCB0aGlzIHdvdWxkIGFsc28gaGF2ZSBzaWduaWZpY2FudGx5IGlu
Y3JlYXNlZCB0aGUgCj4gdGVzdAo+IGNvbXBpbGF0aW9uIHRpbWUuCj4gCj4gU2luY2UgdGhlIERI
Q1AgaXMgbm90IHJlYWxseSBuZWVkZWQgaGVyZSB0byB0ZXN0IHRoZSBYZW4gbmV0d29ya2luZwo+
IGNhcGFiaWxpdHksIHRoaXMgaXMgd2h5IHRoZSBuZXR3b3JrIGNvbmZpZ3VyYXRpb24gc2ltcGxp
ZmljYXRpb24gd2FzCj4gcHJlZmVycmVkIGhlcmUuCj4gCj4gQWZ0ZXIgdGhvc2UgY2hhbmdlcyBi
b3RoIFhlbiB0ZXN0cyBhcmUgc3RhYmxlIG9uIENJIGFuZCBsb2NhbGx5Lgo+IAo+IEZpeGVzOiBo
dHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzExODcxNDU0
NjQ4Cj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0u
Y29tPgo+IENjOiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgoKQXBwbGllZCB0byBtYXN0
ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
