Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7218FC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4568E60687;
	Fri, 16 May 2025 11:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lHjNPcGCNu_n; Fri, 16 May 2025 11:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8996E608B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8996E608B0;
	Fri, 16 May 2025 11:01:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12AD113D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0415D80ED5
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7FdK-fVuvY1q for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:01:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1840080EBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1840080EBD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1840080EBD
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:01:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id AAAE4B005BB;
 Fri, 16 May 2025 13:01:38 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 16 May 2025 13:01:38 +0200
MIME-Version: 1.0
Date: Fri, 16 May 2025 13:01:38 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org, Gary Bisson <bisson.gary@gmail.com>, Refik
 Tuzakli <tuzakli.refik@gmail.com>
In-Reply-To: <20250506-bump-imx-packages-lf-6-12-v1-1-56ee2884287a@armadeus.com>
References: <20250506-bump-imx-packages-lf-6-12-v1-0-56ee2884287a@armadeus.com>
 <20250506-bump-imx-packages-lf-6-12-v1-1-56ee2884287a@armadeus.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <ab9fda7f6128983aa361359ef0c5dc90@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747393302;
 bh=Drjq7xuvMyEw2oDi+5eFMj1WNI28K8sEYs8j8UQP/KQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RKH1UUl3Sf48yXidOhnAoySMHhxj99UoLc54Gsjj7/8iozRT13Wk69Ie0LSbsh0kX
 nybzApruvB8HU5mhHblIGceZnpIBA/UEKRAcGEJt6JSvl82lt8ZQESPD2IDCmGzYqG
 louOzQOq/VPMG+wl2n2K7jDLMZTHhlhW7mUrK4Yf3MS6ciNeTmTj/QeRZEE11jn1yy
 ZOAwRRtwSjY9Oga1e/eBRjmsKKOzsnK4S0zqUJjl+iytrE39pOJtO1SfA14ZECH506
 IL2KsqRRYMfURvCQ1ZDB8E2yHFcLuz6szqsFCAYjdFIldhC5nv1wFOc13pNm43u4mo
 obepopMTyXdCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RKH1UUl3
Subject: Re: [Buildroot] [PATCH 1/7] package/freescale-imx/firmware-imx:
 bump version to 8.27
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

SGkgU8OpYmFzdGllbiwKCk9uIDA2LzA1LzIwMjUgMTE6MTAsIFPDqWJhc3RpZW4gU3p5bWFuc2tp
IHdyb3RlOgo+IFRoaXMgdmVyc2lvbiBpcyBhbGlnbmVkIHdpdGggTlhQIExpbnV4IEJTUCB2ZXJz
aW9uICJsZi02LjEyLjMtMS4wLjAiLgo+IAo+IExpY2Vuc2UgaGFzaGVzIGNoYW5nZWQgYmVjYXVz
ZSB0aGUgTEFfT1BUX05YUF9Tb2Z0d2FyZV9MaWNlbnNlIGNoYW5nZWQKPiBmcm9tICJ2NTcgSnVs
eSAyMDI0IiB0byAidjU4IE5vdmVtYmVyIDIwMjQiLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFPDqWJh
c3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KClNlcmll
cyBhcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKRm9yIGluZm8sIEkgYWxzbyBhcHBsaWVkIGp1
c3QgYWZ0ZXIgdGhpcyBzZXJpZXMgdGhlIGkuTVggZGVmY29uZmlnCmJ1bXAgdG8gdGhlIHNhbWUg
QlNQIHZlcnNpb24uIFNlZToKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRy
b290Ly0vY29tbWl0L2U5OTExODczYWEyYTk0YWYyOWQ2MmIwNWQwOTFhNTJkNzBlYmJhODUKCkJl
c3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
