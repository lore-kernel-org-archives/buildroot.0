Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43230C636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 15:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CB1141684;
	Sun,  5 Feb 2023 15:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CB1141684
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qetYw0vR99uU; Sun,  5 Feb 2023 15:21:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7493A4167A;
	Sun,  5 Feb 2023 15:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7493A4167A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 942DD1BF59E
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 15:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F17E40135
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 15:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F17E40135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jo_H-y4k8Flr for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 15:21:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 376514010D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 376514010D
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 15:21:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.201])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0A82413F87F;
 Sun,  5 Feb 2023 16:21:08 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Feb 2023 16:21:08 +0100
Date: Sun, 5 Feb 2023 16:21:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230205152108.GR2960@scaer>
References: <20230202192526.30357-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230202192526.30357-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675610471;
 bh=Apx0UpxkIz1nQMICJzzgAT5T0Flq2gnFZ14a1vmTAdE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z0NB31y91dkofoh3TuhH2TmwezCzDCKprkxV16RxwiMuuk5EI0y7PHJPitfDgL5UZ
 d19teY0gzIoQw8b0mLpFcExx/9LTd3J8ZEMUFNRfMpn32OmMZFuRlR2iqjBR+tAEv9
 3Eksw6cPHVQ/YCvkQ3J/Q/eJjOdTLfXAVd3GKp/5Fl9FuTVWcj3xXMPjWdndrE62DM
 IVC5C4d9iGmVAYccL63JIO6VK0zEmu7Hb25a4u/ip7edIMXt/Siq1c2dXIUXV8MHn7
 tdMgB3v60Lbq+J5zabpgOti0TsTyKr9LbNZzW9ToR+RAuL3GJK9UheNMHCXA0S7Eg2
 NYMY2DGHzJnnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z0NB31y9
Subject: Re: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.19.0
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

On 2023-02-02 20:25 +0100, Bernd Kuhls spake thusly:
> Changelog: https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/xmrig/xmrig.hash | 2 +-
>  package/xmrig/xmrig.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
> index 3c50faf23f..781e089de8 100644
> --- a/package/xmrig/xmrig.hash
> +++ b/package/xmrig/xmrig.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  f97fe20248e0eb452f77e9b69f2fb1510b852152b3af4f9a8b20680c854888d1  xmrig-6.18.1.tar.gz
> +sha256  772f947058e5b89ca9bf34128487def47796870b547439a9b0524ddd1899420c  xmrig-6.19.0.tar.gz
>  sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
> diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
> index ca5bcecfbe..f345ba9cf9 100644
> --- a/package/xmrig/xmrig.mk
> +++ b/package/xmrig/xmrig.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XMRIG_VERSION = 6.18.1
> +XMRIG_VERSION = 6.19.0
>  XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
>  XMRIG_LICENSE = GPL-3.0+
>  XMRIG_LICENSE_FILES = LICENSE
> -- 
> 2.39.1
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
