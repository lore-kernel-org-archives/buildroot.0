Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403F3C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 17:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC20240C6B;
	Tue,  4 Feb 2025 17:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hbn4lsMCcsPP; Tue,  4 Feb 2025 17:50:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7EC740DAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7EC740DAF;
	Tue,  4 Feb 2025 17:50:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15DDA12F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0611C80E26
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJ54QcwbSnyY for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 17:50:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BDDD580C07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDDD580C07
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDDD580C07
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:50:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8DAE819F73C;
 Tue,  4 Feb 2025 18:50:23 +0100 (CET)
Received: from host-109-89-232-55.dynamic.voo.be ([109.89.232.55:43530])
 via host-109-89-232-55.dynamic.voo.be ([109.89.232.55])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Feb 2025 18:50:23 +0100
MIME-Version: 1.0
Date: Tue, 04 Feb 2025 18:50:23 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250204-usbutils-libiconv-v2-1-245e490da092@armadeus.com>
References: <20250204-usbutils-libiconv-v2-1-245e490da092@armadeus.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <29d702b3ea2cb1dba852f8ca8f7a3e07@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738691425;
 bh=qokl5EA5wSWJsx+lFcCnWfFmB7cHaYcFEYbfUgDP68I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WikZG+MhSBpTnVlipRpD4Wor68JI5vWvgK1PyWyarW6wdtGw1qyRS4VPpmaotuzAj
 r2+soOJMtmX0w9UktSOHEc85Dbrgxd44VDZfVZxNBjt0DJAvK3sE9FqFERpguaK5zL
 DQe1tmEmRVZSRP0p3U1PhZnBcE4ShIX+Lp6rEl8JvnyBNpV6fVpf/wS5LeLFDfBvaT
 uLilourxjfEGqXk8iIHUTgXuO/jFB9eBUqwhHvb/CwUgZ/nxF2LYA6gZwzcOY7x25e
 vT0n8hbCjUmGjl/DOMvTW+lsZ69L5Q2jPiXssDHtpJwOpltHjVRDtUlAB5dMupZFO7
 F7cUwy+1Thl2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WikZG+Mh
Subject: Re: [Buildroot] [PATCH v2] package/usbutils: select libiconv if
 needed
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

T24gMDQvMDIvMjAyNSAxNjo1NSwgU8OpYmFzdGllbiBTenltYW5za2kgd3JvdGU6Cj4gU2luY2Ug
dXBzdHJlYW0gY29tbWl0IDdjN2ZlZDMwZjc1NTNiNTUxZmNlMzE1MWZlMzE1Y2Y2OWU2MDIwNjUs
IHdoaWNoCj4gZmlyc3QgYXBwZWFyZWQgaW4gdXNidXRpbHMgdmVyc2lvbiAwMDcsIGljb252IGlz
IHVzZWQgd2hlbiBhdmFpbGFibGUuCj4gU2luY2UgdGhlbiwgdGhlIHBhY2thZ2UgaGFzIGJlZW4g
ZmFpbGluZyB0byBidWlsZCB3aGVuIGxpYmljb252IG5lZWRzIAo+IHRvCj4gYmUgcHJvdmlkZWQg
YnkgYSBsaWJyYXJ5IGV4dGVybmFsIHRvIHRoZSBDIGxpYnJhcnkuIFRoaXMgY29tbWl0IGZpeGVz
Cj4gdGhhdCBieSBzZWxlY3RpbmcgQlIyX1BBQ0tBR0VfTElCSUNPTlYgd2hlbiBsaWJpY29udiBp
cyBub3QgcHJvdmlkZWQgYnkKPiB0aGUgdG9vbGNoYWluLgo+IAo+IEZpeGVzOgo+ICAKPiBodHRw
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9kN2QvZDdkZWRiNzU0ODA0MjQyZDAy
MGQxYTBkMzRkZDk1YzdjMTA3NDcxMC8vCj4gIAo+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm5ldC9yZXN1bHRzL2JjYS9iY2ExNGNlNGZlMDVmMDg3ZTFkODgyMTY3MGJhMzE2NWU5ODIwYTdm
Ly8KPiAgCj4gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvNjY1LzY2NWMw
NjRiZjI4YTMyNWE4YmM0ZDlmZTE2ZjQ1M2JlNDg0NzJlNTcvLwo+ICAKPiBodHRwOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9iNTQvYjU0M2EzNzEzOTQ5NTcxYjA0ZGJkOWM5NGYw
NjNmYTBhMTg2NzY1Yi8vCj4gIAo+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1
bHRzLzZlYS82ZWE2Y2RlOTFjMmM2YzQ5ZjU2YTA4ZjM3ZmVmMGMxMzRlZGE0MGEwLy8KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBh
cm1hZGV1cy5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
