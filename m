Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F3DC001DF
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 19:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B971140111;
	Wed,  2 Aug 2023 19:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B971140111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZxdMwRmB5fCd; Wed,  2 Aug 2023 19:11:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD5D04052E;
	Wed,  2 Aug 2023 19:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD5D04052E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AD541BF86B
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 19:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 696F36121B
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 19:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 696F36121B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NHrq69_tdKaq for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 19:10:45 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 003686124D
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 19:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 003686124D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:79c1:a9ed:b3cf:6f2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 249792003D6;
 Wed,  2 Aug 2023 21:10:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 02 Aug 2023 21:10:38 +0200
Date: Wed, 2 Aug 2023 21:10:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230802191038.GG421096@scaer>
References: <20230802120201.382284-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802120201.382284-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691003442;
 bh=GPFtsNMLHFHW09wUN/9Y/E4I4Zx1eOgkL4rlW2jJGcY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PkRod3zf/2PW3kWHa/BXRPwOwU+3X8qXNXxt3MJ4vceOH6FPQcv9jpCULTlauf/b0
 DqRBpqeOS8r9rx9oSlLl/b7wOvFnzVTzS6fZ5iQQDV/cN94QbFkY7H5v5KpkqEd0DG
 C0UY5rWNB93F2AreeYSjiugot7tto4FwHI5ptfkwckfXLPWUPyvd3shu8jdR/NK44N
 5NsbIfTuZiTTzMMpUY0Q/W447cYDJyo3U0t0DWectUEC7ClOPNoXak6E4jGBV2OX6v
 coSQdvmZVk7HNvAMIWyl7N0ouz9CqrF/GjXpeoz2bR0ERpEkZrPfxEVIsc65XvZZXX
 wReQIqb5px65Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PkRod3zf
Subject: Re: [Buildroot] [PATCH] package/systemd: handle vconsole w/ keymap
 support
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2023-08-02 14:02 +0200, Romain Naour spake thusly:
> systemd v254 provide a new option "default-keymap" to handle vconsole
> with keymap support [1]. With this change systemd now use the "us"
> keymap by default and requires keytable files and keyboard utilities
> from kbd package.
> 
> The keymap support can still be disabled using -Ddefault-keymap=""
> at build time.
> 
> Handle the vconsole w/ keymap support and allow to use another
> keymap than "us" by default.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561206 (TestInitSystemSystemdRwNetworkd)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561203 (TestInitSystemSystemdRwIfupdownDbusbrokerDbus)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561202 (TestInitSystemSystemdRwIfupdownDbusbroker)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561201 (TestInitSystemSystemdRwIfupdown)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561199 (TestInitSystemSystemdRwFull)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561197 (TestInitSystemSystemdRoNetworkd)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561194 (TestInitSystemSystemdRoIfupdownDbusbrokerDbus)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561190 (TestInitSystemSystemdRoIfupdownDbusbroker)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561189 (TestInitSystemSystemdRoIfupdown)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561186 (TestInitSystemSystemdRoFull)
> 
> [1] https://github.com/systemd/systemd/releases/tag/v254
> [2] https://github.com/systemd/systemd-stable/commit/1cd421106893c5126e33e211cf6634e9167d1762
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/systemd/Config.in  | 15 +++++++++++++++
>  package/systemd/systemd.mk |  6 ++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index bea717a456..174ee77b29 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -569,4 +569,19 @@ config BR2_PACKAGE_SYSTEMD_VCONSOLE
>  
>  	  https://www.freedesktop.org/software/systemd/man/systemd-vconsole-setup.service.html
>  
> +config BR2_PACKAGE_SYSTEMD_VCONSOLE_KEYMAP

There's no need for this intermediate option, see below...

> +	bool "enable vconsole w/ keymap support"
> +	depends on BR2_PACKAGE_SYSTEMD_VCONSOLE
> +	select BR2_PACKAGE_KBD
> +	help
> +	  systemd-vconsole-setup requires keytable files and keyboard
> +	  utilities only if at least one keymap is used by default.
> +
> +config BR2_PACKAGE_SYSTEMD_VCONSOLE_DEFAULT_KEYMAP
> +	string "vconsole default keymap"
> +	default "us"
> +	depends on BR2_PACKAGE_SYSTEMD_VCONSOLE_KEYMAP
> +	help
> +	  default keymap used when populating /etc/vconsole.conf.
> +
>  endif
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 0aa1da3fb8..f6d131c304 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -353,6 +353,12 @@ else
>  SYSTEMD_CONF_OPTS += -Dvconsole=false
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SYSTEMD_VCONSOLE_KEYMAP),y)
> +SYSTEMD_CONF_OPTS += -Ddefault-keymap=$(call qstrip,$(BR2_PACKAGE_SYSTEMD_VCONSOLE_DEFAULT_KEYMAP))
> +else
> +SYSTEMD_CONF_OPTS += -Ddefault-keymap=""

There's nothing that prevents BR2_PACKAGE_SYSTEMD_VCONSOLE_DEFAULT_KEYMAP
from being empty, in which case the above sets the option to an empty
string, exactly as is done if the boolean is not set.

So the boolean is superfluous, and I dropped it (I moved the select to
kbd to the vconsole option instead, with a condition on the keymap not
being empty).

This in turns simplifies the condition in the .mk file as well.

Applied to master with the above changes, thanks.

Regards,
Yann E. MORIN.

> +endif
> +
>  ifeq ($(BR2_PACKAGE_SYSTEMD_QUOTACHECK),y)
>  SYSTEMD_CONF_OPTS += -Dquotacheck=true
>  else
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
