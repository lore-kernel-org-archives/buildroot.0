Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DE0FA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 08:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D65CC40273;
	Mon, 31 Oct 2022 08:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D65CC40273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R44BdkHyJv_f; Mon, 31 Oct 2022 08:17:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFD0B40265;
	Mon, 31 Oct 2022 08:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFD0B40265
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21A2E1BF2BF
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 08:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF77B40265
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 08:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF77B40265
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cqfNVeJVN3O7 for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 08:17:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE6CE40263
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE6CE40263
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 08:17:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BD6E8B00533;
 Mon, 31 Oct 2022 09:17:35 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 09:17:35 +0100
Date: Mon, 31 Oct 2022 09:17:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221031081735.GK1058960@scaer>
References: <20221031010904.1109541-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221031010904.1109541-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667204259;
 bh=J3sVkzwyP2W+xfUQnc3WhDAdaj2xAS1S9jKoma8Jqyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rCePnD8kXjz2GTu2ppBvJCsHcIauQWLcHUG4WkUkQXY3FZEZU3+ofOxnU+asp2idJ
 2FoAOj8enwGlRLYn6EuMIC0lpsESGvfU2gWgwvj1z5W00w5y1oYLrs4YxdNF5YhkD8
 PW6lwoYdqYi5nasbnqfkGTVw5yyOFTHrcppuEZQ4UNYQuKGpmmMhb3bYwYmFp8O/oB
 DhpXdj/YiO9ViSMa5Zr0Lzl7R9jyVguSvGN9+esF0dJHpwlcPum8ryzhnrRjJzuhuM
 CiSUoKwbr9dOOhNbLv5ThZrH1lHmeBoZseCTg3s/MHsfjMQZAzX7K1nwXADhiG9WtQ
 BeGwWbrLUtpxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rCePnD8k
Subject: Re: [Buildroot] [PATCH 1/1] package/iwd: set dbus busdir
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
Cc: Daniel Lang <d.lang@abatec.at>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

+Daniel

On 2022-10-30 19:09 -0600, James Hilliard spake thusly:
> In 5b3b2d80f4cf586d360ff696c3dacbd4cb48fdc4 we dropped dbus as a build
> dependency, as such we also need to set --with-dbus-busdir which would
> otherwise be pulled via pkg-config.
> 
> Fixes:
> checking D-Bus bus services directory... configure: error: D-Bus bus services directory is required

I was surprised that I did not have this error locally, but it only
happens when systemd is enabled.

So, rather than hard-code the path, I think I would prefer we add back a
buid dependency on dbus when systemd is enabled:

    diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
    index 002988cf33..6e366e094d 100644
    --- a/package/iwd/iwd.mk
    +++ b/package/iwd/iwd.mk
    @@ -31,7 +31,8 @@ endif
    
     ifeq ($(BR2_PACKAGE_SYSTEMD),y)
     IWD_CONF_OPTS += --enable-systemd-service
    -IWD_DEPENDENCIES += systemd
    +# Need dbus for system_bus_services_dir variable provided by dbus' .pc
    +IWD_DEPENDENCIES += dbus systemd
     else
     IWD_CONF_OPTS += --disable-systemd-service
     endif

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/iwd/iwd.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> index 002988cf33..e53ae595d7 100644
> --- a/package/iwd/iwd.mk
> +++ b/package/iwd/iwd.mk
> @@ -17,7 +17,8 @@ IWD_CONF_OPTS = \
>  	--disable-manual-pages \
>  	--enable-external-ell \
>  	--enable-dbus-policy \
> -	--with-dbus-datadir=/usr/share
> +	--with-dbus-datadir=/usr/share \
> +	--with-dbus-busdir=/usr/share/dbus-1/system-services
>  IWD_DEPENDENCIES = ell
>  
>  ifeq ($(BR2_PACKAGE_READLINE),y)
> -- 
> 2.34.1
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
