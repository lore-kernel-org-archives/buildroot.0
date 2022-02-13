Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69722C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 16:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 205C081656;
	Sun, 13 Feb 2022 16:50:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XoU7ZenEWpfy; Sun, 13 Feb 2022 16:50:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66572815AB;
	Sun, 13 Feb 2022 16:50:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D13EA1BF421
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 16:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C027F4031F
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 16:50:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FVzNvjZMhdfV for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 16:50:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C814840319
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 16:50:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8910:5bc5:ca35:1c76])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DB17213F87F;
 Sun, 13 Feb 2022 17:50:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644771012;
 bh=gizICnrFEOyg++nj2C9vTZ02yc9ErIxmHdXgdELeZUo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G4824/tgfefC1DMupCjsrxEBEAuLqMjF2gQKKjMwMwbIXuhD0njaYuOMSBaehLUof
 UHN4a0idnzLg4/82BPjoNCtU9K1uVxEjlE+VpFOLKfb+Wnxn4zjtAyXKjuMQf/LAJp
 YaSZXp5ab5BoCW++4kXoDbvj+wxOpPoZdbvmRy1FQXsFrHjJphB3O3KYfcOhLY0UaZ
 lTecouXBeawUM1wXPzHuftZFQ7kCcrMY0YLO4zFMgXCyVk/qQg0gJEQy6dkiAkm2Qd
 dxl+IqPixLgPZFmatE2osN/lCFVSxpyUz77S/F+vtWNR1saOn8RJQ95VdvavLiiOhj
 r/g9t7D/we/WQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Feb 2022 17:50:01 +0100
Date: Sun, 13 Feb 2022 17:50:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220213165001.GA38097@scaer>
References: <20220205201837.3324085-1-james.hilliard1@gmail.com>
 <20220205201837.3324085-6-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220205201837.3324085-6-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v6 6/8] package/qt5/qt5webengine-chromium:
 new package
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Gilles Talis <gilles.talis@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Martin Bark <martin@barkynet.com>,
 =?utf-8?B?R2HDq2w=?= Portay <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-02-05 13:18 -0700, James Hilliard spake thusly:
> We need to add a separate package for the chromium submodule so that
> we can apply patches for python3 support to it and replace catapult
> with a python3 compatible version.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/qt5/Config.in                         |    1 +
>  .../0001-Add-python3-build-support.patch      | 1858 +++++++++++++++++

This is a very big patch...

The commit you are using here, 0ad2814370799a2161057d92231fe3ee00e2fe98,
is on the '87-based' branch, which is supposedly not a recent branch,
even if the commit itself is not so old (a bit over two months).

However, there are more recent branches that already have python3
support, starting from '90-based' onward.

Why can't we use those branches, instead of carrying such a beast of a
patch?

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
