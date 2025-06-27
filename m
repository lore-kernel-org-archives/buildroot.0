Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CA3C7EE2A
	for <buildroot@archiver.kernel.org>; Fri, 27 Jun 2025 15:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E23D61045;
	Fri, 27 Jun 2025 15:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DM0wgs0Cshkg; Fri, 27 Jun 2025 15:16:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EBD361152
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EBD361152;
	Fri, 27 Jun 2025 15:16:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 22901154
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A86D8456C
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGaozSNpSv1F for <buildroot@buildroot.org>;
 Fri, 27 Jun 2025 15:15:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8686B8456D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8686B8456D
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8686B8456D
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:15:55 +0000 (UTC)
Received: from [192.168.2.2] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id VAnwuB6iGzKH1VAnxuOBJe; Fri, 27 Jun 2025 17:15:53 +0200
Message-ID: <12c35e94-748f-4f7c-a6a1-ef41fb227480@benettiengineering.com>
Date: Fri, 27 Jun 2025 17:15:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Matthew Maron <matthewm@tekvox.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jim Reinhart <jimr@tekvox.com>, Julien Olivain <ju.o@free.fr>
References: <20240701193420.2119084-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US, it
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240701193420.2119084-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfNxcZzWeQA1ZA3x3M01QjqPAaj9Riuql5bYcN7O4t6ngVrTbszElMLEoq/g/GYX/8YuFcNDEqQSqXidVmMon8Pu8O+sxx77IB9GZjmokyrMkGdLxMh2q
 eDZ6TOReH8dLrhivavhJyqOkPo0aiZb/WHGb4QqrPZ8CnbPMjnxY1CkT6JdHPjlHs2I7me9Q53QFJSytDxLKuMBrB5TKKbpU22bYhvPxBSBTtSMod/qS0+aD
 +bBKMMhqSavYhGYDmXe/KRjEa0+rc304158yUPOngFzFEmifQ0hmOG5xzT1qT/SWcYBHEnHW+uDgIcp41n9spygaE8MUYTuFSYjUq8I25cZ5ze3dtSY9y5w2
 jYOeh8fzsZj1uP3lbCtln3/nSEohGHE52CHWONazreINTBHzLcFW4+uhe8hNx34TCqsqmhA0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1751037353; bh=n/gNdVSG9ZcPxgLrmV7HIvoWA993qjmKdh27tqeD6aQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=WB2zZ82PbhL1jQyincnuEA5IAR72xcNy57ZhRaPV3dn3eK+nACZcMtyOJL6Lh2lE2
 0ux7DQyvGONjsyyp/P/nnytR7HM0uOAffgxw/+vw1aHPUm7SwUf/LptI1FSpF7M/WC
 qSTrlj8zT4l2miHdg2IegQRv6qYGQjMOG5WpnxCLon2yvV3zIRspnPVXImXZYnN6zs
 by0rIG/43cQcNvGBJspJkIbBVlqbGlg8NjZqjNAFxd+MVN5LvmVcZRbH7NZVGuMNeX
 5upjEJftKE1DkvGcq+JJmed3L3VzLXXhH8fjz6O3D8L7iSdL6aJR44AyMyjPI2KEB5
 nqRTAeT9tHXnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=WB2zZ82P
Subject: Re: [Buildroot] [PATCH v3] package/dotnet-runtime-prebuilt: new
 package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello eveyrone,

I kindly ping since long time passed.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
https://www.linkedin.com/company/benetti-engineering-sas/
https://www.linkedin.com/in/giulio-benetti-79975951/

