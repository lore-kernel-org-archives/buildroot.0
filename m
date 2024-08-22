Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEA1C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 20:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA65E8175F;
	Thu, 22 Aug 2024 20:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2zSO1B0j3nur; Thu, 22 Aug 2024 20:02:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABC2A81D18
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABC2A81D18;
	Thu, 22 Aug 2024 20:02:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 027921BF334
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 20:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F09B881D24
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 20:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZRTnoEb0Pmbq for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 20:02:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E383D8175F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E383D8175F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E383D8175F
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 20:02:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E60A013F880;
 Thu, 22 Aug 2024 22:02:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 22 Aug 2024 22:02:00 +0200
Date: Thu, 22 Aug 2024 22:02:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Message-ID: <ZseZOEB4XJ0a93P-@landeda>
References: <20240822130220.4135741-1-alex.bennee@linaro.org>
 <20240822130220.4135741-5-alex.bennee@linaro.org>
 <Zsdfx5CUXg8ARG75@landeda> <871q2gmr3t.fsf@draig.linaro.org>
 <Zsd0Z2v3PVmsqeJI@landeda> <87seuwl501.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87seuwl501.fsf@draig.linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724356925;
 bh=woh9ES+wcjyVMgaqeBxbhoJke/UnQ4B+i/6H/8rmN8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MU1KTKYk2zwnBvHrL+e01FH5hHJi8UkwjwjzYSmgQwHmsWT2NYOk+TS2pEpRPVjf2
 1dkQDZxNX2eElaGpsjz56jPs8A17C8jJvM9zF1sgkLTCwFzsH395/CNvK+MW+4TLLU
 VYY4Uj8qOHJMcEj9bnKThpBviEVJosx4OpxoMTOr7BVikrUjxqmujmtsAY59+eOINC
 iqBDfb0zRORzERO6gyT71J86nze6UC+4vXutuGmOn6lafSKwTBRASuDz/bKThmwCjf
 /vECI5ORMNXyUOcIVo3UDAbO+V6TswnANIhq2gWnJWenPC28PIEayVmF/FGCXNr3X0
 MIma7yNCnfW7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MU1KTKYk
Subject: Re: [Buildroot] [PATCH 4/4] package/mesa3d: bump to 24.2.0
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
Cc: Romain Naour <romain.naour@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxleCwgQWxsLAoKT24gMjAyNC0wOC0yMiAyMDo0MSArMDEwMCwgQWxleCBCZW5uw6llIHNwYWtl
IHRodXNseToKPiAiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cml0
ZXM6ClstLVNOSVAtLV0KPiA+IEFsc28sIEkgc3VzcGVjdCB0aGUgZm9sbG93aW5nIHBhdGNoIGRv
ZXMgbm90IGJlbG9uZyB0byB0aGUgc2VyaWVzOyBJCj4gPiBkb24ndCBzZWUgaG93IGl0IGlzIHJl
bGF0ZWQgdG8gbWVzYTNkIG9yIHRoZSBidW1wIHRoZXJlb2Y6Cj4gPiAgICogYm9hcmQvcWVtdTog
YWRkIHBvc3QtYnVpbGQgc2NyaXB0IHRvIGFhcmNoNjRfdmlydF9kZWZjb25maWcKPiBZb3UgbmVl
ZCB0byBiZSBsb2dnZWQgaW50byBhIGZyYW1lYnVmZmVyIGNvbnNvbGUgdG8gc3RhcnQgd2VzdG9u
IHRvIGJlCj4gYWJsZSB0byB0ZXN0IHRoZSB2aXJ0aW8tdnVsa2FuIEdQVS4KCkJ1dCBxZW11X2Fh
cmNoNjRfdmlydF9kZWZjb25maWcgZG9lcyBub3QgZXZlbiBlbmFibGUgbWVzYTNkLCBzbyB0aGUK
cmF0aW9uYWxlIGRvZXMgbm90IHN0c2FuZC4KCkhvd2V2ZXIsIGEgcnVudGltZSB0ZXN0IHdvdWxk
IGluZGVlZCBiZSB2ZXJ5IHdlbGNvbWUsIGJ1dCB0aGV5IGRvIG5vdAp1c2UgdGhlIGRlZmNvbmZp
Z3M7IHNlZSBzdXBwb3J0L3Rlc3RpbmcvIGZvciBleGFtcGxlcy4KClstLVNOSVAtLV0KPiA+PiA+
IFRoZXJlIHByZXZpb3VzbHkgd2FzIHNoYTI1NiBfYW5kXyBzaGE1MTIgaGFzaGVzLCBidXQgbm93
IHlvdSBvbmx5IGFkZCBhCj4gPj4gPiBzaGEyNTYgb25lLiBDYW4geW91IGV4dGVuZCBhIGxpdHRs
ZSBibHVyYiBhYm91dCB0aGF0LCBwbGVhc2U/Cj4gPj4gU3VyZSAtIG9ubHkgdGhlIHNoYTI1NiB3
YXMgaW4gdGhlIHJlbGFzZSBhbm5vdW5jZW1lbnQuIEkgY291bGQgY2FsY3VsYXRlCj4gPj4gb25l
IGlmIHlvdSB3YW50PwoKQUgsIE9LLCB0aGVuIHN0YXRlIHNvIGluIHRoZSBjb21taXQgbG9nIChl
LmcuOiB1cHN0cmVhbSBkb2VzIG5vdCBwcm92aWRlCmEgc2g1MTIgaW4gdGhlaXIgYW5ub3VuY2Vt
ZW50LCBqdXN0IGEgc2hhMjU2LCBzbyB1c2Ugb25seSB0aGF0KS4KClJlZ2FyZHMsCllhbm4gRS4g
TU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBS
ZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6
IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04g
ICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0t
LS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRw
Oi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2
ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
