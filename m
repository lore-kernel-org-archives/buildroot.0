Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93F7C02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 22:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A3724179A;
	Tue, 21 Jan 2025 22:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ug30iLUk8NHp; Tue, 21 Jan 2025 22:49:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66D8241794
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66D8241794;
	Tue, 21 Jan 2025 22:49:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B785B959
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 22:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98AD684E29
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 22:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_fJHXkMRH9k for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 22:49:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2C7484E26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2C7484E26
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2C7484E26
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 22:49:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2AB6C19F5BE;
 Tue, 21 Jan 2025 23:49:34 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40672])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Jan 2025 23:49:34 +0100
MIME-Version: 1.0
Date: Tue, 21 Jan 2025 23:49:34 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Cc: buildroot@buildroot.org, Alexander Mukhin <alexander.i.mukhin@gmail.com>
In-Reply-To: <20250121134740.2894756-2-salvador.joseluis@gmail.com>
References: <20250121134740.2894756-2-salvador.joseluis@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <f025a517f55cf9a82d936edc5674f67a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737499776;
 bh=5+qcAW5+pLjdcNvnwP2GZIEZB6wvjLwTk0fK4ZgzU1k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hagsmkEcb2XncR31FcdlK3A+v/qFC5ncxlJMmYYv7oezhu54XLh77LNYo/xYxGw83
 Uv5FlQIkXTSRoYB4mJmpSPfcz5LK3JgbMrcLM23xs3hBtsF+ZmtYm54NJPAzzom2lb
 yce9vxlIPbhje/Skzh38RK4/5ok++lk3u7IGEed8HiRbscnfWk17PN6peOhZVwC5Bz
 tndF3Q0nr5uJN6XPxoX990zrLrEswtETnUEnNVhDLhTSciJcyicRJvNoxpSG1UL6Kx
 dSYDygMBUwhEShxihDD9KvvDmVwwzt7NWDkmmU9h2NLVEN2ZFpI8Hs8L4g56/6gDLU
 KesZGUoRjMbPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hagsmkEc
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: update zfs tests to
 Linux 6.12.9
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

T24gMjEvMDEvMjAyNSAxNDo0NywgSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIHdyb3RlOgo+IFRo
ZSBwcmV2aW91cyB2ZXJzaW9uLCBMaW51eCA1LjE1LjM1LCBpcyBvdXRkYXRlZC4KPiBVcGdyYWRl
IHRvIHRoZSBsYXRlc3QgTFRTIHJlbGVhc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVp
cyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+CgpTZXJpZXMgYXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
