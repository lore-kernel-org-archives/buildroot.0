Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAB3C282EC
	for <buildroot@archiver.kernel.org>; Sat,  8 Mar 2025 11:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12F0241422;
	Sat,  8 Mar 2025 11:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5peqzSkXsU1; Sat,  8 Mar 2025 11:03:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 927AA40E58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 927AA40E58;
	Sat,  8 Mar 2025 11:03:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 89A011C9
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 11:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BC6040CD9
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 11:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDPqN6EJlgHP for <buildroot@buildroot.org>;
 Sat,  8 Mar 2025 11:03:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3633E41207
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3633E41207
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3633E41207
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 11:03:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1CBD419F5A5;
 Sat,  8 Mar 2025 12:02:58 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 08 Mar 2025 12:02:57 +0100
Date: Sat, 8 Mar 2025 12:02:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Julien Olivain <ju.o@free.fr>
Message-ID: <Z8wj4ZEJGRdf38Ll@landeda>
References: <cover.1740841539.git.yann.morin.1998@free.fr>
 <dee1cb43f9e636b7ccdc7d4602ae0ab438952c3a.1740841539.git.yann.morin.1998@free.fr>
 <549206ba-180d-4ee1-9a5b-a9d99ab2d3d1@gmail.com>
 <CA+h8R2o4L0tMA1SWdp5PMxt3VjWzBj1hhQakK2805RKZ8JUMwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2o4L0tMA1SWdp5PMxt3VjWzBj1hhQakK2805RKZ8JUMwQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741431782;
 bh=QwMYVoa7+hQwsvKSc/BsXtESUsP6k+zBt9VQjTkRjFI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nlcHQ3EyCSkjuLvb0u2Qm4RQXn+usn+Fokhyojg5AyAK7Rd2+BAnIFCtVh39jjhSn
 LKvJ98w1tpcM+2MzM8BNWo0FKnoNj59GdIj2XutpGEsraBehBVQu0lnYMzZMWgfPTk
 IwQQo461aRUXLe17tUrDBsOrcMIIl5qvrOznUOTgZFcGZMC4l4t1VlnYwKWpDIjFge
 akr0f7UaDDgM+mO0XlgqcNfGx3BbMgL/64rfhUiUYn+c/OA0ITxgw7qmhhogiaE5y+
 Q4hvvG+9KrrDhApyLA3QV9aBP2uoJjsW5ad5WJame0oRhYLzHmkRCxSSKtINVUkgIO
 6gFf1wdHIXkmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nlcHQ3Ey
Subject: Re: [Buildroot] [PATCH 9/9 v3] package/podman: new package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hyaXN0aWFuLCBBbGwsCgpPbiAyMDI1LTAzLTA3IDExOjM4IC0wODAwLCBDaHJpc3RpYW4gU3Rl
d2FydCBzcGFrZSB0aHVzbHk6Cj4gT24gRnJpLCBNYXIgNywgMjAyNSwgNTo0MOKAr0FNIFJhcGhh
ZWwgUGF2bGlkaXMgPFsxXXJhcGhhZWwucGF2bGlkaXNAZ21haWwuY29tPgo+IHdyb3RlOgo+ICAg
ICBPbiAzLzEvMjUgMTY6MDUsIFlhbm4gRS4gTU9SSU4gd3JvdGU6Cj4gICAgID4gK8KgIMKgIMKg
IMKgIMKgIMKgIMKgJChQT0RNQU5fUEtHRElSKS9jb250YWluZXJzLmNvbmYgXAo+ICAgICA+ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCQoVEFSR0VUX0RJUikvZXRjL2NvbnRhaW5lcnMvY29udGFpbmVy
cy5jb25mCj4gICAgID4gK8KgIMKgIMKgJChRKSQoSU5TVEFMTCkgLUQgLW0gMDY0NCBcCj4gICAg
ID4gK8KgIMKgIMKgIMKgIMKgIMKgIMKgJChQT0RNQU5fUEtHRElSKS9wb2xpY3kuanNvbiBcCj4g
ICAgID4gK8KgIMKgIMKgIMKgIMKgIMKgIMKgJChUQVJHRVRfRElSKS9ldGMvY29udGFpbmVycy9w
b2xpY3kuanNvbgo+ICAgICA+ICvCoCDCoCDCoCQoUSkkKElOU1RBTEwpIC1EIC1tIDA2NDQgXAo+
ICAgICA+ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCQoUE9ETUFOX1BLR0RJUikvcmVnaXN0cmllcy5j
b25mIFwKPiAgICAgPiArwqAgwqAgwqAgwqAgwqAgwqAgwqAkKFRBUkdFVF9ESVIpL2V0Yy9jb250
YWluZXJzL3JlZ2lzdHJpZXMuY29uZgo+ICAgICBKdXN0IGZvciBjdXJpb3NpdHksIHdoeSBub3Qg
aW5zdGFsbGluZyB0aG9zZSBmaWxlcyB1bmRlcgo+ICAgICAvdXNyL3NoYXJlL2NvbnRhaW5lcnM/
Cj4gSSBhZ3JlZSB0aGF0IGFzIGZhciBhcyB0aGUgZGVmYXVsdHMgd2UgaW5zdGFsbCB3aXRoIHRo
ZSBwYWNrYWdlLCB0aGV5IHNob3VsZCBnbwo+IHRvIC91c3Ivc2hhcmUvY29udGFpbmVycwo+IFsy
XWh0dHBzOi8vZ2l0aHViLmNvbS9jb250YWluZXJzL2NvbW1vbi9ibG9iL21haW4vZG9jcy9jb250
YWluZXJzLmNvbmYuNS5tZAo+IAo+IENvbnRhaW5lciBlbmdpbmVzIHJlYWQgdGhlIC91c3Ivc2hh
cmUvY29udGFpbmVycy9jb250YWluZXJzLmNvbmYsIC9ldGMvCj4gY29udGFpbmVycy9jb250YWlu
ZXJzLmNvbmYsIGFuZCAvZXRjL2NvbnRhaW5lcnMvY29udGFpbmVycy5jb25mLmQvKi5jb25mIGZv
cgo+IGdsb2JhbCBjb25maWd1cmF0aW9uIHRoYXQgZWZmZWN0cyBhbGwgdXNlcnMuCgpTZWUgbXkg
cmVwbHkgdG8gUmFwaGFlbCwgdGhhdCBleHBsYWlucyB3aHkgSSBjaG9vc2UgdGhvc2UgbG9jYXRp
b25zIGZvcgp0aG9zZSBmaWxlcy4KCkknbGwgbW92ZSB0aGUgY29udHJhaW5lcnMuY29uZiBmaWxl
IHRvIGl0cyBwcmltYXJ5IGxvY2F0aW9uLCBpbgovdXNyL3NoYXJlLywgaW4gdGhlIG5leHQgcmVz
cGluLgoKVGhhbmtzIQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBB
U0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNv
ZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAg
fAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAg
ICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8g
fCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
