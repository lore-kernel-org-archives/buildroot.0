Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3A9ECAAD5
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 14:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0828812F6;
	Mon,  5 Sep 2022 14:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0828812F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IF_vFShtrrZP; Mon,  5 Sep 2022 14:08:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA677812E2;
	Mon,  5 Sep 2022 14:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA677812E2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E184E1BF2CB
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 14:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD27040481
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 14:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD27040481
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AAf2Gh_L6_RW for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 14:08:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 760864014C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 760864014C
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 14:08:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a5dc:9bd4:48b0:8ef0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EBCE5B0053E;
 Mon,  5 Sep 2022 16:08:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Sep 2022 16:08:13 +0200
Date: Mon, 5 Sep 2022 16:08:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220905140813.GE1490660@scaer>
References: <20220904191010.200822-1-christian@paral.in>
 <20220904194138.GA1490660@scaer>
 <CA+h8R2pXVEsdxhtuwNNqm-kdE_XdLwjbQLDWNGE4k7=_qrWzgA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2pXVEsdxhtuwNNqm-kdE_XdLwjbQLDWNGE4k7=_qrWzgA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662386897;
 bh=f8HcZFDnye1tEGDigmOzp3TAQmHV+Yh8Wy6sJd7I8ac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tci4npEHp/1GdxzrxoFrgez/oEDeKuz5q8jhZMJ1IpFtoO57wRq47LRuHTBP9UuoW
 BDuE+G2dre/Xc4lvpP5CSQHOPTODPGO3Eet/qoV1zwqdhe0TSFZ2GnzhO6msZZer7o
 Ps+VIPpcZ/3kHsLpr4XdLv3h+i6qmM8qhO2WLUG2SY6ZLQkxYfkM8Iubbwl62UToAe
 lAElb+9ltGeg45MDwXbXRkcGN3E2akHTankaR68mu9Nwd3LgthujCMhb/N+/jHSndK
 mcMRMACa2kJ2FCPi9Zv0UKk23BG4WHmQrtnAKw5Vf6FUoWG3XnZ6i1SrduwKMps8IP
 GqfPzfXKVWFtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Tci4npEH
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump to
 version 2.10.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2022-09-04 13:02 -0700, Christian Stewart spake thusly:
> On Sun, Sep 4, 2022 at 12:41 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2022-09-04 12:10 -0700, Christian Stewart via buildroot spake thusly:
> > > Docker Compose v2 is a CLI plugin loaded by docker-cli.
> > So, if it is a plugin for docker-cli...
> I thought about doing that, with docker-compose in a sub-menu under DOCKER_CLI.

Not in a sub-menu, but as a separate package that depends on docker-cli.

> But given that historically it was a separate package, and people may
> not necessarily realize it's a plugin,

It happens al the time that, when we bump a package version, it gains ne
dependencies. We do nt have a good mechanism for that, except people can
run utils/diffconfig to check their .config files before and after they
update to  newer Buildroot version.

> I instead decided to just `select BR2_PACKAGE_DOCKER_CLI` if
> DOCKER_COMPOSE is enabled.

I see the reasoning, but I still think the select should be switched to
a depends on.

> Do you want me to re-submit it with the plugin style instead?

No need, it is trivial to do when applying.

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
