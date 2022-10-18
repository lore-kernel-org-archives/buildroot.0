Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23710C433FE
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 08:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D042830A7;
	Tue, 18 Oct 2022 08:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D042830A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JnyIT-WrgLfr; Tue, 18 Oct 2022 08:40:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB93A8308B;
	Tue, 18 Oct 2022 08:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB93A8308B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F98C1BF34E
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 08:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E60CE60FFA
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 08:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E60CE60FFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L-vf8yaKFfha for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 08:40:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7C5960FF8
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7C5960FF8
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 08:40:48 +0000 (UTC)
Received: from opfednr00.francetelecom.fr (unknown [xx.xx.xx.64])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr22.francetelecom.fr (ESMTP service) with ESMTPS id 4Ms6l26kpszyww;
 Tue, 18 Oct 2022 10:40:46 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 18 Oct 2022 10:40:44 +0200
Date: Tue, 18 Oct 2022 10:40:44 +0200
From: <yann.morin@orange.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <17222_1666082446_634E668E_17222_61_1_20221018084044.GG2064029@tl-lnx-nyma7486>
References: <cover.1665868987.git.yann.morin.1998@free.fr>
 <CADYdroMmvaBpSbVkrc+Eu7KtkBt1m7Zqeu4mO6a2UZp+a1Hjrw@mail.gmail.com>
 <30300_1666015916_634D62AC_30300_412_1_20221017141154.GE2064029@tl-lnx-nyma7486>
 <CADYdroMNqJr3nDGhi0=_TttJ9jNp2dD44M=NVQJioLFDxreQVQ@mail.gmail.com>
 <14503_1666022446_634D7C2E_14503_9_8_20221017160044.GF2064029@tl-lnx-nyma7486>
 <CADYdroOjp1duBTiNsdv=C1afgahQVmiDTg49-z_=hdqQJfVxqw@mail.gmail.com>
 <20221017201444.GE3666@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221017201444.GE3666@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX308.corporate.adroot.infra.ftgroup
 (10.115.27.13) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1666082446;
 bh=R7NatqSJZBDY6gIuzxqwy9vuv4t4CjcspnMGENwKfgI=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=eZkXQAThAC0AVQRMDIIPJz4WkdNssj0UvYeL1yqLMEc2EeK/S4Pr3usjE4YVQJEAs
 yiXoVLYR8YHcn/rNIvLxUpN+bd4Nk436jEUw76ah2+oR12RhgIdwKxdA3i5Zz1iXVw
 CrHTdA0p9qGdYREgWTmUHpPvaOsEE225vN3nhOyVxR+4bkAGIf6r0a7PIOebf+SyOd
 1COD1iGQ1tKWKvAttNavV3WIYJR6vHCnPJKXhIEeVq84ZIMda2xLJuAOI3N3Q5XGwS
 vLtup0wVBdTb3BYYxZuN/nussgzi8noa3ZKUACFCSjUaGtuxfwGElmhmvilWyHSQsV
 ZP+iwXHtBaV7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=eZkXQATh
Subject: Re: [Buildroot] [PATCH 0/4] systemd: sort out the conflict between
 var factory and tmpfiles (branch systemdify-var)
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
Cc: Norbert Lange <nolange79@gmail.com>,
 =?utf-8?B?SmXMgXJlzIFteQ==?= Rosen <jeremy.rosen@smile.fr>,
 Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Norbert, All,

On 2022-10-17 22:14 +0200, Yann E. MORIN spake thusly:
> On 2022-10-17 18:49 +0200, Norbert Lange spake thusly:
> > Am Mo., 17. Okt. 2022 um 18:00 Uhr schrieb <yann.morin@orange.com>:
> > > But so far, we do not have that technically better solution, so we need
> > > to fix things that are arctually broken.
> > I tried to bring that in for ages. Probably just have cooked up a patch instead.
> I'll test it in our use-case @work tomorrow.

I did preliminray tsts, and it works, that's great! :-)

I'll be cleaning up my series and repost something real quick I hope.

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
