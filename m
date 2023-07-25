Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC7DEB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 19:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFAC36110E;
	Tue, 25 Jul 2023 19:50:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFAC36110E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MY8Kuahuj_yB; Tue, 25 Jul 2023 19:50:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3A1D60A4F;
	Tue, 25 Jul 2023 19:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A1D60A4F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F9321BF982
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34CBF418BE
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34CBF418BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nJUlHHEYPSzf for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 19:50:44 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD1D54094D
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 19:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD1D54094D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 1DBAB78034E;
 Tue, 25 Jul 2023 21:50:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jul 2023 21:50:39 +0200
Date: Tue, 25 Jul 2023 21:50:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Robert Marko <robimarko@gmail.com>
Message-ID: <20230725195039.GM3544423@scaer>
References: <20230725161633.791156-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725161633.791156-1-robimarko@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690314642;
 bh=lX5rEcwrLjb0LgmcCa3MaQsm0kSCXXplPZXanlEWaKA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j49IBEjUija7vo9gWqJutG/pMjcvB1N5HN2AmmCramLR79Ta75ex5wbDpiNRE/fFR
 7npfMHQcBZYpEB+YNDA0FkNCTQE/U38UATBRAhNgJcRk8mzsEijuTg5PKaN1C2HGFJ
 BDN61iuW38iU4y0iiS3ViXZ2Rng7fZp32d7dVhteU6D5W5KzVJ9cDaZZ2dD9uJsAH+
 1mJT8uXOzXu6I6eSAz+LJ7Bu3MNeG7KlRxG8Oe2hdjYnVDpAQ2sxIFmT4cmyL7zW7+
 ZwMCbypMty7ZA4bexFlbO7auoRQZhH37zCBClj0A5iubjW5cZB4cyan8cbaax8avXR
 Dc0AGMbINLysQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=j49IBEjU
Subject: Re: [Buildroot] [PATCH] package/mdio-tools: bump version to 1.3.0
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

Robert, All,

On 2023-07-25 18:16 +0200, Robert Marko spake thusly:
> Kernel 6.3 has split the C22 and C45 MDIO support and mdio-tools needed to
> be adapted to that.
> 
> So, now that new release with support for kernel 6.3 and later is available
> lets update to it.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mdio-tools/mdio-tools.hash | 2 +-
>  package/mdio-tools/mdio-tools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mdio-tools/mdio-tools.hash b/package/mdio-tools/mdio-tools.hash
> index 0111165f27..1a9d598923 100644
> --- a/package/mdio-tools/mdio-tools.hash
> +++ b/package/mdio-tools/mdio-tools.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  c5e17431c62392f6c1da1ba4fb0a6f5918521509a377af74485851f93ff2a106  mdio-tools-1.2.0.tar.gz
> +sha256  d2ab71d92173053af41d754e9c229e1ead768b9f8b7f4947b3b87b84c4c5e360  mdio-tools-1.3.0.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
> index c4be54142e..fb8ec39f35 100644
> --- a/package/mdio-tools/mdio-tools.mk
> +++ b/package/mdio-tools/mdio-tools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MDIO_TOOLS_VERSION = 1.2.0
> +MDIO_TOOLS_VERSION = 1.3.0
>  MDIO_TOOLS_SITE = https://github.com/wkz/mdio-tools/releases/download/$(MDIO_TOOLS_VERSION)
>  MDIO_TOOLS_LICENSE = GPL-2.0
>  MDIO_TOOLS_LICENSE_FILES = COPYING
> -- 
> 2.41.0
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
