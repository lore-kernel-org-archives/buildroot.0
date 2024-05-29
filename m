Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA069C25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 21:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F1894018A;
	Wed, 29 May 2024 21:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vr6dDh_TmFOV; Wed, 29 May 2024 21:52:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AB37403C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AB37403C4;
	Wed, 29 May 2024 21:52:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A56E1D3B9E
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 21:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32E9C4026E
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 21:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRGoTI8DvoYv for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 21:52:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 174A74018A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 174A74018A
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 174A74018A
 for <buildroot@buildroot.org>; Wed, 29 May 2024 21:52:40 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CRDpsR3xDSQU3CRDpsEW08; Wed, 29 May 2024 23:52:37 +0200
Message-ID: <cba4d2dd-cdd7-480c-926b-9152083a19d4@benettiengineering.com>
Date: Wed, 29 May 2024 23:52:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
References: <20240529205618.1118206-1-giulio.benetti@benettiengineering.com>
Content-Language: it
In-Reply-To: <20240529205618.1118206-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfJzeFqIoW2+c48uAhJVj143R608Z+jPPXDap8OutSC3pPj/PAptDKjOU/fcCkIdkgI6kA/4LOrrNJWiuAElklKWvL6A/vlLtdFBYFDVeBcbx3JRzaXdr
 IPnHfCJmFDUkcqcGXFxd7RWCa1iRCigFHQy37UxibicdRtmyaCwrumO26/5pvPs9kKlDHoxCFj3f/2sEmdbGKrf9IqBjCIsbPOLfKlr3UPQJlKfG/OADP8uW
 0ca6kSb328T+SOfNuINHWMaTU340M1ZXiW7fHa2VTKXBNH8Pea+ISVz8yzPoh7+RnAqZCBEJlcVvwlH0/8cQ5D+6R5nuqzZI0c0SgbATSzYbe/aJxQ08JtJh
 zcECKhhkvANivbpUxFM4d3KBRUIP7GG4CTXklMEsWcHlEKCMDYHNUTVEWuVxC9GjAcnbHJq4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1717019557; bh=2bpziWVOAvtdvyux4dOr6dcw2Dxz2AGETt5j4XqLsyc=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=X7fZOQpsJsAhGzKBeMsJRCX3F/7Ku1pzUnK43hFYJa2y0vnXSX7R8UE6ZJQOlU+UP
 QVUQHwMRWXBBy6DioEcAYPjUObnmgnpkaIm1c06XknfZoBlTjvqrBTxJM8A2CL4s1e
 wIv17flEjMQKLFXa9Ga57XTFljiBnwucNG2LOOQ+v4pAiCllrsW0vxaOq4N53kS1IS
 XxS01e0PwHCUdELZC3vBE/+ye0zeLVs+7NANNenkAgs55A31YhnilOIsxvBWMfwAcA
 p1W9137JBSyMvmJEBfbnfTpqkFM+ybdADR2ILJjJ4Ap7kAdZFcJgcJvPGvSM3ONkPe
 xyA9h3l2v0Yvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=X7fZOQps
Subject: Re: [Buildroot] [PATCH] package/dotnet-runtime-prebuilt: new package
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
Cc: James Autry <jautry@tekvox.com>, Jim Reinhart <jimr@tekvox.com>,
 Matthew Maron <matthewm@tekvox.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pardon,

I've forgotten to add me as Maintainer and the hash for LICENSE.txt file.

I wait for some comment before sending a V2.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

On 29/05/24 22:56, Giulio Benetti wrote:
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
>   package/Config.in                             |  1 +
>   package/dotnet-runtime-prebuilt/Config.in     | 29 +++++++++
>   .../dotnet-runtime-prebuilt.hash              |  7 +++
>   .../dotnet-runtime-prebuilt.mk                | 62 +++++++++++++++++++
>   .../dotnet-runtime-prebuilt.sh                |  2 +
>   5 files changed, 101 insertions(+)
>   create mode 100644 package/dotnet-runtime-prebuilt/Config.in
>   create mode 100644 package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.hash
>   create mode 100644 package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.mk
>   create mode 100644 package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.sh
> 
> diff --git a/package/Config.in b/package/Config.in
> index 0aa31d4a94..35cd972ae8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -665,6 +665,7 @@ menu "Interpreter languages and scripting"
>   	source "package/4th/Config.in"
>   	source "package/dotnet6-runtime/Config.in"
>   	source "package/dotnet8-runtime/Config.in"
> +	source "package/dotnet-runtime-prebuilt/Config.in"
>   	source "package/enscript/Config.in"
>   	source "package/erlang/Config.in"
>   if BR2_PACKAGE_ERLANG
> diff --git a/package/dotnet-runtime-prebuilt/Config.in b/package/dotnet-runtime-prebuilt/Config.in
> new file mode 100644
> index 0000000000..f519555472
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
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_PACKAGE_DOTNET_RUNTIME_PREBUILT_ARCH_SUPPORTS
> +	select BR2_PACKAGE_HOST_CMAKE
> +	select BR2_PACKAGE_ICU
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBKRB5
> +	select BR2_PACKAGE_LIBZLIB
> +	select BR2_PACKAGE_LTTNG_LIBUST
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
> index 0000000000..f2cc3d9d22
> --- /dev/null
> +++ b/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.hash
> @@ -0,0 +1,7 @@
> +# Locally calculated
> +sha256  811b3d6d052e0d37c5cb2f6746cb950ae7c87a1c5082897a27bcd9258c94de66  dotnet-runtime-8.0.6-linux-arm.tar.gz
> +sha256  0c1355dfba7b0e354294fd202274e4fa1838b93afcc180ecf667e25e5d1b7df6  dotnet-runtime-8.0.6-linux-arm64.tar.gz
> +sha256  cfecba75d6497e14a06f04096c0be6bb57938ef23abd3c5ff6639bd999dbb9a1  dotnet-runtime-8.0.6-linux-musl-arm64.tar.gz
> +sha256  566c219fb59864c23333a254092c5b9644717164ad047050ccad06b79f710700  dotnet-runtime-8.0.6-linux-musl-arm.tar.gz
> +sha256  15c7219c2630d81131c0b47a7c6577f0f76f56ea0ed8dd337748d0b5929834d9  dotnet-runtime-8.0.6-linux-musl-x64.tar.gz
> +sha256  b29b4e02b622cf0ff4581b0a96824b74a6690e97b95158a2e3d8fb43342dadfd  dotnet-runtime-8.0.6-linux-x64.tar.gz
> diff --git a/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.mk b/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.mk
> new file mode 100644
> index 0000000000..6dc72b5cdb
> --- /dev/null
> +++ b/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.mk
> @@ -0,0 +1,62 @@
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
> +ifeq ($(DOTNET_RUNTIME_PREBUILT_IDENTIFIER),)
> +$(error "Target platform is not supported by dotnet")
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
