Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB46C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EF7D40A15;
	Sun, 17 Jul 2022 13:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EF7D40A15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uk0scqvCxetz; Sun, 17 Jul 2022 13:09:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C637440412;
	Sun, 17 Jul 2022 13:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C637440412
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 090821BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D61F640412
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D61F640412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ef3IrA-yd_oM for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:09:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1493400F2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1493400F2
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:09:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E3ECF78050A;
 Sun, 17 Jul 2022 15:09:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 15:09:24 +0200
Date: Sun, 17 Jul 2022 15:09:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20220717130924.GA2249625@scaer>
References: <20220713163332.3079691-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220713163332.3079691-1-festevam@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658063369;
 bh=TmTJ+ATQOvaEUMN047IMZesel6M+haJ15kHh01qUV88=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PMfY1YDAir6RZqXoSAkw8pjt2jFhvLnZ2Cqv8QZGfyGUrqCFEcN5Rf0eYWNKbrPe8
 7eTLioPgBBuyqP5oRLSY94+z35izvIp9SVGPNSlm7THztB+v+84rIy95AnQff22mBQ
 4nVPSOwtlZ7zVz7fjSRNb0IT1Jl9gDwEGFTcGqtBbQlRyW81XQbnHM0Rpzu6v2W73J
 OjWXD5q+6coyrS3YrTygFViV5KZFAwF+CuZA2P3yMSvqG4NfT2jc5hkGXj9amCuu39
 2S9OpVrkcPx6oB+Xe3Bk1XKTPhevmmzEuN4ezLXeREhHQqmRCAre5Exe49i1EhfAA7
 rUffqbY5QE3/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PMfY1YDA
Subject: Re: [Buildroot] [PATCH] package/crucible: new package
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
Cc: andrea.barisani@withsecure.com, andrej.rosano@withsecure.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabio, All,

On 2022-07-13 13:33 -0300, Fabio Estevam spake thusly:
> crucible is a useful tool that allows reading and writing
> to the i.MX fuses via the Linux NVMEM framework.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/crucible/Config.in b/package/crucible/Config.in
> new file mode 100644
> index 0000000000..06f7d5913c
> --- /dev/null
> +++ b/package/crucible/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_CRUCIBLE
> +	bool "crucible"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	help
> +	  Crucible is a One-Time-Programmable (OTP) fusing tool for the
> +	  i.MX family.
> +	  

    $ make check-package
    package/crucible/Config.in:7: line contains trailing whitespace

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

> +	  https://github.com/usbarmory/crucible
> diff --git a/package/crucible/crucible.hash b/package/crucible/crucible.hash
> new file mode 100644
> index 0000000000..ad8a2cb35c
> --- /dev/null
> +++ b/package/crucible/crucible.hash
> @@ -0,0 +1,2 @@
> +sha256  51e911ce5e2a9f182a737b71f6e2bbf46fb80bb3252220cd99ffaf54d38e6c64  crucible-v2022.05.25.tar.gz
> +sha256  d88514630470aec9fa7abdc990a1e0a8751a752321bffa868188c49009d64d59  LICENSE
> diff --git a/package/crucible/crucible.mk b/package/crucible/crucible.mk
> new file mode 100644
> index 0000000000..e9038f8cff
> --- /dev/null
> +++ b/package/crucible/crucible.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# crucible
> +#
> +################################################################################
> +
> +CRUCIBLE_VERSION = v2022.05.25
> +CRUCIBLE_SITE = $(call github,usbarmory,crucible,$(CRUCIBLE_VERSION))
> +CRUCIBLE_LICENSE = GPL-3.0
> +CRUCIBLE_LICENSE_FILES = LICENSE
> +CRUCIBLE_GOMOD = ./cmd/crucible
> +
> +$(eval $(golang-package))
> -- 
> 2.25.1
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
