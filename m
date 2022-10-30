Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E16DC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D49C60AF1;
	Sun, 30 Oct 2022 16:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D49C60AF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ClXB-90ix8-0; Sun, 30 Oct 2022 16:30:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3270460A90;
	Sun, 30 Oct 2022 16:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3270460A90
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06B8C1BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D635B60A8C
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D635B60A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E_GEw9SQVfDK for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:29:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC542607FE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC542607FE
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:29:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 34DD413F88A;
 Sun, 30 Oct 2022 17:29:22 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 17:29:21 +0100
Date: Sun, 30 Oct 2022 17:29:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030162921.GS1058960@scaer>
References: <20221029093947.124529-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221029093947.124529-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667147364;
 bh=3Kn47ZnPWKXwfDvgCXQJxWSbk2fC5nySWCXjmk3DI/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S2b3NDQzQ+oDJGot38R4fWF+ltx8hrSuZALwbLFRccSHaJ7YwhHcUwC5P87bvdRb6
 51TDLmSz3ZZt10fbAvSACpmCQ6xSpOfa3I02209iqYe/Y8RsVZEQsmo1sG0h63B3Qh
 avXtDrwcElNadSnn0rlqKqguXwhmNLWWzd0nHVu4rmgUdXab2AxSdirda944XO0ePk
 8XYg8RsDTxvP9w+08yswA1w19jB/AgCYNrLZVC09Xd+5Q9UtbqW9x0kD5wlsWCm9us
 sYmwbrpj1COA8auTu2DkEW1uUs6QVg7zBLOBsxVDX+rDSMHl0yMx6AlCtj0YfbmiWo
 KLB9Avi3VOseg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S2b3NDQz
Subject: Re: [Buildroot] [PATCH 1/1] package/mtr: bump to version 0.95
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

Fabrice, All,

On 2022-10-29 11:39 +0200, Fabrice Fontaine spake thusly:
> https://github.com/traviscross/mtr/blob/v0.95/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mtr/mtr.hash | 2 +-
>  package/mtr/mtr.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mtr/mtr.hash b/package/mtr/mtr.hash
> index d6062ef08f..399799f49e 100644
> --- a/package/mtr/mtr.hash
> +++ b/package/mtr/mtr.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  ea036fdd45da488c241603f6ea59a06bbcfe6c26177ebd34fff54336a44494b8  mtr-0.94.tar.gz
> +sha256  12490fb660ba5fb34df8c06a0f62b4f9cbd11a584fc3f6eceda0a99124e8596f  mtr-0.95.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
> index 07c58a1e93..d3e3b1a97a 100644
> --- a/package/mtr/mtr.mk
> +++ b/package/mtr/mtr.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MTR_VERSION = 0.94
> +MTR_VERSION = 0.95
>  MTR_SITE = $(call github,traviscross,mtr,v$(MTR_VERSION))
>  MTR_AUTORECONF = YES
>  MTR_DEPENDENCIES = \
> -- 
> 2.35.1
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
