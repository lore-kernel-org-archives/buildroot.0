Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4208C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57CDB4059C;
	Sun,  9 Jan 2022 20:24:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tyja5aGgcP9t; Sun,  9 Jan 2022 20:24:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D2F84058A;
	Sun,  9 Jan 2022 20:24:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66EA51BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60FAE81D11
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rv7yMygQ30ZX for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:24:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E23081D0C
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:24:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:884e:4989:9dec:67ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 68B895FF3F;
 Sun,  9 Jan 2022 21:24:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641759863;
 bh=VadzVQTxoniGEZob9fguYRjoCC86UuEVp7rbrT73H0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YTQzxFGi934n68JQO5BsCTNyX88Vn6CPh9/cObCP6G2EgXp2dbX58vnAeaiDLXW0e
 kvdJIh6DFI6nE+EwOdC8aLJGyjJ1yGrD7R/UGwT/9ODGTI8W07wNaLaVsmo1ky/ciy
 7xiS+C0QTERwV/dU5qTkNhIfiaA3AaTOPJcCRewNYvrfhhJwSj/WfQqbnnyLbn0qAo
 aqN/VuMHJcD0XzKQNu/LrOmoF3kwTSuTn0CosKbpIuzGltEW5JR3Z5krHcuv557o/T
 LHlXwoYaOIjzMIvqwFFJtoBlU23GYMymiALI0qJIqlAbnFq98lT+W/GToCOqIkUoVf
 D98f2HtDdNI7A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jan 2022 21:24:19 +0100
Date: Sun, 9 Jan 2022 21:24:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220109202419.GF1477939@scaer>
References: <20220109200039.3188788-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220109200039.3188788-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/3] package/libvirt: fix ssh2 option
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
Cc: Jared Bents <jared.bents@rockwellcollins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-09 21:00 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since commit
> fbf25acfbfd5a73b3560918bea081768abbe5723:
> 
> output/build/libvirt-7.7.0/meson.build:1:0: ERROR: Unknown options: "ssh2"
> 
> Fixes:
>  - No autobuilder failures (yet)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of 3 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libvirt/libvirt.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
> index 41218c0e53..0c1ee82f43 100644
> --- a/package/libvirt/libvirt.mk
> +++ b/package/libvirt/libvirt.mk
> @@ -220,10 +220,10 @@ LIBVIRT_CONF_OPTS += -Dsasl=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBSSH2),y)
> -LIBVIRT_CONF_OPTS += -Dssh2=enabled
> +LIBVIRT_CONF_OPTS += -Dlibssh2=enabled
>  LIBVIRT_DEPENDENCIES += libssh2
>  else
> -LIBVIRT_CONF_OPTS += -Dssh2=disabled
> +LIBVIRT_CONF_OPTS += -Dlibssh2=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBVIRT_LXC),y)
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
