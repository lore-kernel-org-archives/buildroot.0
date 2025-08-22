Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFE0CA0EED
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 17:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6CDB406B2;
	Fri, 22 Aug 2025 17:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVdvZhBMJPjD; Fri, 22 Aug 2025 17:41:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01603406C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01603406C1;
	Fri, 22 Aug 2025 17:41:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 87740D8
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 17:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7907F405D4
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 17:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eT_YZaSSqyCW for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 17:41:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 54BD4406C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54BD4406C1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54BD4406C1
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 17:41:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E414C78050E;
 Fri, 22 Aug 2025 19:40:59 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 22 Aug 2025 19:40:59 +0200
MIME-Version: 1.0
Date: Fri, 22 Aug 2025 19:40:59 +0200
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>, Romain Naour
 <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>, Arnout
 Vandecappelle <arnout@mind.be>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20250811165531.1533913-11-olteanv@gmail.com>
References: <20250811165531.1533913-1-olteanv@gmail.com>
 <20250811165531.1533913-11-olteanv@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <bada87874fe4b95de25bd6ed667598fc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755884467;
 bh=JVH4qunvmRX0cH59odUUwaS6hxfgepfROhDFtHugQr0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sQdP3in6VIzpMZ1kc0AQ/7btJgSnDEv9+xCTpWrcpWVxJ3Jlvsip6f6Pu38GgpcxL
 1kzBEOjSHUGi6vaBsKfXfVKUyxnLfOJB+/jTFLdqhl7OC6Y/SyiFPF8/+0YJ+TN6o/
 zphPyNuayme2DUwtkfqp96uEW5wc2UF5BGuIBleExaE/DId3H86pSQesKUG8t3q+RJ
 6YXfBvjoXzODJVlFgwPKAPEzynqIpJn0eKjgaTl5xtEaGVY7BSPiko8AjXH44PXTSf
 8eikaOvbPy1R316qDx5IJOnHGzppTFLo+aayRO38F8d5VnRMQXKWz0O3JggQXtBHFN
 yKrGXBgjHFMVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=sQdP3in6
Subject: Re: [Buildroot] [PATCH v3 10/11] package/qoriq-restool: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vladimir,

Thanks for the patch!

On my side, it generates few build failures with test-pkg, when running
the command:

     utils/test-pkg -a -p qoriq-restool

I'm expecting no build failure. So either there is missing requirements
in Config.in, or it is bugs in the code.

Could you have a look please?

