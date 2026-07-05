Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A25C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 16:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BA6C60718;
	Sun,  5 Jul 2026 16:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ykWcT2ixDXUY; Sun,  5 Jul 2026 16:33:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64C0A606A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783269219;
	bh=aBejyD+wCLf43xmGxlv1W6imJuNVvlq4JsFfmJfjREo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oMLsYSqXb9HdoDQl9oALBt/ZSERMJLS633PdhDeFBkeJqVnWGeJaokNCKkvBhQBGG
	 fTZoInZqQbDYrw8ir0oTbjXIPty4bk72U1CTMyDwIzkAESR2dlJc2EJHJdQ6inwkyS
	 Mmnqs55P5dkj210oqLR76UR+r/05MopYRRW7F0mBEDqknEmZgbRN2zuWfn/2BfHYGo
	 +DU/XTyJAgD7izafRkzLYLJHYJ76plHKfwoK2ve7MhVB6c7rG2h50GztNhX9QDwAEw
	 AoUvDGJGxNAu0SlYUNM1kTLZRqPaSqaeWmkZLNYX72omaOwbFbfqby71LsZ31cGNn7
	 LfDsHNuKdOR0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64C0A606A7;
	Sun,  5 Jul 2026 16:33:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA64C316
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC61F400AB
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZElgccc0Fc1 for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 16:33:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3730400C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3730400C7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3730400C7
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:33:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 013F8B00539;
 Sun,  5 Jul 2026 18:33:31 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jul 2026 18:33:31 +0200
MIME-Version: 1.0
Date: Sun, 05 Jul 2026 18:33:31 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
In-Reply-To: <20260624182117.362190-1-thomas.devoogdt@barco.com>
References: <20260624182117.362190-1-thomas.devoogdt@barco.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <c2a07ec87530f4bc88b4381bb70f6387@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783269215;
 bh=5kL7+w/ouUVGsrqslcOqy/TMEVKrSElxLA69lDUbgso=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D+R1eED/JiTBuPIvdz8k+eOkdSdtO5x7OjhrGCyxwELTITdxaOqVfSM44lM9gpBr6
 6al4Ns/44cwJHyYA2TJOQ0/39wedwoeVPiwqrkHWTDrdCQrVePnLZxgsxBLN3O8JiH
 MesqqMIIVv4ZpXVxJwT4HTwlPJVfJ8bYxPaqrRgPUeiF1JON0exQTYDOWkSQHmH46w
 DqDNzQL9yXY7qD2PGWzuvMm3Jt5ctBiWkx8fYuwK0axLcMikmu6/Tn+an7UDh1kx9m
 h+blVdIJml2ldAZs8kUyj8Qtj1c18PHLMbL80IP6+GML9XeOzGfg6AsqAsMQWn/Dny
 upefxUgj+cFWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=D+R1eED/
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: bump to version 2.52.4
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 24/06/2026 20:21, Thomas Devoogdt wrote:
> Release notes:
> 
> https://webkitgtk.org/2026/06/02/webkitgtk2.52.4-released.html
> 
> Fixes the following security issues:
> 
> https://webkitgtk.org/security/WSA-2026-0003.html
> 
> Includes fixes (among others) for CVE-2026-28847, CVE-2026-28883,
> CVE-2026-28901, CVE-2026-28902, CVE-2026-28903, CVE-2026-28904,
> CVE-2026-28905, CVE-2026-28907, CVE-2026-28942, CVE-2026-28946,
> CVE-2026-28947, CVE-2026-28953, CVE-2026-28955, CVE-2026-28958,
> CVE-2026-43658, and CVE-2026-43660.
> 
> Also added 
> 0001-REGRESSION-313606-main-Fails-to-build-with-system-ma.patch,
> to get webkitgtk compiled when -DUSE_SYSTEM_MALLOC=ON is in use.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to master.

Since this bump fixes several CVEs, I added the "security" mention in 
the commit title.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
