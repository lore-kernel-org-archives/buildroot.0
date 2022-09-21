Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A57AC32771
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 08:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B84240CE6;
	Wed, 21 Sep 2022 08:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B84240CE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7P9-c_2jUbfZ; Wed, 21 Sep 2022 08:42:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B314D40C53;
	Wed, 21 Sep 2022 08:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B314D40C53
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 171781BF3AE
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 08:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6D1181BA8
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 08:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6D1181BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bco1OB7Gfqzc for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 08:41:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E7B981774
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E7B981774
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 08:41:53 +0000 (UTC)
Received: from opfedar02.francetelecom.fr (unknown [xx.xx.xx.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar27.francetelecom.fr (ESMTP service) with ESMTPS id 4MXX2l2J9bz2yG8; 
 Wed, 21 Sep 2022 10:41:51 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Wed, 21 Sep 2022 10:41:49 +0200
Date: Wed, 21 Sep 2022 10:41:49 +0200
From: <yann.morin@orange.com>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <10267_1663749711_632ACE4F_10267_83_8_20220921084149.GB2398274@tl-lnx-nyma7486>
References: <20220920064550.520645-1-thomas.petazzoni@bootlin.com>
 <20330_1663659985_63296FD1_20330_21_1_20220920074624.GC3551@tl-lnx-nyma7486>
 <20220920103524.41ad225a@windsurf>
 <30931_1663665105_632983D1_30931_112_8_20220920091143.GD3551@tl-lnx-nyma7486>
 <20220920111919.784ffa7e@windsurf>
 <29653_1663666853_63298AA5_29653_380_1_20220920094051.GE3551@tl-lnx-nyma7486>
 <20220920115459.2aca37f7@windsurf>
 <2ec945e7-22ab-36c9-9ccf-ef022bcfb0ef@mind.be>
 <9ce68f90a18642ad96e8010fd87dd15f@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ce68f90a18642ad96e8010fd87dd15f@AcuMS.aculab.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX103.corporate.adroot.infra.ftgroup (10.115.26.4)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1663749711;
 bh=V0Pw/H0I4pVtAPfcXMGhm1erHSfzucSEi8flQ6GEh1o=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=dT0i337ndHfaSYoOmBkXE0VmcgH1pYAbLxNfVEgjqPasHYVGULxLjKi6Pe121UX+d
 s3Pmz7USfmQ3A4IJlj6GZUWIYTXC+A9alrYbp/tm3+vRi1TbO0KiuySSLnXCLckuUH
 t0O9FLa/8tVAP1pAOhZMCdXiMQTeDnyLrKUE1Cq+DjpT2fswXT27FwZbSMVjawpjuf
 9w5NQzSKTOVnwArvM+b8WqZOpM+NsvyAxGWL5khmPvyGTPAoH34BByj8xUhJ0Gr0Yk
 1aciFhWmpC8CHTGXiUyswGrmO7dmElJ/AuD8knSPjbjc911KJAE9ORTY6LnNnHW215
 OqZPsIHTJAAxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=dT0i337n
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

David, All,

On 2022-09-21 08:23 +0000, David Laight spake thusly:
> From: Arnout Vandecappelle
> > Sent: 20 September 2022 20:49
> ...
> > date +%s
> > find host/*bin host/lib* -type f |while read f; do
> >          if printf '\x7f\x45\x4c\x46' | cmp -s -n 4 - ${f}; then
> >              printf '%s\n' "${f}"
> >          fi
> > done | wc -l
> > date +%s
> > 
> > 1663702312
> > 111
> > 1663702338
> 
> Think a bit further and you can remove the exec of cmp, eg:
> 
> $ time find /usr/lib -type f | (ELF="$(printf '\x7f\x45\x4c\x46')"; while read f; do read l <"$f" && [ "${l#$ELF}" != "$l" ] && echo $f; done )| wc -l

Nice trick. That took ~3s on my host/ dir.

And then, I think we can do simpler and more obvious (we know we have
bash, so we can use the bashisms 'read -N'):

    read -N 4 magic <"${f}"
    if [ "${magic}" = "${ELF}" ]; then printf "%s\n" "${f}"; fi

Now it's about ~1s, and that yields the same list as cmp yields.

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
