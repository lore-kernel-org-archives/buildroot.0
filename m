Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674C8C77B7F
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 19:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 132D641D31;
	Mon,  8 May 2023 19:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 132D641D31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ka8wT9Bmt4eI; Mon,  8 May 2023 19:22:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D284A40A4D;
	Mon,  8 May 2023 19:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D284A40A4D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C25AB1BF867
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7CE441D86
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7CE441D86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WEC9j5t4KqmI for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 19:22:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E5CE41D82
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E5CE41D82
 for <buildroot@buildroot.org>; Mon,  8 May 2023 19:22:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id B4BB520059E;
 Mon,  8 May 2023 21:22:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 21:22:35 +0200
Date: Mon, 8 May 2023 21:22:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230508192235.GH252090@scaer>
References: <20230508143506.137329-1-dalang@gmx.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230508143506.137329-1-dalang@gmx.at>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683573758;
 bh=5x/9hIcjzMhgad8SjXmQG3RNZYGz+IP5wk+VSyVoSt4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=llUmIpIYAp/OKhbrQxiNW75tj4U28ApnimiSQEuWfhYZ1yXFCxUu3PdBhgRAyM6i7
 Hx/93ZjPEi8Pi3kTB3LfvlFNh2yYgoQsGMP+DQwbmUSYMf0UAwpPpiTI/VjnPFD66M
 szTyWYTwQbUt2a4HhEW2J2eQ6AIJUAM2BCXInFFN39IXNtDCopM4HWpiq0QAtDE545
 M/YwsXvN6a8b2cgx3C4Mxk5nxGqm1daRDBINZt4A6PAMGfUp0Fg6XVcFLaNsRtt4K7
 lAHUTzLafUh01epuNRdmJ5/PvX5Z7FV9DyPx/8AYzfvTHYeO7Vn4tHMocVQJIhvdxq
 gCaImCIOMfTcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=llUmIpIY
Subject: Re: [Buildroot] [PATCH] package/dbus-cxx: bump version to 2.4.0
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
Cc: Daniel Lang <d.lang@abatec.at>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Daniel, All,

On 2023-05-08 16:35 +0200, Daniel Lang spake thusly:
> https://github.com/dbus-cxx/dbus-cxx/releases/tag/2.4.0
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dbus-cxx/dbus-cxx.hash | 2 +-
>  package/dbus-cxx/dbus-cxx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dbus-cxx/dbus-cxx.hash b/package/dbus-cxx/dbus-cxx.hash
> index 6a7a634ced..4ed9d73bac 100644
> --- a/package/dbus-cxx/dbus-cxx.hash
> +++ b/package/dbus-cxx/dbus-cxx.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  88d4bd1d9af8563bda03f24b26ffe4efbc555ca82ac664ced572b053928f739a  dbus-cxx-2.3.1.tar.gz
> +sha256  c38456ed70023d93e6e689087e4bbe030f1650bbda9de7c035d6f4ebac788379  dbus-cxx-2.4.0.tar.gz
>  sha256  99e5d0ad951d96567a6f9a17f3f17ac000c0582f53357c7f3601851c2dcbb786  COPYING
>  sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  cmake-modules/LICENSE_1_0.txt
>  sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  tools/libcppgenerate/LICENSE
> diff --git a/package/dbus-cxx/dbus-cxx.mk b/package/dbus-cxx/dbus-cxx.mk
> index 554acaa67d..8e2b4f70fa 100644
> --- a/package/dbus-cxx/dbus-cxx.mk
> +++ b/package/dbus-cxx/dbus-cxx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DBUS_CXX_VERSION = 2.3.1
> +DBUS_CXX_VERSION = 2.4.0
>  DBUS_CXX_SITE = $(call github,dbus-cxx,dbus-cxx,$(DBUS_CXX_VERSION))
>  DBUS_CXX_LICENSE = LGPL-3.0+ or BSD-3-Clause, Boost license (cmake-modules), Apache 2.0 (libcppgenerate)
>  DBUS_CXX_LICENSE_FILES = COPYING cmake-modules/LICENSE_1_0.txt tools/libcppgenerate/LICENSE
> -- 
> 2.40.1
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
