Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70E8CF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 09:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 964D96063F;
	Sat, 21 Sep 2024 09:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTFefOkYFFkA; Sat, 21 Sep 2024 09:52:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 908D860652
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 908D860652;
	Sat, 21 Sep 2024 09:52:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF3561BF3D5
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 09:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DED9981EAC
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 09:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3B3VCVgt5Nul for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 09:52:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A16BF817AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A16BF817AC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A16BF817AC
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 09:52:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0A8E56012F;
 Sat, 21 Sep 2024 11:52:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Sep 2024 11:52:37 +0200
Date: Sat, 21 Sep 2024 11:52:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <Zu6XZXX1bCgd2jFP@landeda>
References: <20240919202026.723863-1-yann.morin.1998@free.fr>
 <e35baa79-3f30-4a85-b811-d3d662e6f96a@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e35baa79-3f30-4a85-b811-d3d662e6f96a@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726912360;
 bh=F3eGP41y1dpz56xTg+Ir7VpTOHsZrLmhGfnW4jNpHGg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NFLZRyroYKrwtBmk7mtyAhgUr875jE30IuREpdsxIcjka41EvOhD3/PpclGdnvlwi
 RVWS7wLpPgEncNbR1oJx35UhEZnnJL5GTgpHqQE/9Py08v+px3HwV5h7ISP0X3wROE
 rQxI8D7xkZfpU0dL92q8s95+dzjy/RAh/YeDPJNv/44AAJfwU73FcRdfuXTPcOCCMi
 uh2Tpw+kLCexa4WGjUIoF8/hfqevjuCoymxUGcUa5GQhys52MICb0n5OTaUgDcl4aG
 Q3wLHkh1qf1bO0W5Dn1KaqCQbIEjcPY+CPA6cXi6yf7vNfXVziazW5JpRcf0CcHxn3
 p+xUcuiaQzFCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NFLZRyro
Subject: Re: [Buildroot] [PATCH] configs: regenerate all defconfigs
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RWRnYXIsIEFsbCwKCk9uIDIwMjQtMDktMjAgMTA6MDEgKzAyMDAsIEVkZ2FyIEJvbmV0IHNwYWtl
IHRodXNseToKPiBZZXN0ZXJkYXksIFlhbm4gRS4gTU9SSU4gd3JvdGU6Cj4gPiBUaGlzIGlzIGEg
bWVjaGFuaWNhbCBjaGFuZ2UsIGFjaGlldmVkIGJ5IHJ1bm5pbmc6Cj4gPiAgICAgJCBmb3IgY2Zn
IGluIGNvbmZpZ3MvKl9kZWZjb25maWc7IGRvCj4gPiAgICAgICAgIChtYWtlICIke2NmZyMjKi99
IiAmJiBtYWtlIHNhdmVkZWZjb25maWcpIHx8IGJyZWFrCj4gPiAgICAgICBkb25lCj4gVGhlIHBy
b2JsZW0gd2l0aCB1c2luZyBgbWFrZSBzYXZlZGVmY29uZmlnYCBmb3IgdGhpcyBpcyB0aGF0LCBp
ZiB3ZSBhcmUKPiB1c2luZyB0aGUgbGF0ZXN0IHN1cHBvcnRlZCBrZXJuZWwgaGVhZGVycyAoY3Vy
cmVudGx5IDYuMTApLCB0aGUgbGluZQo+ICAgICBCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURF
UlNfQ1VTVE9NXzZfMTA9eQo+IAo+IGdldHMgcmVtb3ZlZCBmcm9tIHRoZSBkZWZjb25maWcuIFRo
aXMgaXMgYW4gaXNzdWUgYmVjYXVzZSwgd2hlbmV2ZXIKPiBCdWlsZHJvb3QgYWRkcyBzdXBwb3J0
IGZvciBoZWFkZXJzIDYuMTEsIHRoZSBkZWZjb25maWcgd2lsbAo+IGF1dG9tYXRpY2FsbHkgZGVm
YXVsdCB0byB0aG9zZS4KCkluZGVlZCwgdmVyeSBnb29kIGNhdGNoIQoKPiBJbiBmYWN0LAo+IGRv
Y3MvbWFudWFsL2FkZGluZy1ib2FyZC1zdXBwb3J0LmFkb2MgZXhwbGljaXRseSBhc2tzIGNvbnRy
aWJ1dG9ycyB0bzoKPiAgICAgc2V0IHRoZSBjdXN0b20ga2VybmVsIGhlYWRlcnMgc2VyaWVzIHRv
IG1hdGNoIHlvdXIga2VybmVsIHZlcnNpb24KPiAgICAgKCtCUjJfUEFDS0FHRV9IT1NUX0xJTlVY
X0hFQURFUlNfQ1VTVE9NXyorKS4KClllcywgSSBmb3Jnb3QgdG8gdXBkYXRlIHRoZSBkb2N1bWVu
dGF0aW9uIGFjY29yZGluZ2x5LiBCdXQgaW4KcmV0cm9zcGVjdCwgSSBjYW4ganVzdCBub3cgc2F5
ICJJIGp1c3Qgd2FudGVkIGZlZWRiYWNrISIgOy0pCgo+IEluIHRoaXMgcGF0Y2gsIHRoZSBpc3N1
ZSBhZmZlY3RzIHNpeCBkZWZjb25maWdzLCBuYW1lbHk6Cj4gICAgIGJlYWdsZXBsYXlfZGVmY29u
ZmlnCj4gICAgIGlteDhtbl9ic2hfc21tX3MyX2RlZmNvbmZpZwo+ICAgICBpbXg4bW5fYnNoX3Nt
bV9zMl9wcm9fZGVmY29uZmlnCj4gICAgIG14NnVkb29fZGVmY29uZmlnCj4gICAgIHRpX2FtNjJ4
X3NrX2RlZmNvbmZpZwo+ICAgICB0aV9hbTY0eF9za19kZWZjb25maWcKCkknbGwgc2VuZCBhIG5l
dyBwYXRjaHNldCB0aGF0IGFjdHVhbGx5IGFsbG93cyB1c2luZyBzYXZlZGVmY29uZmlnOyBJCmp1
c3QgbmVlZCB0byB0aGluayBhIGxpdHRsZSBiaXQgbW9yZSBhYm91dCBpdCAoSSB0aGluayBJIGhh
dmUgYQpzb2x1dGlvbikuCgpUaGFua3MgZm9yIG5vdGljaW5nLiDwn5GNCgpSZWdhcmRzLApZYW5u
IEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4g
IHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGly
YWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBB
SUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0t
LS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cnwg
aHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8
ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
