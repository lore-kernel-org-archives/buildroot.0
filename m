Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58060C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 15:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB7AD60B08;
	Sun, 18 Sep 2022 15:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB7AD60B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jJmSLbENQsxM; Sun, 18 Sep 2022 15:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA77860AB1;
	Sun, 18 Sep 2022 15:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA77860AB1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1506C1BF301
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 15:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E52294050C
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 15:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E52294050C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IYtYxayeCneo for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 15:18:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA43B400F2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA43B400F2
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 15:18:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4908:486:8484:20b8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id BED2B19F5C9;
 Sun, 18 Sep 2022 17:18:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Sep 2022 17:18:44 +0200
Date: Sun, 18 Sep 2022 17:18:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220918151844.GJ1419013@scaer>
References: <20220918134912.03172851A2@busybox.osuosl.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220918134912.03172851A2@busybox.osuosl.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663514328;
 bh=q+9+vKSJKjhwuupkHdMdOnQwGBvyDM76uim77o6IKeA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TuVlf2kv14xoZouamsnoD1rZqJdCPhPkWerpsGWZDEvJLA2dONTyBQ6nUZ3/anATo
 6Z3/mpMm8k7XZeB2IupsLndmXF7xZg+MktVJEFgMkOTnAqgsbBQ1+b5yEsb2ZZASuK
 eWdXNoGTTVD1Oco9giCeuGr0fZ379EiDpMnpetZPSawPm7XDmPqYoxZalvvAKPiRf9
 2ctYgRgivwD12bGjeIAtWTVUKyXjeY369HgESJ2KKHhHo9EgsZURYDouJBpSmvE3oz
 WdyY2mfAyVHIOT8o++tjBZlLYfmBEe5Ypkmi7C+sGOYiHqpqKXHne5uOT2DdTabq2v
 7AjsMb9bxtTew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TuVlf2kv
Subject: Re: [Buildroot] [git commit] utils/genrandconfig: disable
 libopenssl without atomics
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

Fabrice, All,

On 2022-09-18 15:36 +0200, Arnout Vandecappelle spake thusly:
> commit: https://git.buildroot.net/buildroot/commit/?id=af494d92d3d065a8939f0567bfbf312d177048f2
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> libopenssl needs atomic or the build will fail (e.g. on sparcv8 without
> libatomic):
[--SNIP--]
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 7fd17239c5..efa73e938d 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -247,6 +247,11 @@ def fixup_config(sysinfo, configfile):
>      if 'BR2_ARM_CPU_ARMV7M=y\n' in configlines and \
>         'BR2_PACKAGE_LIBFFI=y\n' in configlines:
>          return False
> +    # libopenssl needs atomic, but propagating this dependency in
> +    # Buildroot is really too much work, so we handle this here.
> +    if 'BR2_PACKAGE_LIBOPENSSL=y\n' in configlines and \
> +       not 'BR2_TOOLCHAIN_HAS_ATOMIC=y\n' in configlines:

This triggers a flake8 warning:
    https://gitlab.com/buildroot.org/buildroot/-/jobs/3045260108

    $ make check-flake8
    utils/genrandconfig:253:8: E713 test for membership should be 'not in'
    1     E713 test for membership should be 'not in'

I've pushed a fix with commit fa538315dc02 (utils/genrandconfig: fix
flake8).

Regards,
Yann E. MORIN.

> +        return False
>      if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
>          configlines.remove('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE=""\n')
>          configlines.append('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/hackberry.fex"\n')
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
