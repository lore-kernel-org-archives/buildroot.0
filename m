Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C96ED7B9D
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 10:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D46D61CDB;
	Tue, 14 Apr 2026 10:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFNzFLZGeJ8l; Tue, 14 Apr 2026 10:38:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F37B61CD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776163091;
	bh=VgymsRmk0qAc0sewyc12sJGg6PFHIh3JE8oRTFvLxpA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B/5ym2ha5BRUMLiioeO9iLYfq8YfCx90V4tvlcvj66iCpCFvJqpK9rwvQHeHBmCdK
	 73T8U1fvm5hh4OTf/yxCsKa5k8FdTonDqxs5BhZ9KCuNw3yD4fvXw8TV4Z2NJ4bziX
	 O+1DCXt8yQ4uzPicnCv+MC4X7dFxbjSVVbT7GITT3FxGaAB3EbRaB3aVKXv18hcFkG
	 zpxXG0sd2WXpq+UNDkb6h0pDvtg46E2WFr37tj5osVO3NSuaYZCj+KOYeDqFHR6/W+
	 AI4z86rJxeTZTGm9nDXS+02s40Ohx87MvxuhkKAU0DBxFYsNJ5j0rv9kMrV/i0mf6z
	 SFZRc3t1sxXfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F37B61CD4;
	Tue, 14 Apr 2026 10:38:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB9C7375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 10:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCCF784C56
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 10:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RnjKk5KcdQ7g for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 10:38:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 195E084C55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 195E084C55
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 195E084C55
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 10:38:08 +0000 (UTC)
Received: from L13942.iliad.fr (unknown [213.36.7.12])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0B102780375;
 Tue, 14 Apr 2026 12:38:04 +0200 (CEST)
Date: Tue, 14 Apr 2026 12:38:03 +0200
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <ad4ZC9VgKY07gvlR@L13942.iliad.fr>
References: <20260413151148.42226-1-maxime@leroys.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260413151148.42226-1-maxime@leroys.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776163087;
 bh=qukmvdpB6aBggckqZ0gk3UhmajTW99RwGMVxtyvMrPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nklxgc+XbqUFYzDQtazpv2/XV6rK/XipiZ0IeNWa9tDOKv7G5PJ8A+90jy3MxpMWL
 rZCQJbiF3TyzYANt5uB4is2pO89b6HfR0zjiczGhNdI797nGL3K+s2t/jHtzKehK0g
 ke8EnYagUwuRUmsv+tgMeVPXPCnWWFa74cExcnkVV5OUDrwmXbt9aqIDLXZLFF3283
 c9gM0JYwSbmc/pq6RU2zNtsTFO5dXLL9MMhHOsGFvA5j5AxcEjujP3SIhE2h2/LUws
 8XIxH3d8S1SGBIOLWd2rvzVPOPqeaYyYY+Kz0GvmJ4Jep5EwRjdP4adP32+62nF3Vw
 h00Plv9JR6NlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Nklxgc+X
Subject: Re: [Buildroot] [PATCH 0/3] Bump libecoli and grout;
 DPDK packaging improvement
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maxime,

It would be better to send a specific one per package.

My 2 cents,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
