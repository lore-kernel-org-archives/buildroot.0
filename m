Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FF3C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:15:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BE9861248
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BE9861248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9B9140194;
	Sun,  3 Oct 2021 20:15:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBqjIQxgI2JF; Sun,  3 Oct 2021 20:15:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E761640169;
	Sun,  3 Oct 2021 20:15:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BDBED1BF44A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC0CC40169
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:15:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G0yAnJw6ljuM for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 20:15:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A25694000B
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 20:15:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d3d:918b:43fc:aadd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EAB1013F80A;
 Sun,  3 Oct 2021 22:15:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633292113;
 bh=f12r2/ZBUQMg0K5zSCvtKuewOIsUEQQy4KK39W3zNGg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P7WOT4JtDeLMM5+6FCftKZ9oSi11UVgqL7Eau3jj4g5zGl86iqrFVVzJ+N6PsQ4+N
 xn67bcSpOXIbl2pftzX0u2V9COj3PHFPzJQ8uc9f0xC1lSpj7/Uih6kwKMJ/s4kJi9
 KuOWvX7ObvBpXj/+XmV9X2mLkdKcngyIHLtIo7leDpkPjSTeHx2z+7HCZjSt+FqnLX
 DMoQjakgQ9VO7GREkibc0wAF6zxs5Gu86dqTakyeGercigNpAlwAnyWeLWpgy6wCej
 CKYdwM0BY/JrdEkObVCjnWGtv+4Y/LydlY5eWqPnAuHcygIbaj4DStUZcOlu/ZXWp2
 BccpoX0OvhVFw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 22:15:08 +0200
Date: Sun, 3 Oct 2021 22:15:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20211003201508.GW1504958@scaer>
References: <20211001103417.1078082-1-aperez@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211001103417.1078082-1-aperez@igalia.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/webkitgtk: remove
 gst1-plugins-good from dependencies
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

Adrian, All,

On 2021-10-01 13:34 +0300, Adrian Perez de Castro spake thusly:
> This is only a runtime dependency, not a build dependency.
> Based on a similar patch by James Hilliard for the wpewebkit
> package.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/webkitgtk/webkitgtk.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index 6687d7f61b..87aeffea45 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -46,7 +46,7 @@ ifeq ($(BR2_PACKAGE_WEBKITGTK_MULTIMEDIA),y)
>  WEBKITGTK_CONF_OPTS += \
>  	-DENABLE_VIDEO=ON \
>  	-DENABLE_WEB_AUDIO=ON
> -WEBKITGTK_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base gst1-plugins-good
> +WEBKITGTK_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base
>  else
>  WEBKITGTK_CONF_OPTS += \
>  	-DENABLE_VIDEO=OFF \
> -- 
> 2.33.0
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
