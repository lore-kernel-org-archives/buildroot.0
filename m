Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C3FC63797
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 11:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F373415DD;
	Mon,  6 Feb 2023 11:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F373415DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7QzzsvOCUKFf; Mon,  6 Feb 2023 11:39:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3433441583;
	Mon,  6 Feb 2023 11:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3433441583
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DECAE1BF397
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C531560A8C
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C531560A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CTKukrCeV82N for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 11:39:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D50B160743
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D50B160743
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 11:39:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1B07E13F85F;
 Mon,  6 Feb 2023 12:38:54 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 06 Feb 2023 12:38:53 +0100
Date: Mon, 6 Feb 2023 12:38:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230206113853.GE3565@scaer>
References: <20220920232154.1219792-1-KAMenyaev@sberdevices.ru>
 <CAEyMn7YCnxWokN9y90TeqAr4fW21jz0dXZSzYqtEs+qYqG3cxQ@mail.gmail.com>
 <CADvTj4oZBG8hXJNeEwdnm2tjaJDkzq8w-dBa=W_WQmY=L42pZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4oZBG8hXJNeEwdnm2tjaJDkzq8w-dBa=W_WQmY=L42pZA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675683544;
 bh=ur6S4PyoGp89jpl7SFQqhuZluMcXI76J9zG7lC7XNvI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oGTvaXNDuVQ3n+vb1I3L1scp8gVky4i7rP85fqU27pVRjUoAmKE2Be0JYNyQZYc2b
 1mmob0Tgt2Tym01DT/O0hRwA9tiNH74nJYR530FeuP6xaxnhfW5k+3QaFAfI9jT5AI
 vf9QIeqdDlpKcwX56+1fYyGqK6ltoxMtCsmXRzw7tH8XxNGGdJYm2UwTE2VLkf44v3
 j0glo8moogTsCiKoKiVAs8HYkl9OLTMSLbr3r25Mehn4qw/vgkjbTz57K/iUqLhoG9
 qjiilKyipuGRTrm9P+amxX17/3XbJKr+GXwAQaHLuhhCfu5Se0/P3cToHNvpbvcJRT
 fpQ7zvVyzpq8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oGTvaXND
Subject: Re: [Buildroot] [PATCH 1/2] package/python-iniparse: add
 host-python-iniparse
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
Cc: sdfw_system_team@sberdevices.ru, KAMenyaev@sberdevices.ru,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-02-06 04:32 -0700, James Hilliard spake thusly:
> On Mon, Feb 6, 2023 at 3:12 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
> > Am Mi., 21. Sept. 2022 um 01:24 Uhr schrieb <KAMenyaev@sberdevices.ru>:
[--SNIP--]
> > > diff --git a/package/Config.in.host b/package/Config.in.host
> > > index f437ef680c..fb805577d1 100644
> > > --- a/package/Config.in.host
> > > +++ b/package/Config.in.host
> > > @@ -72,6 +72,7 @@ menu "Host utilities"
> > >         source "package/pkgconf/Config.in.host"
> > >         source "package/pru-software-support/Config.in.host"
> > >         source "package/pwgen/Config.in.host"
> > > +       source "package/python-iniparse/Config.in.host
> Missing a trailing quote:
> package/Config.in.host:81:warning: multi-line strings not supported

Fixed, thanks!

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
