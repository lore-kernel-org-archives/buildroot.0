Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F5FC77B7D
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 08:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28493428B1;
	Sun, 14 May 2023 08:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28493428B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lRqNd5V05PXx; Sun, 14 May 2023 08:16:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E341428AE;
	Sun, 14 May 2023 08:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E341428AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 735541BF5A6
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 08:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57C43428AE
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 08:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57C43428AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ZBTOzQ3EF48 for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 08:16:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CBCE428A5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CBCE428A5
 for <buildroot@buildroot.org>; Sun, 14 May 2023 08:16:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5F347B00572;
 Sun, 14 May 2023 10:16:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 May 2023 10:16:42 +0200
Date: Sun, 14 May 2023 10:16:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230514081642.GR2582048@scaer>
References: <20230511200257.607495-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230511200257.607495-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684052204;
 bh=VFWdtzQgKEDSp7aUDTJalQBn/ixHO3BBb/gaLhnoQv0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fhk5F73IwXsot5dOLfJyJ5EZu8dQZAUIJaYBCgWq+E5/LIxADj7qTvAMDn9zxEKPs
 zK6j33TgwoDwSG5yQqTUGO6k+ABRbEBmx+RJW3Jme0ZKUKjmBphBogtRVGHNYgOWdC
 gpHxUF7QySiRxvqPVCYVYvDs1+5mfhrDxNkOgTMVG2sktGtKKWeDaEfn5jBu2uM4cc
 +jpmjsTJH8pd7QiqC7EHgTB9Wj5jyYv4WFk9+LYFIUwW4cPWatouxizGYqO9ltUkzb
 Jdvmbopgp2s7bveB+NVkufec2/ubFN4yFWf5G63sJsYjEmAQ/1JlMEnaSFpEqAeCQr
 b2v+C1yZuclpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fhk5F73I
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump to version 2.6.3
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

Giulio, All,

On 2023-05-11 22:02 +0200, Giulio Benetti spake thusly:
> Drop local patches since they have been upstreamed but add a new local
> patch already upstreamed that checks for libevent and sqlite since with the
> adding of reexport they became mandatory. This is because it's not possible
> to disable reexport.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
[--SNIP--]
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index 1a4a99f566..2f2e200bb5 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -4,12 +4,12 @@
>  #
>  ################################################################################
>  
> -NFS_UTILS_VERSION = 2.6.2
> +NFS_UTILS_VERSION = 2.6.3

This bump causes build failures for the host variant:
    http://autobuild.buildroot.org/results/5e1ac97e4023f902dffa066c895aa6f6005d541c/

because...

>  NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
>  NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
>  NFS_UTILS_LICENSE = GPL-2.0+
>  NFS_UTILS_LICENSE_FILES = COPYING
> -NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libtirpc util-linux
> +NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libevent libtirpc sqlite util-linux

... libevent should also be added to the host variant dependencies (as
host-libevent, of course).

Care to look into that, please?

(Note: our reference docker iamge does not have libevent, so maybe this
is a good idea to test in there?)

Regards,
Yann E. MORIN.

>  NFS_UTILS_CPE_ID_VENDOR = linux-nfs
>  NFS_UTILS_AUTORECONF = YES
>  
> @@ -47,7 +47,7 @@ NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_NFSD) += usr/sbin/exportfs \
>  
>  ifeq ($(BR2_PACKAGE_NFS_UTILS_NFSV4),y)
>  NFS_UTILS_CONF_OPTS += --enable-nfsv4 --enable-nfsv41
> -NFS_UTILS_DEPENDENCIES += keyutils libevent lvm2 sqlite
> +NFS_UTILS_DEPENDENCIES += keyutils lvm2
>  else
>  NFS_UTILS_CONF_OPTS += --disable-nfsv4 --disable-nfsv41
>  endif
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
