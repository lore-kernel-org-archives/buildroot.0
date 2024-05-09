Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A7CC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6723661286;
	Thu,  9 May 2024 20:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sukUFF9IB-QN; Thu,  9 May 2024 20:58:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FFA161307
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FFA161307;
	Thu,  9 May 2024 20:58:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6672C1BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6038584011
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92jKLH9siqoT for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:58:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 358E48400F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 358E48400F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 358E48400F
 for <buildroot@busybox.net>; Thu,  9 May 2024 20:58:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6A7EF13F86A;
 Thu,  9 May 2024 22:58:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 09 May 2024 22:58:07 +0200
Date: Thu, 9 May 2024 22:58:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <Zj0432-NlSv5LYaa@landeda>
References: <be7460b2010a5732e757b9cbc60b94d28b580273.1712568188.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be7460b2010a5732e757b9cbc60b94d28b580273.1712568188.git.baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715288293;
 bh=OPe92CQT/ykeD5CBc/nU4Ef9OuUFZy/dO6ozkvYUW/c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j/QmPa2QVMhNkDRWzqjzDIzHf0zwMDrepyFcB7EOwHzxwGst9uX0rrYL9XTU7zLUV
 qIjOXKVYKh357xkEs66Y98wsJ6p25wzmzAwF6oPzG5KHC/yTIVpOoYghFkotWd7zm+
 tFHmZjVizqtQHvFrs8/ilNDkA/ZInCT9KEUMBy2pNTXUWP5bycAVBMEwf7GSqyOOZN
 oJCx8zGIgT6Ja7ltTYIAkdkW3ErgY6O0POGHCk2QJ5Akpwy+vIJ+9WOjpNHGtKcYl/
 oloMtXzqBispJytmRVBW7o7saAn/70f+2MnBYbMQD/rHXckIvdpOuT43BZ8r3x4AgB
 VMlgMiDB5xTLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=j/QmPa2Q
Subject: Re: [Buildroot] [PATCH] linux: add option to include git submodules
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Baruch, All,

On 2024-04-08 12:23 +0300, Baruch Siach via buildroot spake thusly:
> Some kernel users find it useful to store submodules in the kernel
> source tree for cross source trees definitions. Add option to download
> these submodules.

This is a litle odd, and Thomas and I were not very fan of such a patch,
but we can see why it might be needed...

> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  linux/Config.in | 6 ++++++
>  linux/linux.mk  | 3 +++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index d520dc379f0e..3f5b088a193f 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -126,6 +126,12 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION
>  
>  endif
>  
> +config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
> +	bool "Download also git submodules"
> +	depends on BR2_LINUX_KERNEL_CUSTOM_GIT
> +	help
> +	  Include git submodules in the kernel source tree.
> +
>  config BR2_LINUX_KERNEL_VERSION
>  	string
>  	default "6.6.22" if BR2_LINUX_KERNEL_LATEST_VERSION
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 4e12b36c1fd4..16d9f1947089 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -24,6 +24,9 @@ LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
>  else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
>  LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
>  LINUX_SITE_METHOD = git
> +ifeq ($(BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES),y)
> +LINUX_GIT_SUBMODULES = YES
> +endif
>  else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_HG),y)
>  LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
>  LINUX_SITE_METHOD = hg
> -- 
> 2.43.0
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
