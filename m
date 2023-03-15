Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C19C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 10:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFEC060E7C;
	Wed, 15 Mar 2023 10:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFEC060E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NTOT9N03ldBY; Wed, 15 Mar 2023 10:13:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29A4F60BAB;
	Wed, 15 Mar 2023 10:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29A4F60BAB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D555E1BF5E0
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 10:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AED92813BE
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 10:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AED92813BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hV6qSVqYY5C0 for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 10:13:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5227C813B0
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5227C813B0
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 10:13:31 +0000 (UTC)
Received: from [172.20.10.9] ([151.36.255.68])
 by Aruba Outgoing Smtp  with ESMTPSA
 id cO8NppT7dBDVWcO8NpMEuJ; Wed, 15 Mar 2023 11:13:28 +0100
Message-ID: <08b690c2-155b-3036-4abc-ed41f4996316@benettiengineering.com>
Date: Wed, 15 Mar 2023 11:13:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US, it
To: buildroot@buildroot.org
References: <20230314233719.55e2f430@windsurf>
 <20230315100848.57061-1-giulio.benetti@benettiengineering.com>
 <20230315100848.57061-2-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230315100848.57061-2-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfEHMlxuwogzfSbwH6xvGcQKVJKeBsmFWbpqNNGKKJDr/WZ2aZ+04mw9zxV0jrYdL5BHL/JS0M+VCkyZPa5rgOoxlTfCcth/HwGfyRdMvrow3PeraEiVx
 0+B656bKXLEdBa0tgR20Qmq52xxts7lFtkj9UE3MwDvfDPrZVSP9umHP/YMA2OFk3gIPMtoGaS4WQY/ck1UAPjvFfLGpdqrqdqqv/IpabFHqWa+ktqWW4Ggs
 c57x3MUFGX9T1ekJHvDVPCSMObD1DhrnaF8Wp4XIZ2DF3Sf6g3Ii+zfiJbtpvb3t
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1678875208; bh=d/Tdo6mCGxfjifBzAaSt0jE/xx0mMwAApwOIFCeZmyk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Qsn6MGwhG+hVwnuOrq8NMh0aOnNwFdLGxRdpSWplkbGQkdrPHZdDRtCPZ3NvPhRDp
 0qemFhSor5p8RAPK27rfueErLmiUWbGtoz4CcqVQy1egA2PsFbKr05Tp5e6tQVPKM/
 xWp+cVaRutYqRvGQqxRf/FSO1dwZqyStw0ucF26LAjT3RXWMEypP+yVrjEUkI9Q0h7
 nnm7vsskdwVv+BgsFgRjG4BH7/Fam78Ya8hgXEraQJsylvQvQ5WzUyjvVKmbmWhP40
 ejffxoRKfeSHLZx6nzBECIZyljDetZkRCCfVkiinXe74OtqA6xss0rnWfVMcVHQMR0
 u4dY69pUdLIFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Qsn6MGwh
Subject: Re: [Buildroot] [PATCH v2 2/2] package/swugenerator: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is V3... Sorry!

On 15/03/23 11:08, Giulio Benetti wrote:
> Add swugenerator as host utility to generate images for swupdate with all
> the possible options available like encryption, passkey etc. Let's also
> add Giulio Benetti as package maintainer to DEVELOPERS file.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
* use github macro for package _SITE as pointed by Thomas Petazzoni
V2->V3:
> * add host dependency to python-libconf

Sorry again for the noise
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   DEVELOPERS                             |  1 +
>   package/Config.in.host                 |  1 +
>   package/swugenerator/Config.in.host    |  6 ++++++
>   package/swugenerator/swugenerator.hash |  4 ++++
>   package/swugenerator/swugenerator.mk   | 14 ++++++++++++++
>   5 files changed, 26 insertions(+)
>   create mode 100644 package/swugenerator/Config.in.host
>   create mode 100644 package/swugenerator/swugenerator.hash
>   create mode 100644 package/swugenerator/swugenerator.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 8ddffbf428..453fbf4b0f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1186,6 +1186,7 @@ F:	package/rtl8821cu/
>   F:	package/sunxi-mali-utgard/
>   F:	package/sunxi-mali-utgard-driver/
>   F:	package/sunxi-tools/
> +F:	package/swugenerator/
>   F:	package/trace-cmd/
>   F:	package/udisks/
>   F:	package/wilc-driver/
> diff --git a/package/Config.in.host b/package/Config.in.host
> index edfe7ce4b3..7059d78eb8 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -101,6 +101,7 @@ menu "Host utilities"
>   	source "package/squashfs/Config.in.host"
>   	source "package/sunxi-tools/Config.in.host"
>   	source "package/swig/Config.in.host"
> +	source "package/swugenerator/Config.in.host"
>   	source "package/systemd/Config.in.host"
>   	source "package/tegrarcm/Config.in.host"
>   	source "package/ti-cgt-pru/Config.in.host"
> diff --git a/package/swugenerator/Config.in.host b/package/swugenerator/Config.in.host
> new file mode 100644
> index 0000000000..df0e9a5170
> --- /dev/null
> +++ b/package/swugenerator/Config.in.host
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_HOST_SWUGENERATOR
> +	bool "host swugenerator"
> +	help
> +	  A host tool to generate SWU update package for SWUpdate.
> +
> +	  https://github.com/sbabic/swugenerator
> diff --git a/package/swugenerator/swugenerator.hash b/package/swugenerator/swugenerator.hash
> new file mode 100644
> index 0000000000..2125be3d1c
> --- /dev/null
> +++ b/package/swugenerator/swugenerator.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated
> +sha256  b5c47c47be0df4df476d2bf596f58a7296a4b0cebe6c8de42251605475b37d25  swugenerator-0.2.tar.gz
> +# Locally computed sha256 checksums
> +sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
> diff --git a/package/swugenerator/swugenerator.mk b/package/swugenerator/swugenerator.mk
> new file mode 100644
> index 0000000000..f4ead1d229
> --- /dev/null
> +++ b/package/swugenerator/swugenerator.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# swugenerator
> +#
> +################################################################################
> +
> +SWUGENERATOR_VERSION = 0.2
> +SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,v$(SWUGENERATOR_VERSION))
> +SWUGENERATOR_LICENSE = GPL-3.0
> +SWUGENERATOR_LICENSE_FILES = LICENSE
> +HOST_SWUGENERATOR_SETUP_TYPE = setuptools
> +HOST_SWUGENERATOR_DEPENDENCIES = host-python-libconf
> +
> +$(eval $(host-python-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
