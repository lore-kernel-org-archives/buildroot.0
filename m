Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C766C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 14:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FEED82907;
	Mon, 10 Jan 2022 14:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HJAHZHwr-2dk; Mon, 10 Jan 2022 14:05:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48A378266A;
	Mon, 10 Jan 2022 14:05:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 60A8F1BF3C3
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C4478266A
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uoqx6ulzOpBz for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 14:04:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8734E823CB
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 14:04:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8dcf:1110:8dc6:b258])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0B4FA19F5AE;
 Mon, 10 Jan 2022 15:04:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641823494;
 bh=oj7wqmKHG4vchCY6D1lkSNJZrZ/2lXBiaCYe6kJOSxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gvTn/xk3dXLQ4km8qqwtptbfwrmqZ9kntnidiOcAPgn0QBaiowaZ9jYMLiY89ZNHy
 ADlu3qoubM5MmL/lPnRVIhGfZbFNDGNOChD2k9Gd8HonzhDtelkpLM8zV4jdcWtSqc
 yxmGhBwSsZq/JvqKhtnaum0OgJaHwl89JU4GeW69n1Ecu7hsXWkKErPZEQ9r9Z5LTR
 ASV/m5zqp6y/gue3am6NjaDkw/Cfz7Hy0mMXMQ4longUwn05uQqxstuc8fWHuGkCXx
 eW8GZdkdau06JYg+aco3z9crNI4wbMDt7EQD9CI9+YT3FfH2oJCsl+pQw0ypwckrBT
 cJxdVyNCTI4WA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Jan 2022 15:04:50 +0100
Date: Mon, 10 Jan 2022 15:04:50 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <20220110140450.GO1477939@scaer>
References: <20220110085850.11095-1-yegorslists@googlemail.com>
 <20220110085850.11095-2-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110085850.11095-2-yegorslists@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] package/avrdude: add support for Linux
 sysfs GPIO interface
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yegor, All,

On 2022-01-10 09:58 +0100, yegorslists--- via buildroot spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/avrdude/Config.in  | 3 +++
>  package/avrdude/avrdude.mk | 6 ++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
> index 89558a5ff5..57a8df66ea 100644
> --- a/package/avrdude/Config.in
> +++ b/package/avrdude/Config.in
> @@ -17,6 +17,9 @@ config BR2_PACKAGE_AVRDUDE
>  
>  if BR2_PACKAGE_AVRDUDE
>  
> +config BR2_PACKAGE_AVRDUDE_LINUXGPIO
> +	bool "Linux sysfs GPIO interface support"
> +
>  config BR2_PACKAGE_AVRDUDE_SPI
>  	bool "SPI support"
>  	default y # Backward compatibility
> diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
> index accd92c1d5..3ccba80d8e 100644
> --- a/package/avrdude/avrdude.mk
> +++ b/package/avrdude/avrdude.mk
> @@ -16,6 +16,12 @@ AVRDUDE_CONF_OPTS = --enable-linuxgpio
>  AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
>  	host-flex host-bison
>  
> +ifeq ($(BR2_PACKAGE_AVRDUDE_LINUXGPIO),y)
> +AVRDUDE_CONF_OPTS += --enable-linuxgpio
> +else
> +AVRDUDE_CONF_OPTS += --disable-linuxgpio
> +endif

We already have an unconditional activation of those:

    https://github.com/buildroot/buildroot/blob/master/package/avrdude/avrdude.mk#L15

(which you can btw. incidentally also notice as part the hunk header).

So, if the intention was to be able to enable linux-gpio, then this is a
noop as they are already enabled. If the intention was to be able to
disable them, then the unconditional enable should be dropped.

But then, does it make sense to be able to disable linux GPIO?

And what if both SPI and GPIO are disabled?

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_AVRDUDE_SPI),y)
>  AVRDUDE_CONF_OPTS += --enable-linuxspi
>  else
> -- 
> 2.17.0
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
