Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72488E77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 20:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 422AD6103B;
	Tue, 14 Jan 2025 20:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTJwQfONM1-q; Tue, 14 Jan 2025 20:21:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 670296103D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 670296103D;
	Tue, 14 Jan 2025 20:21:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0141B89
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCCFC6103D
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E9YhChX9G-kD for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 20:20:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 76A4A6103B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76A4A6103B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76A4A6103B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:20:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BED426012D;
 Tue, 14 Jan 2025 21:20:53 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56840])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jan 2025 21:20:53 +0100
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 21:20:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Cc: buildroot@buildroot.org, Alexander Mukhin <alexander.i.mukhin@gmail.com>
In-Reply-To: <20250114013411.1772357-2-salvador.joseluis@gmail.com>
References: <20250114013411.1772357-2-salvador.joseluis@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <b7726b80cec57822e45edbc5691b707b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736886056;
 bh=NGcxG7w+4kNz5F8Y50mdFLkIR0y/709JtQLTjR0X9/0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KlJSRMd8FzcegXRMERcnxXR4aMBsCkAmJF/DB8PaKbPLBh5PcGnCLQTlH5twwqAe1
 SPhiDhW4znEpDNiMaoQlUGStTEIEWQGHPZmA3r7MdA1cYIUvQXKdgsovX3FWhBL5Km
 bzk8/+v9Xl4bmqTEdzZGPh9B3ptU/urPmV7oRjk/aTPDZgAJM0Wcl8ScWGXl4cARs8
 A56DNLTRVTXF5oSoHHClQK6SmHN350FRFs6nCl3JsmAcsubQx/UXP4mtHwiQ+PwvLa
 B3MyDFiSkC+jPBCePMmvM6D1UyR+JmnrTafx2hks+kSQlUyMsclnwwC0WQVk1FJhap
 lkAPiWa+56r4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KlJSRMd8
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.3.0
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

T24gMTQvMDEvMjAyNSAwMjozNCwgSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIHdyb3RlOgo+IFNp
Z25lZC1vZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNA
Z21haWwuY29tPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
