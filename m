Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF25AC54EBE
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 08:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6667C403C2;
	Tue, 10 Jan 2023 08:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6667C403C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OvixuSYzekB5; Tue, 10 Jan 2023 08:30:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE2BC4013D;
	Tue, 10 Jan 2023 08:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE2BC4013D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F0FA1BF322
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 08:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE8FE60B0C
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 08:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE8FE60B0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KgC3yp5mL7wt for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 08:30:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07C786068D
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.39])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07C786068D
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 08:30:45 +0000 (UTC)
Received: from opfedar05.francetelecom.fr (unknown [xx.xx.xx.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar26.francetelecom.fr (ESMTP service) with ESMTPS id 4NrkXg2Rv0zFqVV; 
 Tue, 10 Jan 2023 09:30:43 +0100 (CET)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 10 Jan 2023 09:30:40 +0100
Date: Tue, 10 Jan 2023 09:30:40 +0100
From: <yann.morin@orange.com>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <25234_1673339443_63BD2233_25234_350_1_20230110083040.GB2889@tl-lnx-nyma7486>
References: <cover.1672006091.git.yann.morin.1998@free.fr>
 <c429b33d532df8723f6477d17bbaedff495abc1e.1672006091.git.yann.morin.1998@free.fr>
 <CADYdroMHy9Ax2Rr5wRNuVs7g1z-xSWE2OXcqe=aVEy0XdJD_9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADYdroMHy9Ax2Rr5wRNuVs7g1z-xSWE2OXcqe=aVEy0XdJD_9Q@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX207.corporate.adroot.infra.ftgroup (10.115.27.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1673339443;
 bh=2INvKPbaQ49cJJ1XdaGWYHXEvaO0AnKGWnUn5Zkw91o=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=JyfQwUtPBTBVcivQZeUzKdLpC/owLTuDmvA8RRLIxDVNhLOI1kojzxmgLBS1ADtRa
 kc6iJtyk0Qlsi2gz3FmDgFsjTpcIz61fKtvFGBl9XF/HPWLUDQn6ayN9HQgEmsoQSU
 yRZg/KcIZTTMcgY9/sWwkt5VSx7iTWzLDQXF1/sqD9L38p9z0wEX+yVTd5kg2mXz0t
 RHyuWfcRwngkRy2NnWBTWIFGq5z/gnzTl34QJUIjqP1/aH3GFfBkPKAHQD1sBPnimf
 Y1Y/K/aEWu6JzIkBzG05C98IhqSzMUtE1MLNSJi3RIcfulAbtYGNHr+fAngguBNCMl
 ZVnOS0iBoWvHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=JyfQwUtP
Subject: Re: [Buildroot] [PATCH 2/3 v4] system: add option to use an
 overlayfs on /var on a r/o root w/ systemd
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
Cc: Romain Naour <romain.naour@smile.fr>,
 =?utf-8?B?SmXMgXJlzIFteQ==?= Rosen <jeremy.rosen@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Norbert, All,

On 2023-01-09 00:26 +0100, Norbert Lange spake thusly:
> Am So., 25. Dez. 2022 um 23:08 Uhr schrieb Yann E. MORIN
> <yann.morin.1998@free.fr>:
> > From: "Yann E. MORIN" <yann.morin@orange.com>
> >
> > While the /var factory seems to be working in most cases, there have
> > been suggestions that it may be slightly and subtely borken in some
> > (rare? edge?) cases, especially about symlinks.
> >
> > An other solution is to pre-populate /var at build time, by way of
> > calling systemd-tmpfiles, and mounting an overlayfs on-top of it at
> > runtime. The first part is already done, and this change focuses on
> > mountig the overlayfs.
[--SNIP--]
> Just a heads up that I worked on a new version with several
> cleanups/improvements,
> still need to rework it into a proper patch with explanations, hope I will
> finish it next weekend.

Cool! :-) Do not hesitate to grab whatever explanations I provided
above, that are still relevant to your changes, and drop whatever was
wrong or not longer fits.

Will you base that over this series, so that it fits within the choice
introduced in the previous patch? I hope the choice can be applied by
the end of the week.

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
