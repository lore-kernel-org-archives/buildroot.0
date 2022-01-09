Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F00C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED91D40877;
	Sun,  9 Jan 2022 20:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Rii5lqdofkY; Sun,  9 Jan 2022 20:39:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AE6C403CC;
	Sun,  9 Jan 2022 20:39:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31A471BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2034B60BB5
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9yzqClL8dM2i for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:39:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4707360B12
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:39:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:884e:4989:9dec:67ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 006535FF96;
 Sun,  9 Jan 2022 21:39:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641760760;
 bh=UseHAi+rKBB5OPWhPFams2kB8TNhJhMmTIm3aVO7jqU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a6q33dxNrBR9u20+Y06Wgva4KbBqL0I88zNIWfjRnMgSvr/XXZ2Jk4gXXc+8sGXBr
 pTrF5WCNZB/oPDoHI76UOD8vKbP74NVJ48QSTMSUVilIs/aqiSawaD5yuea93Kgoz0
 jfCw3pXuxCYM5KPTBPBo6I0cx8/R3A+OxILJ1wp1q85ZtUw788M9h6Tlh/3GQ53sM6
 D14sWLHt94sP+KUrRXXpcMIrEW6Q2Xlwp1ymiJ/s7Zi3+yy8EWAF/U9kCAFwFFGp8Z
 JlXIsehdEId4D1U5NHsB2OkIz/fBRGwXbrP+Ov4uHSMFwq/XGwz4OlD8EOKYgzX8r6
 Sc5p/K/OtpTqA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jan 2022 21:39:16 +0100
Date: Sun, 9 Jan 2022 21:39:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <20220109203916.GG1477939@scaer>
References: <20220109140421.27820-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220109140421.27820-1-yegorslists@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/avrdude: bump to version 6.4
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yegor, All,

On 2022-01-09 15:04 +0100, yegorslists--- via buildroot spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> The project moved to GitHub, hence change the download location.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/avrdude/avrdude.hash |  4 ++--
>  package/avrdude/avrdude.mk   | 11 +++++------
>  2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
> index ec43355451..1c7758afcd 100644
> --- a/package/avrdude/avrdude.hash
> +++ b/package/avrdude/avrdude.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  2a09913450c6457c3fe8d43d5141de579d4e57d67e593e7399a4cd3768cc60f9  avrdude-r1450-br2.tar.gz
> -sha256  201babc7da198873304a77a30dbfc7ca449c9bba52df2dffa4cca0009dbdfcb2  avrdude/COPYING
> +sha256  bbe2cf09163b3561ea28e9d48c2a588838f7adcd7858e34ced9c886feacb5be6  avrdude-v6.4.tar.gz
> +sha256  201babc7da198873304a77a30dbfc7ca449c9bba52df2dffa4cca0009dbdfcb2  COPYING
> diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
> index ae623a7929..5bbbc4e8c2 100644
> --- a/package/avrdude/avrdude.mk
> +++ b/package/avrdude/avrdude.mk
> @@ -4,13 +4,12 @@
>  #
>  ################################################################################
>  
> -AVRDUDE_VERSION = r1450
> -AVRDUDE_SITE_METHOD = svn
> -AVRDUDE_SITE = http://svn.savannah.nongnu.org/svn/avrdude/trunk
> +AVRDUDE_VERSION = v6.4
> +AVRDUDE_SITE = $(call github,avrdudes,avrdude,$(AVRDUDE_VERSION))
>  AVRDUDE_LICENSE = GPL-2.0+
> -AVRDUDE_LICENSE_FILES = avrdude/COPYING
> -AVRDUDE_SUBDIR = avrdude
> -# Sources coming from svn, without generated configure and Makefile.in
> +AVRDUDE_LICENSE_FILES = COPYING
> +
> +# Sources coming from git, without generated configure and Makefile.in
>  # files.
>  AVRDUDE_AUTORECONF = YES
>  AVRDUDE_CONF_OPTS = --enable-linuxgpio
> -- 
> 2.17.0
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
