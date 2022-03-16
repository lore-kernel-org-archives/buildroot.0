Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2566C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 22:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1641401DF;
	Wed, 16 Mar 2022 22:07:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TiEYNoBR6KSW; Wed, 16 Mar 2022 22:07:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BC5D401B7;
	Wed, 16 Mar 2022 22:07:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1284C1BF3DB
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 22:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F11E940179
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 22:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T_w8p87nxv5M for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 22:07:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0F6840018
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 22:07:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6da3:2756:3f87:4127])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2F35C13F854;
 Wed, 16 Mar 2022 23:06:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647468420;
 bh=HZaxtpXH6WnoAN8uNxvOYKpAqy/DvXBcIgRl6iMG7qE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HbAoY9XtiAMdQen7jeOW5e1e46ae+PCLOMXcL20gkr/F+lD2DgF8JGZ907Gl4TOQC
 9wX2ZvC2JZLAxC+5RdcjdxkYbSOXpl/cKsMEMsuFmcFA/mgYB62bGIXj3INyxC1jwr
 xgik/KDQ6r/8ht+YIsFi65XnJ1O74EK0YVO4VukVDmzivhNqYoy8dyOrLxmC8EoaC4
 DqGrwMiHkYOr6+Nt8/Ze3p7DkfUcTSoNH0mKif/CxD185U8Wrv276hoZyVFfblN8EK
 w9sdKF+e1TBE9rBDcUexwF1fSv+gszaxu/xD4CkrZjGVZhkHg/r0w1GSBXO0rMw7eq
 FqVaMR8etLpzA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 16 Mar 2022 23:06:57 +0100
Date: Wed, 16 Mar 2022 23:06:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220316220657.GC283544@scaer>
References: <20220316214848.448925-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220316214848.448925-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] support/scripts/pkg-stats: strengthen
 version check in check_package_get_latest_version_by_distro()
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
Cc: Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-03-16 22:48 +0100, Thomas Petazzoni spake thusly:
> The check_package_get_latest_version_by_distro() function analyzes the
> data returned by release-monitoring.org. For two of our
> packages (bento4 and qextserialport), release-monitoring.org returns
> something that is a bit odd: it returns an entry with a
> "stable_versions" field that contains an empty array. Our code was
> ready to have or not have a "stable_versions" entry, but when it is
> present, we assumed it was not an empty array. These two packages, for
> some reason, break this assumption.
> 
> In order to solve this problem, this commit is more careful, and uses
> the stable_versions field only if it exists and it has at least one
> entry. The code is also reworked as a sequence of "if...elif...else"
> to be more readable.
> 
> This fixes the following exception when running pkg-stats on the full
> package set:
> 
> Task exception was never retrieved
> future: <Task finished name='Task-10772' coro=<check_package_latest_version_get() done, defined at ./support/scripts/pkg-stats:532> exception=IndexError('list index out of range')>
> Traceback (most recent call last):
>   File "./support/scripts/pkg-stats", line 535, in check_package_latest_version_get
>     if await check_package_get_latest_version_by_distro(session, pkg):
>   File "./support/scripts/pkg-stats", line 489, in check_package_get_latest_version_by_distro
>     version = data['stable_versions'][0] if 'stable_versions' in data else data['version'] if 'version' in data else None
> IndexError: list index out of range
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/pkg-stats | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index c235d99407..f57041cee4 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -486,7 +486,12 @@ async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
>                  return False
>  
>              data = await resp.json()
> -            version = data['stable_versions'][0] if 'stable_versions' in data else data['version'] if 'version' in data else None
> +            if 'stable_versions' in data and len(data['stable_versions']) > 0:

PEP8 says that we can just test the sequence to test for emptyness:
    https://pep8.org/#programming-recommendations  (toward the end).

Applied to master with that fixed, thanks.

Regards,
Yann E. MORIN.

> +                version = data['stable_versions'][0]
> +            elif 'version' in data:
> +                version = data['version']
> +            else:
> +                version = None
>              check_package_latest_version_set_status(pkg,
>                                                      RM_API_STATUS_FOUND_BY_DISTRO,
>                                                      version,
> -- 
> 2.35.1
> 

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
