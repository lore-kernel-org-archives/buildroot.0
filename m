Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F38EC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 10:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6D2E60E4E;
	Sun,  5 Nov 2023 10:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6D2E60E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1bCEoxSWCdxS; Sun,  5 Nov 2023 10:07:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1593260FD0;
	Sun,  5 Nov 2023 10:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1593260FD0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 102481BF577
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 10:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D789740533
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 10:07:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D789740533
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1JDFmm9dMriK for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 10:07:15 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE425400A6
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 10:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE425400A6
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.208.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1psI-1r1ltY19aq-002INj; Sun, 05
 Nov 2023 11:07:12 +0100
Date: Sun, 5 Nov 2023 11:07:11 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231105110711.310c9104@gmx.net>
In-Reply-To: <20231102184154.46185-1-adam.duskett@amarulasolutions.com>
References: <20231102184154.46185-1-adam.duskett@amarulasolutions.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:LWkMUmVyolEP9rK+F3cDgXjnaQYJMy13Pa7+c+atOpLnJA13F0i
 PKxFtHBeRXv5OrkDUFClVs/XeW+Ec0oz8ZdXASy4hQF5TeUX9VenlK7lzxvpnt4+fGCmtT3
 Jqru4mcvj1vPl6HqYaENxHA46TMf1cINKfGWh3D4meXh0fSavS0gFey9Upw4ZBBffEG4qUW
 JjwPkwY6d4MVNj8aPlzwA==
UI-OutboundReport: notjunk:1;M01:P0:tTGgKRKsROw=;4eOSMtAd6K0uenLEH8q4tf4/ZX3
 rx+Hl5MwlDbNR3W6UjJyEdmEH5lxDwg0Rh6KFyuy1a+8Ulr16uRQkh/JoK4dJUpmSUPG+C1lk
 NKYcmtl+X73s6/uloI1Z3snCpwh2ZcYz8PgfvcHLLY4eQ4ezeXLAv4Wp1pWYdNz2t8b94HD1S
 KAzjvhixo5/rIRKQAdULHYSnGeqwhtNqgG4oy5oRaQSZmn3PF3LVu6dw5bUJRbSHRNlhLM7KL
 hLqfoDVSMB064htgiisCTc+R+O94liF08c2rsYsQRGu0CuBiQX2DQrxEPrNOzsplIucYOY38o
 Td4DwWqSdFYUBtwFy735dEoeXTF6fXi+ONf25B7Gsadty/Iv0ZOwlW858dpglv9qnYpMmL3VY
 TJVdL9pcKLZECmUz8Zn4wnKpfFWPOiJeBb0xKIsPbsoLZFeIxeUMR65XtUJA8ldoxu6lE0b4b
 512GxHBa3ayi3sJQj3ZzU49qJKKJf0nnVYzJcpozF7v4SWaE76fZDXT3AfiR7pcBHvreiyryZ
 hH28PDuTV2v97lNE+CVNxfTuNydPVaVSrx8tRe1BWYx8cfi5ULyZYK/TYz0tSmZv1ZfF+nzh7
 CZsNy8+XGbwAdLXujW+run1CoYCSUq66xV82xksB9MlL8KPMqzPGlP6Nln1Jmd8KR9jzO/GVa
 RmYzDvCm09C0+UyS546nC53ZFixvYQnQ5diZ4P87Lg+4jDZv0mUQxiM6AunQQbA+hQoE/cnUt
 nsH//2UGWeq0A2YHkmRxiRoVHc4vZvStMm1zmqXiZVh+iJO4F1t9iLsPNj2o0SjwYERIexIVM
 3utCAuzgvyEaqYQeUyLcNvaguVFBKj32Dbry/2/5KNnodd2IcAhGKY0YgpPOvn2Tlzu6+6tv6
 +xPKJhapHwYWUzZ22tATS6eOjXmlU0han36LBnQ3gd4CaR6ukdXOwkidxjQyeBiHXXRWR7OGC
 0bLvRmUP3mV6DX1iEwI3NHTP0rY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1699178832; x=1699783632; i=ps.report@gmx.net;
 bh=AEbHp6ViZImSvBAejejeW0QSSswOwmBQbdeqtQlD6wA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:
 References;
 b=SjTNHeIj1ynmkukdeQCK9hi9IsOvQPymSMRyv2Q9LIKaoXhL943nqiIzU6ZrF5b+
 x9UefigRii2C1SULD67f2jij5kFteGl1nMQ7eTCtzrEFAj0Jwuwl34PwmOFDBnzfH
 mtmB7yJdOGWuoFXUW7vCdO3FWd6PFiGHpCMpBk8qurDHa2Og/QXnRNlsl4eI3zu6n
 pm6TC8FnXLxqCZ12U3uDZDbJnrxWuheCTZ17S0/k4tr0M2k1EqeJp38JJWOCOBKyi
 wIKUMHephsHlsaJtRWPAxcbBzh7VRmbj7wtd6qXigPKt8sPvXfXJbWqK/rjmJJF2+
 iP7rPv5wqU1gcsdu5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=SjTNHeIj
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello *,

On Thu,  2 Nov 2023 12:41:53 -0600, Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> From: Peter Seiderer <ps.report@gmx.net>
>
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

And for the record the links to the original patch series/review comments:

	https://patchwork.ozlabs.org/project/buildroot/patch/20200920150659.7562-1-ps.report@gmx.net/
	https://patchwork.ozlabs.org/project/buildroot/patch/20200920150659.7562-2-ps.report@gmx.net/
	https://patchwork.ozlabs.org/project/buildroot/patch/20200920150659.7562-3-ps.report@gmx.net/

Regards,
Peter

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
