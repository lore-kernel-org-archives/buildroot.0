Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458BCC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 08:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFC8660E26;
	Sun, 13 Mar 2022 08:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TGOQs-_Y_eeG; Sun, 13 Mar 2022 08:45:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E690660BAF;
	Sun, 13 Mar 2022 08:45:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 758091BF360
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 08:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D6CC403AE
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 08:45:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w4VJdbQp2xAG for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 08:45:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1AFC401E1
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 08:45:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:91a3:d0c0:1a06:f60f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0CF9E780333;
 Sun, 13 Mar 2022 09:45:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647161152;
 bh=HDcjl3S8crxT2TWMmsbvh6//EZDZAG2r0BcgSK35nNY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qZJpjE+R75YqSa0rCFOJWXElr4VNYP51lz9PZyuT4/p2XZOnz3MKft3b96pEHEajB
 B1Kfm4sDYuBfybvOZWp54OL8sQi4U8erJr6zj+D5tq9bSyGV4f5vY4nsYRbMPoxxZv
 a0SUX+OLreuqEQuB5HXMLwgcuq9wRfVmJ5K2RFLsYX6KXuyx76TMT28L145IyRqKlq
 ymz5uE3V/aGunynTwBxdOGzKVDCBEnTYGT9RrnhZU1jzTehd5VLni628vr/gCH8JMK
 0aY+6LyhVYK3nWFN9z4tGbzYzEqAsjoe9L67+29Zvcsd2tOe0Ysl5cIzIlhcJ1Eudv
 vy0SURVcdEG8w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Mar 2022 09:45:48 +0100
Date: Sun, 13 Mar 2022 09:45:48 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220313084548.GQ283544@scaer>
References: <20220308180056.1558155-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220308180056.1558155-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libsrtp: bump to version 2.4.2
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
Cc: Gregory Dymarek <gregd72002@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-03-08 19:00 +0100, Fabrice Fontaine spake thusly:
> This is a patch release for version 2 & 2.4, fixing a regression
> introduced in 2.4.1.
> 
> https://github.com/cisco/libsrtp/releases/tag/v2.4.2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libsrtp/libsrtp.hash | 2 +-
>  package/libsrtp/libsrtp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libsrtp/libsrtp.hash b/package/libsrtp/libsrtp.hash
> index 3de0130f4c..8e51e68ac2 100644
> --- a/package/libsrtp/libsrtp.hash
> +++ b/package/libsrtp/libsrtp.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  3cb580928fcd502426809c68406d04aaa5ef1af7ebb0a3a41a52a13576f2fc07  libsrtp-2.4.1.tar.gz
> +sha256  3b1bcb14ebda572b04b9bdf07574a449c84cb924905414e4d94e62837d22b628  libsrtp-2.4.2.tar.gz
>  sha256  8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  LICENSE
> diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
> index 885f05a33c..f2ba600dd6 100644
> --- a/package/libsrtp/libsrtp.mk
> +++ b/package/libsrtp/libsrtp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBSRTP_VERSION = 2.4.1
> +LIBSRTP_VERSION = 2.4.2
>  LIBSRTP_SITE = $(call github,cisco,libsrtp,v$(LIBSRTP_VERSION))
>  LIBSRTP_INSTALL_STAGING = YES
>  LIBSRTP_LICENSE = BSD-3-Clause
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
