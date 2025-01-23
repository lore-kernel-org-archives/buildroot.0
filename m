Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC65C02182
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 21:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EC4882CB7;
	Thu, 23 Jan 2025 21:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YH59dZiQctip; Thu, 23 Jan 2025 21:19:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 686EB82EB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 686EB82EB5;
	Thu, 23 Jan 2025 21:19:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27C44959
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 21:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 123654048F
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 21:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VD4MxxdlheSF for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 21:19:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4502140264
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4502140264
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4502140264
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 21:19:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0ED1F5FFC0;
 Thu, 23 Jan 2025 22:19:45 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35696])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Jan 2025 22:19:45 +0100
MIME-Version: 1.0
Date: Thu, 23 Jan 2025 22:19:45 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20250121221224.3128817-1-james.hilliard1@gmail.com>
References: <20250121221224.3128817-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <8bb7f709bc3d647af9bcf31966afa16a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737667188;
 bh=XxtDXO0Bg1sErDv34j9/qDWw264kh3IOgVbyu43pSY0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pOESIgI9gCBDA7U6iJLqTU6Jp/jfkvIT37BlN4FXuNH0xSs5M9rEYqJwl9H2ZPp97
 X9VZpJqNOEGaEok4TyzJXzQRPG3X9A1z2c58M6wnFTKZJz5vci5POdrSA+kc/0qab9
 7vW3dBqf7OHzcTBJ4hlmm/YkJXa4jo1b768t5AmOxNqNPaeBPlzbyw142/6CiU8KAU
 t+PGfsUi+TNAqKewA1BQxkBBjGPct3lXIu7Czycc92HmlHb84f09V4oMkXWUN1Ip8w
 T+ivbkQibBIJvTIX666YLJCXr1lS76fCO0nzx9ed1mblC9uInYftAEIgdL3fNbmzH8
 IqN1JyiZSYN/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pOESIgI9
Subject: Re: [Buildroot] [PATCH 1/1] package/python-botocore: bump to
 version 1.36.3
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

On 21/01/2025 23:12, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
