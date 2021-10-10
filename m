Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01506C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 19:30:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09FDB60EDF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 19:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09FDB60EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C78D160698;
	Sun, 10 Oct 2021 19:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ShFxX6efWyUX; Sun, 10 Oct 2021 19:30:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1346D6067D;
	Sun, 10 Oct 2021 19:30:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 948B01BF3BE
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 19:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F6904018C
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 19:30:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tzb6B9wgLAZT for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 19:30:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13B9740101
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 19:30:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:74c0:e1ec:fabc:9152])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2DD6C19F57C;
 Sun, 10 Oct 2021 21:30:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633894249;
 bh=e53e2MbbSTk15inSnDmNvCixXXXqyWRtrhnq0djmyyk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uji7oY/6dbyym3vcm5mKEt1X+pcxOQPgPMH5VxW2vtZgwCCfat+tHwCXrqe+G2+B7
 6KsfJNpHXvCp6FKFcysmqXvVl8eZWo3RTlSXBdYOOTQYNi2k9KmyCekucN7rE8bDAy
 uPguyvA0pc2n8TgWGk112oJHn3rYMMfCG1KThcAmJUkxuqsi++nsLpXW9FLSoUfXV4
 5NCDEqHA9x+nXhXFNvvzqeJQyv9agZKwMCd5+P430HftBknQxHDFh+bYYHCwpYH+hd
 y/PQ1KXDrTZpDvhzT8otAxQgL3FAmf20Y6llW25Gq8HWTMlTwRGduV4L00bifl6Rt9
 Q/Ek8UmtOAydw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 10 Oct 2021 21:30:25 +0200
Date: Sun, 10 Oct 2021 21:30:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211010193025.GP2081069@scaer>
References: <20211009205523.3137859-1-aduskett@gmail.com>
 <20211010155556.7a2760b2@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211010155556.7a2760b2@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 00/20] package/python3: bump to version 3.10
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org, Mauro Condarelli <mc5686@mclink.it>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2021-10-10 15:55 +0200, Thomas Petazzoni spake thusly:
> On Sat,  9 Oct 2021 13:55:03 -0700
> Adam Duskett <aduskett@gmail.com> wrote:
> > In the following patch series python3 (eventually) gets bumped to version 3.10
> > 
> > - The first parts involve updating packages that are not compatible with 3.10.
> >   Either by updating versions or adding patches.
> > 
> > - Then I fix a typo in python-pathvalidate
> > - Then I complain about python-setuptools and split add support for both
> >   setuptools 48 (compatible with python2) and 58 (compatible with python3.10)
> > - Finally I update python3 to 3.10
> > 
> > This patch series has been tested against every python2 and python3 unit-test
> > available in buildroot, including against https://patchwork.ozlabs.org/project/buildroot/patch/20211006203823.2740442-1-yann.morin.1998@free.fr/
> > 
> > In addition, I also selected *EVERY* python module to ensure all of them at
> > least build against python3.10, and everything passes.
> 
> Thanks a lot for this effort! Should we have a configuration, or a test
> case that builds all Python modules, to facilitate this kind of testing
> in the future ?
> 
> Also, should we drop Python 2.x entirely before merging this, to avoid
> the complexity on the setuptools package? Or do we consider the
> complexity to be reasonable, and therefore we handle the Python 2.x
> removal later?

I've done a (quick) inventory of all the things we have that still
require python2; no package requires python2, but for some optional
parts:

    avahi           -> auto support
    cracklib        -> auto support
    jailhouse       -> opt scripts
    libdnet         -> opt module
    libpwquality    -> auto support
    nfs-utils       -> auto script
    nmap            -> opt script
    owfs            -> auto support
    pcm-tools       -> opt script

    'opt': explicit with Config.in option
    'auto': implicit with .mk conditions
    'module': builds one+ python module
    'script': installs one+ python script
    'support': generic python support (ie. bindings?)

I am totally fine with dropping python2, if we accept the loss of the
features above, an d I think the loss is acceptable.

Note: I haven't had a look at the python-packages. For those that are
python2-only, and that have a python3-compatible version, we bump to
that version, otherwise we drop the package.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
