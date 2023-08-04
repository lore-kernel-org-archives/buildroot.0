Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C04C001DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 17:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97C024063C;
	Fri,  4 Aug 2023 17:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97C024063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mNiK1H5Nztnq; Fri,  4 Aug 2023 17:23:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAA7040A47;
	Fri,  4 Aug 2023 17:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAA7040A47
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6FD8E1BF33A
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 17:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB1DE81E52
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 17:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB1DE81E52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ppqsuy9R8WBf for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 17:22:19 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02B58821A7
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 17:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02B58821A7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:1259:ded8:9ad6:1294])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id E3C892003F7;
 Fri,  4 Aug 2023 19:22:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 04 Aug 2023 19:22:13 +0200
Date: Fri, 4 Aug 2023 19:22:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230804172213.GR421096@scaer>
References: <20230804062307.227606-1-bernd@kuhls.net>
 <20230804143516.4df34cfe@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230804143516.4df34cfe@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691169737;
 bh=Omub7DvB32XOcvv3y+Hy+MiI9LfKf8TMyB3I6F/kPRM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IpjhiiIyQmqE5Y1HuvLaiZdKgY6j7hiBULKAtgLuWirwJC0vyZeVGxxq/GFPVJ/yZ
 KF3Do0zCItmxUR7rwqlvsd+jIDbpxxRTXa3Slweks6AnwTTzXIm6GvAI4mo2elanYO
 acMNYBYIMCI/7627WnMbmZor6RqAj3Sl8FWH114dgQawpwUEWHu9WsLjELp0DT2JbK
 z8Jgz+vQHmHx6ue59KiuZvVJBApKJYyERmHzGC0oL4/yF3qRZdJecbs9ZochCOJ0jY
 dsiOyMt5ruVK5hseObsCU5RH8nteHT3j4Wf+p9BexaJ04dSWT9WHvFv7ul8ZLKmRCG
 rf/acAoC+4+KA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IpjhiiIy
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic: handle host-php as
 an extract dependency
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-08-04 14:35 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Fri,  4 Aug 2023 08:23:07 +0200
> Bernd Kuhls <bernd@kuhls.net> wrote:
> > Fixes:
> > http://autobuild.buildroot.net/results/506/50658c50fde8145fac320e3b17004e98c78c6c4d/
> > 
> > Although composer has host-php as build dependency, in the case of
> > BR2_PER_PACKAGE_DIRECTORIES=y host-php was not built during extract stage
> > of the composer package.
> > 
> > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> 
> Thanks for noticing this. I indeed completely overlooked that when
> reviewing/merging the composer patch. However, there is one thing that
> I believe isn't ideal in your proposal, indeed it's kind of "half-way"
> through.
> 
> You handle part of the problem in package/pkg-utils.mk, as if .phar
> extraction was supported in the generic way in the package
> infrastructure, but that isn't the case: it only works with the special
> _EXTRACT_CMDS defined in composer.mk. So this .phar extraction would
> not work for any other package.
> 
> So instead of your change in package/pkg-utils.mk, can you do:
> 
> HOST_COMPOSER_EXTRACT_DEPENDENCIES = $(BR2_PHP_HOST_DEPENDENCY)
> 
> in composer.mk ? This would make the entire handling of .phar
> extraction a problem of composer.mk.
> 
> Of course, should we progressively have more and more of these, we
> could look at making this generic. But right now, let's handle this as
> a composer.mk specific concern.
> 
> What do you think?

I agree that we do not want to introduce it in the generic infra for
now, until we have at least a few packages that need it.

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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
