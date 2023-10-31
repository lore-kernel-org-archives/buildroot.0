Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EC9C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 12:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4299842122;
	Tue, 31 Oct 2023 12:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4299842122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KJJhWAYJF6Zc; Tue, 31 Oct 2023 12:37:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 598B041F2C;
	Tue, 31 Oct 2023 12:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 598B041F2C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 413E51BF31A
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A66E41F2C
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A66E41F2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JwJ89fs7nodr for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 12:37:51 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9452741F07
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 12:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9452741F07
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89ABDFF815;
 Tue, 31 Oct 2023 12:37:47 +0000 (UTC)
Date: Tue, 31 Oct 2023 13:37:46 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20231031133746.5ce62f07@windsurf>
In-Reply-To: <20231020114236.4129636-1-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698755867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w1boeM20CicP7GeGIdyVZTgtnDxVepE2djwBABnxqdE=;
 b=HUV3BKGMiEVwlKez67rxIH2k1i9CGYuJ+gRavgGFPfvlurjTA8eVsVeluge0i/A3ktUOaL
 hO+onYpkdrgsuBtLGZQmDP3aTyQF1z9CcPTN87jgelXuaJDXq01MU51QWJDEsN7Vp4VEHm
 Khuo8pN7KpeGwFslIl0F3Tu+9bmpGGlGo27beBNjubFcxJNeYd7B0Vvugjho3DWkvpHCDE
 GPc+kv2izV79RHJLS5bpba6BwfkK3yaycEGBOA+tE/8s1WNUu2R6E+WJ6NGq+6L1GGZqkS
 jwNcn2NN/Vc+Png9MFHmz7uFEk8BlI47ZuhAFPHp0M2pgkQl9+qep8BPUs+VNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HUV3BKGM
Subject: Re: [Buildroot] [PATCH v6 01/10] package/binutils-bare-metal: new
 package
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
Cc: michal.simek@amd.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I'm late to the party, but here are some comments.

On Fri, 20 Oct 2023 12:42:27 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:


> diff --git a/package/binutils-bare-metal/2.41/0001-sh-conf.patch b/package/binutils-bare-metal/2.41/0001-sh-conf.patch
> new file mode 120000
> index 0000000000..26dff99523
> --- /dev/null
> +++ b/package/binutils-bare-metal/2.41/0001-sh-conf.patch

I'm not happy with how patches are handled here. I think
package/binutils-bare-metal/2.41/ should be a symlink to
package/binutils/2.41/, and all patches you need should be added to
package/binutils/2.41/. I don't want to see a different patch stack to
be applied on binutils-bare-metal compared to binutils.


> diff --git a/package/binutils-bare-metal/Config.in.host b/package/binutils-bare-metal/Config.in.host
> new file mode 100644
> index 0000000000..e70bee8fa2
> --- /dev/null
> +++ b/package/binutils-bare-metal/Config.in.host
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL
> +	bool "host binutils-bare-metal"

This visible config option is useless, as it's anyway only selected by
host-toolchain-bare-metal. I believe it can simply be dropped.

> +	help
> +	  Build GNU binutils for a bare-metal toolchain
> +
> +if BR2_PACKAGE_HOST_BINUTILS_BARE_METAL
> +
> +config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_VERSION
> +	string
> +	default "2.41"

This option is invisible (it has no prompt), so it is useless. Just
hardcode 2.41 in package/binutils-bare-metal/binutils-bare-metal.mk.


> diff --git a/package/binutils-bare-metal/binutils-bare-metal.hash b/package/binutils-bare-metal/binutils-bare-metal.hash
> new file mode 100644
> index 0000000000..3aab4d433d
> --- /dev/null
> +++ b/package/binutils-bare-metal/binutils-bare-metal.hash
> @@ -0,0 +1,6 @@
> +# From https://gcc.gnu.org/pub/binutils/releases/sha512.sum
> +sha512  5df45d0bd6ddabdce4f35878c041e46a92deef01e7dea5facc97fd65cc06b59abc6fba0eb454b68e571c7e14038dc823fe7f2263843e6e627b7444eaf0fe9374  binutils-2.41.tar.xz
> +
> +# locally calculated
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
> +sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB

Perhaps this should be a symlink to package/binutils/binutils.hash ?



> diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
> new file mode 100644
> index 0000000000..c361a5102a
> --- /dev/null
> +++ b/package/binutils-bare-metal/binutils-bare-metal.mk
> @@ -0,0 +1,39 @@
> +################################################################################
> +#
> +# binutils-bare-metal
> +#
> +################################################################################
> +
> +HOST_BINUTILS_BARE_METAL_VERSION = \
> +	$(call qstrip,$(BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_VERSION))
> +ifeq ($(HOST_BINUTILS_BARE_METAL_VERSION),)
> +HOST_BINUTILS_BARE_METAL_VERSION = 2.41
> +endif # BINUTILS_VERSION

Just hardcode the version to 2.41, no option needed.

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
