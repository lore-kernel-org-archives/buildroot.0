Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4438BCE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 13:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA21981EB5;
	Mon, 25 Sep 2023 13:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA21981EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GFl4sH5Lahnq; Mon, 25 Sep 2023 13:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C7B881EE5;
	Mon, 25 Sep 2023 13:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C7B881EE5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFC8A1BF381
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 13:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A435741AE9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 13:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A435741AE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id amq6uDA4R6LH for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 13:47:08 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BDC341769
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 13:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BDC341769
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 15:47:05 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Sep 2023 15:47:05 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 15:47:03 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Mon, 25 Sep 2023 15:47:03 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.03,175,1694728800"; d="scan'208";a="44305937"
Date: Mon, 25 Sep 2023 15:47:03 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZRGPV+O+bz1rN3jF@tl-lnx-nyma7486-2>
References: <85bdd1b26ba56471330e98465095d943b54e3e74.1695644947.git.yann.morin@orange.com>
 <20230925154232.69fdc4bd@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230925154232.69fdc4bd@windsurf>
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1695649628; x=1727185628;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=zIngJDueSXSofdNJtfzb2b5IqDRGqmhzE0hmTfKwB4M=;
 b=NYDdWvaC/gfaVwjgzIZhJdhG1KJRObqA4nS2Ud2Ijf4Jo1et0e2goSMP
 LkqOyE0ESA10vpKEkSwkzbt5yyGMuNyW8k3/uSk8eVLxDIVdmAczE9z5w
 YgnOKleN/r6o36WWcdCDIISN0B9FtGe7uB26rUgzH/cRZA86ar19VqEva
 uM1iNudqlAY+B4m7uNuPSVnk5BGZNu6lYsZQOpSPJ+zN4gynR6jnC1PNU
 Saiwbnso0a0Wg2PxZjVx+GE2MWMHUqfekVcdm6F7YlhjhJI68WpYr1Gfu
 gQZVNyyDZlE+MYMqVnteqowUiX3dTLoOB0P+7kn1fvNlTSIUyAuOMHBGQ
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=NYDdWvaC
Subject: Re: [Buildroot] [PATCHv2] package/go: cgo for the target needs the
 toolchain
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-09-25 15:42 +0200, Thomas Petazzoni spake thusly:
> On Mon, 25 Sep 2023 14:29:15 +0200
> <yann.morin@orange.com> wrote:
> > From: "Yann E. MORIN" <yann.morin@orange.com>
> So if you're the author...
> > When the target is not supported by go, then there is obviously no need
> > to depend on the toolchain (even if we unconditionally enable cgo
> > support in only-for-the-host host-go).
> > 
> > Signed-off-by: Christian Stewart <christian@aperture.us>
> Christian should not be the first Signed-off-by, but you should be.

Indeed, I forgot to fixup authorship when working on the patch...

> I believe this was originally written by Christian, and you extended
> the commit log/improved the patch, so I guess Christian should be kept
> as the author.

Absolutely, yes.

Regards,
Yann E. MORIN.

> > [yann.morin@orange.com:
> >   - only add the toolchain dependency for target cgo
> >   - reword commit log
> > ]
> > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Anisse Astier <anisse@astier.eu>
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

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
