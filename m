Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4781AC282D1
	for <buildroot@archiver.kernel.org>; Thu,  6 Mar 2025 21:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0350E40391;
	Thu,  6 Mar 2025 21:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYqOlUbe-Dcy; Thu,  6 Mar 2025 21:09:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBCE040425
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBCE040425;
	Thu,  6 Mar 2025 21:09:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12572F21
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 21:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EACDA403E0
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 21:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZGMNPyNwjjM for <buildroot@buildroot.org>;
 Thu,  6 Mar 2025 21:09:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EFCE340425
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFCE340425
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFCE340425
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 21:09:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8E40513F86A;
 Thu,  6 Mar 2025 22:09:49 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 06 Mar 2025 22:09:49 +0100
MIME-Version: 1.0
Date: Thu, 06 Mar 2025 22:09:49 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250306152545.47047-1-bernd@kuhls.net>
References: <20250306152545.47047-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <f35f27c14743881cd9c18e5b2403683f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741295394;
 bh=257OExnKyZ4fvfCLd9+Y5UCrBwQytGjM5FYq2y/273Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JQjD+iyKZL9I1MFUvMX8q4blfllL5VSBnKk/yhbKqRaRPyi9hBMVL/bQjsd2z3Iym
 0DNqMKfhv8b8OE06bxgYKurw6cMBbcJZK9Ue1u/WaCnwGF+4ljPKe8ql4vocWhPx/l
 VFRGRoTP40d2DvBGHefUMeDOf/3zbuaB2Rr6iaH8n0wsq2k2BX/FIUACA/KWJDQ3mx
 Okrc2MUKtz4U3ciDoFES0C5suj0GtX2Bv+FFoylKDtW7r/dFDfjnkeQ9CgmUKWbuuL
 oxrd7NeOIrVLdLMYEm5AufkEwj6XUpLuD5l8aULrp8/Q48L+dYz03eIyFglWMIa+P3
 kt/6ILheKZ/oQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JQjD+iyK
Subject: Re: [Buildroot] [PATCH/next 1/2] {toolchain,
 linux-headers}: add support for 6.13 headers
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

On 06/03/2025 16:25, Bernd Kuhls wrote:
> And add (and default to) 6.13 to linux-headers.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
