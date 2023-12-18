Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39401C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 17:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C60B58190B;
	Mon, 18 Dec 2023 17:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C60B58190B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CJry4feh53CV; Mon, 18 Dec 2023 17:22:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4F8C81852;
	Mon, 18 Dec 2023 17:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4F8C81852
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 372341BF20B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 17:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 100FB60F11
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 17:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 100FB60F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vNU7drSz-WE0 for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 17:22:35 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CB0660D67
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 17:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CB0660D67
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1084FB00535;
 Mon, 18 Dec 2023 18:22:27 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 18 Dec 2023 18:22:27 +0100
Date: Mon, 18 Dec 2023 18:22:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZYB_06OI-Kw5cC0Z@landeda>
References: <20231102184154.46185-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231102184154.46185-1-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702920151;
 bh=knLA5AfVy27fp3l7LzOE4/u9QCdmSheZordXCVt05QI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t2V6qrgvoj7kSCzs1Az8ja0m9Eubky75F+SketcbbaIs+2OSUI4ATSneC7VeKltNv
 If5W01oWmsZIE1Kp8zxxDKNJAo7ZrNejuKLYtkXEYWXDiKs5oC7ntcXm2JsbAhdrmI
 A8FD+Bp/CCuQvoRcPenqUbALo8oqsmQTsQB17DgTBOKSb45a9h1MPMHHKJJYe2+4uK
 J9HMEKYnTIOWX4PFfJpZTeEKAL680M7YQNPhD3/FzlU1bqPzlSmyp++VqlOWlTyQF/
 MZxYkF8DXGb2ass/ygS5TP4VR7OWSN8s16Y5pIxzvmQMrVQXuo00zX9cTobxl8jZK4
 gA2cdtKvf2fjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t2V6qrgv
Subject: Re: [Buildroot] [PATCH v2 1/2]
 package/postgresql/postgresql.service: set locale for initdb to C
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, Peter, All,

On 2023-11-02 12:41 -0600, Adam Duskett spake thusly:
> From: Peter Seiderer <ps.report@gmx.net>

So, this patch is "From Peter", but...

> Systemd creates a /etc/locale.conf file with LANG="C.UTF-8". On boot, systemd
> reads /etc/locale.conf and sets the LANG environment variable,
> (see the locale_context_load_conf method in local-setup.c.)
> 
> When initdb.c is called, a check for the LANG environment variable is called,
> and if it is set to something other than "C" initdb attempts to load the
> corresponding LC_CTYPE file in /usr/lib/locale/. IE: If LANG is set to C.UTF-8,
> then initdb.c attempts to load /usr/lib/locale/C.UTF-8/LC_CTYPE. However, these
> files do not exist on a Buildroot system, and as such, initdb throws the
> following error on startup:
> 
> ```
> initdb: error: invalid locale settings; check LANG and LC_* environment variables
> pg_ctl: database system initialization failed
> ```
> 
> To fix this issue, add "Environment=LANG=C" to the package provided
> postgresql.service file to force Postgresql to use the C locale.
> 
> Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

... the first SoB is by Adam, and there is no SoB be Peter.

In this case, I think I understand that Adam took Peter's patch, and
totally rewrote it with an alternate solution. In such a case, the
customs is to change the authorship to the new author, and keep a
Co-developed-by tag to keep credits to the first author.

So, if you can just reply to this mail stating I got things right, I can
fix authorship and tags when applying. If I got things wrong, then
please resubmit with proper tags and/or authorship.

Also, it does not make much sense that the submitter of a patch adds
their own Tested-By tag, as it is actually expected that the submitter
did test what they sent...

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
> v1 -> v2:
>   - Get to the root cause of the problem and provide a better explination of
>     what is happening.
> 
>   - Use Environment=LANG=C isntead of -o --locale=C
> 
>  package/postgresql/postgresql.service | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/postgresql/postgresql.service b/package/postgresql/postgresql.service
> index 539eea8964..c470c7181e 100644
> --- a/package/postgresql/postgresql.service
> +++ b/package/postgresql/postgresql.service
> @@ -16,6 +16,10 @@ StandardOutput=syslog
>  StandardError=syslog
>  SyslogIdentifier=postgres
>  
> +# Overwrite the LANG variable to prevent systemd from passing the LANG
> +# environment variable set in /etc/locale.conf.
> +Environment=LANG=C
> +
>  ExecStartPre=/bin/sh -c "if [ ! -f /var/lib/pgsql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql; fi"
>  ExecStart=/usr/bin/postgres -D /var/lib/pgsql
>  ExecReload=/usr/bin/kill -HUP $MAINPID
> -- 
> 2.41.0
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
