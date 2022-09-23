Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7898BECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 14:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAF3641862;
	Fri, 23 Sep 2022 14:18:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAF3641862
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UlLCBzeM1bjq; Fri, 23 Sep 2022 14:18:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9421941849;
	Fri, 23 Sep 2022 14:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9421941849
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DE3F1BF28F
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 14:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAD6C40B08
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 14:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAD6C40B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j-cx1yDAT8mY for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 14:18:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C338140A98
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.39])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C338140A98
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 14:18:41 +0000 (UTC)
Received: from opfedar07.francetelecom.fr (unknown [xx.xx.xx.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar26.francetelecom.fr (ESMTP service) with ESMTPS id 4MYvQR3C5tzFqx6; 
 Fri, 23 Sep 2022 16:18:39 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Fri, 23 Sep 2022 16:18:37 +0200
Date: Fri, 23 Sep 2022 16:18:37 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Message-ID: <10091_1663942719_632DC03F_10091_295_1_20220923141837.GD2981@tl-lnx-nyma7486>
References: <20220923053057.9373660C2A@smtp3.osuosl.org>
 <20220923121334.GC2981@tl-lnx-nyma7486>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220923121334.GC2981@tl-lnx-nyma7486>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX207.corporate.adroot.infra.ftgroup (10.115.27.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1663942719;
 bh=jUraSkt77glEYwIgQVuuKijiLQksjSsXE4u1seGrRDo=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=L5Ekai04/e5HQcXfnMLpk2WG5S3cJkFAIqMDVUeJPmfdJ/rth2wg+vyovYaiPTGMj
 FHlELaiOgFdvrZWBnWneifSGiX0VOX953X8nV8c56HAh2SSL6ZKCWN7rki9sC4q0Dp
 ba+EjItZCljnNUiUdXBOQAUFGcGSPYosxorYIydx/a8Fmy8jTSdVC9AwJIwS3+BqSK
 U/Hb7zhUeXJTE1w1HaPN1leZmsNYymJumJhISASgTZFEFAI2JUsze4KMUkv1mzrtIf
 SmmXxnCUUsAa1/X6anBuLJP3j4wkry9XRqcGKY1dE0U3g1tdBLsENdR95qMHAYfoQZ
 4eYBLZRfkxOVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=L5Ekai04
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-09-22
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Waldemar, All,

On 2022-09-23 14:13 +0200, MORIN Yann INNOV/IT-S spake thusly:
> On 2022-09-23 05:30 +0000, Thomas Petazzoni via buildroot spake thusly:
> >     or1k     |           gpsd-3.24            | NOK | http://autobuild.buildroot.net/results/7adc125e843b21b559f1e8813059d65af58feb8d |     
> 
> This is an or1k, shared-only, uClibc-ng, LT (not NPTL) so no TLS, build.
> 
> So, I'm not sure to make of this issue:
> 
>     ..../or1k-buildroot-linux-uclibc-gcc -o gpsd-3.24/gpsctl .... -lusb-1.0 -lm -lrt -lnsl
>     ..../ld: ..../sysroot/usr/lib/libusb-1.0.so: undefined reference to `__tls_get_addr'

So, here are a few other tests I did (each independtly):

  - revert uclibc-ng from 1.0.42 back to 1.0.41 -> still fails
  - revert libusb from 1.0.26 back to 1.0.25 -> still fails
  - revert gpsd from 3.24 back to 3.23.1 -> still fails

So, from the look of it, the __tls_get_addr has alwaus been injected in
libusb [0] on or1k with uclibc-ng and linuxthreeads.

Now, is that a valid combo?

Do we want to keep LT even for those arch where NPTL exists? I.e. when
uclibc is configured with threads, use NPTL is there is an NPTL
implementation for the arch, otherwise use LT. Thoughts?

[0] I don't think it is specific to libusb, just that this is the first
time it got noticed and investigated...

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
