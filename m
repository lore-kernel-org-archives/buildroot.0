Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD764C433EF
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 06:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67B636129A;
	Wed, 25 May 2022 06:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nwf-6ok8D6RN; Wed, 25 May 2022 06:51:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E4AD61270;
	Wed, 25 May 2022 06:51:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 770021BF319
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 06:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7377F61270
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 06:51:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JtU2_Ijlf4Y7 for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 06:51:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EDDD61269
 for <buildroot@buildroot.org>; Wed, 25 May 2022 06:51:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6823:fe26:3f6d:8e17])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8B9355FFAA;
 Wed, 25 May 2022 08:51:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653461490;
 bh=DJrqFFLWAil8PRfGpevB/NoxGMW+drvQLkpQYeqMlK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OCP1DPZv4d4+hUY02cJz1T1K5c6PWyK6Rwh6ZoxW5xulAdvmXbilgMLaMuhLHwIIa
 mSxnQDew0hLBYQNG++UAPmiVshayeePNX+fanz2FC3GILR+CRsZwvWHC+PwtENxCPK
 tm3Ak24vvkt/fS7ySxSWFcIM1A0p/CLtRtC13Zu5tHfgZvKXEdH3SNQkC8StgIak39
 hXbz5RR5L386FDa58kJ4Qa5TBcEYYJ/mcPxrZ/6R4ZlxuaTrQaGO5WcBrmzpuL51/g
 XbcvGPbvP1gTGpARQWN0+ezKtvBeRvAXnH7ngdfiWkYgSQYG0m4PmWDz8RyqHHPZjS
 T7Y6eTnCOseKw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 25 May 2022 08:51:26 +0200
Date: Wed, 25 May 2022 08:51:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220525065126.GA301044@scaer>
References: <20220514222811.3925140-1-james.hilliard1@gmail.com>
 <5a0bb1b8-b671-e85b-1942-3b17f31f0547@mind.be>
 <20220524190138.GB2500@scaer>
 <CADvTj4q77jiin-pcvecnfKC_KR+gxPR=7jYov2WgG=ZT5hGO7A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4q77jiin-pcvecnfKC_KR+gxPR=7jYov2WgG=ZT5hGO7A@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/midori: add missing
 !BR2_PACKAGE_GNUPG dependency
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-05-24 13:16 -0600, James Hilliard spake thusly:
> On Tue, May 24, 2022 at 1:01 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2022-05-18 21:17 +0200, Arnout Vandecappelle spake thusly:
> > > On 15/05/2022 00:28, James Hilliard wrote:
> > > >The !BR2_PACKAGE_GNUPG needs to be propagated from BR2_PACKAGE_GCR.
[--SNIP--]
> > Unfortunately, as Romain noticed, this is causing a circular (aka
> > recursive) kconfig dependency:
[--SNIP--]
> Yeah, already sent a patch that should fix this:
> https://patchwork.ozlabs.org/project/buildroot/patch/20220519045549.2320246-1-james.hilliard1@gmail.com/

Greatm thanks! I've just applied it now.

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
