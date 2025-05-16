Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B93C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 14:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C63DB83145;
	Fri, 16 May 2025 14:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHDRd_q3I_tT; Fri, 16 May 2025 14:34:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F38E2830D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F38E2830D7;
	Fri, 16 May 2025 14:34:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CCE621AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2715830D7
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6kKfXtP76ZK for <buildroot@buildroot.org>;
 Fri, 16 May 2025 14:34:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C0B7882BBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0B7882BBC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0B7882BBC
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:34:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 0DBB9780368;
 Fri, 16 May 2025 16:34:05 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 16 May 2025 16:34:05 +0200
MIME-Version: 1.0
Date: Fri, 16 May 2025 16:34:05 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250516134151.203697-1-thomas.petazzoni@bootlin.com>
References: <20250516134151.203697-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <fc1952f41c1a83e4e567134c60c2bbe5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747406047;
 bh=6bFRLCaMxyi28vBNjeT3ZNO57LE3BtatrHlZJ5sL5ws=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NCqbs+gxtFDQiMvDrCpfrGPPcfZoVSg9+Uy+9us58vR5xZHg1dueHaR6qbwaTGa9K
 UPU94Kvj9M9XrlyZr0JH/CGHZmIDmmF/H4ygFVUNg3tVHss2t97cuTD2iJf5wiWUBt
 uh1uOeI+IuazHenu4xf32ksd18jbyNlW9X3aVIzIwulqW7R0/lyN7WDrnH+l8uerCt
 cp/AkXUlKd57+gdQk7OFFN2+YvcXVtJLsF3rjK4UIKSLuUliAhyoqUsNYcDk37ctDs
 tr3HVMrgq7PeWeEx0o9HklJ+bx+Ht9lCn5qqcq74faCUaAkVL9GIlkj22i1HF++ezg
 lf1PKkM1gRrvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NCqbs+gx
Subject: Re: [Buildroot] [PATCH] package/android-tools: add patch to fix GCC
 15.x build issue
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

On 16/05/2025 15:41, Thomas Petazzoni via buildroot wrote:
> host-android-tools fails to build when the host gcc version is >=
> 15.x. A simple patch allows to fix the issue by adjusting how
> allocate_inode() gets called.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.org/results/e8152490540ee1968182f4eb7813e5e940f3e9b3/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
