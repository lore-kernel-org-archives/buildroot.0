Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34084C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 17:19:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDFFB6113A
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 17:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDFFB6113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C763D60B4E;
	Sun,  3 Oct 2021 17:19:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gVWZJpcnOco9; Sun,  3 Oct 2021 17:19:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CF3360B10;
	Sun,  3 Oct 2021 17:19:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88DBD1BF31E
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 17:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85020404CE
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 17:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rbtcg7JaAoTD for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 17:19:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFA28404AE
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 17:19:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d3d:918b:43fc:aadd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0324813F8AE;
 Sun,  3 Oct 2021 19:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633281542;
 bh=zIugkQQLCkYMtym1z+9xERBk0C5R8Alk8vtmXHurqzc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uiudjN6zsObJlf3pfWx5xFOVsEOI6XsA+eXzTeIHKBEoDIXvLm5LER7PyDLLHyDbw
 3B8/FjEdjbR0Xfkaf7MMi2Kv9s9ADbjGDNnh/LQVMQKT2gHBH7Sgjn+Pjb8v28DxIR
 UyzlzuZeaGB1N4qa7n/3mhHzVGlwN489WMASbduvLe+uQa3wAl12pcdBAUZ5pFfny4
 1EaP1r7yZNBGQsvsM8EhzwXsdeHfQk7EzsBhygw2+N5/P9SqhQhpm/xc1rqyhXbqnX
 ats1SdSBZOtfuJkQvys0/A3f1uA5hi8L55DIb7L5GZ9u4Ld3DR5fZGh7r6AH/BI9Cl
 RLkhtj5Wm+0HQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 19:18:57 +0200
Date: Sun, 3 Oct 2021 19:18:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211003171857.GM1504958@scaer>
References: <20210928195322.1520639-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210928195322.1520639-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/kodi-audiodecoder-modplug: bump
 version to 19.0.0-Matrix
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

On 2021-09-28 21:53 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Series of two patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash    | 2 +-
>  package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
> index fcb5884807..f3736c192c 100644
> --- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
> +++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  629a9f83a2663ab8f2ea1ae747782d1ce6df870f42d6d9b84c858bc9b607ae9c  kodi-audiodecoder-modplug-3.0.0-Matrix.tar.gz
> +sha256  ff3cb9816a30530d522f6a9a23eb49eb5301fb7880f402de6fc1dea31d3469f6  kodi-audiodecoder-modplug-19.0.0-Matrix.tar.gz
>  sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
> index e4bee48f98..ce5619e8c7 100644
> --- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
> +++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_AUDIODECODER_MODPLUG_VERSION = 3.0.0-Matrix
> +KODI_AUDIODECODER_MODPLUG_VERSION = 19.0.0-Matrix
>  KODI_AUDIODECODER_MODPLUG_SITE = $(call github,xbmc,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
>  KODI_AUDIODECODER_MODPLUG_LICENSE = GPL-2.0+
>  KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = LICENSE.md
> -- 
> 2.30.2
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
