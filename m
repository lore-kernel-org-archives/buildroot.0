Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079BBEE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 14:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B595582127;
	Sun, 20 Aug 2023 14:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B595582127
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BM6JzmSgTPzf; Sun, 20 Aug 2023 14:22:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E58881F82;
	Sun, 20 Aug 2023 14:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E58881F82
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C258A1BF86C
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A63B940998
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A63B940998
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aMlCsTjnAJia for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 14:22:52 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94DB840990
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 14:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94DB840990
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:73e4:5f06:f514:c64d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D07D719F5A3;
 Sun, 20 Aug 2023 16:22:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Aug 2023 16:22:47 +0200
Date: Sun, 20 Aug 2023 16:22:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20230820142247.GL1778688@scaer>
References: <cover.1691616286.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1691616286.git.yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692541371;
 bh=TwLQp4Dmr+QkRy72xNDJWuSkyrOzVyTgmiZ1jNJgL08=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EgTA3qHOZB33srviSs2GtGGMVrIoRVVl+aK8YDIQzwZlb8YppvngSsQSSYQZATDcf
 pv4OTew4xnqWzupoy/nLiDikaKUE9e3lv6msLHMdOPYHEkyXbkVeX1kjSULwfz1HVd
 LF6Y62pZlgZW4SICKyDxmJNyUMfVVSP5cVh6CyDJ98n5nbbBFJtYqJ4k7aSJ3bAtb9
 o+ZaqkoNPfWRz4leoL2GId6+b0fVU8N5+ByfVsxBhpNvDZ6cP1vb8uA494HtoCrSYo
 7MbH8ilUfJq/sOYxt/fkNuTiXyogd301ZkQ3It1HQRrorjhGYtSdozRuvnXW6fRl9m
 ZODqD3Glm1lig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EgTA3qHO
Subject: Re: [Buildroot] [PATCH 0/5] utils/docker-run: cleanups and
 improvements (branch yem/docker-run)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Nicolas Boichat <drinkcat@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2023-08-09 23:24 +0200, Yann E. MORIN spake thusly:
> Hello All!
> 
> This 4-patch series improves on our docker-run wrapper:
> 
>   - utils/docker-run: introduce sorted list of mountpoints
>   - utils/docker-run: mount the download directory if specified
>   - utils/docker-run: bind mount .git/objects if needed
>   - utils/docker-run: also mount current working directory
>   - utils/docker-run: make it compatible with SELinux
> 
> It gathers changes from Thomas and Nicolas.

Whole series applied to next, thanks.

Regards,
Yann E. MORIN.

> Regards,
> Yann E. MORIN.
> 
> 
> ----------------------------------------------------------------
> Nicolas Boichat (1):
>       utils/docker-run: bind mount .git/objects if needed
> 
> Thomas Petazzoni (1):
>       utils/docker-run: mount the download directory if specified
> 
> Yann E. MORIN (3):
>       utils/docker-run: introduce sorted list of mountpoints
>       utils/docker-run: also mount current working directory
>       utils/docker-run: make it compatible with SELinux
> 
>  utils/docker-run | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
