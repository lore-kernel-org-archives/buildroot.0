Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91308C54EBE
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 08:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07723408C4;
	Mon, 16 Jan 2023 08:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07723408C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZAsnL8ooYIfU; Mon, 16 Jan 2023 08:15:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 814B4408C1;
	Mon, 16 Jan 2023 08:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 814B4408C1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 006A81BF2B6
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 08:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE934408C1
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 08:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE934408C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZLoZNUS6vdYX for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 08:15:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63AB4408BD
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63AB4408BD
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 08:15:17 +0000 (UTC)
Received: from opfednr07.francetelecom.fr (unknown [xx.xx.xx.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr23.francetelecom.fr (ESMTP service) with ESMTPS id 4NwPw30SYcz5vgb; 
 Mon, 16 Jan 2023 09:15:15 +0100 (CET)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Mon, 16 Jan 2023 09:15:13 +0100
Date: Mon, 16 Jan 2023 09:15:13 +0100
From: <yann.morin@orange.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <18427_1673856914_63C50792_18427_287_1_20230116081513.GB3045@tl-lnx-nyma7486>
References: <20230114181556.1371822-1-fontaine.fabrice@gmail.com>
 <20230116064000.GA3045@tl-lnx-nyma7486>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230116064000.GA3045@tl-lnx-nyma7486>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX207.corporate.adroot.infra.ftgroup (10.115.27.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1673856915;
 bh=rZTQ4U+HBsvPzXd2MekUPiWIXo3LZGG737lHgunzMCc=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=RHesZmRCakFQ5DNU9AC25xxeFC0smRF9cF4eyhzvpWg6hvt4mPSZM71KQ3yYPCmNi
 j9rB5qhubkc/Ly6vWKdbclpS9/frYRbxMAUfc3tjNA1ejLgtlLcmeTByUxU20dDMBo
 d2lN1SChQYh7W9VwHjgH/fT7Pfc8p5902QPWEosKPVJEFru3vjp2G/8HJvXU7Y7dHH
 kjoTiHxA5eSm8xVfCqEzemYiBJ8pRfwftDsPKvTiDj9XYqw7ESPPjM41SGSCuatVZy
 XgewCtQvTYrJbA4mQsT+R6NInUpEKcG4IlRgUSSDgdrq2x2JNlyhSLKDMMAkNagzbT
 Z1scCAS3Ql97Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=RHesZmRC
Subject: Re: [Buildroot] [PATCH 1/1] package/gpsd: bump to version 3.25
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-01-16 07:40 +0100, MORIN Yann INNOV/IT-S spake thusly:
> On 2023-01-14 19:15 +0100, Fabrice Fontaine spake thusly:
> > Drop patch (not needed anymore)
> > https://gitlab.com/gpsd/gpsd/-/blob/release-3.25/NEWS
> Hmm.. Why did I not receive the weekly mail informing me the package got
> updated?

Probably because it was released after the mail was sent last week:
I did get the reminder today.

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
