Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A31EC001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFEAD818D7;
	Mon,  3 Jul 2023 19:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFEAD818D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kx4a3y4ua27t; Mon,  3 Jul 2023 19:37:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1744081854;
	Mon,  3 Jul 2023 19:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1744081854
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 856B91BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E58560750
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E58560750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QL_Lv58ps52C for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:37:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AD1960E4B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AD1960E4B
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:37:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d686:7886:a85d:fb8a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3E8552003AE;
 Mon,  3 Jul 2023 21:36:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jul 2023 21:36:56 +0200
Date: Mon, 3 Jul 2023 21:36:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230703193656.GG2510@scaer>
References: <20230703182930.B08CA863E5@busybox.osuosl.org>
 <20230703205631.4dd121b0@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230703205631.4dd121b0@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1688413022;
 bh=GxfOeGSiKIoc4Dr5uc/TrHtDU7P0ZpFInXW7I5eMHuM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A/+RN3rWYX5N9391kCXYRJteU6Gku8TYRP7wsEvGdMy/LF2JGNK9UY0OAsnxCs3KB
 0eAtlzLuS8L0+OFQfHm7RR44LtjSj0bgLNpzNL2VitlTNqWreQIBr/axgpx+H6Ya5+
 7ttQ+rYg+i9K3cdBiVmV9LgmcrTWPDi/+dQ5aO8n++hrWFnxPJuYdTNjdJE0K8Jb5T
 2idSJFq7E1LnSm2KxWCtwluEehgIhdWq4ySMq/PKmU5/mThnC/XO84R5cslDbvl9nM
 xu4NqWFue3XIFVclHSNZ6f8nBdmuDD2TC/ADE/4l+Ghyn8QmqDPwKAqgV/A608ILYs
 wql4RFk9qqDUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A/+RN3rW
Subject: Re: [Buildroot] [git commit] package/python-setuptools: add missing
 dependency on host-python-wheel
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
Cc: Romain Naour <romain.naour@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Arnout, All,

On 2023-07-03 20:56 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Mon, 3 Jul 2023 20:20:31 +0200
> Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:
> 
> > commit: https://git.buildroot.net/buildroot/commit/?id=3b2913552ee4e304d4d86e577b237652a8f0a99f
> > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> > 
> > While migrating to pep517 build backend the host-python-wheel
> > dependency has been added to host-python-setuptools but
> > not to python-setuptools. Note that host-python-wheel is not really
> > needed during the build of (target) setuptools, but the setup.py script
> > checks if the dependency is present in the host directory.
> > 
> > To make everything consistent, add host-python-wheel as a build
> > dependency, and BR2_PACKAGE_PYTHON_WHEEL as a runtime dependency.
> Hu, this was not in the patch from Romain I believe.
> > +	select BR2_PACKAGE_PYTHON_WHEEL # runtime
> This is not correct, there is no such symbol in Buildroot, and it
> causes a check-symbol error:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4586144848
> What was the motivation behind this additional select?

In the meantime, I've pushed a fixup commit that drops this spurious
select; if there was indeed a good rationaly for having python-wheel on
the target, as a runtiem dependency of python-setuptools, this is going
to need a bit more work.

The fixup does not maek the situation worse than it was before either.

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
