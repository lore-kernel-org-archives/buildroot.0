Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC20C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 11:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98B2041655;
	Mon, 15 Aug 2022 11:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98B2041655
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nGOcFSmdkpM6; Mon, 15 Aug 2022 11:41:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 335EA415A7;
	Mon, 15 Aug 2022 11:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 335EA415A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBC331BF34A
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 11:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C24E4415A7
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 11:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C24E4415A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H2e_ogkXCTw0 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 11:41:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5320E41581
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5320E41581
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 11:41:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 347CE60138;
 Mon, 15 Aug 2022 13:41:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 13:41:43 +0200
Date: Mon, 15 Aug 2022 13:41:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: John Keeping <john@metanate.com>
Message-ID: <20220815114143.GV2854108@scaer>
References: <20220811134533.508348-1-john@metanate.com>
 <20220813221143.GA2854108@scaer> <YvokBS1iouu46JsD@donbot>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YvokBS1iouu46JsD@donbot>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660563706;
 bh=vf8nm2rCuZHjZCCfMa4G0SkySLw3EtsTgmEzTwAt5yo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=os8TaTQkv3K0rS5PGGFnEjLQw+lrF+oxk5dXsT1icYKnKv2jWS2IB47thSLF/f7qb
 QTFGluqG+X+xOZvZUkTbzDWrB6RqhJ8CSiqx0vMlhmposPS+2EiraQ2Ve6r6JFtsm9
 Vc9nRvHbpcNo4F6dLsXaW7zxmqcriJrNFRViaecKogV4za2+DiLrMtQEhLYBZI2NdD
 eQz2gcISHGKfmKWwOzX3kr/SJdlGW0fSwTDhNGwwfbbiIOptmUDGZsxkZjA/f8hivg
 jdNOYY1387noxFu6Y0vcC78ZnU9bt18kS29EWpEETd7mP4acryE3r0UElWDUeh5/2G
 JIoJtHtlo6yXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=os8TaTQk
Subject: Re: [Buildroot] [PATCH] support/download/git: disable global &
 system config
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

John, All,

On 2022-08-15 11:46 +0100, John Keeping spake thusly:
> On Sun, Aug 14, 2022 at 12:11:43AM +0200, Yann E. MORIN wrote:
> > On 2022-08-11 14:45 +0100, John Keeping spake thusly:
> > > The build environment should be isolated from the host system as much as
> > > possible to keep the build reproducible.  Git's global config (usually
> > > ~/.gitconfig) and system config (/etc/gitconfig) can affect the
> > > behaviour of all Git operations, so should be disabled.
> > While I appreciate the reasoning and example, there are valid cases
> > where we do want to use (at least) the user's settings, [...]
> What do you thing about adding a config option to specify the global
> gitconfig file to use?
[--SNIP--]
> 	eval ${BR2_GIT_CONFIG_GLOBAL:+GIT_CONFIG_GLOBAL=\'${BR2_GIT_CONFIG_GLOBAL}\'} \
> 		GIT_DIR="${git_cache}/.git" ${GIT} "${@}"

Honestly, I don't think the issue warrants extra complexity.

For your git-lfs example, we would notice a missing FO_GIT_LFS fairly
quickly, thanks to the autobuilders. So this is not a big issue for
packages in upstream Buildroot; for br2-external trees, this is most
probably not an issue either: either all developpers ona project have
the same settings, or they are using a sane build environment, or they
would also notice, so this is not very important.

Hwever, there are settings that we would probably want to always
disable, like line-ending mangling (core.autocrlf or gitattributes) or
other keyword replacement (gitattributes 'ident' or 'filter'...). But
then, we haven't had much report about such failures, if at all, so this
does not look like a problem in practice.

So, I still don't think we need to add complexity to solve this issue.
If we can get something really simple, that's OK, but no nuclear
powerplant please. ;-)

> The system config is less likely to be problematic as I don't think it's
> used much outside managed environments where the content probably is for
> proxy settings that should be included in Buildroot.

Yes, I agree that system-wide config file should be Mostly Harmless (C).

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
