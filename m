Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A47E77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0883583A8B;
	Sun, 12 Jan 2025 11:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3LzmkYv26RA; Sun, 12 Jan 2025 11:14:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20EF083AD1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20EF083AD1;
	Sun, 12 Jan 2025 11:14:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18091942
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E747860B99
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OrjL6Oztg3Mz for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:14:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F04660AD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F04660AD2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F04660AD2
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:14:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D4FF360141;
 Sun, 12 Jan 2025 12:14:19 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35902])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:14:19 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:14:19 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111165856.2900513-1-james.hilliard1@gmail.com>
References: <20250111165856.2900513-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <f630b9351065ca9c0c2913e5d815c906@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736680461;
 bh=AtTB/m/tSQlDdXSn65+Zcek/kK1z1o8wJMbNDWsYdNk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fr5ov0NQz0xrnzmD7vjgSJPYdY4MA6zMMY9XM3dtXlyhFcUG9OZE0ODhA44daAkDY
 qygIRxLl3ToIPVMkkZIDJItwSk0chskRlxRTWJDPD59S6H3lamIJN9adWLgSi5412W
 GOmEHheuwWVj35meQRBT58wUuBYw/aonLljyrkjeEqyeQBdO8u52Oc/Eb0gPaDVuAA
 OZRkMBuwgEiDZ+JXvNC19rcvotmUrLmScunhGvvne6S6szgamuIaqqBTIWI5cYIHUy
 Vt6cWQfPSev9NMjIvuU/AdB2yKmtTKqUHFX2ob3MbO+jPvh/OTAjKfubdxlLNoqlgn
 8xQIH0kAslDFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Fr5ov0NQ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-selenium: bump to
 version 4.27.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/01/2025 17:58, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
