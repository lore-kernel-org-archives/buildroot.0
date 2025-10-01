Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7F5CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 19:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 056FF413BA;
	Wed,  1 Oct 2025 19:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rw379AAq4rbz; Wed,  1 Oct 2025 19:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19E64413BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19E64413BE;
	Wed,  1 Oct 2025 19:54:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F3C0ED
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31315413C2
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VlOxWSuZ7pD1 for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 19:53:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 59794413BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59794413BA
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59794413BA
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:53:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 05A2620039E;
 Wed,  1 Oct 2025 21:53:54 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 01 Oct 2025 21:53:54 +0200
MIME-Version: 1.0
Date: Wed, 01 Oct 2025 21:53:54 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251001165510.3843216-1-dario.binacchi@amarulasolutions.com>
References: <20251001165510.3843216-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <9f80b82f0cc31669a983fde616cddb0d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759348437;
 bh=QatHMsClnXyramiKdzbG/6owR9JgqoA8tRMp0eR99WA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CVNI8FF9mZqtiT5ubKImQBcANe8V+uxL+OnioO011D7rYCgu1GPi2RWxqamqMo+Os
 xynSG7/9dMs4Sjyr1tMr1WTYE3U60nmClzcQ85jfjZyhZJyNUX4ZJkySevXRDvzKYW
 CS2dwOCekvHUWpgHcLCEXjH6q0p+GJZrGd90tzm+7CttivLi98XRh51RvCDam9Nzmy
 +M0uwi0TFQ3BoTQN3mL7LPvyFnOL2VeZZkua6vg6oGwmKsSH/8GxjEH/vsPRwvnMCO
 WttmXt+fo9NFJLKpViWzlVaITnRT6wH/qvPK4iRkq/DJ5T9DhDUlyJBJtBiO24zJvy
 Z/9dUciAIZO8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CVNI8FF9
Subject: Re: [Buildroot] [PATCH 1/1] package/exfatprogs: bump version to
 1.2.9
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

On 01/10/2025 18:55, Dario Binacchi wrote:
> Drop patch that is now upstream.
> 
> Release notes:
> https://github.com/exfatprogs/exfatprogs/blob/1.2.6/NEWS
> https://github.com/exfatprogs/exfatprogs/blob/1.2.7/NEWS
> https://github.com/exfatprogs/exfatprogs/blob/1.2.8/NEWS
> https://github.com/exfatprogs/exfatprogs/blob/1.2.9/NEWS
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
