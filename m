Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0973FC61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 13:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6186381AEA;
	Tue, 14 Feb 2023 13:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6186381AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rebmLNDtK7ap; Tue, 14 Feb 2023 13:15:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FC7D81A99;
	Tue, 14 Feb 2023 13:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FC7D81A99
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 19BD21BF40E
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 13:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F4077410EA
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 13:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F4077410EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A1WBCN9fKDRj for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 13:15:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ACE1410D5
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7ACE1410D5
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 13:15:32 +0000 (UTC)
Received: from opfedar07.francetelecom.fr (unknown [xx.xx.xx.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar22.francetelecom.fr (ESMTP service) with ESMTPS id 4PGMC52qL8z2xsR; 
 Tue, 14 Feb 2023 14:15:29 +0100 (CET)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 14 Feb 2023 14:15:26 +0100
Date: Tue, 14 Feb 2023 14:15:26 +0100
From: <yann.morin@orange.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <15869_1676380529_63EB8971_15869_68_1_20230214131526.GC3487@tl-lnx-nyma7486>
References: <20230214105033.1042139-1-giulio.benetti@benettiengineering.com>
 <16600_1676373529_63EB6E19_16600_354_5_20230214111846.GB3487@tl-lnx-nyma7486>
 <636d30cd-bb2d-ec64-1b4f-9a1d2c98f2b7@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <636d30cd-bb2d-ec64-1b4f-9a1d2c98f2b7@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX407.corporate.adroot.infra.ftgroup
 (10.115.27.16) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1676380529;
 bh=GaLyG4VOiWZFdMxhKb52MH1LIYZbmTs+uL8C7O7xBq4=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=JEodMst8zvlfOml+aKH3TwSUdRJh8sXgONEX7AqouqBOuEyZDLt+L2n7qh0/riW+0
 dEX40RlX8X0twFFaUvKQU831v5eIZAYhceJd/cscP3I0lv7WMCsZZjpCo9PUciH1ax
 uNHj2uN5rwLvuAmZztIXHaQLxDy84Ob2463DU2aA9z66jBLIIT4vDx6uj0anDO2rS3
 1k9BPm9tYlpNFiVfFYKi+LVA0j9hC24dQS9KqZQZTXO5Tj/SYMJ044O7W56XMvY77k
 3+9QLQHa+2+0aBfop4Pv1+pazlJK68AH1WEI5t/Qt1yoIEVCuqPn8u08wiA4LfXhDw
 G/QwK+5Td46Ow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=JEodMst8
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: disable package for
 s390x architecture
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

Giulio, All,

On 2023-02-14 13:16 +0100, Giulio Benetti spake thusly:
> On 14/02/23 12:18, yann.morin@orange.com wrote:
> >On 2023-02-14 11:50 +0100, Giulio Benetti spake thusly:
> >>s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
> >>package for this architecture.
> >Instead of fixing each and every rtlXXXX packages one by one when there
> >is an autobuild failure, can we just exclude them in bulk, since they
> >are all wireless drivers, and thus will never be available for s390x?
> something like this[0] seems to work, what about it?
> 
> Of course I need to clean up all the packages that depends on !BR2_s390x
> but the idea works for me, at least I've tested on my side and it does.
> 
> If you say it's ok I clean up, check better for other Wireless Drivers,
> create a good patch and send it while rejecting this one.
> 
> [0]: https://patchwork.ozlabs.org/project/buildroot/patch/20230214120808.1282621-1-giulio.benetti@benettiengineering.com/

That's not really what I meant...

I was mostly thinking of sending a patch series that would add the
!s390x dependency to all remaining wifi drivers without waiting for
them to fail in an autobuilder...

However, moving them all inside a common sub-menu that is itself guarded
by !s390x sounds OK. At least, when we add a new wireless driver, we'd
know where to add it, and we would not have to care about forgetting the
!s390x dependency...

(but note that, with this email, I'm no maintainer; let's see what the
maintainers think).

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
