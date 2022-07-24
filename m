Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A693C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 08:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1336442490;
	Sun, 24 Jul 2022 08:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1336442490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dwmpl1VYVNMs; Sun, 24 Jul 2022 08:46:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFC0742489;
	Sun, 24 Jul 2022 08:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFC0742489
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8EE071BF312
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7101E40BBF
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7101E40BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CRsOTTfCMITT for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 08:46:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7653940025
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7653940025
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 08:46:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [86.206.242.79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 720E7780346;
 Sun, 24 Jul 2022 10:46:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Jul 2022 10:46:11 +0200
Date: Sun, 24 Jul 2022 10:46:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220724084611.GP2641@scaer>
References: <20220705134402.5914-1-david.gouarin@thalesgroup.com>
 <20220705134402.5914-2-david.gouarin@thalesgroup.com>
 <5c4dd777-7209-90e3-ea5d-b0ae57c745a9@smile.fr>
 <20220724075906.GO2641@scaer>
 <c85bf232-28ca-8d43-06ca-8e2d78db1581@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c85bf232-28ca-8d43-06ca-8e2d78db1581@smile.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658652377;
 bh=ozY9xQr+o6w/v/4S6+lHjLuBiOkZyfEgaz4ukxyO5+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AMFFvDzmOQCP56oLOxQ/nS9mNMBADorLBINM86BND/vEjpazZcC8H1vLfJZ2CeG+w
 1AZ2U3WYC4kTXyAByi89qDAXwlBnp1LxRvv9ieAB9dq4ZFqPU2ve6YGk6awitc1pSR
 uiziDAJ8VgWZMWZId0aK5K7vH8HFQUBduF8wSyV9WpvSOyqir1FHn0ymTsI9MbA2mj
 DXpRyGGk+cWuEQyIMffkUDoHnar2nfeFu6kuQY7ugZNlJyxRjYCPQcN2GsZBFNF6tp
 ewZirZgN7m8SPsgoSSBcEF5wkP3RJHPtKfoZp14Aq00VeEvNpFDxQrqGqtVpGujZ/a
 5oWmfyFXSr2GA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AMFFvDzm
Subject: Re: [Buildroot] [PATCH 2/2] package/libtalloc: bump version to 2.3.4
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 David GOUARIN <david.gouarin@thalesgroup.com>,
 Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLCBBbGwsCgpPbiAyMDIyLTA3LTI0IDEwOjE5ICswMjAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IExlIDI0LzA3LzIwMjIgw6AgMDk6NTksIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiA+IE9uIDIwMjItMDctMjMgMTk6MTUgKzAyMDAsIFJvbWFpbiBOYW91ciBzcGFrZSB0
aHVzbHk6Cj4gPj4gTGUgMDUvMDcvMjAyMiDDoCAxNTo0NCwgRGF2aWQgR09VQVJJTiBhIMOpY3Jp
dMKgOgo+ID4+PiBUaGlzIHZlcnNpb24gbmVlZHMgdG8gZGVmaW5lIGFuIGVudmlyb25tZW50IHZh
cmlhYmxlIGluIGJ1aWxkIGFuZCBpbnN0YWxsIHN0ZXBzLgo+ID4+PiBUaGlzIHJlcXVpcmVzIGFu
IHVwZ3JhZGUgdG8gcGtnX3dhZi5tay4KWy0tU05JUC0tXQo+ID4+PiArTElCVEFMTE9DX0NPTkZf
RU5WICs9IFBZVEhPTkhBU0hTRUVEPTEKPiA+Pj4gK0xJQlRBTExPQ19NQUtFX0VOViArPSBQWVRI
T05IQVNIU0VFRD0xCj4gPj4gVGhpcyBsb29rcyBzdXNwaWNpb3VzLi4uIFBZVEhPTkhBU0hTRUVE
PTEgd2FzIGFkZGVkIHVwc3RyZWFtIHdpdGhvdXQgZXhwbGFuYXRpb24KPiA+PiBieSB0aGlzIGNv
bW1pdCBbMV0gYmVmb3JlIGxpYnRhbGxvYyAyLjMuMC4KPiA+IEkgYWdyZWUgdGhhdCB0aGlzIG5l
ZWRzIG1vcmUgZXhwbGFuYXRpb25zIHRoYW4ganVzdCAidGhpcyBpcyBuZWVkZWQgdG8KPiA+IGJ1
aWxkIiAob2J2aW91c2x5IGl0IGlzIG5lZWRlZCB0byBidWlsZCwgb3RoZXJ3aXNlIHQgd291bGQg
bm90IGJlCj4gPiB0aGVyZSkuClstLVNOSVAtLV0KPiA+IEJ1dCBsb29raW5nIHQgdGhlIHNhbWJh
IGNvZGUgeWllbGRzIGJldHRlciByZXN1bHRzOgo+ID4gICAgIDE5YTRkM2NhNjkyZSBidWlsZDog
V29ya2Fyb3VuZCBweXRob24zIGhhc2ggb3JkZXIgaXNzdWVzIChmb3Igbm93KQpbLS1TTklQLS1d
Cj4gPiBEYXZpZCwgY2FuIHlvdSB0cnkgdG8gc2VlIGlmIHRoZSBidWlsZCBzdWNjZWVkcyB3aXRo
b3V0IFBZVEhPTkhBU0hTRUVEPwo+ID4gSWYgaXQgcmVhbGx5IG5lZWRzIGl0IChlLmcuIGJ1aWxk
IGZhaWx1cmUsIG9yIHJ1bnRpbWUgZmFpbHVyZSksIHRoZW4KPiA+IHBsZWFzZSBleHRlbmQgdGhl
IGNvbW1pdCBsb2cgd2l0aCB0aGUgYWJvdmUgaW5mb3JtYXRpb24gYW5kIHRoZSBmYWlsdXJlCj4g
PiByZWFzb24uIElmIGl0IGRvZXMgbm90IG5lZWQgaXQsIHRoZW4ganVzdCByZXNwaW4gdGhlIGJ1
bXAgd2l0aG91dC4KPiBJIGZvdW5kIGFub3RoZXIgY29tbWl0IGFkZGluZyB0aGUgb2ZmZW5kaW5n
IHdhZiBjaGVjazoKPiBodHRwczovL2dpdGxhYi5jb20vc2FtYmEtdGVhbS9zYW1iYS8tL2NvbW1p
dC80MjBiYmIxZDkyZmQyYTI4NzI1YjUzZjQyNWJhM2QyMTQ4MzFiNjYwCj4gYmVjYXVzZSBpdCBk
b2Vzbid0IHdvcmsgd2l0aG91dCBQWVRIT05IQVNIU0VFRC4KCkkgYW0gbm90IHN1cmUgIml0IGRv
ZXNuJ3Qgd29yayB3aXRob3V0IFBZVEhPTkhBU0hTRUVEIi4KCkFzIHNhbWJhIGRldmVsb3BlcnMs
IHRoZXkgbmVlZCBpdCB0byBhdm9pZCByZWJ1aWxkaW5nIHdpdGggZWFjaCBjYWxsIHRvCidtYWtl
Jy4KCkJ1dCBmb3IgdXMsIGEgd2FmIHBhY2thZ2UgaXMgb25seSBidWlsdCBvbmNlLCBzbyB3ZSBz
aG91bGQgbm90IGhhdmUgdG8KY2FyZSBhYm91dCB3YWYgYmVpbmcgY29uZnVzZWQgZHVyaW5nIHJl
YnVpbGRzLCBiZWNhdXNlIHdlIGFyZSBub3QgZG9pbmcKcmVidWlsZHMuCgpXZSByZWFsbHkgd2Fu
dCB0byBrbm93IHRoYXQgdGhlIGJ1aWxkIGFjdHVhbGx5IGZhaWxzIHdpdGhvdXQgaXQuCgpSZWdh
cmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4g
RS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNz
JyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwg
XCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3
IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlz
IG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
