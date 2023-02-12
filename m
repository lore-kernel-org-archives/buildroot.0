Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3290DC05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 20:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE76381760;
	Sun, 12 Feb 2023 20:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE76381760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M0ZJ6HfSSwje; Sun, 12 Feb 2023 20:30:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29205813FC;
	Sun, 12 Feb 2023 20:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29205813FC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 997F91BF30E
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73B2A60AC2
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73B2A60AC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 44NftXbXUcQp for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 20:30:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66FAE60B44
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66FAE60B44
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 20:30:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AB0625FF67;
 Sun, 12 Feb 2023 21:30:29 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Feb 2023 21:30:29 +0100
Date: Sun, 12 Feb 2023 21:30:29 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230212203029.GR2796@scaer>
References: <20230212145312.1203134-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230212145312.1203134-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676233832;
 bh=MUcvoHA7Nf6f+dDk9kmRImNEQBWmIA9OXb5d3xfcRzY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VtnM1nI3HVz0+NaRhcLDOiUhLGdBwiddhqKTBzcgrAtuj2StBJUhdM8if7xxRF2o4
 s4dV/9PyoWEKYGtn1+dPBVX9FcRIupXATvsiAFIXlPsDTEx7qb9YrY6L1hangFzn7y
 YTqhurGazsuLfYxu+E9FcAuaOkYnddlV+OW3NnB8XvxogY/8/F6lgb8joD/BEtOhfU
 8zXrK7U28yjCqrDw3iURYic1hdBGQU8sN24UZrooeAwHshg564/NVXKmtNEQeLWbzS
 3l27z3rmQ9YPlR5gkxLYqveHlz4D31DXqC7GtyJWtOYkRRdXY9dZmJXaEVzpwSZ3Ea
 2ZbCDq0iuXgPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VtnM1nI3
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv3: bump to version 3.4.19
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-02-12 15:53 +0100, Fabrice Fontaine spake thusly:
> This bump will fix the following build failure with gcc >= 12:
> 
> /home/thomas/autobuild/instance-1/output-1/build/opencv3-3.4.17/modules/core/src/persistence_base64.cpp: In function 'bool base64::base64_valid(const uint8_t*, size_t, size_t)':
> /home/thomas/autobuild/instance-1/output-1/build/opencv3-3.4.17/modules/core/src/persistence_base64.cpp:167:31: error: comparing the result of pointer addition '(src + ((sizetype)off))' and NULL [-Werror=address]
>   167 |     if (src == 0 || src + off == 0)
>       |                     ~~~~~~~~~~^~~~
> cc1plus: some warnings being treated as errors
> 
> Update hash of LICENSE file (update in year:
> https://github.com/opencv/opencv/commit/f6fe5c07f61eb0bc934672200b2bfd453f2fc41d)
> 
> https://github.com/opencv/opencv/wiki/ChangeLog#version3419
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/cb9c120c15c8042e6919858d6885c1cc4d996c0c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/opencv3/opencv3.hash | 4 ++--
>  package/opencv3/opencv3.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/opencv3/opencv3.hash b/package/opencv3/opencv3.hash
> index 30308188aa..3d6fd2ed8a 100644
> --- a/package/opencv3/opencv3.hash
> +++ b/package/opencv3/opencv3.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  1353eec67849aadb20df71d8bae18b83708e18fc5da080fe5efeabb1e99b2ee8  opencv3-3.4.17.tar.gz
> -sha256  9076d3d934839a2f8e7bfe549abda6faea4751f1edd6e9460ff703559890ad5f  LICENSE
> +sha256  9b913e74299ce4416a5c94000da577c592bf670fd53bad16220eb115a0821529  opencv3-3.4.19.tar.gz
> +sha256  c1fed9cd2f557ba23a1b37a21e2c90629d1a60bdb61e92d0e79369bb6fca3390  LICENSE
> diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
> index 8e4c90786e..29fb246e65 100644
> --- a/package/opencv3/opencv3.mk
> +++ b/package/opencv3/opencv3.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENCV3_VERSION = 3.4.17
> +OPENCV3_VERSION = 3.4.19
>  OPENCV3_SITE = $(call github,opencv,opencv,$(OPENCV3_VERSION))
>  OPENCV3_INSTALL_STAGING = YES
>  OPENCV3_LICENSE = BSD-3-Clause
> -- 
> 2.39.0
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
