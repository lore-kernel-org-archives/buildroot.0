Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893B6C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 15:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2032340520;
	Thu, 28 Apr 2022 15:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4WL9_DjHoYBr; Thu, 28 Apr 2022 15:51:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2286940499;
	Thu, 28 Apr 2022 15:51:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A22041BF39D
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 15:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 847DE40499
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 15:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yPGeii6Yr3SN for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 15:51:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B06040490
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 15:51:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8d9a:c8d:7cf:ba48])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id CB89778035D;
 Thu, 28 Apr 2022 17:51:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651161074;
 bh=ZNgsW0VtgwxjhZGbZCeng+BJ0ZDnMaqLqcszWZMVb7w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e3/hdr0ZLLgmGo8s94KyxycyXBAuU0p8a8hevqAxtqUrF3CHfkHqA8ykIfKUI1jsn
 YuYho2Hfb3WbcqYWSoc8rhZ41kdApFf42mFbDv6RSJcRscOvTdfFIMwqwBRrtnluUc
 7g0jCmBwyIUQLBpvRPNfo0+kS4oHGvfN6aSzgfL1WoqEN2cOyt13eqUa7FcpqDP7qg
 +yZ1C+Yk987k/vdg2lFMr5ICMUuGfvG6ZU7P69nZMcetsKRmAcJ6JZR2LTg8EymKUQ
 nU5zse3LrN7AsUueIz0JlzeHDm0c4f3Ywx98qGz4isA9Q1+ivznCeHbrnfxVOXRXOY
 Jm52kHW+kDuhw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 28 Apr 2022 17:51:12 +0200
Date: Thu, 28 Apr 2022 17:51:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Ehmanns <universeiii@gmx.de>
Message-ID: <20220428155112.GF3624965@scaer>
References: <20220428074641.5682-1-universeiii@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428074641.5682-1-universeiii@gmx.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: add security options to
 DHCP server
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

Andreas, All,

On 2022-04-28 09:46 +0200, Andreas Ehmanns spake thusly:
> I was trying to make the ISC dhcp daemon more secure by using the
> -user and -group option to let dhcp server run as non-root user.
> Unfortunately these options are not available when building ISC dhcp
> server with buildroot.
> The reason is, that the configure script must be called with the
> option --enable-paranoia to activate these options. But this option
> is not set in the dhcp.mk file.
> 
> To be backward compatible I added a new option to the dhcp's Config.in
> file to enable this feature when desired and parse this option in
> dhcp.mk.
> 
> Signed-off-by: Andreas Ehmanns <universeiii@gmx.de>
> ---
>  package/dhcp/Config.in | 8 ++++++++
>  package/dhcp/dhcp.mk   | 4 ++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
> index e0706efafb..5cf7af82de 100644
> --- a/package/dhcp/Config.in
> +++ b/package/dhcp/Config.in
> @@ -25,6 +25,14 @@ config BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK
>  	help
>  	  Enable delayed ACK feature in the ISC DHCP server.
> 
> +config BR2_PACKAGE_DHCP_SERVER_ENABLE_PARANOIA
> +	bool "Enable paranoia options"
> +	depends on BR2_PACKAGE_DHCP_SERVER
> +	help
> +	  Add option --enable-paranoia to configure script. This activates
> +	  additional server options (-user, -group and -chroot) to make
> +	  dhcp server more secure.

    $ make check-package
    package/dhcp/Config.in:32: help text: <tab><2 spaces><62 chars>
    (http://nightly.buildroot.org/#writing-rules-config-in)

Applied to master with that fixed, thanks.

Regards,
Yann E. MORIN.

> +
>  config BR2_PACKAGE_DHCP_RELAY
>  	bool "dhcp relay"
>  	help
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index f815c6c802..b73137506d 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -78,6 +78,10 @@ ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
>  DHCP_CONF_OPTS += --enable-delayed-ack
>  endif
> 
> +ifeq ($(BR2_PACKAGE_DHCP_SERVER_ENABLE_PARANOIA),y)
> +DHCP_CONF_OPTS += --enable-paranoia
> +endif
> +
>  define DHCP_INSTALL_LIBS
>  	$(MAKE) -C $(@D)/bind install-bind DESTDIR=$(TARGET_DIR)
>  	$(MAKE) -C $(@D)/common install-exec DESTDIR=$(TARGET_DIR)
> --
> 2.26.2
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
