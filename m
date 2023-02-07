Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7DAC6379F
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34FE961062;
	Tue,  7 Feb 2023 21:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34FE961062
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0IqAympTPK1; Tue,  7 Feb 2023 21:51:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DD806105A;
	Tue,  7 Feb 2023 21:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DD806105A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6E3A1BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF92E40B24
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF92E40B24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CiCrTvWQA2Ky for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:50:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E49834057A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E49834057A
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:50:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.98])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 37690B0051B;
 Tue,  7 Feb 2023 22:50:53 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 22:50:52 +0100
Date: Tue, 7 Feb 2023 22:50:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Kent <james.kent@orchestrated-technology.com>
Message-ID: <20230207215052.GA2817@scaer>
References: <20230207171020.20194-1-james.kent@orchestrated-technology.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230207171020.20194-1-james.kent@orchestrated-technology.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675806655;
 bh=xE1iBVgyyQHwugFpQV5Vj/nChxXdx813W/FCX6+YnXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uSa9Vr+vf8XcGGw2C4Fepxl86Vr3+zhDMSfheTbM3+IFOw79txd5vGI6Po36QvG4g
 NL4ld/Vr4VkcUTOkl0yu5lEgfv1Lj4mQfSkK/kXBvrzn3H+28YFYvpJ5Ck/WitQ+x+
 ++fKED3HvPuAXZwfTELGHeBQMlVVn7lulOMQPzY85mawkoVOAX47DVdAE5WWGVq3Ba
 h598Ev8cWVzcOkp/c/2shkg9QcyNja8lkQnERsBRpxa+FTgPiJ1V3LDewrhXdqzYZy
 qNqK+qwcV1zl2r/Y/p5kkdGzoOBys1san2wGuUg13ISbp1nlVhk20q6ynxH1UrFBMl
 Adii0WlX8SQYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uSa9Vr+v
Subject: Re: [Buildroot] [PATCH] package/chrony: add default unprivileged
 user option
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

James, All,

On 2023-02-07 17:10 +0000, James Kent spake thusly:
> Configurable option to define and enable by default an unprivileged
> user which the Chrony daemon will assume once initialised. Where libcap
> is not enabled a comment indicates the dependency requirement to make
> the option available.
> 
> This option supports the good security practice of dropping elevated
> privileges for daemon runtime.

Thanks, thjis is=ndeed makes sense. See below for some comments...

> Signed-off-by: James Kent <james.kent@orchestrated-technology.com>
> ---
>  package/chrony/Config.in | 10 ++++++++++
>  package/chrony/chrony.mk |  8 ++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/package/chrony/Config.in b/package/chrony/Config.in
> index 158dc20530..8b053ed7e2 100644
> --- a/package/chrony/Config.in
> +++ b/package/chrony/Config.in
> @@ -14,3 +14,13 @@ config BR2_PACKAGE_CHRONY_DEBUG_LOGGING
>  	  Enable support for debug logging output from Chrony when
>  	  enabled at runtime. If disabled, code for debug logging will
>  	  not be compiled in.
> +
> +config BR2_PACKAGE_CHRONY_USER
> +	bool "chrony default unprivileged user"
> +	depends on BR2_PACKAGE_CHRONY && BR2_PACKAGE_LIBCAP

First, we now try to enclose package sub-options in an if-endif block,
rather than have each option depend on the package. I.e.:

    config BR2_PACKAGE_CHRONY
        bool "chrony"

    if BR2_PACKAGE_CHRONY

    config BR2_PACKAGE_CHRONY_FOO
        bool "foo"

    config BR2_PACKAGE_CHRONY_BAR
        bool "bar"

    endif

Yes, the existing option doesnot follow that coding style, so just fix
it up while at it.

Second, chrony and libcap both need an MMU, so jut select libcap when
BR2_PACKAGE_CHRONY_USER is enabled.

> +	help
> +	  Define and enable default unprivileged user for the Chrony
> +	  daemon to run as.
> +
> +comment "chrony default unprivileged user requires libcap"
> +	depends on BR2_PACKAGE_CHRONY && !BR2_PACKAGE_LIBCAP

And thus, that comment is no longer needed.

> diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
> index 379e95a778..16f8f082a3 100644
> --- a/package/chrony/chrony.mk
> +++ b/package/chrony/chrony.mk
> @@ -21,6 +21,14 @@ CHRONY_CONF_OPTS = \
>  
>  ifeq ($(BR2_PACKAGE_LIBCAP),y)
>  CHRONY_DEPENDENCIES += libcap
> +
> +ifeq ($(BR2_PACKAGE_CHRONY_USER),y)
> +CHRONY_CONF_OPTS += --with-user=chrony
> +define CHRONY_USERS
> +	chrony -1 chrony -1 * /run/chrony - - Time daemon
> +endef
> +endif

This part is correct.

Can you fix and respin, please?

Regards,
Yann E. MORIN.

>  else
>  CHRONY_CONF_OPTS += --without-libcap
>  endif
> -- 
> 2.35.3
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
