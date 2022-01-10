Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6FCC433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 22:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12C2540641;
	Mon, 10 Jan 2022 22:31:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z74Wn8Y5PF3u; Mon, 10 Jan 2022 22:31:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07EBB4063F;
	Mon, 10 Jan 2022 22:31:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B2E11BF31C
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43D9140951
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:31:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LRh6MgEFwkmn for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 22:31:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AF7240942
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 22:31:42 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id s127so20640876oig.2
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 14:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6xJRtOP9VoMEtzPxdxAH5+nWlgfDekRO7St3Iw3BVco=;
 b=Qd+i5xBrs12fvnCFFM2G7aXkV03f1xdLolKki89mmA34azDn9wSJTEvgCusnL6ECxi
 DqezSOdgv1FDd7aZRUvOWO0GbObDTY4sZW3xzUKYeXIRQPgULRyZkhMnh0z9IZc2wagE
 2UHdC9q7G1bY3Kq+axp/AnWy1q2tGbRCk1b7S3Z+FBm6slM+oQxNZci9T0b7kIRoP9la
 v5YAokc+spC9KeBFAM8+tUG7HTTnPVdFzZDke8FwdfAy2dwdOQ8Jxu3pftYwi7QmKAkP
 xnB40tbaDRLvCuF85Zk4wFXrZ+Gft7W21+NsUAbxwa2PMaGSoZySxgtF8Ct3eo5hXvS5
 9TBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6xJRtOP9VoMEtzPxdxAH5+nWlgfDekRO7St3Iw3BVco=;
 b=cY+QZGCxEYmwMH5+cXJJ0LUfeu/FE/jcDqqwDTCFLZzcqOHMXS4bJTs8eDtEyEy4FJ
 OlptPQsTY81X2VTJ9Hpb87fU5+FRu5iGxBgTrjnu/juQULEieNu8Ovc6XigU/o3zRcxc
 neJlqgVAWEjc+O4tYGLCffmdex+wA/TmqHJi05im3caxE0keO5tTQRCvozFlS3+CHBB/
 FUwJ1BLeCmqdHvf9kVytEOuN8t4d8kGY7+TdR1A9Kzcc0WEi4wrl+EFJxanz5ukCu39X
 vF1bEy3yaC3zT5MaAkTLFoFGbxxzPYeymb95U0eYN97Pep/peR/zO3k/9X1s8RcXbr3c
 Dnog==
X-Gm-Message-State: AOAM530tF/fKoec1PL037X6mF3pjls2iIGaZEZHePTt6Mssof9CEcaa8
 swlDa1lq/Pfd66ZyEO8VvA9zwq7d64QYIzT3F8g=
X-Google-Smtp-Source: ABdhPJwC3NVIV2o4YYu4osTAnu7lGN87RYDMvTTkq7XYbCkF/qupHf3C4Cu4NVSXv8qTV3PRRB4QSgt7rpVhkaNxcBA=
X-Received: by 2002:a05:6808:118b:: with SMTP id
 j11mr1112695oil.65.1641853901459; 
 Mon, 10 Jan 2022 14:31:41 -0800 (PST)
MIME-Version: 1.0
References: <20211231202620.3521230-1-james.hilliard1@gmail.com>
 <20220110221051.GT1477939@scaer>
 <CADvTj4qnuwUh594-QC-4ySNQX2aSfhfs36tX-cH5vMB52EbgbQ@mail.gmail.com>
 <20220110222808.GU1477939@scaer>
In-Reply-To: <20220110222808.GU1477939@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 10 Jan 2022 15:31:30 -0700
Message-ID: <CADvTj4ogaTxytpD11-s7EfGOJr=4L8VYGCDr82S4_rsmBEitkw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/zynq-boot-bin: port to python3
 and move to support/scripts
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, Julien Olivain <juju@cotds.org>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jan 10, 2022 at 3:28 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-01-10 15:18 -0700, James Hilliard spake thusly:
> > On Mon, Jan 10, 2022 at 3:10 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> [--SNIP--]
> > > So I wonder if it even makes sense to keep package/zynq-boot-bin now.
> > Well if someone is using an older uboot that doesn't have the
> > generation capability
> > integrated then it's probably still needed right?
>
> But then, they would have that tool in their uboot tree, and then
> nothing would prevent them from running it as a post-build (or
> post-image) script.
>
> Yes, they would need to have a python2 on their host. But that will be
> the case if they stick to such older tools which may break on more
> recent systems, not just uboot...

Yeah, the advantage here is that it works with python3 as is with older uboot
versions. I guess the main issue is that vendor uboot trees are often ancient
and rarely updated so this would be mostly useful for those situations.

>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
