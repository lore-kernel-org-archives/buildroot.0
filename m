Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA19C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 22:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4237781B36;
	Tue, 28 Dec 2021 22:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W9ona79pgcMf; Tue, 28 Dec 2021 22:00:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 951FE81BCB;
	Tue, 28 Dec 2021 22:00:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 807A91BF39D
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 22:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F4E7823CF
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 22:00:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gfUIG7kVuIwx for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 22:00:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A47A813AE
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 22:00:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:25ef:2aa8:94fa:832d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0FAB513F85F;
 Tue, 28 Dec 2021 23:00:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640728851;
 bh=jax69QMtCxBw+aDtXFlRba5958m6nNjWJw5vpx1e1WA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XNr9REXvRUhXV7CBXZuLiGWatay3+vxoekvmlPVM/HBMPKtA10l4Z+c4r6PBK17mL
 5ZsJKtsrPifirbWrqBtZzUkZvVR1jA2Wl5eG6GSUyzzh0p4Dz6lC/z/Wdj5XV1dQbA
 gLASfXG2XP+Mv0K/fDysy2rzjYy/8qTcdcgvApcQZQD98j2VntZROLZvt7jBQ3Lq76
 arEmJEKeA+4hloRgTOK6pkERBny7zxRGl5rzjlFrB840dFfu4Glk8L/J4CXitrJj9y
 jYmSVUCKl9BRplaYwElOyYyxoqTM8ndv7obEEwAqVDaP0KIA5++LS0bnhW+stOfsrQ
 sXI6azvujnc1w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 28 Dec 2021 23:00:46 +0100
Date: Tue, 28 Dec 2021 23:00:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211228220046.GE3390456@scaer>
References: <20211227220423.3121507-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211227220423.3121507-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/daq3: bump to version 3.0.5
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

On 2021-12-27 23:04 +0100, Fabrice Fontaine spake thusly:
> https://github.com/snort3/libdaq/releases/tag/v3.0.5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of two patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/daq3/daq3.hash | 2 +-
>  package/daq3/daq3.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/daq3/daq3.hash b/package/daq3/daq3.hash
> index e4cf4ebefe..a97f81833b 100644
> --- a/package/daq3/daq3.hash
> +++ b/package/daq3/daq3.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  a376c7625d1442ddb7e3c75954c910cc9d64440e2f8f345981aa5fa6999ea206  daq3-3.0.4.tar.gz
> +sha256  4281464c5502037669e69d314b628df863420f590c4999c5b567c8016cd1e658  daq3-3.0.5.tar.gz
>  
>  # Hash for license files:
>  sha256  64601289158eddad72cb4de72652f9e64dc886942c910b38ddee93ba13b0db26  COPYING
> diff --git a/package/daq3/daq3.mk b/package/daq3/daq3.mk
> index 1de7e53a79..ed97615e61 100644
> --- a/package/daq3/daq3.mk
> +++ b/package/daq3/daq3.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DAQ3_VERSION = 3.0.4
> +DAQ3_VERSION = 3.0.5
>  DAQ3_SITE = $(call github,snort3,libdaq,v$(DAQ3_VERSION))
>  DAQ3_LICENSE = GPL-2.0
>  DAQ3_LICENSE_FILES = COPYING LICENSE
> -- 
> 2.33.0
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
