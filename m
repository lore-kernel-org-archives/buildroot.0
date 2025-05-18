Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F056C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 10:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 816DD4081B;
	Sun, 18 May 2025 10:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EN4NI3_iOtS1; Sun, 18 May 2025 10:48:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9C4F40836
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9C4F40836;
	Sun, 18 May 2025 10:48:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 38B18E4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 10:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5F90407D6
 for <buildroot@buildroot.org>; Sun, 18 May 2025 10:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKYtcDLrkcXT for <buildroot@buildroot.org>;
 Sun, 18 May 2025 10:48:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D8D1740811
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8D1740811
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8D1740811
 for <buildroot@buildroot.org>; Sun, 18 May 2025 10:48:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6AE4C780372;
 Sun, 18 May 2025 12:47:52 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 May 2025 12:47:52 +0200
MIME-Version: 1.0
Date: Sun, 18 May 2025 12:47:52 +0200
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>, Joseph Kogut
 <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>, Valentin
 Korenblit <valentinkorenblit@gmail.com>
In-Reply-To: <20250517221131.4172735-1-james.hilliard1@gmail.com>
References: <20250517221131.4172735-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <f15249283a699eeb29060bd2648e7235@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747565277;
 bh=Rmff6UwcJgTE5fu6rOg3YA3RpPDPIcnf5UOTj/08SMw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J2OmJp6Pv6gmXYKZx+fFASWJ96aW14Czr03k6UIk5CE7cghZxGsyA7+4pcSSmtJC9
 LdYlhZYrywAQmNVmtL4HHnk2Tm2TRQIDYxcCK69TVwowdOVd0A3/TDZ/JFExGkF2ER
 3nOvhOE5heAqIFiVy4H26L333SxyRj9mWFPsm5QJombpVsDS8bQsBhuU4xp2e6jtC1
 qP3i1huc/amtYvhRRLVgW4gxFFEbl65uabsbNAf5uVY/NJfKsENGjNUYRgQ2AXucsX
 vqcWIWTR/UP1uq6H30l1BAVELHganHgN20wCNBk/0YdGH7zBdQhzdai2yhL0js+Nwn
 q23U23qcWHfvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J2OmJp6P
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: fix build with
 gcc 15
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

On 18/05/2025 00:11, James Hilliard wrote:
> Adapt gentoo gcc patches from https://bugs.gentoo.org/939498 to fix
> build with gcc 15.
> 
> The llvm project no longer maintains the llvm 15 branch.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Until we review and get llvm 20 bump patches merged, I applied this 
patch.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
