Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815C7C77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 08:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A7F641EE6;
	Sat, 13 May 2023 08:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A7F641EE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gd2co2GkXE0l; Sat, 13 May 2023 08:28:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3C5E41DF6;
	Sat, 13 May 2023 08:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3C5E41DF6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC48E1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CF3460804
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CF3460804
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id etsph4rdNL1E for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 08:28:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D1E4607CA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D1E4607CA
 for <buildroot@buildroot.org>; Sat, 13 May 2023 08:28:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B59E619F73B;
 Sat, 13 May 2023 10:28:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 10:28:35 +0200
Date: Sat, 13 May 2023 10:28:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230513082835.GG2582048@scaer>
References: <20230512002133.1353641-1-christian@aperture.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230512002133.1353641-1-christian@aperture.us>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683966518;
 bh=m55D+MG4WGKzwUjckD5KELOVP+rVtVXViVPdjWKkTZs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pmcp1izAyGjNIqB38fiKEbGcdRd7ewcQ+xhAC5OXDlYTG6xNzc7GypsUhV5LmIWSh
 DdL7/d8D1+8ea2hfga6V3kqadJNdyZYEprHRqhYUdFV8TUjXcvPERkYcb4184b4J4b
 /YCOO2lQMMwnRDTICyvAbof2QbTapM1P9DHiHkRnwBbxune5UR01NW1H+dacuRWPi4
 ZE9KMt05+O4VprE+faEXz1eRnYAcypiHKzQ3cvxwlD1WVMAdECk1k/fHQwN+sKpVST
 UM16IMj/vGV1wIrqtDHMWCQ8KjKYtepf605e5OHm20z8DOusuyfr7QDYLACgIq31U/
 Kw5Pv0ZeanXxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Pmcp1izA
Subject: Re: [Buildroot] [PATCH v1 1/2] package/cni-plugins: bump version to
 1.3.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2023-05-11 17:21 -0700, Christian Stewart via buildroot spake thusly:
> https://github.com/containernetworking/plugins/releases/tag/v1.3.0
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Both Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cni-plugins/cni-plugins.hash | 2 +-
>  package/cni-plugins/cni-plugins.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cni-plugins/cni-plugins.hash b/package/cni-plugins/cni-plugins.hash
> index 0c3e07c91c..90cb184604 100644
> --- a/package/cni-plugins/cni-plugins.hash
> +++ b/package/cni-plugins/cni-plugins.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  f3496ddda9c7770a0b695b67ae7ee80a4ee331ac2745af4830054b81627f79b7  cni-plugins-1.2.0.tar.gz
> +sha256  f9871b9f6ccb51d2b264532e96521e44f926928f91434b56ce135c95becf2901  cni-plugins-1.3.0.tar.gz
>  sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
> diff --git a/package/cni-plugins/cni-plugins.mk b/package/cni-plugins/cni-plugins.mk
> index be02c2ff45..27a31b445a 100644
> --- a/package/cni-plugins/cni-plugins.mk
> +++ b/package/cni-plugins/cni-plugins.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CNI_PLUGINS_VERSION = 1.2.0
> +CNI_PLUGINS_VERSION = 1.3.0
>  CNI_PLUGINS_SITE = $(call github,containernetworking,plugins,v$(CNI_PLUGINS_VERSION))
>  CNI_PLUGINS_LICENSE = Apache-2.0
>  CNI_PLUGINS_LICENSE_FILES = LICENSE
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
