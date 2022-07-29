Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A382C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 20:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72D5F60F69;
	Fri, 29 Jul 2022 20:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72D5F60F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PDlAGMcEsh7a; Fri, 29 Jul 2022 20:13:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D9DE60B16;
	Fri, 29 Jul 2022 20:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D9DE60B16
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E6231BF35D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED3DA82A0B
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED3DA82A0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j9onzLJQAVPT for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 20:13:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36CD0828AA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36CD0828AA
 for <buildroot@busybox.net>; Fri, 29 Jul 2022 20:13:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d054:eb09:eac4:da7e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8B3F513F880;
 Fri, 29 Jul 2022 22:12:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Jul 2022 22:12:57 +0200
Date: Fri, 29 Jul 2022 22:12:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20220729201257.GA1554632@scaer>
References: <20220728113422.6739-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220728113422.6739-1-guillaume.bressaix@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659125582;
 bh=8PIqwLqlF2Er5vK/uz1Ta4VBvC2a5t0tM2uSK4p/BsU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ris9cdq4fudI4eqWdQjWOWpOyb0t1XcBEdYb+U3NstyFTrE96QOOl+qOZnM5yrqGz
 x92yJH4gTOPqw3FKh4BNodN6p9dcRVd1pf7vudoMndyKbJZRcpPgWa/JoPUs5j/LX2
 49gs7GivpDEkCM13fy0sjRyE/Uxo72MXyfCacFsqgcD24K+7EG2NmHWL2EH7b0Jmj0
 QACjxX/W15hJkuULg6jnRnOUD9b+pC6chnT85wu7zGEVIU4zoXRy2V08YAENjvbk82
 VtWBYhnkFQO+8taWD7MutkCsGW/iOqNuBbSKlD8Fv4m/i3X0mVV9ZnsFn9559AHEB2
 9OSjKMoYLSrEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ris9cdq4
Subject: Re: [Buildroot] [PATCH] package/ntpsec: add systemd unit file
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
Cc: buildroot@busybox.net, Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Guillaume, All,

On 2022-07-28 13:34 +0200, Guillaume W. Bres spake thusly:
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
> Use -d to daemonize, use -g to allow a "big leap".
> Prior synchronization, system date is usually set to 01/01/1970.
> By default, ntpsec does not allow that big of a leap,
> and we never obtain synchronization without -g.
> Ideally, you want some sort of mechanism to only use
> -g on first (ever) boot.

Thos explanations should not be after a --- line, as they rally explain
the change, so really must be oin the commit log, not a post-commit
note.

For the -g option, I would rephrase as such:

    Devices that have no RTC, or one that is so bad that it drifts very
    fast, the system time prior to synchronisation is ways off, so that
    ntpsec refuses to apply a giant leap to the current time, unless
    forced with -g.

Idally, the user should be able to easy override that, so I'd add an
environment file where the user can just set additional options (or
remove them); see what it does with my final proposal, below...

However, I think using the -d option as you did is incorrect.

Indeed, the default for a systemd service unit, is Type=simple. This
means that systemd does expect the program in ExecStart to be ready as
soon as systemd calls execve() on it. If the program forks and the
parent exits, then system will consider the system to be terminated, but
will whine that there is a lingering process in the cgroup (to be
confirmed). With Type=simple, its systemd that is responsible for the
daemonisation of the program.

The correct solution in this is either one of the following:

 1. ntpsec is left in the foreground, and Type is explicitly set to
    'simple' (or better yet, 'exec', and we do not use -d

 2. ntpsec is set to fork with -d, but then Type is set to 'forking'

The second solution is nice when the service is going to be used by
dependent units (e.g. a DB server that will be used by further units
later in the boot); in tha case, the program is suposed to fork after it
is ready to server requests, so solution 2 is nice.

However, for ntpsec, I don't think it makes much sense, because it won't
"serve" anything locally. Still, I think it is still better to use
solution 2, because, supposedly, ntpsec only forks when it has
eventually done its initialisation step, so we know it is mostly ready.

So:

    [Service]
    Type=forking
    EnvironmentFile=/etc/defaults/ntpsec
    ExecStart=/usr/sbin/ntpd -d $NTPSEC_OPTIONS

and then in /etc/defaults/ntpsec:

    NTPSEC_OPTIONS="-g"

Care to check, test, and resubmit, please.

Regards,
Yann E. MORIN.

> ---
>  package/ntpsec/ntpd.service | 10 ++++++++++
>  package/ntpsec/ntpsec.mk    |  5 +++++
>  2 files changed, 15 insertions(+)
>  create mode 100644 package/ntpsec/ntpd.service
> 
> diff --git a/package/ntpsec/ntpd.service b/package/ntpsec/ntpd.service
> new file mode 100644
> index 0000000..3987085
> --- /dev/null
> +++ b/package/ntpsec/ntpd.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=NTPSec
> +After=network.target
> +Conflicts=systemd-timesyncd.service
> +
> +[Service]
> +ExecStart=/usr/sbin/ntpd -d -g
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
> index a0d0662..a0fc49b 100644
> --- a/package/ntpsec/ntpsec.mk
> +++ b/package/ntpsec/ntpsec.mk
> @@ -62,6 +62,11 @@ define NTPSEC_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 755 package/ntpsec/S49ntpd $(TARGET_DIR)/etc/init.d/S49ntpd
>  endef
>  
> +define NTPSEC_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 0644 package/ntpsec/ntpd.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/ntpd.service
> +endef
> +
>  define NTPSEC_USERS
>  	ntp -1 ntp -1 * - - - ntpd user
>  endef
> -- 
> 1.8.3.1
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
