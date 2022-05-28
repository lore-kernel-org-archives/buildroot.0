Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAABC433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 22:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 561AC4186E;
	Sat, 28 May 2022 22:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4cofbcIIJBgX; Sat, 28 May 2022 22:10:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1302B4185D;
	Sat, 28 May 2022 22:10:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B15D21BF580
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 22:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABCE04185D
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 22:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0l7iybWyx_uG for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 22:10:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5376541859
 for <buildroot@buildroot.org>; Sat, 28 May 2022 22:10:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:882a:25de:8723:774f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id BCDE519F4F3;
 Sun, 29 May 2022 00:09:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653775800;
 bh=KIFLz+MROuBEjvPZUmRrH4tmaLqnFvBrBzc0KFyXGjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EokI79tlRpsYYUvKZHzxVRfJ34VbLXY/M2jh/VUr7DXzASrpMJRyfcyhHxZLnk/F6
 WiHbpXdBkatBKLmYM1G0HEBXPmB2SC1nzm6G7C+sMWmG0mP/VuXpfJX5NlVVhKfe2g
 CFwLCx3GNWGFF+aE2h6cebDjXRd7X9/8duEXY4wBOFwtWWamscmQ3HDlShXMPq4kKf
 8JfQWXyIdTGTo4254OlRvikxfs65cgK8qxzvrHr6nhgzky8X/g4aQoyTYoDiyp61KV
 ntf6wgsMKwLEMY1t1hdMa3VBF5KQXZ9r/SKAa2WXpbvYai4E4VHTxI8O+g9IZrqtPY
 3hqqtcDyEgoPA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 May 2022 00:09:58 +0200
Date: Sun, 29 May 2022 00:09:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220528220958.GO301044@scaer>
References: <20220528204423.2214898-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220528204423.2214898-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libwebsockets: disable -Werror
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

On 2022-05-28 22:44 +0200, Fabrice Fontaine spake thusly:
> Disable -Werror (enabled by default) through DISABLE_WERROR which is
> available since version 4.1.0 and
> https://github.com/warmcat/libwebsockets/commit/c9c152baba1fbd6e2b061b16a5c987a80309caee
> to avoid the following build failure with gcc 4.8 and libev:
> 
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/libwebsockets-4.3.1/lib/event-libs/libev/libev.c: In function 'lws_ev_hrtimer_cb':
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/libwebsockets-4.3.1/lib/event-libs/libev/libev.c:44:3: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
>    ev_timer_set(&ptpr->hrtimer, ((float)us) / 1000000.0, 0);
>    ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/75ddbd2e0b058b69a99a2a2f01c62dedad1199c0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libwebsockets/libwebsockets.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
> index 63d50999a5..3a9b9ea88f 100644
> --- a/package/libwebsockets/libwebsockets.mk
> +++ b/package/libwebsockets/libwebsockets.mk
> @@ -11,6 +11,7 @@ LIBWEBSOCKETS_LICENSE_FILES = LICENSE
>  LIBWEBSOCKETS_DEPENDENCIES = zlib
>  LIBWEBSOCKETS_INSTALL_STAGING = YES
>  LIBWEBSOCKETS_CONF_OPTS = \
> +	-DDISABLE_WERROR=ON \
>  	-DLWS_WITHOUT_TESTAPPS=ON \
>  	-DLWS_IPV6=ON \
>  	-DLWS_UNIX_SOCK=ON \
> -- 
> 2.35.1
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
