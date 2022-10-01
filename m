Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE440C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 16:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72AB883F26;
	Sat,  1 Oct 2022 16:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72AB883F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h8aSEvJ0aFwY; Sat,  1 Oct 2022 16:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B53383EF2;
	Sat,  1 Oct 2022 16:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B53383EF2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A26E1BF59C
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05FD560E7A
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05FD560E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aTviZsqqvWMd for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 16:51:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ADF360A8C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1ADF360A8C
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 16:51:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8AD65780373;
 Sat,  1 Oct 2022 18:50:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 18:50:55 +0200
Date: Sat, 1 Oct 2022 18:50:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221001165055.GK30794@scaer>
References: <20220929083341.2485242-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220929083341.2485242-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664643058;
 bh=B0pcv23dof4lZ+u/g2GgGFbhN9dAtAjLNzT0i3yeQCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u71O1gnYPz1FfOISC1SYjj+3qWA5nfDtAHNSzZSUIB9EEIgPZvWMQI5m9+Z6xb4hr
 3KsQtwkVD1IBK+YeV1NSbfJtGL40Si3OlQF/FQqp+FQpipACOFbLjh3PFEZ5cErDTY
 CsPNM9LtF1bOEbCWpPxcus79Q4O2NTGZjFZ1m18SdH0Ee0UgonLEMr0xsleRoSU+X9
 2Uez6DfCW8lqjb+W2m2S5vvFrgQ39p3We7rzoggYFFOSQZqIYIEbyQREFurizdsWDn
 3Um/LpFLBd1tTFruzpMgomt4CRiSirUj9CBdBkgk6ngiVJOLNT4GjIamVVjXTxnvKB
 zTE/nIS3ZJ+dQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=u71O1gnY
Subject: Re: [Buildroot] [PATCH 1/1] package/ser2net: bump to version 4.3.8
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
Cc: Francisco Gonzalez <gzmorell@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-09-29 02:33 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ser2net/ser2net.hash | 6 +++---
>  package/ser2net/ser2net.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
> index db493b28cb..50a2efdee8 100644
> --- a/package/ser2net/ser2net.hash
> +++ b/package/ser2net/ser2net.hash
> @@ -1,6 +1,6 @@
>  # From https://sourceforge.net/projects/ser2net/files/ser2net/
> -md5  3323783668b20016d79458e82327cff8  ser2net-4.3.7.tar.gz
> -sha1  88c0542b3b5e8ce03bc99ace00b2e163382e726e  ser2net-4.3.7.tar.gz
> +md5  73b4ccc7e9d89034f1a1a20a780b9da9  ser2net-4.3.8.tar.gz
> +sha1  d1597d88d154489cb08bac69bb1772712d30cbcd  ser2net-4.3.8.tar.gz
>  # Locally computed:
> -sha256  542915e240ae8b5c7dcec8d1589e6067818532900d45cfef226cea9f0e671d13  ser2net-4.3.7.tar.gz
> +sha256  e5620975523059a38709bb53c0567600adbbcb8011066a2d2fe1b4db9efe0ba3  ser2net-4.3.8.tar.gz
>  sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
> diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
> index 393d358033..679aaec29a 100644
> --- a/package/ser2net/ser2net.mk
> +++ b/package/ser2net/ser2net.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SER2NET_VERSION = 4.3.7
> +SER2NET_VERSION = 4.3.8
>  SER2NET_SITE = https://downloads.sourceforge.net/project/ser2net/ser2net
>  SER2NET_LICENSE = GPL-2.0+
>  SER2NET_LICENSE_FILES = COPYING
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
