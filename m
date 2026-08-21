Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918D6C5DF8C
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 19:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0D4481193;
	Fri, 21 Aug 2026 19:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLZdNAi2QRAJ; Fri, 21 Aug 2026 19:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787341726;
	bh=e3464kY3SclRa0B0q9rPc1mtGOiCy/qBrfj1IuKjUXE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j5s4248ITcmvwxRS5djUIrfve+LM30It1XZ4yG/rXfQ6/513pQmdqEaFkTX6A2FaL
	 pS09h/UkOEWdFtQkvHw9xU+zu+vO/UH7DkM/wyz4gf5N7GpZQUJMpEMEY0TWjC9o5m
	 dOz1vt2CAc4ECZLavpx3B55bgrMZ6uQyrRF78DzgAKLnY23UvbakPW1/T+FNm0Qyk2
	 MB+x5u0glb8xmeTZw//xECLBHCCWy6YN0S4/OpLlp+KAx/ZjAWsDgZFQo04S18+gCx
	 v0I6cTUh1naHtrHcqo+hewLSHpZQtifBt5Ha6O05RoqNzLalsAzDnkBx3vIWlDfSHM
	 ChyNxudsp0klQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C305E8116A;
	Fri, 21 Aug 2026 19:48:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3013393F
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21C8C4024D
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AHLbcSEZLam5 for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 19:48:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF9AF40096
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:48:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 902FC19F54D;
 Fri, 21 Aug 2026 21:48:39 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Aug 2026 21:48:39 +0200
MIME-Version: 1.0
Date: Fri, 21 Aug 2026 21:48:39 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260819162406.1945796-1-romain.naour@smile.fr>
References: <20260819162406.1945796-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.18
Message-ID: <b27740a31c2e342e02eeb5f56fbebb57@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/gdb: fix gdb default version
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

On 19/08/2026 18:24, Romain Naour via buildroot wrote:
> We need to select one of the 3 gdb versions available when host-gdb is
> not selected but the condition was removed while removing gdb 14.x
> in commit [1], so gdb package fail to download the archive.
> 
> Select BR2_GDB_VERSION_16 when !BR2_PACKAGE_HOST_GDB.
> 
> [1] 6737c90bc6f89cf0c702707933207dd7c5e3398a
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/15969219536 
> (TestGdbFullTarget)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/15969219539 
> (TestGdbserverOnly)
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