On 7/1/24 21:34, Giulio Benetti wrote:
> From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> 
> Add pre-built .NET Core Runtime Prebuilt 8.0.6 binaries to execute .NET
> executables on Linux. Version 8.0.6 is the latest LTS version. Let's simply
> download and extract specific tarball for aarch64, arm(eabihf) and x64
> architectures and glibc/musl libc. Let's also:
> * add /etc/dotnet/install_location file to point where dotnet runtime is
> * add a script to export 'dotnet' to PATH and native libraries to
>    LD_LIBRARY_PATH to avoid missing dependencies on runtime
> 
> Cc: Jim Reinhart <jimr@tekvox.com>
> Cc: James Autry <jautry@tekvox.com>
> Cc: Matthew Maron <matthewm@tekvox.com>
> Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> ---
> V1->V2:
> * add depends on BR2_INSTALL_LIBSTDCPP and drop select BR2_PACKAGE_LTTNG_LIBUST
> V2->V3:
> * drop DOTNET_RUNTIME_PREBUILT_IDENTIFIER check since it breaks entire Buildroot
> building when architecture is supported but package is not selected. Basically
> it's a testing leftover
> ---
>   DEVELOPERS                                    |  1 +
>   package/Config.in                             |  1 +
>   package/dotnet-runtime-prebuilt/Config.in     | 29 ++++++++++
>   .../dotnet-runtime-prebuilt.hash              |  8 +++
>   .../dotnet-runtime-prebuilt.mk                | 58 +++++++++++++++++++
>   .../dotnet-runtime-prebuilt.sh                |  2 +
>   6 files changed, 99 insertions(+)
>   create mode 100644 package/dotnet-runtime-prebuilt/Config.in
>   create mode 100644 package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.hash
>   create mode 100644 package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.mk
>   create mode 100644 package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.sh
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 551ff2dd0d..291a7e004e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1243,6 +1243,7 @@ F:	configs/rockpro64_defconfig
>   F:	package/at/
>   F:	package/binutils/
>   F:	package/cryptsetup/
> +F:	package/dotnet-runtime-prebuilt/
>   F:	package/dotnet6-runtime/
>   F:	package/erlang-jiffy/
>   F:	package/esp-hosted/
> diff --git a/package/Config.in b/package/Config.in
> index 59a4512b52..ec7b5ef1f5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -662,6 +662,7 @@ menu "Interpreter languages and scripting"
>   	source "package/4th/Config.in"
>   	source "package/dotnet6-runtime/Config.in"
>   	source "package/dotnet8-runtime/Config.in"
> +	source "package/dotnet-runtime-prebuilt/Config.in"
>   	source "package/enscript/Config.in"
>   	source "package/erlang/Config.in"
>   if BR2_PACKAGE_ERLANG
> diff --git a/package/dotnet-runtime-prebuilt/Config.in b/package/dotnet-runtime-prebuilt/Config.in
> new file mode 100644
> index 0000000000..2e2b54d0ac
> --- /dev/null
> +++ b/package/dotnet-runtime-prebuilt/Config.in
> @@ -0,0 +1,29 @@
> +config BR2_PACKAGE_DOTNET_RUNTIME_PREBUILT_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64
> +	default y if (BR2_arm && BR2_ARM_EABIHF)
> +	default y if BR2_x86_64
> +	depends on BR2_USE_MMU # fork()
> +
> +config BR2_PACKAGE_DOTNET_RUNTIME_PREBUILT
> +	bool "dotnet-runtime-prebuilt"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_PACKAGE_DOTNET_RUNTIME_PREBUILT_ARCH_SUPPORTS
> +	select BR2_PACKAGE_HOST_CMAKE
> +	select BR2_PACKAGE_ICU
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBKRB5
> +	select BR2_PACKAGE_LIBZLIB
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  .NET Core 8 Runtime Prebuilt
> +
> +	  https://dotnet.microsoft.com/download/dotnet-core/8.0
> +
> +comment "dotnet-runtime needs a toolchain w/ glibc or musl and threads"
> +	depends on BR2_PACKAGE_DOTNET8_RUNTIME_PREBUILT_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.hash b/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.hash
> new file mode 100644
> index 0000000000..6ff15ed121
> --- /dev/null
> +++ b/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.hash
> @@ -0,0 +1,8 @@
> +# Locally calculated
> +sha256  811b3d6d052e0d37c5cb2f6746cb950ae7c87a1c5082897a27bcd9258c94de66  dotnet-runtime-8.0.6-linux-arm.tar.gz
> +sha256  0c1355dfba7b0e354294fd202274e4fa1838b93afcc180ecf667e25e5d1b7df6  dotnet-runtime-8.0.6-linux-arm64.tar.gz
> +sha256  cfecba75d6497e14a06f04096c0be6bb57938ef23abd3c5ff6639bd999dbb9a1  dotnet-runtime-8.0.6-linux-musl-arm64.tar.gz
> +sha256  566c219fb59864c23333a254092c5b9644717164ad047050ccad06b79f710700  dotnet-runtime-8.0.6-linux-musl-arm.tar.gz
> +sha256  15c7219c2630d81131c0b47a7c6577f0f76f56ea0ed8dd337748d0b5929834d9  dotnet-runtime-8.0.6-linux-musl-x64.tar.gz
> +sha256  b29b4e02b622cf0ff4581b0a96824b74a6690e97b95158a2e3d8fb43342dadfd  dotnet-runtime-8.0.6-linux-x64.tar.gz
> +sha256  cfc21f5e8bd655ae997eec916138b707b1d290b83272c02a95c9f821b8c87310  LICENSE.txt
> diff --git a/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.mk b/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.mk
> new file mode 100644
> index 0000000000..13aa9a1741
> --- /dev/null
> +++ b/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.mk
> @@ -0,0 +1,58 @@
> +################################################################################
> +#
> +# dotnet-runtime-prebuilt
> +#
> +################################################################################
> +
> +DOTNET_RUNTIME_PREBUILT_VERSION = 8.0.6
> +DOTNET_RUNTIME_PREBUILT_LICENSE = MIT
> +DOTNET_RUNTIME_PREBUILT_LICENSE_FILES = LICENSE.txt
> +
> +# Set download URL and runtime identifier
> +# See https://docs.microsoft.com/en-us/dotnet/core/rid-catalog
> +# for the list of supported runtimes
> +# download_link="$azure_feed/Runtime/$specific_version/dotnet-runtime-$specific_version-$osname-$normalized_architecture.tar.gz"
> +
> +AZURE_FEED = https://dotnetcli.azureedge.net/dotnet
> +DOTNET_RUNTIME_PREBUILT_SITE = $(AZURE_FEED)/Runtime/$(DOTNET_RUNTIME_PREBUILT_VERSION)
> +
> +ifeq ($(BR2_aarch64),y)
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +DOTNET_RUNTIME_PREBUILT_IDENTIFIER = linux-musl-arm64
> +else
> +DOTNET_RUNTIME_PREBUILT_IDENTIFIER = linux-arm64
> +endif
> +else ifeq ($(BR2_arm),y)
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +DOTNET_RUNTIME_PREBUILT_IDENTIFIER = linux-musl-arm
> +else
> +DOTNET_RUNTIME_PREBUILT_IDENTIFIER = linux-arm
> +endif
> +else ifeq ($(BR2_x86_64),y)
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +DOTNET_RUNTIME_PREBUILT_IDENTIFIER = linux-musl-x64
> +else
> +DOTNET_RUNTIME_PREBUILT_IDENTIFIER = linux-x64
> +endif
> +endif
> +
> +DOTNET_RUNTIME_PREBUILT_SOURCE = dotnet-runtime-$(DOTNET_RUNTIME_PREBUILT_VERSION)-$(DOTNET_RUNTIME_PREBUILT_IDENTIFIER).tar.gz
> +
> +# Runtime could be installed in the global location [/usr/share/dotnet] and
> +# will be picked up automatically.
> +# As alternative, it is possible to use the DOTNET_ROOT environment variable
> +# to specify the runtime location or register the runtime location in
> +# [/etc/dotnet/install_location]
> +# This script will install runtime to
> +# /usr/share/dotnet
> +define DOTNET_RUNTIME_PREBUILT_INSTALL_TARGET_CMDS
> +	cp -Rf $(@D)/. $(TARGET_DIR)/usr/share/dotnet
> +	mkdir -p $(TARGET_DIR)/etc/dotnet
> +	echo "/usr/share/dotnet" > $(TARGET_DIR)/etc/dotnet/install_location
> +
> +	# Export dotnet to PATH and libraries to LD_LIBRARY_PATH
> +	$(INSTALL) -m 0755 -D $(DOTNET_RUNTIME_PREBUILT_PKGDIR)/dotnet-runtime-prebuilt.sh \
> +		$(TARGET_DIR)/etc/profile.d/dotnet-runtime-prebuilt.sh
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.sh b/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.sh
> new file mode 100644
> index 0000000000..b059a9c593
> --- /dev/null
> +++ b/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.sh
> @@ -0,0 +1,2 @@
> +export PATH=$PATH:/usr/share/dotnet
> +export LD_LIBRARY_PATH=/usr/share/dotnet/shared/Microsoft.NETCore.App/8.0.6


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
