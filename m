Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B418C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 17:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A099340635;
	Tue, 21 May 2024 17:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LoFzGy698tq6; Tue, 21 May 2024 17:44:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6473540647
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6473540647;
	Tue, 21 May 2024 17:44:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CEBD1C5420
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 17:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86EAA812BC
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 17:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9OfTGTJuhEZ for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 17:44:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6C0D281289
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C0D281289
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C0D281289
 for <buildroot@buildroot.org>; Tue, 21 May 2024 17:44:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 45E8613F879;
 Tue, 21 May 2024 19:44:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 21 May 2024 19:44:24 +0200
Date: Tue, 21 May 2024 19:44:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Message-ID: <ZkzdeFeoYMkyGv7w@landeda>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240510215442.3475120a@windsurf>
 <CAOf5uwkDmcxhWJUFhxjw_GJTiTEO5oEexb0Xjh6aNJx+K_9dXA@mail.gmail.com>
 <ZkwwN1NKZ2o1xMba@landeda>
 <CAOf5uwnVbowN6GCYUxFL0xh2YV9AvG2JTkuyQR6rk+56J=3DLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOf5uwnVbowN6GCYUxFL0xh2YV9AvG2JTkuyQR6rk+56J=3DLQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716313472;
 bh=mLo5GjzjqmGsCSXZoczRp/Iclrjz/9my0tX4VH5Rg10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W5D2dnDRiGuHTyy7KjYasX25q12xVkF1l1GzkKxsYd0Qv0inUC7eUFwU5NqeMvvHc
 IqQJgJUY45UR3k0aqqvJdBZRvbU9gM9l5NcSGFrF21/mUbP9ZZrnzFOx9LSG1oao1j
 DaJgvMztwHnp7jBwWj/1wLNDhzMQcI+/Q/gRO8XEFJsKyEZmDlpFTud08E+qh5575U
 U352XcBjs+jVJoARVS6dT2TAByIk6/Mk77oaYRRzZzmrI1NmXNc93cI+bUYSW4rTPx
 f2U03SsjfXn/alABKPACoozB8q+v/qyXZwc+u4AslRP+rM+b9Ss2stC1kYBZXc9SOy
 etNzW59ueYW1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=W5D2dnDR
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWljaGFlbCwgQWxsLAoKT24gMjAyNC0wNS0yMSAxMToyOCArMDIwMCwgTWljaGFlbCBOYXp6YXJl
bm8gVHJpbWFyY2hpIHNwYWtlIHRodXNseToKPiBPbiBUdWUsIE1heSAyMSwgMjAyNCBhdCA3OjI1
4oCvQU0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+ID4g
SSB0aGluayB0aGUgcXVlc3Rpb24gYnkgVGhvbWFzIHdhcyB3aGV0aGVyLCBnaXZlbiBhbiBpbnB1
dCBzcGFyc2UgZmlsZSwKPiA+IGdlbmltYWdlIHdpbGwga2VlcCB0aGUgZ2VuZXJhdGVkIGltYWdl
IHNwYXJzZSBpbiB0aGUgc2FtZSBwbGFjZXMgdGhlCj4gPiBpbnB1dCBmaWxlIHdhcyAob25seSBz
aGlmdGVkIGJ5IHRoZSBvZmZzZXQgdGhhdCBpbnB1dCBmaWxlIHdhcyBjb3BpZWQKPiA+IGF0IGlu
IHRoZSBpbWFnZSkuClstLVNOSVAtLV0KPiBTZWVtcyBJIGRpZCBub3QgdW5kZXJzdGFuZCB0aGUg
cXVlc3Rpb24uIE15IGlkZWEgb24gdGhlIHRvcGljIGlzIGhvdwo+IHdlIGNhbiBnZW5lcmF0ZQo+
IGltYWdlcyB0aGF0IHdlIGNhbiBlYXNpbHkgZmxhc2guIE5vdyBJIHVuZGVyc3RhbmQgdGhlIHF1
ZXN0aW9uIG9mCj4gVGhvbWFzIGFuZCB0aGFuayB5b3UuCj4gCj4gWWFubiBjYW4gSSBhc2sgaG93
IHdlIGNhbiB1c2UgYW4gaW1hZ2UgZ2VuZXJhdGVkIGFzIHlvdSBkZXNjcmliZSBiZWZvcmU/Cgog
ICAgJCBtYWtlIHBjX3g4Nl82NF9lZmlfZGVmY29uZmlnCiAgICAkIG1ha2UKICAgICQgbHMgLXNs
IG91dHB1dC9pbWFnZXMve3Jvb3Rmcy5leHQyLGRpc2suaW1nfQoKSSB0cmllZCBhIGJpdCBlYXJs
aWVyLCBhbmQgdGhlIGdlbmltYWdlIGZpbGUgaXMgaW5kZWVkIHNwYXJzZSwgYnV0IEkKY291bGQg
bm90IGZpbmQgYSB0b29sIHRoYXQgd291bGQgcmVwb3J0IHRoZSBsaXN0IG9mIGhvbGVzL25vbi1o
b2xlcyBpbiBhCmZpbGUsIGFuZCB0aGVpciBvZmZzZXQsIGUuZy4gc29tZXRoaW5nIGxpa2U6Cgog
ICAgICAgICAgICAgICAgc2l6ZSAgICBvZmZzZXQKICAgIG5vbi1ob2xlICAgIDJNaUIgICAgQDAK
ICAgIGhvbGUgICAgICAgIDFNaUIgICAgQDJNaUIKICAgIG5vbi1ob2xlICAgIDE2TWlCICAgQDNN
aUIKIGFuZCBzbyBvbi4uLgoKU28gSSBjb3VsZCBub3QgdmFsaWRhdGUgd2hldGhlciB0aGUgaG9s
ZS9ub24taG9sZSBzdHJ1Y3R1cmUgaXMgdGhlIHNhbWUKaW4gdGhlIGdlbmVyYXRlZCBkaXNrLmlt
ZyBhbmQgdGhlIHJvb3Rmcy5leHQyLiBJZiB5b3UgaGF2ZSBhbnkgaWRlYSBob3cKdG8gZG8gdGhh
dCwgSSdtIGFsbCBleWVzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8i
XCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8
IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAg
ICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNU
ICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9y
Zy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
