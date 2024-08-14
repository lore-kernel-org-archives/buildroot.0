Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B8FC52D7F
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 05:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB7B44000B;
	Wed, 14 Aug 2024 05:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6n1v0R42mfHU; Wed, 14 Aug 2024 05:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 631C140451
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 631C140451;
	Wed, 14 Aug 2024 05:52:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 316A51BF484
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 05:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C887813D7
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 05:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnRQ4Ol6F2al for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 05:52:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A74D181366
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A74D181366
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A74D181366
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 05:52:54 +0000 (UTC)
Received: from unknown (HELO opfedv3rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 07:52:51 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Aug 2024 07:52:51 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 07:52:49 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Wed, 14 Aug 2024 07:52:49 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.09,287,1716242400"; d="scan'208";a="186264350"
Date: Wed, 14 Aug 2024 07:52:49 +0200
To: Markus Mayer <mmayer@broadcom.com>
Message-ID: <ZrxGMYJEcrcxPRxC@tl-lnx-nyma7486-2>
References: <CAGt4E5tNuugDABr-goDwU2csVNOAaKp=GqS9B-3KZcMjmaxKYA@mail.gmail.com>
 <Zru-cKO4R3cz1NRF@landeda>
 <CAGt4E5uHdqDHnNHrvuwe18tozRq8B3M5TTaShqRaWqfAOpn_eg@mail.gmail.com>
 <CAGt4E5u3UeGDLp_D1SgedQgXvcN2mGxSF3ExX+e0KKqDMMTVzw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGt4E5u3UeGDLp_D1SgedQgXvcN2mGxSF3ExX+e0KKqDMMTVzw@mail.gmail.com>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX304.corporate.adroot.infra.ftgroup
 (10.115.26.13) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1723614775; x=1755150775;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=89nToByeJbYMkXhzrdKSVgQy+Ru0hARQt/wlpUJZDo0=;
 b=kSXT51kkOWFbq6eG+PZVkoUQNGB8lMiGa+TTafmr/JlhYVsTDgzNUSmJ
 JHIoubCbJ+NG9cgm3vsrffi5qBMXlBSQGutXY7O2blmxI2B3oExJjQMFy
 3PxqukOi03TWEysiiquU+MrdErfyTlcie0TQIy90yOd31GvvBul7lUIRo
 ZLId6ZyS5VfqAu+VEm39xzrNMnzUTiWMIpWHFoUEQfVK7adzfUYFVoOoG
 5yUdxSzjZIwizBLuALl+YDO/MjHiSWVWHj0kkWU+b91VFIcHoJfPZXcgd
 hIGYCraVtRfu03QuslHMmlhbTRMuwPvIOL6pOPZ3Y1rosEk08e0vaM2Sn
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=kSXT51kk
Subject: Re: [Buildroot] LLVM builds broken by "-z text" (3a39e706a91a)
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Markus, All,

On 2024-08-13 21:11 -0700, Markus Mayer spake thusly:
> > On Tue, 13 Aug 2024 at 13:13, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > My @work alter-ego just sent a series that would hopefully help in this
> > > case:
> > >     https://patchwork.ozlabs.org/project/buildroot/list/?series=419144
[--SNIP--]
> I am happy to report that your patch series performed flawlessly in my
> tests. There were no further build issues caused by "-z text".

Very nice, thanks for testing!

> If you so desire, you can add
> Tested-by: Markus Mayer <mmayer@broadcom.com>

Thanks!

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

____________________________________________________________________________________________________________
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
