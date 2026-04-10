Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85545F44841
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 11:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 536D582F9E;
	Fri, 10 Apr 2026 11:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7AIOjMql0IXI; Fri, 10 Apr 2026 11:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E98B082F87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775821695;
	bh=XhtJxXz3g+Kt94PHF89iTKEneIbgu2xOElDqBiJjRJo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D0ZKnMvfiTmWWedyLwftXKL3lKTV9dmIsgb4umPp2eds96Q2QTy1AlqufnajgaxKU
	 FxLLPUq8j/knL+bKzkPNkAvJxRaNTiCVXRz2jhYPv1hw3kpzjJ6R63j21HU4eDJ+Ti
	 yxCthzV2MI0rsn5TYbJYb1NPGvCCM2Aq7+KyqsGECnz9wzjFm0j3nqfWGthqMAB6yL
	 y0P4E70OV8dtpqXTvpROEMM/vJcl4GouE1Cpj5XzKyOZWbTUXtS2E+Mlcoogty2L3R
	 wKUXqIyhmeNJM1bUvZ8Ulq+AF+Tc1cLyI3Qhhga5mUwkcpbL3PRNS8dohZK5+OjY92
	 hnQFYfnP35rVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E98B082F87;
	Fri, 10 Apr 2026 11:48:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D2429237
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 11:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B819A40060
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 11:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmFClTkc7-BK for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 11:48:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DF4AA40399
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF4AA40399
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF4AA40399
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 11:48:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 72AF16012F;
 Fri, 10 Apr 2026 13:48:07 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Apr 2026 13:48:07 +0200
MIME-Version: 1.0
Date: Fri, 10 Apr 2026 13:48:07 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260410051908.25055-1-bernd@kuhls.net>
References: <20260410051908.25055-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <67401e738995b75573790bbed1288225@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775821689;
 bh=GgXLxDE4DHtnSzwEgB8efYV3RxyD9dLq+NzeU5nyfss=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iE7QssKzdjI5F0cRNGfXvHZdazOyQakrZHkKngPKcqQg+xjDpIbOYpRlZrvx0Kv9F
 JjLeEvdIL5a7Z3hyBlaOSIaaGaLK7bVn7yM4KlR5wB9Od8l8A+z+oEBB6wIsZijyMM
 nSCMIZ936hGYVBvGUIua42Alv0N/boZwVW0grvpXskP2safTqvyMCSxunu78Qe7GLk
 +sHd8bJtmwgwbGruoGge/Q+pmpBfPMkMRFwnVqK7cFTbH42eXHb084c+M9XzNhCzbF
 94bbXYHbhYrg5C0vjwJiMZ76p/iVlrZtNwuR3hbmpf3vs2WQafb5iIe5FiKdReIC6X
 CksKGPLmN4Hjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iE7QssKz
Subject: Re: [Buildroot] [PATCH 1/1] package/libcap: security bump version
 to 2.78
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

On 10/04/2026 07:19, Bernd Kuhls wrote:
> Release notes:
> https://sites.google.com/site/fullycapable/release-notes-for-libcap#h.x4zn8j3lss6r
> 
> Removed patch which is included in this release.
> 
> Fixes CVE-2026-4878.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
