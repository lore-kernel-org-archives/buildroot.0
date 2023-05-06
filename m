Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34748C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 16:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD95A42047;
	Sat,  6 May 2023 16:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD95A42047
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vkwmzVo1oK1B; Sat,  6 May 2023 16:13:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B4CC427FD;
	Sat,  6 May 2023 16:13:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B4CC427FD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06A891BF36A
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E09DB401CC
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E09DB401CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2rPiQpp7SbFF for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 16:10:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7D7D401B7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7D7D401B7
 for <buildroot@buildroot.org>; Sat,  6 May 2023 16:10:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3CEF6B0054E;
 Sat,  6 May 2023 18:10:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 18:10:51 +0200
Date: Sat, 6 May 2023 18:10:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230506161051.GR252090@scaer>
References: <20230504070815.3390348-1-christian@aperture.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504070815.3390348-1-christian@aperture.us>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683389454;
 bh=7Fos1zjpxlCwzmRdXTW0j9Equqg9weXZD3BL/OvEKnM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DoqFabbHtzWijlKoiBWGN0SsAvh+xebZvDd0++sIyo25FUmbX/bj8zo9AVvUJlZeh
 6bmlfWN/whqrwchWAZBtlGY2EWt9o7M98vM5ycqi8KBydMcKew2mWCQ8rdPbeiQ3XJ
 HszEUy3Wc2MVZReK+4egDtm7YxQ1qpo8u4ZZZraCKE4f2OKqcsMjSH5C4TMJXoT26l
 s9EHMqYO8HgdRutwwanlsb3qjHxruWsMcVoBr5dDPwO+pYcsMhZ/uv8FNgWKbz/1oV
 PtdbRk0eJuRilE69RRh30JUosbToTH8hnZG8b5441BvIW1zxlXtP78zLCo1n9ZTTU4
 ev45EHVY/RCBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DoqFabbH
Subject: Re: [Buildroot] [PATCH 1/1] package/fuse-overlayfs: bump version to
 1.11
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2023-05-04 00:08 -0700, Christian Stewart via buildroot spake thusly:
> https://github.com/containers/fuse-overlayfs/releases/tag/v1.11
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/fuse-overlayfs/fuse-overlayfs.hash | 2 +-
>  package/fuse-overlayfs/fuse-overlayfs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fuse-overlayfs/fuse-overlayfs.hash b/package/fuse-overlayfs/fuse-overlayfs.hash
> index aa5438755e..d83d3e3125 100644
> --- a/package/fuse-overlayfs/fuse-overlayfs.hash
> +++ b/package/fuse-overlayfs/fuse-overlayfs.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  4351eaed7cf26a5012c14c6e0fc883ef65a7b5dcc95ba129ce485904106c25a9  fuse-overlayfs-1.10.tar.gz
> +sha256  d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed  fuse-overlayfs-v1.11.tar.gz
>  # Locally computed
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/fuse-overlayfs/fuse-overlayfs.mk b/package/fuse-overlayfs/fuse-overlayfs.mk
> index 1633d3bd41..4db2ccd7d5 100644
> --- a/package/fuse-overlayfs/fuse-overlayfs.mk
> +++ b/package/fuse-overlayfs/fuse-overlayfs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FUSE_OVERLAYFS_VERSION = 1.10
> +FUSE_OVERLAYFS_VERSION = 1.11
>  FUSE_OVERLAYFS_SITE = $(call github,containers,fuse-overlayfs,v$(FUSE_OVERLAYFS_VERSION))
>  FUSE_OVERLAYFS_LICENSE = GPL-3.0
>  FUSE_OVERLAYFS_LICENSE_FILES = COPYING
> -- 
> 2.40.1
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
