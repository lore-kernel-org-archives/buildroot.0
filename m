Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A697ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 07:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99D844187E;
	Wed, 21 Sep 2022 07:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99D844187E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NSdJf8gIJOMr; Wed, 21 Sep 2022 07:27:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49E004188F;
	Wed, 21 Sep 2022 07:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49E004188F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D6F01BF3E3
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 07:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 264C5409FA
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 07:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 264C5409FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3hkpeE9gytTJ for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 07:27:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4A96402E7
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4A96402E7
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 07:26:59 +0000 (UTC)
Received: from opfedar04.francetelecom.fr (unknown [xx.xx.xx.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar20.francetelecom.fr (ESMTP service) with ESMTPS id 4MXVNK21c4z8tnK; 
 Wed, 21 Sep 2022 09:26:57 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Wed, 21 Sep 2022 09:26:55 +0200
Date: Wed, 21 Sep 2022 09:26:55 +0200
From: <yann.morin@orange.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <10071_1663745217_632ABCC1_10071_436_1_20220921072655.GA2398274@tl-lnx-nyma7486>
References: <20220920064550.520645-1-thomas.petazzoni@bootlin.com>
 <20330_1663659985_63296FD1_20330_21_1_20220920074624.GC3551@tl-lnx-nyma7486>
 <20220920103524.41ad225a@windsurf>
 <30931_1663665105_632983D1_30931_112_8_20220920091143.GD3551@tl-lnx-nyma7486>
 <20220920111919.784ffa7e@windsurf>
 <29653_1663666853_63298AA5_29653_380_1_20220920094051.GE3551@tl-lnx-nyma7486>
 <20220920115459.2aca37f7@windsurf>
 <2ec945e7-22ab-36c9-9ccf-ef022bcfb0ef@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ec945e7-22ab-36c9-9ccf-ef022bcfb0ef@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX404.corporate.adroot.infra.ftgroup
 (10.115.26.17) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1663745217;
 bh=kr8bCuOje4WJsH5uXzdCbIK7411wpVkMwmeXUF+UWQU=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=QnWdxDj41V+iWkIQXa72wSpBn8ASFcJpNPM1Yi6suYroalnFSR0aAQSoazJlsoSho
 1K4yn84+Od9Laal/gwbo1TqsulGZLhucWZRur1OM5d7zt9D6uiSTCc6xnUEPtcO0Ay
 W23jRTfrQSw8eHJsxEwI38HUvyLca3OdPMeVDSVJTpFueKdrmwVqy9dEWdwMh5P+hY
 y+VmxMUub3DqNHvb2H9Kj4xIXS6oTGbdLiDT+NJxupnln4XxbIVD+YJHx6H6NQOBo/
 U+6FTVLAD12t+G095IHDESfElHhuUMewvthZ2fC/8qsJx+wmeTDx8H/uU0egAd+T1C
 dXh4T153bjM6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=QnWdxDj4
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-09-20 21:48 +0200, Arnout Vandecappelle spake thusly:
> On 20/09/2022 11:54, Thomas Petazzoni wrote:
> >Another possibility is to not use "file" and just look at the first 4
> >bytes of the files to identify ELF files, because that's really what
> >matters.
>  I was thinking the same thing.
[--SNIP--]
> date +%s
> find host/*bin host/lib* -type f |while read f; do
>         if printf '\x7f\x45\x4c\x46' | cmp -s -n 4 - ${f}; then
>             printf '%s\n' "${f}"
>         fi
> done | wc -l
> date +%s
> 
> 1663702312
> 111
> 1663702338
[--SNIP--]
> - cmp of just 4 bytes still takes 26 seconds, but that's a big improvement
> over the original 67 seconds. Still it seems to be a bit long for just 13000
> files - that's only 500 files per second...

In my case, it takes 62s, i.e. roughly the same amount of time the
one-by-one mimetype check does (76s). So, the many mimetype checks at
once are much faster here (30s).

Anyway, indeed, there is nothing in shell that can beat a little python
script:

    $ cat foo
    #!/usr/bin/env python3
    import os
    import sys

    def main():
        for d in sys.argv:
            if os.path.islink(d):
                continue
            for dirpath, _, filenames in os.walk(d):
                for f in filenames:
                    path = os.path.join(dirpath, f)
                    if os.path.islink(path):
                        continue
                    with open(path, 'rb') as fd:
                        blob = fd.read(4)
                    if blob == b'\x7f\x45\x4c\x46':
                        print(path)

    if __name__ == "__main__":
        main()


    $ date +%s; ./foo host/*bin host/lib* |wc -l; date +%s
    1663743040
    382
    1663743040

Yes, less than one second. And it identifies exactly the same set of
files the cmp shell snippet does (of course, both on a cache-hot dir).

So, I would be happy that we add a python interpreter to the required
dependencies. We can be conservative and require just 2.7 if we really
want to be able to build on older distros. Nowadays, virtually everyone
has a python interpreter on their machine...

There still is a little issue, though, is how we can parse an ELF file
in python. It is not entirely trivial, but I already did that in some
other place (and the license is compatible with that of Buildroot):
    https://github.com/Orange-OpenSource/aa-scan3/blob/master/aa_scan3/plugins/elf.py#L63

And that proved to be much, *much* faster than doing it in shell (at
least an order of magnitude). Only issue: it is not in the python
stdlib...

So, we could delegate to a python helper like the little snippet above,
to search for ELF files, and keep using a shell script to to the rest.
In my experience with Thomas' initial patch, what realyl took time was
running the search, and the readelf part was mostly unnoticeable, so
probably around a few seconds. I'll try to do some timing today.

Regards,
Yann E. MORIN.

> - cmp also finds object files (mime-type application/x-object), and Go
> happens to dump a lot of those in lib/go/debug. This may cause the
> subsequent readelf to take a lot of time again.
> 
> 
> >>What is the policy on requiring a pyhon interpreter on the host for
> >>mandatory Buildroot infra? In my experience, doing things in python
> >>rather than in shell, does indeed speed up things quite substantially.
> >
> >We have indeed dropped python on the host as a requirement for the
> >build some time ago. Probably doesn't make sense to reintroduce this
> >requirement "just" for this. Even though practically speaking, a lot of
> >the tooling around Buildroot (pkg-stats, graphs, etc.) already relies
> >on Python, and most people are very likely to have Python installed
> >anyway.
> 
>  I hate to say this, but we do still have perl as a dependency... If you
> want, I can ask my colleague Hugo to whip something up. But I don't expect
> you actually want that :-) No, seriously, what he writes is really readable.
> Still perl though.
> 
> 
>  Regards,
>  Arnout
> 

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
