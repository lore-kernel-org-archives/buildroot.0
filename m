Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46BBC25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 12:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1684360FD6;
	Tue, 16 Aug 2022 12:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1684360FD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ReozQuY-qDLN; Tue, 16 Aug 2022 12:04:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E697460F4C;
	Tue, 16 Aug 2022 12:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E697460F4C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 784441BF82D
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 12:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 537A08148E
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 12:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 537A08148E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cx7F78LgItds for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 12:04:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5A9281328
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5A9281328
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 12:04:45 +0000 (UTC)
Received: from opfednr02.francetelecom.fr (unknown [xx.xx.xx.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr26.francetelecom.fr (ESMTP service) with ESMTPS id 4M6VFR2Cftzytm;
 Tue, 16 Aug 2022 14:04:43 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 16 Aug 2022 14:04:40 +0200
Date: Tue, 16 Aug 2022 14:04:40 +0200
From: <yann.morin@orange.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <30735_1660651483_62FB87DB_30735_129_1_20220816120440.GA2939@tl-lnx-nyma7486>
References: <20220816094829.377-1-guillaume.bressaix@gmail.com>
 <20220816120109.1a348d39@windsurf>
 <14985_1660644771_62FB6DA3_14985_149_1_20220816101249.GA2027648@tl-lnx-nyma7486>
 <20220816135325.169146bf@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220816135325.169146bf@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX206.corporate.adroot.infra.ftgroup (10.115.27.7)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1660651483;
 bh=LnDUu549NspLMMX5epLURG3Po5nb5EqnwfMNv4LS1Ag=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=cJHuoFJ16gSk0OBME4Zja2MewwX/DRhSB825GBhlP1TuL2ojU8IB5/b6wBBZZO6Pq
 6wa9frS05t75rD7KSpgmxQ58WB7xXas0QzuefDNHNkw+QfNr/IXSUuOoNcz1DEJQK0
 46g1gGFIHbBefnFrpwSztk6zrAWDHyjtWeu7e4HQOO8/8agnfG+8Rm2+Aj5ELcwFov
 BpAv6iiEwznASDLNfjN4bmgaC0tCyVo2MZYk/lMZnSIWal932m1+1Fm54wN1cY8rmg
 0nIAcBKl0hPNTdFMxXYRJ+q693byZgJ53p3B0fpFH9itV0oVvo3alSwNExNfyVcugD
 mCxlLhrJZoQvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=cJHuoFJ1
Subject: Re: [Buildroot] [RFC 1/1] package/pkg-meson.mk: handle possibly non
 existing compilers
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
Cc: buildroot@busybox.net, "Guillaume W. Bres" <guillaume.bressaix@gmail.com>,
 Yann Morin <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-08-16 13:53 +0200, Thomas Petazzoni spake thusly:
> On Tue, 16 Aug 2022 12:12:49 +0200
> <yann.morin@orange.com> wrote:
[--SNIP--]
> > So, yes, we tried for CXX, and no, we do not want to do it again. For
> > consistency, we should not try for other languages either, I believe.
> So, the Meson-specific solution proposed by Guillaume is relevant?

Yes, I believe so. Disabling use/detection of tools should be a
per-infra solution: the meson solution (use /bin/false) is incompatible
with the autotools (which break with /bin/false).

As for why using /bin/false in meson, see:
    https://lore.kernel.org/buildroot/20220809162534.GE3168@scaer/

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
