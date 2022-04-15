Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A0AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Apr 2022 21:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76215841C1;
	Fri, 15 Apr 2022 21:14:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J3kI2p3-pWsr; Fri, 15 Apr 2022 21:14:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79E528415A;
	Fri, 15 Apr 2022 21:14:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CCFA1C11A5
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 21:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4868141A69
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 21:14:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oPQLqQ18AnvJ for <buildroot@lists.busybox.net>;
 Fri, 15 Apr 2022 21:14:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F07764161A
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 21:14:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D09C91C0003;
 Fri, 15 Apr 2022 21:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650057275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wr2poEI0agk/62FfMgl1nULmnyM+NdqPRoTQAuSoZc0=;
 b=Wr7oKIuuNgN5qdJ5k8t47jaJHKj3og0lOngLj3qdIsOIy/xlBfRBgK1pQU4rhjKsSP41zF
 35Btj3BRR/IVgcTwr1PhHrRdIVJVL32qhyarTy8hWcwfGP98Jn+N0HeUB7BUT7iLFA69nA
 GPye0WN4up190qlPf1XjTUS536l9cyaI1FX0T+wUUCj7X/OUFEiNHLob1azwApUHo2hA9p
 cvWSl8SXK/3+U7oxEb08IjZKrBd1rQaWklwyMS7UPw2Yv+NhDj73pUu5h30UBr+6TM9Z6a
 mU7KYYPQ8UTw3FecToy4MguA7HA4gBL1E/fIXpQ1Esrl7IvaZY01Dd0FDuU/Uw==
Date: Fri, 15 Apr 2022 23:14:33 +0200
To: Thomas Perrot <thomas.perrot@bootlin.com>
Message-ID: <20220415231433.0ead2ec4@windsurf>
In-Reply-To: <20220415165240.2820911-1-thomas.perrot@bootlin.com>
References: <20220415165240.2820911-1-thomas.perrot@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/byacc: add new host package
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

Thanks for your contribution. The commit title should be just
"package/byacc: new package". See below for more comments.

On Fri, 15 Apr 2022 18:52:39 +0200
Thomas Perrot <thomas.perrot@bootlin.com> wrote:

> This package provides a Berkeley LALR Yacc parser generator that has been use
> by i.MX Code Signing tool.
> 
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>  package/Config.in.host       |  1 +
>  package/byacc/Config.in.host | 10 ++++++++++
>  package/byacc/byacc.hash     |  3 +++
>  package/byacc/byacc.mk       | 16 ++++++++++++++++
>  4 files changed, 30 insertions(+)

You forgot to add an entry in the DEVELOPERS file for this new package.

>  create mode 100644 package/byacc/Config.in.host
>  create mode 100644 package/byacc/byacc.hash
>  create mode 100644 package/byacc/byacc.mk
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index cd1c34b5a3d9..69c985842d1f 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -7,6 +7,7 @@ menu "Host utilities"
>  	source "package/babeltrace2/Config.in.host"
>  	source "package/bmap-tools/Config.in.host"
>  	source "package/btrfs-progs/Config.in.host"
> +	source "package/byacc/Config.in.host"

This is not needed. This tool is merely a build dependency of imx-cst,
so we don't need a visible entry in menuconfig. Look at package/bison/:
it doesn't have a visible menuconfig entry.


> diff --git a/package/byacc/byacc.hash b/package/byacc/byacc.hash
> new file mode 100644
> index 000000000000..d2ad441df39f
> --- /dev/null
> +++ b/package/byacc/byacc.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  42c1805cc529314e6a76326fe1b33e80c70862a44b01474da362e2f7db2d749c  byacc-20220128.tgz
> +sha256  654a231fe9cd4d36e580214962fa777a1df0771d6889cfc74d19a3d414f14711  LICENSE
> diff --git a/package/byacc/byacc.mk b/package/byacc/byacc.mk
> new file mode 100644
> index 000000000000..e14c4d9c7914
> --- /dev/null
> +++ b/package/byacc/byacc.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# byacc
> +#
> +################################################################################
> +
> +BYACC_SITE = https://invisible-mirror.net/archives/byacc
> +BYACC_SITE_METHOD = https

Specifying the site method here is not needed.

> +BYACC_VERSION = 20220128
> +BYACC_SOURCE = byacc-$(BYACC_VERSION).tgz
> +BYACC_LICENSE = PD

It seems like we normally use "Public Domain" and not "PD".

> +BYACC_LICENSE_FILES = LICENSE
> +
> +HOST_BYACC_CONF_OPTS += --program-transform-name='s,^,b,'

+= not needed, a = is sufficient here. However, a comment above this
line would be appreciated, as it's not obvious why you're doing this.

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
