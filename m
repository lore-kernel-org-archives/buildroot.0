Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBF6ECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 15:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F80A408A8;
	Sun, 28 Aug 2022 15:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F80A408A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7g--mp4AsRMI; Sun, 28 Aug 2022 15:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F32F40600;
	Sun, 28 Aug 2022 15:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F32F40600
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C685B1BF97C
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 15:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0F0360E17
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 15:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0F0360E17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-cFlcIjuhfk for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 15:44:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86B3360E06
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86B3360E06
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 15:44:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c66a:3d95:4f85:baec])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 31D47780501;
 Sun, 28 Aug 2022 17:44:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Aug 2022 17:44:32 +0200
Date: Sun, 28 Aug 2022 17:44:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Chris Dimich <chris.dimich@boundarydevices.com>
Message-ID: <20220828154432.GF2569@scaer>
References: <20220824192604.2549356-8-chris.dimich@boundarydevices.com>
 <20220824192604.2549356-10-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220824192604.2549356-10-chris.dimich@boundarydevices.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661701481;
 bh=V0osRt7+iOKqofQSyNEekvz9O2TzLZ8gYyv57wPkD80=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b3+kuiACxDFfFGKVdIC/P1usCmxXRtXmf7Mm9hPj24TMwsO5UoypDIkR+dNDsG1F6
 bpynk1TUsq+03FSreLBvGgQEUzyxmFRDic6yCKhZhMeM5I5LLoPX4ji8ru/jgOie0Y
 ZkG0gFcrlCuosXVse/dKM9RLxW6RMeOeJ2ZLzlEPMeeK9vjFzd0YUsw2GQhkuqRTCB
 4ZwvvEJ6hdE2mjhWkviLfFJFhPL+1NtPxH9j5uXPXnkxnD8n+5Xa/A9boFZsnYKG9o
 39qnw/weXVZQeks1OZn94wdjH7HGcUJ5foolU+taMVoRLYM0uRheIdVZA1tXxJyQzr
 aHrSlwobGmGRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b3+kuiAC
Subject: Re: [Buildroot] [PATCH 3/7]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version 6.4.3.p4.2
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Chris, All,

On 2022-08-24 12:26 -0700, Chris Dimich spake thusly:
> To match NXP 5.15.32-2.0.0 release.
> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> ---
>  .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash    | 2 +-
>  .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
> index ee105ef82c..ccb28bc4f6 100644
> --- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
> +++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
> @@ -1,3 +1,3 @@
>  # locally computed
> -sha256  257c6cd8b01cfb6543827cbeb78409e6a2ad4ae321891751dcea1abc47d89379  kernel-module-imx-gpu-viv-ae0f3be0b7240f11cca191a3e2bdd4a445ee46e5.tar.gz
> +sha256  b816ab94b1d248cfc5fe5f6381422346c273d01760bb324303e0298e10bd46e2  kernel-module-imx-gpu-viv-82c6cb6c607424403b8d76805bb17e7be74292f6.tar.gz
>  sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
> diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
> index 10505fdf17..f94890a438 100644
> --- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
> +++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KERNEL_MODULE_IMX_GPU_VIV_VERSION = ae0f3be0b7240f11cca191a3e2bdd4a445ee46e5
> +KERNEL_MODULE_IMX_GPU_VIV_VERSION = 82c6cb6c607424403b8d76805bb17e7be74292f6 #6.4.3.p4.2

So not add a comment at the end of the line; this is known to cause
issues in some situations, and we previously had to remove all of them
in the past. Instead, just add such a comment just above the assignment;

    # Equivalent to 6.4.3.p4.2
    KERNEL_MODULE_IMX_GPU_VIV_VERSION = 82c6cb6c607424403b8d76805bb17e7be74292f6

I also have some relatively minor concerns with this package (not
specifically due to your change, but prompted by it):

The git repository does have tags with the corresponding versions, e.g.:

    https://github.com/Freescale/kernel-module-imx-gpu-viv/releases/tag/upstream%2F6.4.3.p4.2

which is tag "upstream/6.4.3.p4.2".

However, here's the corresponding graphlog:

    *   82c6cb6 (HEAD -> master, origin/master, origin/HEAD) Merge tag 'upstream/6.4.3.p4.2'
    |\
    | * c897a6c (tag: upstream/6.4.3.p4.2, origin/upstream) Import 6.4.3.p4.2 original version
    * | a482c32 Merge tag 'upstream/6.4.3.p4.0'
    |\|
    | * 9c2d676 (tag: upstream/6.4.3.p4.0) Import 6.4.3.p4.0 original version
    * | 5c7b884 Merge tag 'upstream/6.4.3.p2.4'
    |\|
    | * 410ce59 (tag: upstream/6.4.3.p2.4) Import 6.4.3.p2.4 original version
    * | 5115a2b Merge tag 'upstream/6.4.3.p2.2'
    |\|
    | * e879a17 (tag: upstream/6.4.3.p2.2) Import 6.4.3.p2.2 original version
    * | ae0f3be gc_hal_kernel_platform_imx.config: remove build time/user * macros
    * | 20595cd Merge tag 'upstream/6.4.3.p2.0'
    |\|
    | * 8f1bf96 (tag: upstream/6.4.3.p2.0) Import 6.4.3.p2.0 original version
    ...

So, basically, we are using the commits on the master branch, but all
that differs from the corresponding tag is (by running:  git diff -p
c897a6c..82c6cb6):

  - there is an added 'fscl' (or variation thereof, like '+fscl') in 4
    locations, all appended to the version string;

  - there are two macros that are removed (specifically by ae0f3be).

So, can't we use the tag instead of a sha1, and carry the patch from
ae0f3be localy?

Otherwise, Chris and Gary: could you add tags on the master branch,
maybe?

Thoughts?

Regards,
Yann E. MORIN.

>  KERNEL_MODULE_IMX_GPU_VIV_SITE = \
>  	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
>  KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPL-2.0
> -- 
> 2.34.1
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
