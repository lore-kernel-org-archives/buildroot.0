Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB16C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BE04702B0;
	Tue, 21 Feb 2023 02:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BE04702B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7SL6WB2LES3Y; Tue, 21 Feb 2023 02:08:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 907B561096;
	Tue, 21 Feb 2023 02:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 907B561096
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C0C61BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1579042A78
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1579042A78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ddgMxzlsO--C for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 21:10:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E682B429E1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E682B429E1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 21:10:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A080C5FFA2;
 Mon, 20 Feb 2023 22:10:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 20 Feb 2023 22:10:17 +0100
Date: Mon, 20 Feb 2023 22:10:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230220211017.GF2718518@scaer>
References: <20230219232301.1795196-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230219232301.1795196-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676927419;
 bh=w7sB1hqpZmUIQyYKltL8AxauO3SFc6dnXZ8HHrT8DiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EQIFcEwUnwJECEvMVXvv4nksBufabGP+XnHZ2MOx5q42n0oxk1kfvLo5H7mJygf8b
 d596XjU2uo65EZNtn7eONDyvsgqCQCAH1y/e0Lf4i+v99uSpiJis0S2308HKkQ1HxO
 sOf++VN0vmTi8eD4wlnsVjZgDmKNiDaEbBw31RVQArW2xQUJXuGqKMpdb3LKJ6iGhi
 IbSHzsIW1Wy4eYM/iovIvcPH2nConfvy6di4+2qP/w1CqLErqaUaEeI7sYRJKBOFTC
 RUDt6MH4hIOz6Zf7TdloL7ri1OIkrvSxOErqCThWHAk6DEgauDPrF9BKV6LatkgNeZ
 0CBIzXISrsIVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EQIFcEwU
Subject: Re: [Buildroot] [PATCH 1/1] package/tmux: fix BR2_SHARED_STATIC_LIBS
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

Fabrice, All,

On 2023-02-20 00:23 +0100, Fabrice Fontaine spake thusly:
> tmux uses custom --enable-static option, instead of standard libtool
> directive

In fact, the purpose is also different: libtool's --enable-static drives
whether to generate static libraries, while tmux' --enable-static drives
whether to link against static libraries.

So, not unrelated, but still different.

> resulting in the following build failure with systemd or
> utf8proc raised since commits
> 1f618aa388535181c281c85e2b5264532de4ef0f and
> e279599d255a79c08ef20b97b96eb248689d52a9:
> 
> checking for utf8proc.h... yes
> checking for library containing utf8proc_charwidth... no
> configure: error: "utf8proc not found"
> 
> In file included from tmux.h:34,
>                  from alerts.c:23:
> compat.h:379:18: error: conflicting types for 'forkpty'; have 'pid_t(int *, char *, struct termios *, struct winsize *)' {aka 'int(int *, char *, struct termios *, struct winsize *)'}
>   379 | pid_t            forkpty(int *, char *, struct termios *, struct winsize *);
>       |                  ^~~~~~~
> 
> Link to (closed) upstream issue:
> https://github.com/tmux/tmux/issues/3290
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6e8523d8d514bf6d8fc3377d05e5edbe7fc2d5bb
>  - http://autobuild.buildroot.org/results/cba06f3bb6d9be25e91f56c390a70ddf9904832e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tmux/tmux.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
> index 47ee9b16ca..af06c8570b 100644
> --- a/package/tmux/tmux.mk
> +++ b/package/tmux/tmux.mk
> @@ -25,6 +25,12 @@ else
>  TMUX_CONF_OPTS += --disable-utf8proc
>  endif
>  
> +# tmux uses custom --enable-static option, instead of standard libtool
> +# directive resulting in a build failure with systemd or utf8proc
> +ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +TMUX_CONF_OPTS += --disable-static
> +endif
> +
>  # Add /usr/bin/tmux to /etc/shells otherwise some login tools like dropbear
>  # can reject the user connection. See man shells.
>  define TMUX_ADD_TMUX_TO_SHELLS
> -- 
> 2.39.0
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
