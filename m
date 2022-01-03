Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBDEC433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 09:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 268934030F;
	Mon,  3 Jan 2022 09:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qky7aPmvRLrk; Mon,  3 Jan 2022 09:11:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67783402C3;
	Mon,  3 Jan 2022 09:11:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 114C21BF360
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 09:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3D7D8131F
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 09:07:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IfTBEjeH_5xA for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 09:07:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7C4B812F3
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 09:07:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c1c4:dbff:d80e:9740])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 883FA20039C;
 Mon,  3 Jan 2022 10:07:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641200856;
 bh=gWdB5Jch626qzDgju3TV8GqzHws9IVV9UMXlBQ0h0xo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VmIiKgXxGW0DclgWRMpwiMO9zeCA9uD+KO8xCp/uWw+cTcW3a16fGjqNp7LHsTrB8
 QqwqL9KhgeC5DmOPXRQP1MuLry9RFGgO75Dq79SXzST3ok5jIGdGnKgZty7EHIVM7O
 mx8Rzs+zumuGKqSmSFJfVbdWdOt/LzI2OVN6xJj05SCF+nHQvRq0H3AjaOiSArBA3C
 iB6ssezGRZlZf2xyihyvphxM7QCg2ZoBwm/XT10NHuLjBkAO8yR7TpyXcquE/5slnF
 CA9rW0srysPyk7ZYEDAG6RncdhQoI/8Lx3/ajHQTKuGmd8y22MmYzc47qP61mUXj6S
 mJJgoMQfLWycw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jan 2022 10:07:32 +0100
Date: Mon, 3 Jan 2022 10:07:32 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220103090732.GE69135@scaer>
References: <20220102191025.259154-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220102191025.259154-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 01/19] package/kodi-audiodecoder-modplug:
 bump version to 19.0.2-Matrix
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

On 2022-01-02 20:10 +0100, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Whole series of 19 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash    | 2 +-
>  package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
> index 7bab017241..e2bfe09928 100644
> --- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
> +++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  4c422cacf456ab9eda5e2836d2789c3756bfbae03265a01647dd8f935261d9ec  kodi-audiodecoder-modplug-19.0.1-Matrix.tar.gz
> +sha256  6e1b1910e799ea8c5ab11428084feb8f6a0a9b1b0d4b5760033545fe765a59e9  kodi-audiodecoder-modplug-19.0.2-Matrix.tar.gz
>  sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
> index 9b2cf98dbc..f5736e7db7 100644
> --- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
> +++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_AUDIODECODER_MODPLUG_VERSION = 19.0.1-Matrix
> +KODI_AUDIODECODER_MODPLUG_VERSION = 19.0.2-Matrix
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
