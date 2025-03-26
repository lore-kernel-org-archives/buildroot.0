Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D6EC3600C
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 11:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEEA561292;
	Wed, 26 Mar 2025 11:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0WadCiqPv2mn; Wed, 26 Mar 2025 11:26:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AC436F614
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AC436F614;
	Wed, 26 Mar 2025 11:26:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 642EA1B8
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 11:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5698440237
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 11:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fRoVDy6XOCtV for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 11:26:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7BD1E400FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BD1E400FC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BD1E400FC
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 11:26:51 +0000 (UTC)
Received: from L25025.local (unknown [213.36.9.119])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 30C15B00571;
 Wed, 26 Mar 2025 12:26:46 +0100 (CET)
Date: Wed, 26 Mar 2025 12:26:45 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Robin Jarry <robin@jarry.cc>, 
 Julien Olivain <ju.o@free.fr>
Message-ID: <la7npnj2anu62uqhucuhrig7w3n4h4ta32nrwwzjuf6h7uaubp@fxxjoqq3fojj>
References: <20250326111651.23707-1-maxime@leroys.fr>
 <20250326111651.23707-2-maxime@leroys.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250326111651.23707-2-maxime@leroys.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742988409;
 bh=bePyNAEeOYHqH0h8dNHBGlzOWvHCw3DDKOzz47LARRQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DE/xkf8Q0Uu0X4vNR4wtSIeTBlqGiTkOwsSSxuzdgxsbELr7Ep6bRUA5FUwEUWRj9
 oAekQafIJhc6rYmqVHYnazOyKuWZ6la5Xi91Obz1uyzsunRvbHHkMm8055mI3m4INV
 NBC4+ISqs92dlEG0JWIWo7sbzEPVMg3LOe56lux5NUzyecFFQ2wJaR6MVhl1dVRJfb
 8GsUfXRfzIi5BeRBiToh8qL7A0iS18pW25lCTCPkTRVgHWxQRQjrDx/Fw3EdKTySre
 mASmO24PQuDwNdXVfOgFl31eQTthXJyN2gV27Y/8ztD3yUM90W9JVLFgaeT1zW5Sv6
 0fyWRFNTswTDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DE/xkf8Q
Subject: Re: [Buildroot] [PATCH 2/2] package/grout: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maxime,

see below

I am not confortable with the Config.in's select/depend yet, so I'd prefer to
leave those comments for some Buildroot's maintainers.

On Wed, Mar 26, 2025 at 12:16:51PM +0100, Maxime Leroy wrote:
> Grout is a Graph router based on DPDK.
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>
> ---
>  DEVELOPERS               |  3 +++
>  package/Config.in        |  1 +
>  package/grout/Config.in  | 13 +++++++++++++
>  package/grout/grout.hash |  2 ++
>  package/grout/grout.mk   | 24 ++++++++++++++++++++++++
>  5 files changed, 43 insertions(+)
>  create mode 100644 package/grout/Config.in
>  create mode 100644 package/grout/grout.hash
>  create mode 100644 package/grout/grout.mk
> 
> +++ b/package/grout/grout.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256  10f8e20b4aa1a8fe928c87b249e23267eef356f39b04994a0b88b52931fcaa4b  v0.8.4.tar.gz

You need to add the LICENSE's hash too.

> diff --git a/package/grout/grout.mk b/package/grout/grout.mk
> new file mode 100644
> index 0000000000..0d6fb8dce9
> --- /dev/null
> +++ b/package/grout/grout.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# grout
> +#
> +################################################################################
> +
> +GROUT_VERSION = 0.8.4
> +GROUT_SITE = https://github.com/DPDK/grout/archive/refs/tags
> +GROUT_SOURCE = v$(GROUT_VERSION).tar.gz
> +GROUT_LICENSE = BSD-3-Clause
> +GROUT_LICENSE_FILES = LICENSE
> +
> +# Avoid using buildroot commit hash
> +GROUT_CONF_ENV += GROUT_VERSION=$(GROUT_VERSION)
> +
> +GROUT_DEPENDENCIES = \
> +	host-pkgconf \
> +	dpdk \
> +	libevent \
> +	numactl \
> +	libecoli \
> +	util-linux
> +
> +$(eval $(meson-package))

Since DPDK is a complex topic, will you add a Grout basic check/test just
like it was done for DPDK too ?

Thanks,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
