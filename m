Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BC0C433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 15:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D64B881765;
	Sat, 25 Dec 2021 15:02:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5hCTPYjJDeGF; Sat, 25 Dec 2021 15:02:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20E98814A0;
	Sat, 25 Dec 2021 15:02:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B430A1BF239
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 15:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B09766060A
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 15:02:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YhVFIu-4A0Lw for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 15:02:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82E1D605A9
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 15:02:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b527:fd15:94c1:e7d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9BD0913F846;
 Sat, 25 Dec 2021 16:02:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640444560;
 bh=Q8h88aee/QYV/kZWfUBhjKCn3KVbpjjL/BU4LzFAoVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nmoBfv2yua1D3M3b5O+TQBN83M9Q9bWQxqTRGEnbiJoMmrgIYkTECvkZpSUby4aoB
 WFtHbbQbJ632OhUZRPXvB8KlP4HO2QupbkY2H9vS/Do0N7Px0nQe64szvujIjFkiXV
 dkYkuXR5jiShZN72akA/+sQHWC9owqe/4koAwrJidReU/1B6s2SMZ4pzgIdFCY0aGe
 YQcqIM7kCkCRSTT1z5a7rIMwzXDAP4ypobFp5z1KCQBsME8jwfkA9bt6ySGo+UntV2
 DfDtx6syj8sz8JrWgW6E0Z5kQMQihWPW3rSPvxVYqY1T943DXcz+IaB8+9GOFD0aJ/
 K7lU1AKN096PA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Dec 2021 16:02:36 +0100
Date: Sat, 25 Dec 2021 16:02:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211225150236.GP2603@scaer>
References: <20211225114438.8956-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211225114438.8956-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/3] package/kodi-audiodecoder-timidity:
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

On 2021-12-25 12:44 +0100, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Series of 3 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash  | 2 +-
>  .../kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
> index 0120c1ff3b..b1131ff43d 100644
> --- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
> +++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  c33bcf24a6a9ca8c594c3d587c0efa5f1469c9402b3a934aaa5d21f1cbf41e9a  kodi-audiodecoder-timidity-19.0.1-Matrix.tar.gz
> +sha256  2d9aa6f00315d227a39cb67089c64671987fd9167766f37c28a91168cb8e230e  kodi-audiodecoder-timidity-19.0.2-Matrix.tar.gz
>  sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
> index 824015a93f..d10fd161cb 100644
> --- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
> +++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_AUDIODECODER_TIMIDITY_VERSION = 19.0.1-Matrix
> +KODI_AUDIODECODER_TIMIDITY_VERSION = 19.0.2-Matrix
>  KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,xbmc,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
>  KODI_AUDIODECODER_TIMIDITY_LICENSE = GPL-2.0+
>  KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = LICENSE.md
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
