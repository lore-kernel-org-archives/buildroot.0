Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFC9C0015E
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 19:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60279417F8;
	Fri, 11 Aug 2023 19:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60279417F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WyBrtTtL_s0M; Fri, 11 Aug 2023 19:07:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95DCD4049A;
	Fri, 11 Aug 2023 19:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95DCD4049A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29E991BF616
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 19:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02E56840A1
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 19:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02E56840A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5W3fPqIj4rSn for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 19:07:40 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5356B840A0
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 19:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5356B840A0
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 74AA0A05C9;
 Fri, 11 Aug 2023 21:07:38 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix03.mail.de (Postfix) with ESMTP id 557F8801A9;
 Fri, 11 Aug 2023 21:07:38 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 0C993100135;
 Fri, 11 Aug 2023 21:07:38 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 11 Aug 2023 21:07:37 +0200
Message-ID: <3753730.kQq0lBPeGt@kilian-aisec>
In-Reply-To: <10318288.nUPlyArG6x@kilian-aisec>
References: <20230811162546.8088-1-robertoxmed@gmail.com>
 <20230811162546.8088-2-robertoxmed@gmail.com>
 <10318288.nUPlyArG6x@kilian-aisec>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 694
X-purgate-ID: 154282::1691780858-5D7FE7B6-5B040A45/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691780858;
 bh=1NFM/DlzjlReODQ73CiZyaYhg7OZjiDopwDS04jgIhk=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=gaUqPvvgDZTW/Cwz+6j5tJ1Xq7RqDCD8MsCLUfGl8ewgS/hst9N/ByFD57OyfTuxL
 1o0TyQkZN01h5JR/09DGobJx4f3Y3N0n6WTq+79f8pVXEHOi35uEFgD/XRZzeAD6mq
 TYdHNchvo2zZHlsUIzR3jAnldF99NznnUrLyxP3QAVfTJuaaTEgyaO1sBibINTZ2uf
 JW6ZkC61A1y6RhA94Bp7Ukqfc27QSMq5fkPFTvdyW5c/1cQnQIRzj69KZDo6GcpriX
 c/MwBtYuWQH1E42BVd38cKf2FCcTkBJB7+V0iU1Bc8taVi4GYRukRvXD0aY39P/Z9W
 VTnbxEzGHk+xA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=mail.de header.i=@mail.de header.a=rsa-sha256 header.s=mailde202009
 header.b=gaUqPvvg
Subject: Re: [Buildroot] [PATCH 1/1 v3] configs/roc_rk3399_pc: Bring back
 and update the configuration for the rockchip rk3399 built by firefly.
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Roberto Medina <robertoxmed@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roberto,

> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 6ffa3ee693..5ebabd01cb 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -2546,6 +2546,10 @@ F:	package/mhz/
> > 
> >  N:	Robert Rose <robertroyrose@gmail.com>
> >  F:	package/grpc/
> > 
> > +N:	Roberto Medina <robertoxmed@gmail.com>
> > +F:	configs/roc_pc_rk3399_defconfig
> > +F:	board/firefly/roc-rk3399
> 
> I think when it comes to repositories (i.e., board/firefly/roc-rk3399) it is
> best practice to add a trailing space. I guess this way one can easily
> distinguish directories from single files.

... a trailing slash instead of a trailing space, of course ...

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
