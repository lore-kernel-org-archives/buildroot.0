Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA99C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 21:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21AFA41978;
	Wed, 20 Apr 2022 21:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jWLLZzzfZsaF; Wed, 20 Apr 2022 21:35:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D646041506;
	Wed, 20 Apr 2022 21:35:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98E8E1BF20F
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 21:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8666341506
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 21:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BN4OE0bUG1-V for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 21:35:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B3E4400B2
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 21:35:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7d82:8745:111f:47d9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9DF5B5FF67;
 Wed, 20 Apr 2022 23:35:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1650490552;
 bh=qEh4qX5l39hw5hjXGDDJR6beKVUi4mMvWsoUoqvFmYw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vDMAUNhw3rR5m0IPB9QwD9g26PE/cSZd7sndFivA5VHJZ4yTQPkmfwEyzE9cxX9E+
 rq2HLWmzaeWaN134VzVnuil1///Q6Y5CwKi+Ta4mVemjoePwXXYwbBVVHlAXbjlE+s
 R4ZsSn8l0Rbh2wOYaXCW1zqb57jTfR9JxvdDWxcGmZOJzDZf1YzA8Nqbhai217Usl8
 a2ioXNWbL6kq44l9foFsfOA8WOdDvu/A9oKvy5GhiZDHZ/n+Wa2EzA1xUMh7f9pnA5
 9yEMwioKQ9faR0p8xWpbUSvjYwZlOKiTpYzicBC51h7lRerwQnOya0w/4XEPkPkfNb
 7OLsbWiJwi3wA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 20 Apr 2022 23:35:50 +0200
Date: Wed, 20 Apr 2022 23:35:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220420213550.GM2730@scaer>
References: <20220213014024.1868278-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220213014024.1868278-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: add optional lv2
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-02-12 18:40 -0700, James Hilliard spake thusly:
> Pipewire supports lv2 via the lilv dependency.
> https://github.com/PipeWire/pipewire/blob/0.3.45/meson.build#L451
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pipewire/pipewire.mk | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
> index fc521c86ac..2a38db9977 100644
> --- a/package/pipewire/pipewire.mk
> +++ b/package/pipewire/pipewire.mk
> @@ -29,8 +29,7 @@ PIPEWIRE_CONF_OPTS += \
>  	-Dvideotestsrc=enabled \
>  	-Dvolume=enabled \
>  	-Dsession-managers=[] \
> -	-Dlibcanberra=disabled \
> -	-Dlv2=disabled
> +	-Dlibcanberra=disabled
>  
>  ifeq ($(BR2_PACKAGE_DBUS),y)
>  PIPEWIRE_CONF_OPTS += -Ddbus=enabled
> @@ -129,6 +128,13 @@ else
>  PIPEWIRE_CONF_OPTS += -Dlibcamera=disabled
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LILV),y)
> +PIPEWIRE_CONF_OPTS += -Dlv2=enabled
> +PIPEWIRE_DEPENDENCIES += lilv
> +else
> +PIPEWIRE_CONF_OPTS += -Dlv2=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
>  PIPEWIRE_CONF_OPTS += -Dx11=enabled
>  PIPEWIRE_DEPENDENCIES += xlib_libX11
> -- 
> 2.25.1
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
