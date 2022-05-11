Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46347C433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 06:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52FCF4187C;
	Wed, 11 May 2022 06:01:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id If18qNZQ8gJ3; Wed, 11 May 2022 06:01:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF61741879;
	Wed, 11 May 2022 06:01:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A55541BF37A
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 06:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9317D41878
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 06:01:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jMCe7IoyZ91T for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 06:01:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B1A741621
 for <buildroot@buildroot.org>; Wed, 11 May 2022 06:01:01 +0000 (UTC)
Received: from opfednr07.francetelecom.fr (unknown [xx.xx.xx.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr24.francetelecom.fr (ESMTP service) with ESMTPS id 4KykmV548bz1ytR; 
 Wed, 11 May 2022 08:00:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1652248858;
 bh=744zxiS3b0XxEanNPtRA2EwsEY1doMazgFt+ayQamQE=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=qD4BwVF0E4Y3FXo67L/8Fu/Nmo3Gepz7NjRnCxaD9VGQMgNchcoasrNemgO6hjzL1
 XlVZsykI150ps3N9rqdqBnUMCts3s7+EXVoni52qlzL3zYPeXN95b5l+pRB/SV0G2D
 Rvlmo+Q2IR5BTqJTeUSd2G2rqSTLL3XOVWW2mUWjreXybkSehYwvkMvVKs5As8upso
 LiRr3jAkMVVxIKZ49TtisJWXK2aEI4G96Wodiuj1Jhs2LPfQ7DFBt0VECw4M/1d0pO
 QU0fIvcLhB2zoCYoobmZIPHoFQeXV0C7/fAVHQBU/57n2Yo6Jd71Yp/Lt0ZDHpAyVw
 +VskO04yGVo8g==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Wed, 11 May 2022 08:00:56 +0200
Date: Wed, 11 May 2022 08:00:56 +0200
From: <yann.morin@orange.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <32022_1652248858_627B511A_32022_163_1_20220511060056.GA2862@tl-lnx-nyma7486>
References: <24588_1651771186_62740732_24588_360_1_2d4cd3ac6995d7b5119ef4dfdc22b975992b8a73.1651770627.git.yann.morin@orange.com>
 <c8c34832-4993-4779-e125-4beea032836b@mind.be>
 <31076_1651814495_6274B05F_31076_440_1_20220506052132.GB2870@tl-lnx-nyma7486>
 <4634ccff-2b76-5b91-0730-391c53b883b8@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4634ccff-2b76-5b91-0730-391c53b883b8@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX303.corporate.adroot.infra.ftgroup
 (10.115.26.12) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: Re: [Buildroot] [PATCH] package/pkg-download: do not try to vendor
 _EXTRA_DOWNLOADS
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-05-10 21:24 +0200, Arnout Vandecappelle spake thusly:
> On 06/05/2022 07:21, yann.morin@orange.com wrote:
> >On 2022-05-05 22:37 +0200, Arnout Vandecappelle spake thusly:
[--SNIP--]
> >>  Applied to master, thanks, with a few changes:
> >>      - no loop needed for MAIN_DOWNLOAD, it can have only one;
> >In fact, that was on purpose: it can have no main download...
> >Indeed, a package can very well only declare extra downloads...
> >I forgot to explain that in the commit log, sorry.
>  OK. However, somehow this seems to work:

Yes, otherwise we could not even install host-skeleton to begin with....

>  So I don't think it is needed after all?

Still, I am not happy that we are in a situation that works by accident.
I'd much prefer we understand why exactly this does not break...

> The dl-wrapper script apparently
> doesn't do anything if the filename is empty.

It really works by accident:

 1. we pass no URI, so I thought the dlwrapper would fail, as it
    basically does:

        download_and_check=0
        for uri in "${uris[@]}"; do
            ...
        done
        if [ "${download_and_check}" -eq 0 ]; then
            exit 1
        fi

    However, it does not even go that far...

 2. even though there is no output file, we still pass the path to
    the package output directory as the output path. So, as part of
    validating the download, the wrapper checks if the output file
    exists, and checks its hash:

        if [ -e "${output}" ]; then
            if support/download/check-hash ${quiet} "${hfile}" "${output}" ...
                exit 0
            ...
        fi

 3. the output path does exist now, because we explicitly create it just
    before calling the wrapper, because that's where we also locate the
    lockfile.

So, this is all a bit fragile, and I am not feeling very happy about
that...

So, I'll cook up a fixup patch to revert to the previous behaviour of
not even attempting a download in that case.

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
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
