Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC391C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 562B08137D;
	Sat,  8 Jan 2022 22:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M41rcGEmF6W8; Sat,  8 Jan 2022 22:13:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D88681373;
	Sat,  8 Jan 2022 22:13:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C394F1BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B040640185
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:13:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cw09T7gBIeQV for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:13:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9555A400C1
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:13:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4919:b1be:c8bf:308d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A6A6A13F86E;
 Sat,  8 Jan 2022 23:13:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641679997;
 bh=oleA95iFi1Qgrd2hcm+J1M/FLXAbo5ZaDoga9+j55Bo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u/Hk7B5TZASt0elT+xJFIM5P3QF/FNSIAa8g4w9BhJYQ4+mAI6nYGnyVhZ9U/VOdq
 PHVzI0k3p/fTSF2TBf9ySSuWzRt85/ZOHSeHB6bCBZ8ik9WfnkhJqGd9d9rg/EWO4I
 UcEVauDBA+jf19eTBbqUyH1NcmHjOaX52zoTB/okAKNaHvBVVX/PQKOTDjg5XyrXSi
 JdPhET1+TErXaaEj2qXUYg7hLHmVoffHw1h9zORBWXlm/17WwNI/pCmo2BpPwXo7Ki
 YGF1ob6uzI1V7kPViHNUjFpimLSwYjZmlXdmC4tKaOcfptLd5RfADdpGPbUwPYIPBL
 Bnv271YmvdAUA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 08 Jan 2022 23:13:14 +0100
Date: Sat, 8 Jan 2022 23:13:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220108221314.GH1881783@scaer>
References: <20220108214952.3493782-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220108214952.3493782-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/btrfs-progs: add zstd support
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

On 2022-01-08 22:49 +0100, Fabrice Fontaine spake thusly:
> zstd is supported since version 4.13.1 and
> https://github.com/kdave/btrfs-progs/commit/717a8b1e5d1ba69154ef84b35be75c9cf7730e1d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/btrfs-progs/btrfs-progs.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
> index 4c26cf0df5..b010a0e0be 100644
> --- a/package/btrfs-progs/btrfs-progs.mk
> +++ b/package/btrfs-progs/btrfs-progs.mk
> @@ -8,7 +8,7 @@ BTRFS_PROGS_VERSION = 5.15.1
>  BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
>  BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
>  BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
> -BTRFS_PROGS_CONF_OPTS = --disable-backtrace --disable-zstd --disable-python
> +BTRFS_PROGS_CONF_OPTS = --disable-backtrace --disable-python
>  BTRFS_PROGS_LICENSE = GPL-2.0, LGPL-2.1+ (libbtrfsutil)
>  BTRFS_PROGS_LICENSE_FILES = COPYING libbtrfsutil/COPYING
>  BTRFS_PROGS_INSTALL_STAGING = YES
> @@ -30,6 +30,13 @@ else
>  BTRFS_PROGS_CONF_OPTS += --disable-convert
>  endif
>  
> +ifeq ($(BR2_PACKAGE_ZSTD),y)
> +BTRFS_PROGS_CONF_OPTS += --enable-zstd
> +BTRFS_PROGS_DEPENDENCIES += zstd
> +else
> +BTRFS_PROGS_CONF_OPTS += --disable-zstd
> +endif
> +
>  ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
>  BTRFS_PROGS_CONF_OPTS += --enable-libudev
>  BTRFS_PROGS_DEPENDENCIES += udev
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
