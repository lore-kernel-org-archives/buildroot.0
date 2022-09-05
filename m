Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34ACAECAAD3
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 19:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B384D81417;
	Mon,  5 Sep 2022 19:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B384D81417
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FZ8XiO4g2sxW; Mon,  5 Sep 2022 19:06:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCDA781401;
	Mon,  5 Sep 2022 19:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCDA781401
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B849D1BF37E
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 19:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 933D581401
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 19:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 933D581401
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0GTLoLJDPIsX for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 19:06:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34A0A813E4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34A0A813E4
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 19:06:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 756E0B005B0;
 Mon,  5 Sep 2022 21:06:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Sep 2022 21:06:37 +0200
Date: Mon, 5 Sep 2022 21:06:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: KAMenyaev@sberdevices.ru
Message-ID: <20220905190636.GG1490660@scaer>
References: <20220905010913.13640-1-KAMenyaev@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220905010913.13640-1-KAMenyaev@sberdevices.ru>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662404801;
 bh=HtHZeM2G0A5rV612Wo6UBImChhI+zqS+s85ZhZvRYZ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NKNd1TCgQPxU/IxX4ctTnxhglb2R8IUrCorpJHnnaXaOHkZdrYDO0XHco8nhEtq7D
 iO+IG1r7l32iSymYw3voihIbTPf3HrAWXJf4lUVjHelgkoBaZpMezegn/D1Z7Kuupk
 IURJVNr4REWaBiwYriU08CwNQwasyvlBVMLoKM7lTniHOnViVQIMeUc5Drg75kB5hP
 YeHh2ESv+B6GtyqhHi3BVUdNIfv2Sg3cRFQSTsHCYZZ6D20Hvw7/vcTf3TQxLSHP8a
 Q3HJI3h8nnREiz+V6SugLOG1mfSryCCk4DsX/Wo0JQF9BxSEzGogokClGz73juOR8P
 cRdyuxX5hog1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NKNd1TCg
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcpcd: pid path fixed.
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
Cc: John Stile <johns@msli.com>, sdfw_system_team@sberdevices.ru,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Konstantin, All,

On 2022-09-05 04:09 +0300, Konstantin Menyaev via buildroot spake thusly:
> From: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
> 
> dhcpcd-9 defaults the run directory to `/var/run/dhcpcd` instead of
> `/var/run` and the prefix of dhcpcd has been removed from the files.

I've extended the commit log to explain that that sentence is from the
README of dhcpcd.

I also tweaked the commit title.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
> ---
>  package/dhcpcd/S41dhcpcd      | 2 +-
>  package/dhcpcd/dhcpcd.service | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dhcpcd/S41dhcpcd b/package/dhcpcd/S41dhcpcd
> index 3e5c22f715..55794f4075 100644
> --- a/package/dhcpcd/S41dhcpcd
> +++ b/package/dhcpcd/S41dhcpcd
> @@ -5,7 +5,7 @@
>  
>  DAEMON=/sbin/dhcpcd
>  CONFIG=/etc/dhcpcd.conf
> -PIDFILE=/var/run/dhcpcd.pid
> +PIDFILE=/var/run/dhcpcd/pid
>  
>  [ -f $CONFIG ] || exit 0
>  
> diff --git a/package/dhcpcd/dhcpcd.service b/package/dhcpcd/dhcpcd.service
> index e648092c9b..4da49818a7 100644
> --- a/package/dhcpcd/dhcpcd.service
> +++ b/package/dhcpcd/dhcpcd.service
> @@ -5,7 +5,7 @@ After=network.target
>  [Service]
>  Type=forking
>  EnvironmentFile=-/etc/default/dhcpcd
> -PIDFile=/run/dhcpcd.pid
> +PIDFile=/run/dhcpcd/pid
>  ExecStart=/sbin/dhcpcd $DAEMON_ARGS
>  Restart=always
>  
> -- 
> 2.37.2
> 
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
