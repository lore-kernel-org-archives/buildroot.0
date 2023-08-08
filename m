Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21332C04A6A
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 20:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A1D04175A;
	Tue,  8 Aug 2023 20:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A1D04175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5sZltGS7_id; Tue,  8 Aug 2023 20:44:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7439E4174F;
	Tue,  8 Aug 2023 20:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7439E4174F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F5161BF5E0
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 20:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2715E4174F
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 20:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2715E4174F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZV-EDtjYj2xg for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 20:44:12 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 938444174C
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 20:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 938444174C
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 877FCA07FE;
 Tue,  8 Aug 2023 22:44:10 +0200 (CEST)
Received: from smtp02.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix03.mail.de (Postfix) with ESMTP id 6AD73801CF;
 Tue,  8 Aug 2023 22:44:10 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp02.mail.de (Postfix) with ESMTPSA id E9AB5A03AF;
 Tue,  8 Aug 2023 22:44:09 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 08 Aug 2023 22:44:04 +0200
Message-ID: <1860848.tdWV9SEqCh@kilian-aisec>
In-Reply-To: <20230808094348.1c7a8650@windsurf>
References: <20230808050122.6788-1-kilian.zinnecker@mail.de>
 <20230808094348.1c7a8650@windsurf>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1866
X-purgate-ID: 154282::1691527450-6A7FA199-B6F6198F/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691527450;
 bh=cmbNsOzduBGS9xJTp3RgQsTK3OnIAVC5mjF00UDqKMg=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=3hWANQCOlbEOpOYSoAmazM8xBlH0mj6zlML+qeoSZs3YdixHLOgxFxKzPwELQSQpc
 F6OuQ6Kq0wzt+eSdEZbdzwc3JM24aqPtZNpHwI4LY4sc5VDGDSxXmYa0Fb2i0lTZpe
 6fzN4XnEmiVTOhutbtlGjFly8IOzV7uWT/mjH9AOrwE4uKJly8hr5fTEG/IozRbi/z
 YntH0UtsPVOvyLSi3XEOAuJvgdiROck6uWk5xCs8MffVpFnjwUElzwO7jrra6xMk00
 QdaInV2+YRAwZUNv/hvjNIxS1vkOn+cybrUnL8nS6gHn/MZm1AR7htWsaLERQmD9d6
 rrW8xozy9BEKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=3hWANQCO
Subject: Re: [Buildroot] [PATCH 0/2] Fix Rock 5B build,
 broken by gcc 12 warnings
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas, all,

> > Building the image for the Radxa Rock 5B currently breaks: The gcc
> > version was recently changed to version 12 and gcc 12 seems to stop
> > compiling, if certain warnings occur. See the broken build here:
> > 
> > https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673759
> > 
> > This patch series adds two patches from the mainline Linux kernel,
> > which fix two of the warnings. However, also custom code parts of the
> > used custom kernel break due to warnings from gcc 12. The best
> > solution would be to fix those issues as well. However, until they are
> > fixed, the version of gcc used for the Rock 5B is set to the previous
> > version, gcc 11.
> > 
> > Kilian Zinnecker (2):
> >   configs/rock5b: Freeze gcc to version 11
> >   board/radxa/rock5b: Add patches for gcc12 warnings
> 
> I'm not sure to understand the reasoning for the second patch. Does it
> fix all gcc 12.x issues or not? If not, what is the motivation for this
> second patch?

No, the second patch does not fix all gcc 12.x issues. It only fixes two of 
them. I think that fixing two of the warnings for now still is a plus.

> Also: gcc 11.x is currently the oldest version supported by Buildroot,
> it means that as soon as gcc 14.x is released, we will drop support for
> gcc 11.x. So clearly, the solution of sticking to gcc 11.x is not going
> to work for a very long time.

Thanks for the info, I actually would not have known this! I think that the 
best way is to ask the maintainers of the Radxa custom kernel whether they may 
fix the remaining issues, so that the custom kernel compiles with gcc 12.x. I 
intend to do so.

I think both patches should be applied. However, the first patch alone should 
already cause to fix the build itself. (Tbh. I did not test it though.)

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
