Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E36BCA5FD4
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 16:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C91E140C89;
	Thu,  1 Oct 2026 16:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXtG_DUFmBop; Thu,  1 Oct 2026 16:56:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 12DA540C00
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790873812;
	b=luS+JZn+ktgj5LkMSEE2TE3daJoLHVCLxgzvq4KbuTOSEb9Oox9bju50/Czp2wMFy/DL
	 otBZE5VRLc5WicMuMoQyU9T6RZb3rY0ARWOzOVniasaQZK/CSSa2Keads5qmQxM3C0fqa
	 rQNHPdKsnF0+X5qZ1w8kLrt3QF4RTNIeaychKhQvbb7ms4SiFis5a8jSfafh0ihOI/W15
	 n3CVNsIH8pUWYhGLx4jHlWcXZ2dsYNKWzgA+qbeUY8pVOTmoBtYT2Fnh6yxmIN2sjnk5y
	 c8KRt2RtJSWZfoRItVLE/Jsh371aytSdTKj6n76dAKLNMMb4j3Kbs9+qjOiNKc/sDUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790873812;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=CmkmdF3z9ljTXKxsmUUJCuCTmmv4ip3avZnCeE+7AKs=;
	b=mBt4qsvQsEdsVXyntDftRh6SK8zhKPPsRg0fwNExgeR4DMf3lI7ZeynZ8Pq1gIQchNTY
	 NboTH3ziOfIl/Fc/xrHkiiSbtXXeTJ3T0RTjrIzMK1bO/d8LsReady0SiO7+ICNwub61E
	 /W1zfbs2Wu1Ban/tURHD4Y6qmwgj98ZnO0pN4XJvpCg2HXX64zDkPpBcw1OhgQ8ME8gLQ
	 vGL5D41gkqpnPHfunqOFrYYxcJS2tpvzMjvgmt6IIy7Q3yzKhpnTkyEavCTm/UvGSrriX
	 KNyLCl6AXMF79CJYacsp9xOsYcmAP8KDw0a2yunwjq1JzNAMS98E3Mx8MtFkwDcSOsQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790873812;
	bh=CmkmdF3z9ljTXKxsmUUJCuCTmmv4ip3avZnCeE+7AKs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cRtRzKTPou+6hzWhYGorxjxKt0Qc2U2NcWozIJVfEl8n5kVMf91joBvPanvj4WmFe
	 CEjV8ITg/NAkTsG7PHDW13qgqbusmAGGrioJmRpVEuTdDhnOwJSrioAYYdc4s/3JbX
	 ghtOsvb2awCU/lAKyscseA720fV3fkREz2ct+Y2qqlryC9u4AB9YwO9GS6wlaCpL16
	 No7sB3VgSiCUBRl+8/bNfcwFqaUv3t3WHONN4/2DK/Rn4CQ5XH3oQqLM4dYNuuEmb7
	 HluHt7BCind3Sn0csOwGATB6mP6Qh2zBb30SRmIbU0+RkwtDSmx39CMw3jU4VQJpqW
	 IWOtOxzr4RORQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12DA540C00;
	Thu,  1 Oct 2026 16:56:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3517332A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1ACD18118B
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RnpsL0gFBe9L for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 16:56:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6E6638117F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790873810;
 b=h+xr9YI43Z0J+MiVrMYrkqpNMXVFl1+TzhNs75Czd/OC/TFiQIuRZyYrvUfeliJc1PYP
 9S0f5HCGl9O2bL623WPmQiRvZU3L+Nz3jqKZslLOtCGPKQokoFuDNQ/niwjDuTXLq5vgS
 dC0+Od8s0O5Da524VnOJJldNHZR/lxohWvWN/gAyRsqR8WFUwvFMUnxcgvdr+O4rmN1A/
 bdb6dDGoKZXIlh5kF7al4E7rB8tB+9N8w0FN7HbwCTlnO2MPjzVqsbCo4E2tHks0XStEE
 tauddjzNPs8eCcAZKAlKxZsEAaBohpAOok++xQv+IiXPp4Mc1xmTMyQNj7XCXQ/nb+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790873810;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=LzHqcL+pu4yaCmMk66b0xM8VrX3Un1sNgyMtif927zg=;
 b=W1FTuXX1TqXwpvEaKyCQW2iAgw3ZjGipBec6/grxYEykcvk+TqEb4fEKfQZzbwkInop8
 9Xs1Ahhvquykakc7Qq2ILNPZV4vKFmR9xwUE0/gXDT/gdurUioIAqzC00H39XYiQManGQ
 q2kJ4U56kSxcrjBdHHGgOf+IhlE6HqXsbzdvaNPpOCxwRGwbMZoUxmmwKFdvHLmkZfAcW
 9mFcVEuhAIRAyxCnO69RrDgpAgAK+QcXe8cx8Z5/Rad9yNS/cxNNxetbaatNfJ8gOA+Ij
 Rnc2alioSbTvDYwQRnU37nppo8icoO6hi+P8FEOm5xGzlhwFen8iu6rJra7RxMvTX+g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="LpA3aLs/"; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E6638117F
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:56:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 098CD19F73D;
 Thu,  1 Oct 2026 18:56:45 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 01 Oct 2026 18:56:45 +0200
MIME-Version: 1.0
Date: Thu, 01 Oct 2026 18:56:45 +0200
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260930105825.462957-1-raphael.melotte@mind.be>
References: <20260930105825.462957-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.19
Message-ID: <06a58853482e5b8ecf1723f26046bebf@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/harfbuzz: add upstream patch
 fixing builds with old gcc
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

T24gMzAvMDkvMjAyNiAxMjo1OCwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBCdWlsZGluZyB3aXRoIGFuIG9sZCBnY2MgdmVyc2lvbiAoZm9yIGV4YW1wbGUgd2l0aAo+
ICAgYm9vdGxpbi1hYXJjaDY0LWdsaWJjLW9sZCkgY3VycmVudGx5IGZhaWxzIHdpdGggdGhlIGZv
bGxvd2luZyBlcnJvcjoKPiAgIC4uL3NyYy9ncmFwaC9ncmFwaC5oaDo2Mzg6MTI6IGVycm9yOiBj
b3VsZCBub3QgY29udmVydCDigJhn4oCZIGZyb20gCj4g4oCYZ3JhcGg6OmdyYXBoX3TigJkgdG8g
4oCYZ3JhcGg6OmdyYXBoX3Jlc3VsdF90PGdyYXBoOjpncmFwaF90PiB7YWthIAo+IGhiX3Jlc3Vs
dF90PGdyYXBoOjpncmFwaF90LCBncmFwaDo6Z3JhcGhfZXJyb3JfdD594oCZCj4gICAgICAgIHJl
dHVybiBnOwo+IAo+IEFkZCBhbiB1cHN0cmVhbSBwYXRjaCB0byBmaXggaXQuCj4gCj4gTm8gY29y
cmVzcG9uZGluZyBidWlsZCBmYWlsdXJlcyBvbiBhdXRvYnVpbGRlcnMgd2VyZSBmb3VuZCBhdCB0
aGUgdGltZQo+IHRoZSBjb21taXQgd2FzIG1hZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFwaGHD
q2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgoKQXBwbGllZCB0byBtYXN0ZXIs
IHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
