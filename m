Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323DEC2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 10:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75C43410C6;
	Tue, 16 Aug 2022 10:12:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75C43410C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CbZGyDJn_IJs; Tue, 16 Aug 2022 10:12:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74210410D7;
	Tue, 16 Aug 2022 10:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74210410D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5077D1BF3C8
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 10:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B17281AAC
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 10:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B17281AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UqXk33H9EFFd for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 10:12:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5321817F5
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5321817F5
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 10:12:54 +0000 (UTC)
Received: from opfednr02.francetelecom.fr (unknown [xx.xx.xx.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr26.francetelecom.fr (ESMTP service) with ESMTPS id 4M6RmM6MWpzyf6;
 Tue, 16 Aug 2022 12:12:51 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 16 Aug 2022 12:12:49 +0200
Date: Tue, 16 Aug 2022 12:12:49 +0200
From: <yann.morin@orange.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <14985_1660644771_62FB6DA3_14985_149_1_20220816101249.GA2027648@tl-lnx-nyma7486>
References: <20220816094829.377-1-guillaume.bressaix@gmail.com>
 <20220816120109.1a348d39@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220816120109.1a348d39@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX404.corporate.adroot.infra.ftgroup
 (10.115.26.17) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1660644771;
 bh=u5wLmD7Yen6ca2bWEs20/2SojRGR1rv8PfsXji42HkQ=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=QZegE2LCcC0Axawc98PAxgjGzdmyGHvwzPSiMOBkdqCv/DVeayoto6TZ643T4wloG
 jFv9KX/8LFhc+/58VklZbFRSCUIgZmWHAc1i9ZSG+A2/Llu6TRCwbiuFcYhxff0ns3
 c5xKdlEksgrPCvgkIMsLjXVkUbeR113vBWIU0ufZ6fa9hmIM+iv5hBGhMYmn3ICO5Y
 n6/MbgRi5d4Iyge0qo4cgyi1OoDlyyqDWo5Qb4C/W12gSqlpg2Wc0A+MmlM5uHtdTb
 KUSqfbxR8cgIiTJ0t4eeie4NHJxXaex4L7JnIMgHPqK5wlKi6OCOPl0ravJYQ2uE1u
 lCZ0B6wVllf8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=QZegE2LC
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

Thomas, Guillaume, All,

On 2022-08-16 12:01 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Tue, 16 Aug 2022 11:48:29 +0200
> "Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:
> > To avoid populating the cross-file with non existing compilers,
> > we tie them to /bin/false
[--SNIP--]
> Now, the annoying question: should this be done in pkg-meson.mk, or
> should we do it more globally, i.e define TARGET_CXX and TARGET_FC to
> correct values only when C++ or Fortran are supported.
> 
> Yann, what do you think? Did we ever try to have TARGET_CXX=/bin/false
> and TARGET_FC=/bin/false when there is no C++/Fortran support?

I think my non-work identity would also remember commit bd39d11d2eaa
(core/infra: fix build on toolchain without C++), and the mess it
caused, which was fixed by commit 4cd1ab15886a (core: alternate solution
to disable C++).

So, yes, we tried for CXX, and no, we do not want to do it again. For
consistency, we should not try for other languages either, I believe.

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