On 11/08/2025 18:55, Vladimir Oltean wrote:
> Introduce a package for the restool program, which permits the user to
> modify the network configuration of the DPAA2 subsystem and create one
> that is adequate to their use case.
> 
> We integrate the lf-6.12.20-2.0.0 release tag, which contains some 
> extra
> fixups specifically made for the Buildroot integration:
> - commit 14a9058c772b ("manpage: it should be optional"): It was 
> pointed
>   out on previous patch submissions that the "make install" target also
>   converts man pages from Markdown to groff using pandoc, and apart 
> from
>   the fact that Buildroot doesn't want manpages, pandoc is also too
>   heavy to drag into the build system. So that feedback was considered
>   valid and the patch is included here via upstream.
> - commit 6d6b9d8c200c ("dpdmux: remove unused dpdmux_create_options
>   array") addresses a build error
> - commit 66d941a0160d ("Adapt BITS_PER_LONG and GENMASK() definitions
>   for 32-bit compatibility") addresses a build error on 32-bit builds
> - commit 8f73f2600111 ("Print 64-bit counters using PRIu64 from
>   inttypes.h") addresses a build error on 32-bit builds
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Vincent Jardin <vjardin@free.fr>
> ---
> v2->v3: integrate upstream a patch which fixes 32-bit builds
> v1->v2: integrate upstream a patch from Vincent which avoids building
>         man pages
> 
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/qoriq-restool/Config.in          | 22 +++++++++++++++++++++
>  package/qoriq-restool/qoriq-restool.hash |  3 +++
>  package/qoriq-restool/qoriq-restool.mk   | 25 ++++++++++++++++++++++++
>  5 files changed, 52 insertions(+)
>  create mode 100644 package/qoriq-restool/Config.in
>  create mode 100644 package/qoriq-restool/qoriq-restool.hash
>  create mode 100644 package/qoriq-restool/qoriq-restool.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 12a41597afb0..1b5b3e87ea04 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3432,6 +3432,7 @@ F:	package/qoriq-ddr-phy-binary/
>  F:	package/qoriq-firmware-inphi/
>  F:	package/qoriq-mc-binary/
>  F:	package/qoriq-mc-utils/
> +F:	package/qoriq-restool/
> 
>  N:	Volkov Viacheslav <sv99@inbox.ru>
>  F:	package/v4l2grab/
> diff --git a/package/Config.in b/package/Config.in
> index 137f74ed82ce..ccf76af1cc21 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -598,6 +598,7 @@ endmenu
>  	source "package/pru-software-support/Config.in"
>  	source "package/pulseview/Config.in"
>  	source "package/qoriq-cadence-dp-firmware/Config.in"
> +	source "package/qoriq-restool/Config.in"
>  	source "package/raspi-gpio/Config.in"
>  	source "package/rdma-core/Config.in"
>  	source "package/read-edid/Config.in"
> diff --git a/package/qoriq-restool/Config.in 
> b/package/qoriq-restool/Config.in
> new file mode 100644
> index 000000000000..dbe0934d4dd3
> --- /dev/null
> +++ b/package/qoriq-restool/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_QORIQ_RESTOOL
> +	bool "qoriq-restool"
> +	help
> +	  The DPAA2 architecture in Layerscape SoCs consists of
> +	  networking resources that can be assembled into various
> +	  nuggets of functionality, called "objects" (DPMAC, DPNI,
> +	  DPDMUX, DPSW etc), by the Management Complex (MC) firmware.
> +
> +	  The MC firmware reads a file called Data Path Layout (DPL)
> +	  which describes the set of networking objects it should
> +	  create statically, at boot time.
> +
> +	  The restool program is able to talk to the Management
> +	  Complex at runtime and permits the dynamic reconfiguration
> +	  of networking objects, as well as saving the current
> +	  configuration into a new DPL file. Without the restool
> +	  program, the only possible networking configuration is
> +	  that specified in the boot-time DPL file.
> +
> +	  https://github.com/nxp-qoriq/restool
> +	  # sign in required
> +	  https://www.nxp.com/webapp/Download?colCode=DPAA2UM
> diff --git a/package/qoriq-restool/qoriq-restool.hash 
> b/package/qoriq-restool/qoriq-restool.hash
> new file mode 100644
> index 000000000000..5e11f60d0e74
> --- /dev/null
> +++ b/package/qoriq-restool/qoriq-restool.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  
> efc3c21c04adef30d7903e6ce4923ca085dad7e53351ce21b6bfafd681ae8674  
> qoriq-restool-lf-6.12.20-2.0.0.tar.gz
> +sha256  
> 68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  
> LICENSE
> diff --git a/package/qoriq-restool/qoriq-restool.mk 
> b/package/qoriq-restool/qoriq-restool.mk
> new file mode 100644
> index 000000000000..2e02e00cdb1c
> --- /dev/null
> +++ b/package/qoriq-restool/qoriq-restool.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# qoriq-restool
> +#
> +################################################################################
> +
> +QORIQ_RESTOOL_VERSION = lf-6.12.20-2.0.0
> +QORIQ_RESTOOL_SITE = $(call 
> github,nxp-qoriq,restool,$(QORIQ_RESTOOL_VERSION))
> +QORIQ_RESTOOL_LICENSE = BSD-3-Clause or GPL-2.0-or-later
> +QORIQ_RESTOOL_LICENSE_FILES = COPYING
> +
> +QORIQ_RESTOOL_MAKE_OPTS = \
> +	CC="$(TARGET_CC)" \
> +	CROSS_COMPILE="$(TARGET_CROSS)"
> +
> +define QORIQ_RESTOOL_BUILD_CMDS
> +	cd $(@D) && $(TARGET_MAKE_ENV) $(MAKE) $(QORIQ_RESTOOL_MAKE_OPTS)
> +endef
> +
> +define QORIQ_RESTOOL_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) MANPAGE="" $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) 
> \
> +		prefix=/usr install
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.43.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
