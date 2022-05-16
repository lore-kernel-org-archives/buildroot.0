Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E399C433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 10:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB95240B36;
	Mon, 16 May 2022 10:28:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QXU2O4ObEp7B; Mon, 16 May 2022 10:28:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AA6C40B2B;
	Mon, 16 May 2022 10:28:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DBAFA1BF3A8
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 10:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8CCD82784
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 10:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qhkjv4AK1Xh5 for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 10:28:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A8EA826A4
 for <buildroot@buildroot.org>; Mon, 16 May 2022 10:28:30 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id EB9FFC27CA
 for <buildroot@buildroot.org>; Mon, 16 May 2022 10:19:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7156B1BF208;
 Mon, 16 May 2022 10:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652696336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GK55W0l67Tt3+tSPWuIRZFfGPIBs/GWz+PXdzOA6S64=;
 b=W5ksHPhbbOSC5ChiTOdBToe/rNyRdkiDRVksD2CAHmcWPBnerTj4oB/R/NdInUBuKBSWof
 pjfwVOTdOcFfiVRsRvGnozh5+bQX4iC5U5twJNDdzN6IVM2CqESpUonWwgass7awPc700t
 VCi98ydgWBHdnp6Bie2nrUzD9bLTtKF4VM5LQZasfyb/dVXoSz92DLy9a3tBMBYkCgZhwf
 H2rSMWrdzK0z/IADN2aW0www0fvPOs2F6HwSxijt95s3OYS6Ly/s8/qK021DQpKN1D6CAU
 GoXOIvSBmYAz/EERMtAzpa96RWYrXRAJG0xwsAtHppoJRhmQbBlcdnt8APUumw==
Date: Mon, 16 May 2022 12:18:54 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220516121854.0f257189@windsurf>
In-Reply-To: <20220516000619.1666731-1-james.hilliard1@gmail.com>
References: <20220516000619.1666731-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] toolchain-buildroot: only allow
 BR2_STATIC_LIBS on supported archs
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 15 May 2022 18:06:18 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> It is currently possible to select BR2_STATIC_LIBS while
> BR2_TOOLCHAIN_BUILDROOT is selected even when there are no buildroot
> toolchains that support BR2_STATIC_LIBS for the selected architecture.
> 
> Add BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_SUPPORTS so that we can
> disable the selection of BR2_STATIC_LIBS when using an unsupported
> architecture.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/4da/4da59af8193376ec893321c4c2aaf1d25598502d
>  - http://autobuild.buildroot.net/results/195/1950348218a4f097f078d158977c13f8b0a97d6e
>  - http://autobuild.buildroot.net/results/2f0/2f03f2be32ad9898a990f6f0264d8c8d51991eb1
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - move supports config variables into toolchain configs
> ---
>  Config.in                               |  2 ++
>  package/glibc/Config.in                 | 38 +++++++++++++++++++++++
>  package/musl/Config.in                  | 28 +++++++++++++++++
>  package/uclibc/Config.in                | 28 +++++++++++++++++
>  toolchain/toolchain-buildroot/Config.in | 41 +++++--------------------
>  5 files changed, 104 insertions(+), 33 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index f0cd6f48ed..52c3c4b4c8 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -601,6 +601,8 @@ choice
>  
>  config BR2_STATIC_LIBS
>  	bool "static only"
> +	depends on !BR2_TOOLCHAIN_BUILDROOT || \
> +		BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_SUPPORTS
>  	help
>  	  Build and use only static libraries. No shared libraries will
>  	  be installed on the target. This potentially increases your
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index 8e9ddac7d9..6405bff6a0 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -1,3 +1,41 @@
> +config BR2_TOOLCHAIN_BUILDROOT_GLIBC_ARCH_SUPPORTS

Should be BR2_PACKAGE_GLIBC_ARCH_SUPPORTS I believe to be consistent
with other packages.

Ditto for uclibc and musl, of course.

(I didn't review in detail the patch, only noticed this)

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
