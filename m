Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA5AC5B572
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 19:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34803813BD;
	Thu, 13 Aug 2026 19:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WafRSBbECvxO; Thu, 13 Aug 2026 19:40:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE8AF813A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786650052;
	bh=IRVvTSJW4JGuwdLjhHW1zEAz12gzkTWH/6GmL5AHAEk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KeQu+LUJOKpaYnLbyaRA3hroDIAs4CKQ+QYJ+BVVEjqs83jMg738N/ibB7qMJhdWU
	 mwHufX/4BoZjNlXhICG7sl/zXgw5SRU5OJABQfSUpUbUUfMEXj0MflalR4HlPUZgWD
	 Ts4gKUMVO/ofojVByfF3C5NRmi4a+m+ZTyGRxwlXTIZAoCymGWRGUFKF7lAbax1/mS
	 8c9mUyTOKP0kHPsFLC1Fm7MtEeEPLLIRoCHjMvXGBeOE6qFPCN6ICYfl+Xdaz2aP4V
	 LVu3qBE38L74y1CE6EIhBe/XLvnlk80Sqzd3M9KWSJVFrvxPDZfcfNaN4JCWcmvU3w
	 oXsW377jcVyKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE8AF813A1;
	Thu, 13 Aug 2026 19:40:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 21B3733B
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FB0140147
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B4V2B47KH_RP for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 19:40:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4649140106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4649140106
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4649140106
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:40:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 781F078035B;
 Thu, 13 Aug 2026 21:40:45 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 13 Aug 2026 21:40:45 +0200
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 21:40:45 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>
In-Reply-To: <20260812085353.419485-1-titouan.christophe@mind.be>
References: <20260812085353.419485-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.17
Message-ID: <59da30984c8e59db752ba897e2a6efbd@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2] package/redis: bump to v8.10.0
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

On 12/08/2026 10:53, Titouan Christophe via buildroot wrote:
> Redis 8.10 is a new feature release, see the changes:
> https://github.com/redis/redis/blob/8.10.0/00-RELEASENOTES
> 
> Since upstream commit 4dd58caa7cc23225b01f31e7bd9a1ed0af7e49ad [1],
> Redis must now be built with `make build redis` to avoid building extra
> modules, which are distributed within the source code archive since 
> 8.10.0
> 
> Moreover, because the default upstream configuration now includes those
> modules, attempting to launch redis-server with this would fail, 
> because
> it cannot load the missing modules. Therefore, we use the provided
> `make sync-redis-conf` to regenerate a full redis configuration that
> take the absence of modules into account, and we install that config
> file instead of the default one.
> 
> [1] 
> https://github.com/redis/redis/commit/4dd58caa7cc23225b01f31e7bd9a1ed0af7e49ad
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
