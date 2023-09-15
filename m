Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705CACD37AA
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 21:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02D6941980;
	Fri, 15 Sep 2023 21:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02D6941980
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GKc1lJuvcnbe; Fri, 15 Sep 2023 21:19:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BEE640477;
	Fri, 15 Sep 2023 21:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BEE640477
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A7CA61BF29D
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80B41612D8
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80B41612D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1SH2rFFs7QPJ for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 21:19:48 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54ADA60E83
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 21:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54ADA60E83
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 81E1F2003C8;
 Fri, 15 Sep 2023 23:19:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 15 Sep 2023 23:19:42 +0200
Date: Fri, 15 Sep 2023 23:19:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Yanghao Cheng <yanghaobillcheng@gmail.com>
Message-ID: <20230915211942.GE2571@scaer>
References: <20230915172458.3388709-1-yanghaobillcheng@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915172458.3388709-1-yanghaobillcheng@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694812785;
 bh=d4Z6o9sk4smVUuCsWAz/npEKLRJUpWHp3XcpVlOj26Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=avHxwTXC3qn725/AoPqvIlq89fwTJxfyUGi8fbOxjHvnZIlAo0SQjz39g+ByMl/gx
 yX6Qx3djjP+ik600pt6Kmm8ugjil65m4djDXQ6pTfSyW1ly4RhvXnBwgNjBFItUlmf
 PWOk1geKf/G50F7Z/cOF5f607uyi2nXXOZw2/bOKPTb2FRv0EE//rXEDsL5M8S18YI
 chOCz0HzXi3hX0KitWvXI8ttH8SiKknz6Tvhy2ikKKUm79jAbG/uU+EYqbBVKVx1ws
 +OxxYCDvvUP3BirlJw8jOmYqMwfCyAtSYPPAUEOvIPjX8c9y+lq5CLsPv6hiHeHU02
 r0q8wxR6wibLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=avHxwTXC
Subject: Re: [Buildroot] [PATCH v2 1/3] package/xserver_xorg-server: fix
 init script conflicts
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
Cc: Yanghao Cheng <yanghao.cheng@aioi-atg.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yanghao Cheng, All,

On 2023-09-15 10:24 -0700, Yanghao Cheng spake thusly:
> From: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
> 
> xdm package also installs a init script that utimately starts X server
> 
> Signed-off-by: Yanghao Cheng <yanghao.cheng@aioi-atg.com>

Thanks for this v2, but there are still a few issues, see below...

> ---
>  .../xserver_xorg-server/xserver_xorg-server.mk     | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index 593bbd4276..e5df7f7e93 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -181,12 +181,14 @@ define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
>  		$(TARGET_DIR)/usr/lib/systemd/system/xorg.service
>  endef
>  
> -# init script conflicts with S90nodm
> -ifneq ($(BR2_PACKAGE_NODM),y)
> -define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
> -	$(INSTALL) -D -m 755 package/x11r7/xserver_xorg-server/S40xorg \
> -		$(TARGET_DIR)/etc/init.d/S40xorg
> -endef
> +# init script conflicts with S90nodm and S99xdm
> +ifneq ($(or $(BR2_PACKAGE_NODM), $(BR2_PACKAGE_XAPP_XDM)),)

Thomas suggested you change the condition to positive logic. I see you
did that in patch 3/3, but it should have been done right here in this
patch, not in a separate patch.

> +    # NODM or XDM is defined, do not define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
> +else
> +    define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
> +        $(INSTALL) -D -m 755 package/x11r7/xserver_xorg-server/S40xorg \
> +            $(TARGET_DIR)/etc/init.d/S40xorg
> +    endef

    $ make check-package
    package/x11r7/xserver_xorg-server/xserver_xorg-server.mk:189: expected indent with tabs
    package/x11r7/xserver_xorg-server/xserver_xorg-server.mk:190: expected indent with tabs

Also, the "define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV" and "endef"
lines should not be indented: we do not indent the Makefile code, even
when it is in a conditional block.

Can you look into that, and also check patch 2 about systemd, to follow
the same suggestions?

Thanks!

Regards,
Yann E. MORIN.

>  endif
>  
>  $(eval $(autotools-package))
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
