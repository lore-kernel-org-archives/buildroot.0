Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A18C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 16:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACAFE813E3;
	Mon, 14 Feb 2022 16:36:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lOFaUqSMMLOQ; Mon, 14 Feb 2022 16:36:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF75781409;
	Mon, 14 Feb 2022 16:36:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A855A1BF383
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 16:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94639403AA
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 16:36:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHf088319EIn for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 16:36:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F6DC4025D
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 16:36:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:892f:28b2:cec5:360f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id E7560200342;
 Mon, 14 Feb 2022 17:36:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644856575;
 bh=FnPPlMkW3ZuEyxvn6ooyHmICQjt7X5T/cxRAXqULCDk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ltnmS51gdkXw7qjv5RQ35OSykalzWo/xYk98QY1N9SuDrBeUUjBQOkm6rB1+W4T3O
 szO1c2D5g3EZlvVJ1JxIFn2UaZaRJsyW/4zN6U30+U8e23+fgGwQViB/m0Q4BoxpF6
 nQf/tD4kuhEiW3bXAfGljR2Mkh27Wi7uFvv3l2lCBeXWGXylIN/umLknNCPu9vwsKV
 4e2wdHRnV51kI3rwrft+GJAqIeWYPcUkRQ2t3uiLNCbKt7BPKbtlYroG6UdmQ99emr
 DO/sXd5DYy0phNjtXVx2izvf2j3qKEFv+hHS10CqwRj5fnlMrWrJsYRZSQjHS39xDu
 GKA2KMr/n7gRw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 14 Feb 2022 17:36:09 +0100
Date: Mon, 14 Feb 2022 17:36:09 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <20220214163609.GD38097@scaer>
References: <20220214162413.17301-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214162413.17301-1-luca@lucaceresoli.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] utils/docker-run: use portable bash
 shebang
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luca, All,

On 2022-02-14 17:24 +0100, Luca Ceresoli spake thusly:
> /usr/bin/bash does not exist on Ubuntu 2018.04. Use the more portable
> alternative /bin/bash.
> 
> Note that currently "/usr/bin/bash" does not appear anywhere in the
> Buildroot source code, while "/bin/bash" is used by many scripts.

The real portable solution is to use /usr/bin/env, which is mandated by
POSIX:
    #!/usr/bin/env bash

and which we already use quite a bit:
    $ git grep 'env bash' |wc -l 
    34

(No need to respin, it can be fixed when applying, I guess...)

Regards,
Yann E. MORIN.

> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Fixes: 242e9d72e7d2 ("utils/docker-run: new script")
> ---
>  utils/docker-run | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 0614f1325d78..979aec69b946 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -1,4 +1,4 @@
> -#!/usr/bin/bash
> +#!/bin/bash
>  set -o errexit -o pipefail
>  DIR=$(dirname "${0}")
>  MAIN_DIR=$(readlink -f "${DIR}/..")
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
