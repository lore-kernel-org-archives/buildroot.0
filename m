Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DABFC433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 14:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D19DA82882;
	Fri, 13 May 2022 14:18:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pBUdyi-ThPXk; Fri, 13 May 2022 14:18:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3157827FB;
	Fri, 13 May 2022 14:18:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDF0D1BF31A
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 14:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC74C408E3
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 14:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=orange.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 65tCzGRLjYcm for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 14:18:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9435408A3
 for <buildroot@buildroot.org>; Fri, 13 May 2022 14:18:17 +0000 (UTC)
Received: from opfedar03.francetelecom.fr (unknown [xx.xx.xx.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar20.francetelecom.fr (ESMTP service) with ESMTPS id 4L09jM30myz8vJ2; 
 Fri, 13 May 2022 16:18:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1652451495;
 bh=9/nXu2+TEuPFYaUJ6Mw88No/WqzcZycTB90e/W6c9QI=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=gEzKAG8SR2EyXDUVXGoAyZaTPMjJSc6vxbT7n62oLxv8Kk1Yg2c9C+LVohpXOCoa4
 OEsryj4AS5y3EJlOVyG/WReJc+VUAHinCKyX30PKFOedJWBse+rwWa5P/Cdqs6CByy
 GWhBBLAHX/HOuAH1zGCFlD+/MafFyzb1apHqlfa758yc1Cln+OpsSOXoY8+hduttUQ
 2oZx5FEjHNe/3vSGpMma+3Xho6vtvmay2GtBst8EhErP4WEYXAd3iTCM9o3YexHyT/
 AZNPFQ8SnmDpRIR0AuKSJdc5oEQt4LUZenyugMGhI8FWMzEVJoWMB3hugOfC53aVPi
 FLIIxNZ+ZpcLw==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Fri, 13 May 2022 16:18:13 +0200
Date: Fri, 13 May 2022 16:18:13 +0200
From: <yann.morin@orange.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <19430_1652451495_627E68A7_19430_14_1_20220513141813.GB3073@tl-lnx-nyma7486>
References: <17102_1652250198_627B5656_17102_437_1_abf36ee4172876cd86eaa1ce6691ddca377f8b0b.1652250196.git.yann.morin@orange.com>
 <1e866bf0-454c-81a8-7194-19a5b22a1605@mind.be>
 <4719_1652299450_627C16BA_4719_69_1_20220511200406.GA1110715@tl-lnx-nyma7486>
 <74693905-9bb5-94c3-6931-c102723d3fe5@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <74693905-9bb5-94c3-6931-c102723d3fe5@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX301.corporate.adroot.infra.ftgroup
 (10.115.26.10) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: Re: [Buildroot] [PATCH] package/pkg-generic: explicitly do not
 download package withtout source
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-05-12 23:54 +0200, Arnout Vandecappelle spake thusly:
> On 11/05/2022 22:04, yann.morin@orange.com wrote:
> >On 2022-05-11 19:15 +0200, Arnout Vandecappelle spake thusly:
[--SNIP--]
> >>  Perfection is the enemy of the good and all that, but a few lines below, we
> >>actually have the same issue for ACTUAL_SOURCE.
[--SNIP--]
> >So I believe that we do not have the issue with ACTUAL_SOURCE.
>  True, but feels brittle.

Agreed.

> >>  So maybe instead the condition should be moved inside the DOWNLOAD macro,
> >>and it should check $(notdir $(1)).
> >I don't think this is correct. If the dl-wrapper were to be changed,
> >then it should be changed to not accept to be called without any URI.
>  I was talking about the DOWNLOAD macro, not the dl-wrapper. I agree that
> dl-wrapper should error out if the -f parameter is empty (or contains
> slashes).
> 
> >Afteral, if we call the dl-wrapper, that's exactly because we want to
> >download something, so it does not make sense to call it in a way that
> >will not trigger any download.
>  I do admit that you could claim the same of the DOWNLOAD macro.

Indeed, there is no reason to call the DOWNLOAD macro if there is
nothing to download. ;-)

What the current patch does is fix a regression in a previous change.

Then, for _ACTUAL_SOURCE, I do agree that the situation is a bit
fragile, but we did not have an issue so far as it is correctly
protected, albeit in a way that makes it not very maintainable.
Enhancing the situation can be done in another patch.

So, I'm going to be a bit stubborn here, and stand by my proposal in
this patch, if you will.

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
