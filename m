Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BCAC46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0371435EE;
	Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0371435EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dloCGm4Qxd1x; Fri, 29 Dec 2023 21:17:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6CC8435BE;
	Fri, 29 Dec 2023 21:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6CC8435BE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3481E1BF239
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0918141B6E
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0918141B6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bJWb8CWBIsuO for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:17:45 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1087440983
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1087440983
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CCC42B0053D;
 Fri, 29 Dec 2023 22:17:38 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Dec 2023 22:17:38 +0100
Date: Fri, 29 Dec 2023 22:17:38 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ZY83cvKA8SCz7jbc@landeda>
References: <20231226200320.143381-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231226200320.143381-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703884662;
 bh=O8rDs4xxA6wZrnN2GKH1epsbureV+0Mh5GoSp0Gd9lQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gch2U7UKNjoFv65BeF4DXQlFklW4HVwSYmsvbZRAoKlZQ+CTeIuZFlY2H8w0+1XGJ
 KIumLDk4btqZ+D0UoCnhEvgylozDLBSoKqXzOzqHsDSVbwEQWs+oIz43NeS1l/GSUz
 fnlbmD+6yT8d6bfXNj5sIbTlW9+eFaZbNpPXFGX9EGlE9ULMESqk1rXCjVIU+Y2CUy
 KmzVzsBIkY+ZXKr1e6xJd+o58+HopL/XPUUYQxS6XbNRP1jctNEiqifzdqINvkFnSL
 Uxmz6UYUE8L5hquTzi/XzI5dhsphtWDQnAtPRUPmZs73rpdxs3hIbMEZRaSCit7zPl
 iOF+uCN1rO6Bw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Gch2U7UK
Subject: Re: [Buildroot] [PATCH] package/xr819-xradio: bump to version
 2023-12-25
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-12-26 21:03 +0100, Giulio Benetti spake thusly:
> With this patch package builds with Linux up to version 6.7
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/xr819-xradio/xr819-xradio.hash | 2 +-
>  package/xr819-xradio/xr819-xradio.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
> index 1ff36368ec..388a3a3cd4 100644
> --- a/package/xr819-xradio/xr819-xradio.hash
> +++ b/package/xr819-xradio/xr819-xradio.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  e27b6b5fb35ef44a93eb1f5b29bd61c06109e951c8a5ea2cc3e0310663f22001  xr819-xradio-547521df27d1a80fb5542e93fa13bd09fb2259a2.tar.gz
> +sha256  8bc3d745ed08b7f3a9c0413c2635d0faf647362b41494d04edc98709b869deef  xr819-xradio-3a1f77fb2db248b7d18d93b67b16e0d6c91db184.tar.gz
>  # Locally computed
>  sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
> diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
> index 1e4cdb6872..8b576a347a 100644
> --- a/package/xr819-xradio/xr819-xradio.mk
> +++ b/package/xr819-xradio/xr819-xradio.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XR819_XRADIO_VERSION = 547521df27d1a80fb5542e93fa13bd09fb2259a2
> +XR819_XRADIO_VERSION = 3a1f77fb2db248b7d18d93b67b16e0d6c91db184
>  XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
>  XR819_XRADIO_LICENSE = GPL-2.0
>  XR819_XRADIO_LICENSE_FILES = LICENSE
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
