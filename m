Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15124C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 16:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 593B840488;
	Sat, 12 Mar 2022 16:24:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MJlJZQFUZ66P; Sat, 12 Mar 2022 16:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2375B403E9;
	Sat, 12 Mar 2022 16:24:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B041F1BF3FF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CE40403E9
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J8wqIRk0zk84 for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 16:24:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81A5F40004
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 16:24:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9481:d19c:460:d0b4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 88A6619F58C;
 Sat, 12 Mar 2022 17:24:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647102245;
 bh=pfOzZrR0YVlykc+nVsclmOnrsXXJNh99NvhRJWBcYqo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HszkakoPDgZk/XPlPb3jRedtwm12zCA6BiXSaQkijw05U2DB5d3Jnav8jyxuBD7WG
 F5e99dG/QBgLV0M27Lrhkr8Ma+kcR3nk4tsUf2VBEeodB28MD30+XCWltS8PQIqsIp
 mMQsPOysiAxUDF0vc5W4ZfYI//lhbLkUzukpfYI+F3lNjU6KvpxlQFOduUwN+S2gj8
 rZs84ywJ4H6O87Y/JFnCdJob5OszrK3u1NmFZEHOYpZqJVNfjFwpgvg1YSGiUTXnA2
 vQ7nL6zCsRvGwXZfmvhvRF006op31K8cYn3A0zNUxlx1dDPjJQTeEUkjAk8iBlK7FH
 XRBWHnuFuEtNA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Mar 2022 17:24:01 +0100
Date: Sat, 12 Mar 2022 17:24:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220312162401.GG283544@scaer>
References: <20220310140350.1955655-1-john@metanate.com>
 <20220310213840.32655ec7@gmx.net>
 <c5548e2e-8cd5-141e-3f8a-060127e43540@mind.be>
 <20220311082413.4bfe7465@gmx.net>
 <3ce1b58b-7721-a63a-4503-11e89fd55f22@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ce1b58b-7721-a63a-4503-11e89fd55f22@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/openssh: backport upstream fix for
 32-bit
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
Cc: Peter Seiderer <ps.report@gmx.net>, John Keeping <john@metanate.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, Peter, All,

On 2022-03-12 17:00 +0100, Arnout Vandecappelle spake thusly:
> On 11/03/2022 08:24, Peter Seiderer wrote:
> >But the sha1 alone does not tell to which git repo it belongs to, but the explicit
> >upstream link does (and has the nice effect to gain a one-click link to the
> >corresponding patch/merge-request etc.) and is a prominent remainder in case
> >of package version bump where the patch comes from...
>  I don't know about you, but the normal way that I generate patches is to
> clone the repo and do 'git format-patch -1 <sha1>', and then add my SoB. And
> if it doesn't apply cleanly, I first do 'git cherry-pick -x -s'.

Exactly what I do too, with an additional tag just before my SoB:
    [yann.morin.1998@free.fr: backport from upstream]
    Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

>  Obviously it's helpful to have a link there. However, requiring
> contributors to go and find the upstream web frontend and construct a URL is
> IMHO asking a lot, especially since chances are that no one is ever going to
> actually look at that link. There's already plenty of steps a contributor
> has to go through, I don't want to increase the threshold even more.

I fully subscribe to Arnout's position.

I only add an URL to the original patch if it was grabbed fro; a pending
PR/MR/BZ/.. or a third-party tree.

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
