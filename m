Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEF1C6FA91
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 09:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 599E041731;
	Tue, 20 Sep 2022 09:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 599E041731
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ffqiRIfx3F34; Tue, 20 Sep 2022 09:11:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7291415F4;
	Tue, 20 Sep 2022 09:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7291415F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 389E81BF2FD
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 09:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 211D160D72
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 09:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 211D160D72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7laF3BAcDO2a for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 09:11:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1C586058D
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.40])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1C586058D
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 09:11:47 +0000 (UTC)
Received: from opfedar03.francetelecom.fr (unknown [xx.xx.xx.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar24.francetelecom.fr (ESMTP service) with ESMTPS id 4MWwlj59WPz5wpg; 
 Tue, 20 Sep 2022 11:11:45 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 20 Sep 2022 11:11:43 +0200
Date: Tue, 20 Sep 2022 11:11:43 +0200
From: <yann.morin@orange.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <30931_1663665105_632983D1_30931_112_8_20220920091143.GD3551@tl-lnx-nyma7486>
References: <20220920064550.520645-1-thomas.petazzoni@bootlin.com>
 <20330_1663659985_63296FD1_20330_21_1_20220920074624.GC3551@tl-lnx-nyma7486>
 <20220920103524.41ad225a@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220920103524.41ad225a@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX307.corporate.adroot.infra.ftgroup
 (10.115.27.12) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1663665105;
 bh=rSroev/saZMUb3K095L8Rb5+bZsuzU5AFZMBcEziBl0=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=Pg+g/puMFc2M97s0Yp6XpAQhZPhXT8/H8sik19v2U7bWJtkHa7jhjL1zhYgNm/f2X
 TJnetR+sTh3fLPltBusAt7oV1ariWvJIHozFIJ2G2qqundsSOxqk2xqEiqYj+X4Gr8
 WjnyC3RtUNZoLrjL38hMIYO6Sy4+moFV8mhEyQD0KTfJm68FjVBzvOUc1bHng43ooM
 NfhyY2gnPI9BvGBJJUktNDgTEukqeWCZWCAm9Bppoc3alI6XrQWIQBS3QiaOxd+Tqj
 qPlSHMhOsdcRsvBbrgvKLWyaBCSu/YqzawJxndhxVitlq2MCuM+/3cE0Fb7xiM2J/8
 7qPDPAbyl2rzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=Pg+g/puM
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

On 2022-09-20 10:35 +0200, Thomas Petazzoni spake thusly:
> On Tue, 20 Sep 2022 09:46:24 +0200
> <yann.morin@orange.com> wrote:
[--SNIP--]
> > Finally, this script takes more than a minute to run on our build, about
> > a 10% increase from ~12min. This is not nice at all.
> >     $ find host/*bin host/lib* -type f |(keep just libs + execs) |wc -l
> >     339
> > That last command, though, is what takes time: there is a huge ton of go
> > junk installed in HOST_DIR, and this takes ages to filter-out.
> Wow, 1 extra minute, this seems a lot. However, I don't understand what
> you mean by "That last command". What exactly takes time? The fact that
> we run "file" on zillion of files to filter out files that are not
> executable/shared libraries? Or the readelf on the filtered files?

Sorry, I was not explicit enough. Yes, the filtering only, i.e. only
running 'file' on all those 16k+ files takes more than a minute:

    $ date +%s; find host/*bin host/lib* -type f |while read f; do
        mime=$(file -b --mime-type ${f})
        if test "${mime}" != "application/x-sharedlib" -a
                "${mime}" != "application/x-executable" ; then
            continue
        fi
        printf '%s\n' "${f}"
    done |wc -l; date +%s

    1663659605
    339
    1663659681

I.e. 76 seconds just to identify the files to actually look at.

> > So, although I understand the rationale, this should probably be opt-in.
> > 
> > Or it should only be ran when doing an SDK?
> 
> I am fine with this being opt-in, but I would not tie it to the SDK,
> but rather to CI in the autobuilders. Indeed, while locally for your
> own projects where you might control the build environment (using
> containers, as you mentioned), in the general situation, Buildroot
> tries to not use system libraries other than the C library. So having
> this in the autobuilders would not impose the extra time on users, but
> would allow us to detect a number of undetected spurious host
> dependencies.
> 
> So, it would be a Config.in option, disabled by default. Autobuilders
> would enable it, and users who are interested by the extra checks could
> also enable it.
> 
> Thoughts?

Yes, being opt-in is probably the best solution, in the "Build options"
-> "Advanced" submenu.

Or we can see at optimising it. Overall, I am not a fan of "if it's too
slow, don't do it", but I prefer "if it's too slow, make it faster".

So, we can start by spawning less processes, then use sed to filter out
the result:

    find ${HOST_DIR}/*bin ${HOST_DIR}/lib* -type f -print 0 \
    |xargs -0 -r file --mime-type \
    |sed -r -e '/^(.+): application/(x-executable|x-sharedlib)$/!d; s//\1/' \
    |while read f; do
        readelf blabla...
    done

I'll try to find some free CPU cycles to look further into that soon...

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
