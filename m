Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11919C61DD6
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 19:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A474340BCE;
	Wed,  2 Sep 2026 19:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhepOSYVQ825; Wed,  2 Sep 2026 19:26:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 35A6840BD6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788377196;
	b=WCW9yZgoMaccDUYyPqaJd696Ty7QX7L/A+OUKz1w9u4ILteJan+rxwjZh159O6tEudmW
	 P182wqeLttBZfN0UYTZWId4tJDYLgcJmNI6seYRD/LG3mAAWZXG/fI3uVtvp4ZcyIoX1t
	 B0quQzh4P1pX586w0ans1eq6FLje9b9vTvaW5aFCZmWBH+sHybjwWUUr77p+TsXwT+Ywv
	 EJuEhcMhTzAdzS/nL1a/LeNXM60rBSTEa3NXOQ7D7oxY5BZWbN+sNOLTpRuTzFpLV/uHh
	 ruE84G2TH8yysQV7PIFFAwMn7iyPCToCMe045/56LD3f7WMoRRmjNKqhmNi7P4Y/lmg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788377196;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=qpBdazTl02mY55Hm2LgENc/AQMAN3Tap9b+ZB/Dh6wE=;
	b=nQj2+TUpr4rWY5AghC0cCAQiPpKDo/EkMqyRD+Ro5qeIumF/9IQpK8TsENHFz6WXgV87
	 OTdyAS8+QqaoGkCZHZhxTVWEagomT6ZzdLsEa/GSD9XVvJS2ah6NFuT99ZoYaDfLNaP0Y
	 V8SqJZxFuqzcCM20Dc4kZkWwazMzzMjERX+wyNPTlFvBS/ltwFzZtYVJD4/2kKeR6L4z6
	 efwnayz/tKP5+ZT1BfK21DKyKqMtAKnPCazza+gi/mFuP5Sua57ZGkbtsCGUn048qmlMD
	 AT/ZBMaYf6NUap3usEqYrllVdpkeZ4zMmSh8fI77T5CGElb6saXMBxWe/7bArath7tA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788377196;
	bh=qpBdazTl02mY55Hm2LgENc/AQMAN3Tap9b+ZB/Dh6wE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MrVPe8Hk3I0gkCZRP0nCmWXWVbXRiLfpHDXnOgMsiNVPErvtuXzZErJi7CYOuRlTd
	 GXuuPR6rMhGjmlOfFTdXGpUJUg/DwLrBHudOYouR7F6t0ZVJcQyGBI16FXXwp9DyFt
	 ShZ+4rFZBBIlYPbbnqKM1nc2m7ogh6LU0NFuMbOcYypDmTFxY1vhBrkZV0v9z3CEMy
	 agYON1WR6B9NLYomTGnYURlko3z/jx6HQIo9BZI7Ws4h0g+N7bRhVgFs8lbOX7G7n2
	 kN5PotRGqkQB5kP7diHj+wgJv+z5UIxHR2VEOWks6eEWMsHqv3PRByb3iMQO3d9O+S
	 XQ6BEHPy2elzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35A6840BD6;
	Wed,  2 Sep 2026 19:26:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CD581D9
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5318F401A3
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:26:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dR08jWhBHpzj for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 19:26:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 43D1E40177
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788377194;
 b=Rovxc9dD0l/t+Uzh8CQCLoQAR++UgTpSdvn39e6OGa7OPLUN/Yn1TZDPZYmlYgTAmL9b
 WcgQYV9xZ+BzIHMSHSroyQxW9uY/2DGs7voHwBakA/mxajn5YVMJDsoNZ36h5rY4UVa6W
 A007+krBxCqm3yoNvL1y6CZ0qsguyV3nPQwF6rUhTTz5uQEgUZxdNZ1cNxMLKCnAOrwNI
 93xVO0MSKs6wgBGqjn+JRnoKcWlP1UAo9oFn2j/A62aNZMblXgKBNimRfsmZL+wC3rFt8
 TbDpjijIxDVyNrjqzgf4OrRafT3rxzLt+Wdo58VzqFtvMXCQrYiRbqGn600jWqFkR8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788377194;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=UH6GUBHdhQAjdCxnzJ0gdcXR/hQLy6dFJKXXqhr5Y04=;
 b=evf65PbDAvXTHWMr8AIil0cKl7CHKNtsiUthKNqVmrGAs1OvoFN4WJlRQYL+xwAxRYaD
 JGSi0P36zTPXtc6FzroQJe9fzyT5Wk4UzucyyU5HcqaXBgEoYb2lz+imc90V958TVDlQW
 suZZ9q6CVQdTBz3OQsy5dhrPMpf7YaQief10NTintuShwX/z/0Z1884CJmywIC31cqbbz
 Ty0d0GOpeGdMadov+yYuF1DEMf8Tk9OkeNPCL65zcbuY6kBq8ubwCckFq0TgNRpsBSo2S
 u+duhU3vS+2IuO39UlBesuJnfSmRFTyc08Vdm+G7Nu9RW1tmjLuW67UhhEKEou33ksA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=E1hOlIfW; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43D1E40177
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:26:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9CEC519F734;
 Wed,  2 Sep 2026 21:26:29 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 02 Sep 2026 21:26:29 +0200
