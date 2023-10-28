Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB77FC4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 19:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BACA42076;
	Sat, 28 Oct 2023 19:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BACA42076
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dhrs_9_xk1Pv; Sat, 28 Oct 2023 19:31:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97A4A42077;
	Sat, 28 Oct 2023 19:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97A4A42077
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8371BF3C6
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11C5C6120F
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11C5C6120F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fqklNzYm1Ev5 for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 19:31:18 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1FDB611D5
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 19:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1FDB611D5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id CF4F42003EE;
 Sat, 28 Oct 2023 21:31:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Oct 2023 21:31:13 +0200
Date: Sat, 28 Oct 2023 21:31:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20231028193113.GE2582@scaer>
References: <20231027122551.1856719-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027122551.1856719-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698521475;
 bh=3i3v31rN6hqUMcgd0lpKzT7Co2y7P409roqm7C5sU+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t0tvSR3wUiw5xWbtUte8ZGLqGPu4wCcjmbrv1E8CkzyybbgOqv5FsQCdgsGhaZetb
 IE5NNNpb3dHCPPpx0kwvrBxL/ogc8CQ4AR+RsmfzX2Ly+kXIrQNLwwk0BcKhSS1ker
 kKORc2nlVW1MAJiBqCoK568EU5U7Wo/x/MfoKLq/gaIV1/ZHFL5LLP2zzSzkZlWdOQ
 a4Z3SpL6nKRVQ6DRzMlFTTR2MfPYw4K8ipijTlztS51jnmXIHDidkbMT8qY+mK5dCY
 YJE632QqNa1vUzfUKl8BVcaSgE/C/GIEazzdDUC2sLX2KoWc92C1laLYfKf9bYL7KE
 i5zsBYB+Ah4tg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t0tvSR3w
Subject: Re: [Buildroot] [PATCH 1/2] package/aufs: use HTTPS for
 git.code.sf.net
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

Petr, All,

On 2023-10-27 14:25 +0200, Peter Korsgaard spake thusly:
> git.code.sf.net is available over HTTPS, so use that for security and
> consistency with the other packages.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/aufs/aufs.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/aufs/aufs.mk b/package/aufs/aufs.mk
> index 4e95a350a0..d00e7a1a21 100644
> --- a/package/aufs/aufs.mk
> +++ b/package/aufs/aufs.mk
> @@ -9,7 +9,7 @@ AUFS_LICENSE = GPL-2.0
>  AUFS_LICENSE_FILES = COPYING
>  
>  ifeq ($(BR2_PACKAGE_AUFS_SERIES),3)
> -AUFS_SITE = http://git.code.sf.net/p/aufs/aufs3-standalone
> +AUFS_SITE = https://git.code.sf.net/p/aufs/aufs3-standalone
>  AUFS_SITE_METHOD = git
>  else ifeq ($(BR2_PACKAGE_AUFS_SERIES),4)
>  AUFS_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_VERSION))
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
