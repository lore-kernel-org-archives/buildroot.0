Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B32CCD199
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 20:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F34080DEF;
	Thu, 16 Oct 2025 20:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKZvoM1nbgpz; Thu, 16 Oct 2025 20:17:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D0C080DE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D0C080DE7;
	Thu, 16 Oct 2025 20:17:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60FF0968
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4787A80DE7
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3QEtK-SjKTS3 for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 20:17:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 76B048052E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76B048052E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76B048052E
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:17:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E835F19F5C2;
 Thu, 16 Oct 2025 22:16:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 16 Oct 2025 22:16:56 +0200
MIME-Version: 1.0
Date: Thu, 16 Oct 2025 22:16:56 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251014161134.2592291-1-buildroot@bubu1.eu>
References: <20251014161134.2592291-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <6dd8cff7f2d0e28f1e92c49b5645a094@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760645819;
 bh=jtdr1xmlnQpk85peirJcqVsmRvY4V5h9t+6Av6NCydY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cmY/oftl/He+Hdea5IBjcYPT+7/kldFZj9vgf4ZPrS6yc2dQLyaLP1alYouW43PsW
 5zsuw4swU5U5ymmFv7UoV+lVdHw/4F/NsFUAHqwq9saGS6FwqTdGT21JKKjbCh8tLZ
 pdgz8BODdRADLroyN4iF1Oh3gZUNkD5IssCJrddDOwhs1gDA0JGmqDtY/GBX0s328w
 lkWeyU+7Y1RVBN4QCWb5BbroPdiMyKP0YDpGDGsTUopwJE3tvlCI3XIIaAUFe/emIk
 hs8W2LrWOrZDqwrEvpn7d+GuWQGN/EyH80Aybga1VdJh67zQe4fQ9ELi96smwkHTvL
 yG0TXdkevvbug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cmY/oftl
Subject: Re: [Buildroot] [PATCH] package/python-trio: bump to 0.31.0
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

On 14/10/2025 18:11, Marcus Hoffmann via buildroot wrote:
> Changelog: 
> https://trio.readthedocs.io/en/latest/history.html#trio-0-31-0-2025-09-09
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