MIME-Version: 1.0
Date: Wed, 02 Sep 2026 21:26:29 +0200
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260902-revert-openscap-patch-v1-1-f56161b6c7bd@bootlin.com>
References: <20260902-revert-openscap-patch-v1-1-f56161b6c7bd@bootlin.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <956e555ffd8d5ac876e6abd129e1148b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/openscap: drop duplicate patch
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

T24gMDIvMDkvMjAyNiAxMDoxMSwgQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gQ29tbWl0IGJkNWIyNjdiMWRlMCAoInBhY2thZ2Uvb3BlbnNjYXA6IGZpeCBidWlsZCBmYWls
dXJlIHdpdGggZGJ1cyBhbmQKPiBtdXNsIikgYnJvdWdodCBhbiB1cHN0cmVhbSBwYXRjaCB0byBm
aXggYSBidWlsZCBmYWlsdXJlIG9uIHRoZSBvcGVuc2NhcAo+IHBhY2thZ2UsIGRldGVjdGVkIGJ5
IHRoZSBhdXRvYnVpbGRlciBvbiBidWlsZHJvb3QgMjAyNi4wMi54LCB3aGljaCBoYWQKPiBvcGVu
c2NhcCAxLjMuMTIgYXQgdGhhdCB0aW1lLiBiZDViMjY3YjFkZTAgaGFzIHJlY2VudGx5IGJlZW4g
bWVyZ2VkIG9uCj4gbWFzdGVyOyBvcGVuc2NhcCBoYXMgYWxyZWFkeSBiZWVuIGJ1bXBlZCB0byAx
LjQuNCBvbiB0aGlzIGJyYW5jaCwgYW5kIAo+IHNvCj4gaXQgYWxyZWFkeSBicmluZ3MgdGhlIG5l
ZWRlZCBmaXggZm9yIG11c2wrZGJ1cyBidWlsZCBjb25maWd1cmF0aW9ucywKPiBoZW5jZSBtYWtp
bmcgdGhlIHBhdGNoIHN0ZXAgZmFpbC4gVGhpcyB1cHN0cmVhbSBwYXRjaCBpcyB0aGVuIG5vdCAK
PiBuZWVkZWQKPiBhbnltb3JlIG9uIGFueSBtYWludGFpbmVkIGJyYW5jaC4KPiAKPiBGaXhlczog
Cj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2QxMWQwYjgyZGNkYjRi
ZjEwZjZjMzdkYjhiZGJjNDJhNzhiZGYyOGIvCj4gRml4ZXM6IAo+IGh0dHBzOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy80Mzk3YTRlZjk0Y2NmNDgyZjFhYjlkMjRiNjMzNGFkYjAy
MjJhNTgwLwo+IFNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVA
Ym9vdGxpbi5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
