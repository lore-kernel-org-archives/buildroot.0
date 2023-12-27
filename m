Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78DEC46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 22:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 785FD41BAE;
	Wed, 27 Dec 2023 22:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 785FD41BAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J0vNy1g1j7rs; Wed, 27 Dec 2023 22:28:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFE7B41C20;
	Wed, 27 Dec 2023 22:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFE7B41C20
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B08B01BF3E3
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A658610C0
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A658610C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XohJtxdji3nC for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 22:28:32 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D9A361086
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 22:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D9A361086
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AD5A4B00535;
 Wed, 27 Dec 2023 23:28:26 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Dec 2023 23:28:26 +0100
Date: Wed, 27 Dec 2023 23:28:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <ZYylCmH5A1etLs-c@landeda>
References: <20231109212901.5596-1-ps.report@gmx.net>
 <20231109212901.5596-3-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231109212901.5596-3-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703716110;
 bh=gybNHbnVDK0QmR3L5ed3m7q++NmPaWlgQNZncaCYzOI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qb+7mO/lbKdVudhS6V/4YKE0M0hrVI3/VcJYli2udqqoQ9J34G8ZCYZVlIP574faN
 Jgcvj7jhe+qh4BcwpvzqQTkd5HvoPEs0dMA7IPVwV3iQnqoTFjqsYxK0s/aU9vb9CY
 p692B9ZTYnK8FF7/X9C0E8L9ksdCEMHiZNkzF40KlkfqXVHDzJt+ZcerksLQYoMjFy
 7f4988XTTnqTt0GGL5mPPTE9wj68oNps7w7zIE4cjmwkWutk4rmus01ND6lYD8p5GL
 jkiRyYoOxHv+xTULH/S4mRx5OuKLvvr2kKVJSpEwMflzEDeL7K8C7OakoAhdiQ4wXI
 HFl5xcGMLUN/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Qb+7mO/l
Subject: Re: [Buildroot] [PATCH v1 3/4] package/libcamera: use udev
 configure option
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-11-09 22:29 +0100, Peter Seiderer spake thusly:
> Use the udev configure option introduced with upstream commit [1] (since
> version v0.1.0).
> 
> [1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=d314d3b98b86dec9a25ce7b829e72a790b7ead1b
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libcamera/libcamera.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 8b33b9e708..dd31d90e98 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -98,7 +98,10 @@ LIBCAMERA_DEPENDENCIES += tiff
>  endif
>  
>  ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +LIBCAMERA_CONF_OPTS += -Dudev=enabled
>  LIBCAMERA_DEPENDENCIES += udev
> +else
> +LIBCAMERA_CONF_OPTS += -Dudev=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
> -- 
> 2.42.1
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
