Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882BEC282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 20:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 393EA60B90;
	Tue, 11 Mar 2025 20:51:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zEujzn-eb7G4; Tue, 11 Mar 2025 20:51:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6263860B91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6263860B91;
	Tue, 11 Mar 2025 20:51:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5BB91C8
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 20:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8478540610
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 20:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4N3P2pCmJg2 for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 20:51:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5A751405D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A751405D6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A751405D6
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 20:51:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 27E6CB00A48;
 Tue, 11 Mar 2025 21:51:19 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 11 Mar 2025 21:51:16 +0100
MIME-Version: 1.0
Date: Tue, 11 Mar 2025 21:51:16 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Cc: buildroot@buildroot.org, Alexander Mukhin <alexander.i.mukhin@gmail.com>
In-Reply-To: <20250311095831.825806-1-salvador.joseluis@gmail.com>
References: <20250311095831.825806-1-salvador.joseluis@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <20af5043a519e46062c1831087a01793@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741726282;
 bh=bqDJnil6UvdSyxCtxHBINxYAe/R193ZJVWKAq/d3idw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vMd8A1fIVMzY/FJbepydk3rD2saCcXBGC8OsYI0tml/BP5VQT/0OLvGQveGPpN1Im
 ZweBdB8vjmXHNc936OgKTFnI7e2m9V+GA0MyHP5fkgulqT2Hu5hLGL2sQbzscqr8PM
 MSa/WMJLareCMD5QJOiHdl+M76xy6vr/O4Uo2fHM7A6r4KOMsmpCxgzelF1OIDWV5s
 uadhONW31bXCMQEpr9UNkcX/m+uex53b4hsD6PcTo4SmOgzB4lNVi/jwwDTKMbiIyn
 4n5gZPE334+Ndei018WhSxTt/CSOXK2U7nkJFxzHCfr0cYr1NUUoUdNkVzsoo5Doed
 xPOCXZa/hiv/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=vMd8A1fI
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.3.1
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

T24gMTEvMDMvMjAyNSAxMDo1OCwgSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIHdyb3RlOgo+IEZv
ciByZWxlYXNlIG5vdGUsIHNlZToKPiBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVs
ZWFzZXMvdGFnL3pmcy0yLjMuMQo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFk
b3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgoKQXBwbGllZCB0byBuZXh0LCB0
aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
