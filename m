Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A587C369A2
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 17:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B95D760AB1;
	Tue,  8 Apr 2025 17:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELiC6JItJExJ; Tue,  8 Apr 2025 17:24:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7A8560B7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7A8560B7D;
	Tue,  8 Apr 2025 17:24:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 071B41F1
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0407A40B90
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X5fge6yxrxZW for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 17:24:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2BC6240077
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BC6240077
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BC6240077
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:23:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 11D2C78032A;
 Tue,  8 Apr 2025 19:23:55 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 08 Apr 2025 19:23:55 +0200
MIME-Version: 1.0
Date: Tue, 08 Apr 2025 19:23:55 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Mattias_Walstr=C3=B6m?= <lazzer@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250408094158.3725214-1-lazzer@gmail.com>
References: <20250408094158.3725214-1-lazzer@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <96544a0d69f7f46ea6688c4d04183dad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744133038;
 bh=yYyT8HhKelcAJr4+A+MAv6GOUs2bHG6ajMaK+gLKmWg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F3rr4XvsBRbALsv09j47fZBAf0nVnOVXvtxF+uBWF5M4k0lVC+FNm6qN8vHjY+nhQ
 ONz7jtJYlVAhX9APB+fPCaWPiO05S6dpmAmejyKPmHcE1i6V6EHVbA9B1VsYqD7hyZ
 QKzZqzwdJOVMylXQ/6PFST0ZYZb9rFtaNx0zQvdARVH4KjzkFpL+WJn9YxyOjcBvQA
 AemFOnlkVau4FXFa/HaZ9XWSKnpT4z7tZDnUiBdTYIhZrOgx0MNI8zWPvIaHIkLdOS
 /XfJHRC7lasr2RqNk5xC0P9v/RA2nFoPiOWIjjzoTjk+PCWSzA1tHMHn6kBFPPH2Ss
 byjy5WA0dUyYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F3rr4Xvs
Subject: Re: [Buildroot] [PATCH 1/1] package/ethtool: bump version to 6.14
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

T24gMDgvMDQvMjAyNSAxMTo0MSwgTWF0dGlhcyBXYWxzdHLDtm0gd3JvdGU6Cj4gQ2hhbmdlbG9n
Ogo+IGh0dHBzOi8vd2ViLmdpdC5rZXJuZWwub3JnL3B1Yi9zY20vbmV0d29yay9ldGh0b29sL2V0
aHRvb2wuZ2l0L3RyZWUvTkVXUz9oPXY2LjE0Cj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0dGlhcyBX
YWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
