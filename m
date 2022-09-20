Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4B9C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 09:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E87881B69;
	Tue, 20 Sep 2022 09:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E87881B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eyCR2K5cU7SJ; Tue, 20 Sep 2022 09:41:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E3F981846;
	Tue, 20 Sep 2022 09:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E3F981846
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 78DC61BF2FD
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 09:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5059081846
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 09:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5059081846
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vJomyD9u6fR2 for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 09:40:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F98581801
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F98581801
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 09:40:56 +0000 (UTC)
Received: from opfednr05.francetelecom.fr (unknown [xx.xx.xx.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr23.francetelecom.fr (ESMTP service) with ESMTPS id 4MWxPK70bPz5wry; 
 Tue, 20 Sep 2022 11:40:53 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 20 Sep 2022 11:40:51 +0200
Date: Tue, 20 Sep 2022 11:40:51 +0200
From: <yann.morin@orange.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <29653_1663666853_63298AA5_29653_380_1_20220920094051.GE3551@tl-lnx-nyma7486>
References: <20220920064550.520645-1-thomas.petazzoni@bootlin.com>
 <20330_1663659985_63296FD1_20330_21_1_20220920074624.GC3551@tl-lnx-nyma7486>
 <20220920103524.41ad225a@windsurf>
 <30931_1663665105_632983D1_30931_112_8_20220920091143.GD3551@tl-lnx-nyma7486>
 <20220920111919.784ffa7e@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220920111919.784ffa7e@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX405.corporate.adroot.infra.ftgroup
 (10.115.27.14) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1663666854;
 bh=Nhc9sGxtdn90j/6lidbMyxBRDNz7tzcUpptDXzqGWJo=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=h1kdB8UetPeMMgSY1xooTHjLcHJdxOerrE1bs2+mOaktHa3T9DVLFpVHxKEdZiqr8
 8eHq2lXyweE3S2bv9vUSToyGW0jKULbbza//a8tiCECnIH2maBRsoIJOC7Q1AcrNIR
 l1EBE9I7n+dJDMfzXjLsngprXVUM+J94QOE9MdsVKXFRzWRcssJCLkFCtBdO2m6n8l
 vkWBgUQpye33p2xA1yTOKhtW6WVr5kVqvcJ9mmDahbyVt6s8WbOhDeKqQaUqgCkO7B
 3UZbM2y7I03bVdD8hqr8PssuWxkz8x6RzIxVgVO196+IiCTt6bzc8RALuUpd8MM5xG
 fPiqqVW9JJfdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=ORANGE001 header.b=h1kdB8Ue
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-09-20 11:19 +0200, Thomas Petazzoni spake thusly:
> On Tue, 20 Sep 2022 11:11:43 +0200
> <yann.morin@orange.com> wrote:
[--SNIP--]
> > So, we can start by spawning less processes, then use sed to filter out
> > the result:
> > 
> >     find ${HOST_DIR}/*bin ${HOST_DIR}/lib* -type f -print 0 \
> >     |xargs -0 -r file --mime-type \
> >     |sed -r -e '/^(.+): application/(x-executable|x-sharedlib)$/!d; s//\1/' \
> >     |while read f; do
> >         readelf blabla...
> >     done
> 
> If it's really running "file" on a zillion files that is slow, I'm not
> sure how this can really improve the performance: it still runs "file"
> on zillion files.

That's because in your script, 'file' reads in DB for every file, while
the above only loads the DB for each set of a lot of files at once.

So, using the above to just list he ELF files, takes just 30s instead of
76s with your construct. It's still a lot, but it is less than half the
time already.

> Also, I initially had some constructs with a ... | while read f, but
> the variables in the sub-shell where not visible outside, so the
> "bailout" variable didn't work.
> 
> An alternative would be to try to do this in Python and use
> parallelization.

What is the policy on requiring a pyhon interpreter on the host for
mandatory Buildroot infra? In my experience, doing things in python
rather than in shell, does indeed speed up things quite substantially.

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
