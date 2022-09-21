Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BE1ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 09:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7557140C68;
	Wed, 21 Sep 2022 09:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7557140C68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ir5O1vZtjIk; Wed, 21 Sep 2022 09:09:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5617140C53;
	Wed, 21 Sep 2022 09:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5617140C53
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B5AF1BF5DD
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 09:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22BED60FF7
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 09:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22BED60FF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 07HqRPKi8rJJ for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 09:09:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C32560FEF
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.40])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C32560FEF
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 09:09:05 +0000 (UTC)
Received: from opfedar04.francetelecom.fr (unknown [xx.xx.xx.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar24.francetelecom.fr (ESMTP service) with ESMTPS id 4MXXf64rhxz5wL7; 
 Wed, 21 Sep 2022 11:09:02 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Wed, 21 Sep 2022 11:09:00 +0200
Date: Wed, 21 Sep 2022 11:09:00 +0200
From: <yann.morin@orange.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <25007_1663751342_632AD4AE_25007_496_36_20220921090900.GD2398274@tl-lnx-nyma7486>
References: <20220920064550.520645-1-thomas.petazzoni@bootlin.com>
 <20330_1663659985_63296FD1_20330_21_1_20220920074624.GC3551@tl-lnx-nyma7486>
 <20220920103524.41ad225a@windsurf>
 <30931_1663665105_632983D1_30931_112_8_20220920091143.GD3551@tl-lnx-nyma7486>
 <20220920111919.784ffa7e@windsurf>
 <29653_1663666853_63298AA5_29653_380_1_20220920094051.GE3551@tl-lnx-nyma7486>
 <20220920115459.2aca37f7@windsurf>
 <2ec945e7-22ab-36c9-9ccf-ef022bcfb0ef@mind.be>
 <9ce68f90a18642ad96e8010fd87dd15f@AcuMS.aculab.com>
 <20220921110500.5128d0b9@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220921110500.5128d0b9@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX606.corporate.adroot.infra.ftgroup
 (10.115.27.30) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1663751342;
 bh=npG3PUBvWrcbG0IAgjYALwYE8MrtlidgX4b2++Rttiw=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=Zx4Q8FVU9GnQurXo5gJ2SQMwwPhLds1L94m4rVzMxFIBkggyjAaFt30ef1iftH5tT
 Xdst7YSpuoaCP167SD8B/eVzomuax+uFf3YLBLvkbvok5sOwHKXeI0aZFp7jpNE8rr
 OCCk/vLizSCO2huI0YRPFWvGnlI3HxDX/nAumbBqEmDIg9Lq9c5F53awhov3EeYjPC
 +o2XTqZlC9pMRNj0nWieVU7YP9UQnIwYuPzbjdAcLAOv00p5StOQcEJMBe3a3BngEy
 uwyDSw3CrA5xsQmfcGmA3ExV5/gcq52taGkycDnP3IEHrg2W2nbIXY0JluLVLXuT4u
 kvH4UW3keGcow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=ORANGE001 header.b=Zx4Q8FVU
Subject: Re: [Buildroot] [PATCH] support/scripts/check-host-libs: add new
 check on host binaries/libs
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
Cc: David Laight <David.Laight@ACULAB.COM>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-09-21 11:05 +0200, Thomas Petazzoni spake thusly:
> On Wed, 21 Sep 2022 08:23:54 +0000
> David Laight <David.Laight@ACULAB.COM> wrote:
> > Think a bit further and you can remove the exec of cmp, eg:
> > $ time find /usr/lib -type f | (ELF="$(printf '\x7f\x45\x4c\x46')"; while read f; do read l <"$f" && [ "${l#$ELF}" != "$l" ] && echo $f; done )| wc -l
> Thanks for the input and proposal. Isn't read l <"$f" going to read
> each file entirely in memory?

It should read a single "line", i.e. until the first \n, which can still
be quite a lot for binary files, yes. Hence my followup tweak that reads
only 4 bytes.

> > That takes a few seconds on my system.
> On my system, your command took 19 seconds. When doing this kind of
> test, make sure to drop the contents of the page cache first by doing:
> 
> echo 3 > /proc/sys/vm/drop_caches
> 
> Before each experiment. On my machine, with the page cache contents
> dropped, it takes 19-20 seconds to run your command the first time.
> Subsequent runs only last 12 seconds.

But usually, that will run just after the rsyncs to aggregate the host
dir, so everything will be cache-hot, which is what we care about...

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
