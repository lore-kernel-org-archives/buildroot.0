Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF9BCD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 13:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 499C540C1C;
	Sat, 16 Sep 2023 13:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 499C540C1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yajcipuvp-Nd; Sat, 16 Sep 2023 13:19:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A90440B5E;
	Sat, 16 Sep 2023 13:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A90440B5E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D0F01BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56ADD80EE0
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56ADD80EE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fFnkI38ILfRg for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 13:19:36 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 711C480EC8
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 13:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 711C480EC8
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 8408C2003C8;
 Sat, 16 Sep 2023 15:19:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Sep 2023 15:19:30 +0200
Date: Sat, 16 Sep 2023 15:19:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Yanghao Cheng <yanghaobillcheng@gmail.com>
Message-ID: <20230916131930.GE415981@scaer>
References: <20230915222711.899079-1-yanghaobillcheng@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915222711.899079-1-yanghaobillcheng@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694870373;
 bh=l9Qlum7rm8H+o8I6oP/1v8aTRLbbmDJTuxximy99Sdo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c9UInhNIdS4nezwkW3rnIh2UK/VsYk3RRMJ85g6T5mdvBbZQ6fVOPL8HQMqrv+g31
 wJt4x5qKOf3wGp61UbFBl0cxRygE4tqqqyGmY4eKgQqda2ByLlsqvZ62Zoj1HWrSjZ
 MokQsitog8ujtDxipauH+ltuXMYQ8TW3Stz2spiidplG1JkziCwf/UCweZfKoNFxlc
 GTs05UL5tFJ+ygAj0c1VufiKThf+3Co+f5DZ8jTCcKuQNn6KqWdrwZEih5hPxVH+vl
 ndK3O+SSZLdz6dHf+LOtaD4TiyUmeBVS3HuBk/BCynkuioF/NmimU6wOoRZrZ0QN33
 a5mzQwTjqWxkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c9UInhNI
Subject: Re: [Buildroot] [PATCH v3 1/2] package/xserver_xorg-server: fix
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

On 2023-09-15 15:27 -0700, Yanghao Cheng spake thusly:
> From: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
> 
> xdm package also installs a init script that utimately starts X server
> 
> Signed-off-by: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
> ---
> Changes v1 -> v2:
>     - Simplify the condition per Thomas's suggestion
> 
> Changes v2 -> v3: (Suggested by Yann)
> 	- Revert indent added in original patch
> 	- Keep the original number of patches
> 
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index 593bbd4276..0390519d6a 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -181,8 +181,9 @@ define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
>  		$(TARGET_DIR)/usr/lib/systemd/system/xorg.service
>  endef
>  
> -# init script conflicts with S90nodm
> -ifneq ($(BR2_PACKAGE_NODM),y)
> +# init script conflicts with S90nodm and S99xdm
> +ifeq ($(or $(BR2_PACKAGE_NODM), $(BR2_PACKAGE_XAPP_XDM)),)

As Thomas mentioned, in this situation, we do not use $(or ...), but we
just concatenate the values:

    ifeq ($(BR2_PACKAGE_NODM)$(BR2_PACKAGE_XAPP_XDM),)
    ...

> +# Install the init script only when nodm nor xdm aren't enabled

I slightly reworded the comment, bcasue it did not make much sense to
have two similar comments, one outsode, the other inside the conditional
block.

I did the same in the systemd-related change in patch 2.

Both applied to master, thanks.

Regards,
Yann E. MORIN.

>  define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 755 package/x11r7/xserver_xorg-server/S40xorg \
>  		$(TARGET_DIR)/etc/init.d/S40xorg
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
