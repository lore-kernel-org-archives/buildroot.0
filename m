Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2121C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:14:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30CD360720
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30CD360720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D811A403D9;
	Sun, 25 Jul 2021 07:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tg46sSvg0NPs; Sun, 25 Jul 2021 07:14:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2577403DA;
	Sun, 25 Jul 2021 07:14:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 666B01BF48C
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 630D540116
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EEfKujQgtc2R for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 07:14:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A80440104
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 07:14:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4802:7ee4:40b0:1519])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id DDB2C7802D7;
 Sun, 25 Jul 2021 09:14:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627197248;
 bh=rC68oqFWzXGehOT/IU/cVxrVwKIzZAnle9rECs9Yv0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CY1Ih8Z0qTZkeqweSC7Rf9sIql3IYEiUXmPSmPhVl0iMAMrq6BYcX6HujXvV4/ywF
 ZIoYMTquTZKKxlhj29JvcEJ0PQljrWXCrI1jV52OMPQbCi6lnA5O1StHZqTcfqQn+Z
 FOTp1AgvtgPXXbd/kfg7jjyaNTZ8SsusobIHdypqLsbB+pSc1GfnCtsfL3Y4HWsBMN
 6YdbyDLU2SGfyjZnXjjVnwj3JpVlHyvGpcTSu6qv6q2M0Qz8gp14LeMZFdOcegRyOF
 f4qMvgfYorE7ofEWQnVx6tbT3LGJbFL1kT67TzBkJXdgiozKKcH5eyom+W243xqA2F
 idPzbGGOcyIOQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Jul 2021 09:14:01 +0200
Date: Sun, 25 Jul 2021 09:14:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20210725071401.GL2382418@scaer>
References: <20210724204801.1073334-1-daniil.stas@posteo.net>
 <20210724210341.GJ2382418@scaer> <87tukjxcrs.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tukjxcrs.fsf@tarshish>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/htop: fix sources location
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org, Daniil Stas <daniil.stas@posteo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Baruch, All,

On 2021-07-25 07:01 +0300, Baruch Siach spake thusly:
> On Sun, Jul 25 2021, Yann E. MORIN wrote:
> > Daniil, All,
> > On 2021-07-24 20:48 +0000, Daniil Stas spake thusly:
> >> Change sources location from bintray to github since bintray doesn't
> >> work anymore
> > Applied to master, thanks.
> Wouldn't tar file hash change break the sources.buildroot.net cache?

Damn, you're absolutely right! I've revert the change now.

Daniil, could you redo your patch, but rather than use the tag, use the
sha1 of the corresponding commit, and explain why we do so in a comment
and in the commit log?

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
