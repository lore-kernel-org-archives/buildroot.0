Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD790C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 15:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 607604031C;
	Thu, 10 Feb 2022 15:19:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CR_JP_L92pQn; Thu, 10 Feb 2022 15:19:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F5FB40647;
	Thu, 10 Feb 2022 15:19:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FBB21BF3DB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 15:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D43B40647
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 15:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JeCizSWAL1tm for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 15:19:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.39])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 757424031C
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 15:19:20 +0000 (UTC)
Received: from opfedar06.francetelecom.fr (unknown [xx.xx.xx.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar23.francetelecom.fr (ESMTP service) with ESMTPS id 4JvgQG0hknzBrkp; 
 Thu, 10 Feb 2022 16:19:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1644506358;
 bh=hzzLRvuxqEwsqxfOnuGKlyKR2UFdZieZkOnHXj7ev0k=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=TaXjg3NOan4W3+l87hUmkO88RlHOqG24EDBstsgJm3Y0iHuCslGtaqzmPxs7mcCI9
 dJ63ariIDsHutAt8yZPPd+XHEBjOCqoZcdCMVsHR+7DLVGCPtSMd4eDuaxwwo85mMt
 NVPn94KgHsBZSq1Cse5tngm90MATpzEQENQUEp1vyyPRt4ax34wvNAu72sXwwZIbBl
 c5F0oiGyJmwGOxLg65CZYRC8VhulNmkvKZkGhLnmkK4OEnFMPJ4Df91M/HFrzdwKtn
 vUL7J3KTY7MlErmJh856Fe2QOCxQ95DiTe+ah0o2PKTltib1Ls+OHKdeSl3FcsNyCZ
 ia9PgrRJ59z0w==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Thu, 10 Feb 2022 16:19:16 +0100
Date: Thu, 10 Feb 2022 16:19:16 +0100
From: <yann.morin@orange.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <7033_1644506358_62052CF5_7033_331_1_20220210151916.GB2599@tl-lnx-nyma7486>
References: <fea7d1545892211e01cb6660dc5fba16b0851c47.1644422916.git.yann.morin@orange.com>
 <20220209205410.071f193a@windsurf>
 <20220210150850.GA2599@tl-lnx-nyma7486>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220210150850.GA2599@tl-lnx-nyma7486>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX103.corporate.adroot.infra.ftgroup (10.115.26.4)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: Re: [Buildroot] [PATCH 2/5 v2] package/pkg-cargo: allow building in
 a sub-directory
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

Thomas, Alll,

On 2022-02-10 16:08 +0100, MORIN Yann INNOV/IT-S spake thusly:
> On 2022-02-09 20:54 +0100, Thomas Petazzoni spake thusly:
> > Should $(2)_SUBDIR be documented for the cargo-package infra in the
> > documentation ?
> It is not documented for any of the other infras that make use of it
> (autotools, cmake, python, etc...).
> The only mention of _SUBDIR in the manual is about _SUBDIRS (plural) for
> the kernel-module sub-infra.

Scratch that, I seem to be unable to do a proper search in a webpage...
:-(

I'll add it to the cargo part of the manual.

Cordialement,
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
