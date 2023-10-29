Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70EAC4167D
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 08:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9141B7040D;
	Sun, 29 Oct 2023 08:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9141B7040D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cztopc4iadPB; Sun, 29 Oct 2023 08:46:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B52AF70425;
	Sun, 29 Oct 2023 08:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B52AF70425
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16C3E1BF41A
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E261443112
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E261443112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I3S8WV397i8z for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 08:46:09 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8191743108
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 08:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8191743108
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id AF0652003CC;
 Sun, 29 Oct 2023 09:46:05 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 09:46:05 +0100
Date: Sun, 29 Oct 2023 09:46:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231029084605.GP687180@scaer>
References: <20231026180416.3147682-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026180416.3147682-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698569167;
 bh=jdAjhTOu82imqRWltD5mIeBCNt7lIO144ffCuTy6cJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QahtjcgT+BwcGQKA/GXIzJvX+R+MIwLSZEdTMvcxIb21pwI5Gvvm0FDOYYl0p3zjf
 m4FLt1kFxSigV/v7xiXVl8mmIEo4Utw5WU7nhxz2bHzjAq5716GUQc3qJEXGz8Ujs2
 hzwZi8iXrAUAWZkwCtbvOUGFbio4L4+Sov+DmBfJpV5ysb/gVF+ALHQuK7LiG9zJVX
 AxoWbHZLhalblv1CzbFe2ysduGF0CObProhSp4fX96voNz4S9tGRvkuJG08p3KcjS+
 qnZJc0lh6DExWc6vUiSy4YwKmES10YJGzUlYrYnzUf/k/uKXfnHWtghDZEQBV0LcP0
 lktwB/LJhBn6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QahtjcgT
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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

Bernd, All,

On 2023-10-26 20:04 +0200, Bernd Kuhls spake thusly:
> Fixes build with python 3.12.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tvheadend/tvheadend.hash | 2 +-
>  package/tvheadend/tvheadend.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
> index 5b021edcc3..5a9ec3df23 100644
> --- a/package/tvheadend/tvheadend.hash
> +++ b/package/tvheadend/tvheadend.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  9d8e68d1442403709846b93e7994652a1eca0f03924924d3a4dd31b882851375  tvheadend-fe47ecb5504a521fed9c1ca9705fb0dd2bb8443a.tar.gz
> +sha256  98a27a6a5ce2fc800df6d154534f494582418f6b24b3a1c30267785d191e50df  tvheadend-62adbebfd062d7b97829268274aad92df2033784.tar.gz
>  sha256  54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index f9303ef2fe..1d4e6ee30c 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TVHEADEND_VERSION = fe47ecb5504a521fed9c1ca9705fb0dd2bb8443a
> +TVHEADEND_VERSION = 62adbebfd062d7b97829268274aad92df2033784
>  TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
>  TVHEADEND_LICENSE = GPL-3.0+
>  TVHEADEND_LICENSE_FILES = LICENSE.md
> -- 
> 2.39.2
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
