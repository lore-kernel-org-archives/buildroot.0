Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFA1606A31C
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 11:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LxoanvAL
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3D7160B0C;
	Wed, 11 Nov 2026 11:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdhD_T0jTzHM; Wed, 11 Nov 2026 11:55:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9D34660784
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794398159;
	b=lbpGgCl3z2f0czjpXK02tJHiyLLwuKpn+INFjHFHZWUsv0AvSILVmbs68fB7w/sWQk38
	 yx+80KcQgBCUZOKkfbCCRJl6N93gVqE8WVC0+VVaRVbvjFUPmtx+1bzahNuwE0iTGBdCV
	 CRjTGfwRS0YdnokCD/xXnnsmYwxql4URKlLU3cJQLqNRgYal9oSsSNb260dtkEK1yvBjr
	 iwGEANmQeCjOS4MGd5wWdC5GAVyB3JZ1grZzJE7IFsFmzv0Mt3FXZRByb4VJHJFxUiPL7
	 5qg2rXnX1m/E6eea68D3LKyBU4Grk69G1o0ue205q0fCOiGn10IUvwBHi1R/F9bR1zg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794398159;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=+NQkI79uXxWW/5+LySrmZP5yYKEqP3MZTQJdX7kMa24=;
	b=FD7Gltf71mj5ZhOVwKGVFwRW/Y9FwOusdN4qozcZjUxbrRsfT5VRFrsCUjrdUrv8o9ny
	 buEiiY1QVe303bmDnCWyI/BARoqSwu1Lwi/XuDDH2x+MuvvGEQyAD4XHoB17iP0KmZAMc
	 +7iS06IURwRfWDbFk70h0RicZsuBxBg9588awUS3XKDYvcb8HcbP2Qz6gKFzUvCcMMt/A
	 4reTT+rdch/SPijPzSBQl53piizI5KAJqNLiV4SLPe10AEazrCUDRWvq/FHOFcjPXgbBK
	 88rcV/4wNQDy6gjX/opI8fmR3dV2eZYXXvgdSXP4GKQ2TJNRLfXXlT4vDcizfINlLMw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794398159;
	bh=+NQkI79uXxWW/5+LySrmZP5yYKEqP3MZTQJdX7kMa24=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LxoanvAL/drpp0O0MHuMMr3HOHi19mGC3ZbgKTneCIcvnbuy9NSoq4NNYTGWFk5It
	 sNgyEV5XwbM8aaAyfDKNzR5+5UrYuRqoPhB0nUfVim12CqD4RpO0wb8qeosk95qR/Q
	 We7yR3wRG8US2VvCoJdaUIqDvSfBEud4qgIz+roxou01iuQG/mZeRtsVHPH0UnohD6
	 0z5noQyjl3LFkUXG2d8+0T/tR1jQpXhcHciYF7fF6BQv2kuB2ua3rWmM9IG9jNarTW
	 iZLF+djly9c5fq+YWS4D+bwxmLmKPQ6LlIdLb3QvwWM6vZFqk2B7FPOXasw3eoGGAj
	 x9/KWGPRtLxcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D34660784;
	Wed, 11 Nov 2026 11:55:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4DDE17CC
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6446811F2
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HHJPGkos-uG2 for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 11:55:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E6A69811D0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6A69811D0
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:55:56 +0000 (UTC)
Received: from [IPV6:2a01:e0a:1164:dba0:bf0c:75c5:43f0:4c00] (unknown
 [IPv6:2a01:e0a:1164:dba0:bf0c:75c5:43f0:4c00])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519) (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 3522C180DDE;
 Wed, 11 Nov 2026 12:55:54 +0100 (CET)
Message-ID: <453e2807-4baf-4b9e-a671-141dc9f62f79@grenoble.cnrs.fr>
Date: Wed, 11 Nov 2026 12:55:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Cc: Biagio Montaruli <biagio.hkr@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>
References: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
 <20261110215557.2248804-3-angelo.compagnucci@gmail.com>
Content-Language: en-US, fr
In-Reply-To: <20261110215557.2248804-3-angelo.compagnucci@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/5] configs/acmesystems_acqua_a5_*: bump
 AT91Bootstrap to 3.10.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/11/2026 22:55, Angelo Compagnucci wrote:
> Use the 3.x version of the at91bootstrap3 package, now 3.10.4, instead
> of fetching v3.10.3 from git, and drop the board hash file of the git
> tarball: the package hash file covers the release tarball.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Tested-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Acked-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Specifically, I applied patches 1 and 2 on top of master (7966fa960556
"package/libcurl: fix build on LoongArch with musl"), built the
acmesystems_acqua_a5_512mb_defconfig, booted on an Acqua 512 MiB
board, and logged-in on the serial console.

Best regards,

Edgar.

> ---
>  .../acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash      | 2 --
>  configs/acmesystems_acqua_a5_256mb_defconfig                 | 5 +----
>  configs/acmesystems_acqua_a5_512mb_defconfig                 | 5 +----
>  3 files changed, 2 insertions(+), 10 deletions(-)
>  delete mode 100644 board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
> 
> diff --git a/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash b/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
> deleted file mode 100644
> index 6edf3d3345..0000000000
> --- a/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# Locally calculated
> -sha256  5ea2a8fed1ba0024229c6f6d77176679e1b24791bdbce8e285634013d4a93551  at91bootstrap3-v3.10.3-git4.tar.gz
> diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
> index 5b31f4c692..725b82e86f 100644
> --- a/configs/acmesystems_acqua_a5_256mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_256mb_defconfig
> @@ -22,10 +22,7 @@ BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_AT91BOOTSTRAP3=y
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
> -BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
> +BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X=y
>  BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-256m"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
> diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
> index ed74dd30d6..470ac36de8 100644
> --- a/configs/acmesystems_acqua_a5_512mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_512mb_defconfig
> @@ -22,10 +22,7 @@ BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_AT91BOOTSTRAP3=y
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
> -BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
> +BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X=y
>  BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-512m"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
