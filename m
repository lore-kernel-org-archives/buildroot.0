Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD2EC61DCB
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 11:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAB9680ECB;
	Fri, 28 Aug 2026 11:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJzS0tJJRWce; Fri, 28 Aug 2026 11:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787918027;
	bh=+U3tu/uU9NCIt7/Fdmwp/VxGXqWN3V3PBd4t7IMKrm8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KRVgqr0y1mkPY1WrK76bJXbvisgBHRMSBDEoRPLvfDxjPCIMSX7JusFpkVut/nY3J
	 033sfqLaKgS9fb0rhQKDkCSik2IdeqjFzRrtV68ZxsaH3tcmKhSEoVuZZ0jk/Ss+ls
	 g/UFU4jj4grIHo0ZAc4PUM3KsWaTwCw7sISLyI5NUGjQy6fffqDSLxVpuJCLXsd47T
	 mFNb1CxovsWZIkPoprF3bmUbMPc6crnT84EvQc7HZN8xsV4a5IBcttYoOT0V0uYNJm
	 S8oVOcZXcytokSXTiGcpVT1EM2ki8EyV68xkdwmPr7r+4ByBD79CtaBmHpm0r0VI8T
	 mkDlPpzkLkHRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED67F80E6A;
	Fri, 28 Aug 2026 11:53:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C309B105
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 11:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B57F04077E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 11:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BhApGzN9YVlg for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 11:53:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE23B4076B
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 11:53:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A31B5780331;
 Fri, 28 Aug 2026 13:53:40 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Aug 2026 13:53:40 +0200
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 13:53:40 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260827110603.3318017-1-giulio.benetti@benettiengineering.com>
References: <20260827110603.3318017-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <c11098caf44da81cbb6445e5da36c7f0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 14.4.0
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

On 27/08/2026 13:06, Giulio Benetti wrote:
> https://github.com/harfbuzz/harfbuzz/blob/14.4.0/NEWS
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
