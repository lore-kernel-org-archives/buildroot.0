Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5242AC021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 15:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFA7560E41;
	Mon, 17 Feb 2025 15:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SdXA3FCgqIz3; Mon, 17 Feb 2025 15:19:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0C9060E49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0C9060E49;
	Mon, 17 Feb 2025 15:19:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31CB3C8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 164B14045A
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rY0C-l3nfLLM for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 15:19:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58AD540422
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58AD540422
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58AD540422
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:19:32 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.115.144]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MD9X9-1tb0Md0epd-00ENhG; Mon, 17
 Feb 2025 16:19:30 +0100
Message-ID: <d93186ec-d97c-479a-b793-9bcbff222b04@gmx.de>
Date: Mon, 17 Feb 2025 16:19:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
References: <cover.1739615626.git.yann.morin.1998@free.fr>
 <9f1441b0cfb92eb66c6d379e2723d52000e35c9f.1739615626.git.yann.morin.1998@free.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <9f1441b0cfb92eb66c6d379e2723d52000e35c9f.1739615626.git.yann.morin.1998@free.fr>
X-Provags-ID: V03:K1:FPfhRtVDCMN44oY58b6ruKWjJJcRt/Bc4PiTAzsIy5QWIe+m3Ze
 0Z5h2eQrWHZeiea3vg3ykhLgqRc1CMa9qpiCmo1ifR3uiSBhn6cwNJayxtptFT8vCEB0AiB
 ooP3NS0MCBpN8yvBLC+KJEuoC3eTirymQY0SNkwE+Au/CyslLxJ1dy43k00Bn5E7oraK52f
 KXA6RsDAUBkyQfWh0XCgQ==
UI-OutboundReport: notjunk:1;M01:P0:NpQ1UThxHRI=;trN5AtlxrSXk0hpDBkmxlby6FPY
 NaMX/eskQAzRHndK3C5mFz/Q0ctiBhU0l/+je2yNINodToQAjHDASZDmXHHuNicjl5kt3FKz6
 ZzYZPcosQMLZ7zwSfDBV4zaIMobjPbxEKFEMaR/LCy1T/DUxmd2oRAEWEAdpXBhZWqG6ZKMNw
 tq69eLSUJ0EGQmbfjNvNgmIaqCvuQGYgyF7s9pWEOvA6mvrch7cIBSXX/ZyDRD2qpegAwuZqC
 cSUyEjqsbQoKqAFsAD47OUTzBhu6ebEynBiAKgRj+ou0ghzbCqqiGlRamg2GJporojracrK4m
 2NcdzK2ECtas3kNf4aTmmQ470ZIToLoN3jVhpBKqrik0TNN9t8s6934kG3alwEJJTogUYXJog
 5KivWyLrcAzq4om1tjPxk23VmeQSYYTNP/7WGk6Lep3B6F/QkfMeTPJc1VN5g78hgJb2ewmUW
 S+sHrHZUIfW+3Vl/Kk6zJf7gAUEuwhYtntyQ2NId2UbHVQQw/C9GJ0aNeHHH0BSHbGv/4G/Xt
 1oqk0v+nyD1WoItCw7K4+03SsHAUlQQrGvLHGVBoeb4qqiZ8nvTDYooXUy3MyILFe/x3ER6sY
 vJCAAVwfpal3qOakKITU31RUvh7B2KjiFBFb8UWsV2Tu+wISTVm2z+kfAC8FpDSNfAzjI8721
 9JuK+WSl2f37lUZGD06OFA2+ruicCsYHMhMCKBiI6/JmbwkjCEsHAwfIgiJNBLFfi4YF82UyK
 cbTaTRPwZfvtRBaFf3RP+ZP9QJ3OgaS0QC2duWtNsREhJAVGpxycs4XhGVwiT6zJcLLDL+isR
 TfMcBN0z7/99QMS910YBpb+PXcB02k3l1GbezPPAgqIfQnYFz6LwgGHp25RqkTCL+8ECzVDzA
 NRAJGggH07XzU9hVpHOexzKUXzY16mILsacrd3um00GD62kyTBNLEAb6SwmB+N8w7tQ6dXCsF
 Lq4fNxofBU+naJ4zAxXcIQ9jf4DnrU8Fhcq926ZBFFmNoc+2L+32w/WNJ8upSFv+p0lASCs+2
 mwB2gLYgOX2TSbgDfdj+axpUsz/KenxkUeQaVdMM1GUivpARa04w4X6w/ulQ2rYr4LQ9vrYop
 IAfa8iuAdw8U8Qf1urBfZcT5vYoThB21NoDzJ4kPz7ZN/Yacr8BkvZmaiXn/EKg/K1YTn2rMC
 zPbcIlotlF2PQH+MSFq/lOwNlL8T8sY8hoY73W3yjJ58R5vMOkJnrRRKfUpOJ4QiaWOPi1mMq
 CB4SvJUfHGw3SFB7s+2mLAKdQqksIP5bSWKToG/taNVCHeIi7HC9sJrvM1BrCMzyUWQ3ex0nS
 YyXhoisbKTC88HmLXiIGucBw+Ex537ndhcyidmp0r6/z0OnvAH+yxtbjDXdfe8rema9UqDS28
 4FA/p1irtvNZBjfBJOGYgBrapPwN1Ty+3KC7yfDj7AdzMhUIHC2aoHsg5p5FlYKw6tUUw2x9X
 qXNvHBw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739805570; x=1740410370; i=fiona.klute@gmx.de;
 bh=1sX9zQs5WmXhliI9ZT5BEE5zAv/ctcxoF+QSnauIi3k=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=kJchLOHW/vjT9H0tx5kXAZ7UKH5Ndpg7TUuVSBqNQI3OXqf6N/eGX6V2YEDusFfn
 I5+6a3CKDUNNLKiEsOpONMybcqc2WeVs5JierQ+qeMyyY7uFyC8RVsExjDlDLr+BE
 M3k3i90LH1H1PltM1lpl01Q+iISwqgd2SpjJ/Ew7RmfsMnOuKGNvyyV8hCSDR4bn5
 EptMWDOn27Kd5vdbbcB6mrHXoWlcUPp2xTT7Jq8JL8NE0CGvvsutcxhGMZteZTJFD
 PpVNr6EE+dnB8cePuet0T9OTkJ4ZlDP4brAgZUxbE7hLrx1nm07u8TORR26l4BOwC
 AR9KNWj0kQ9WzOHANw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=kJchLOHW
Subject: Re: [Buildroot] [PATCH 2/4] package/docker-engine: add option to
 support catatonit as init
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 15.02.25 um 11:33 schrieb Yann E. MORIN:
> currently, docker-engine can only use tini as injected init. catatonit
> as a package exists, but it does not create the symlink that would be
> needed at runtime [0].
>
> Add a choice at the docker-engine level, for which injected init to use,
> bringing catatonit to the integration level of tini.
>
> [0] that could be done in a post-build script, but that's not practical.
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Christian Stewart <christian@aperture.us>
> Cc: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Thanks!

> ---
>   Config.in.legacy                       |  9 ++++++++
>   package/docker-engine/Config.in        | 32 ++++++++++++++++++++++----
>   package/docker-engine/docker-engine.mk |  6 +++--
>   3 files changed, 40 insertions(+), 7 deletions(-)
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index c302b73423..eaf4d708d0 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,15 @@ endif
>
>   comment "Legacy options removed in 2025.02"
>
> +# BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT is still referenced in docker-engine
> +config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT
> +	bool "docker-engine init support is now a choice"
> +	select BR2_LEGACY
> +	help
> +	  docker-engine init support is now a choice. The original
> +	  setting has been adapted; be sure to review it in the
> +	  docker-engine package.
> +
>   config BR2_PACKAGE_LATENCYTOP
>   	bool "latencytop has been removed"
>   	select BR2_LEGACY
> diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
> index e03ecceeff..6338eeeef1 100644
> --- a/package/docker-engine/Config.in
> +++ b/package/docker-engine/Config.in
> @@ -48,16 +48,38 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
>   	help
>   	  Build the vfs filesystem driver for Docker.
>
> -config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT
> +choice
>   	bool "support docker-init"
> +	default BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_TINI if BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT  # legacy
> +	help
> +	  Support providing a minimal init process for containers.
> +	  Required to use "docker run --init".
> +
> +config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_NONE
> +	bool "none"
> +	help
> +	  Do not support docker-init.
> +
> +config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_CATATONIT
> +	bool "catatonit"
> +	select BR2_PACKAGE_CATATONIT # runtime
> +	help
> +	  Support providing a minimal init process for containers,
> +	  using catatonit.
> +
> +config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_TINI
> +	bool "tini"
>   	select BR2_PACKAGE_TINI # runtime
>   	help
>   	  Support providing a minimal init process for containers,
> -	  using tini. Required to use "docker run --init".
> +	  using tini.
>
> -	  This does not change the Docker engine build, the
> -	  docker-init symlink is provided by the tini package
> -	  itself. This option only adds the dependency.
> +endchoice
> +
> +config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_NAME
> +	string
> +	default "tini" if BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_TINI
> +	default "catatonit" if BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_CATATONIT
>
>   endif
>
> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
> index 7467f13b39..c39dc2b440 100644
> --- a/package/docker-engine/docker-engine.mk
> +++ b/package/docker-engine/docker-engine.mk
> @@ -35,10 +35,12 @@ DOCKER_ENGINE_DEPENDENCIES += systemd
>   DOCKER_ENGINE_TAGS += systemd journald
>   endif
>
> -ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT),y)
> +DOCKER_ENGINE_INIT_NAME = $(call qstrip,$(BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_NAME))
> +ifneq ($(DOCKER_ENGINE_INIT_NAME),)
>   define DOCKER_ENGINE_INIT
>   	mkdir -p $(TARGET_DIR)/usr/libexec/docker
> -	ln -sf ../../bin/tini $(TARGET_DIR)/usr/libexec/docker/docker-init
> +	ln -sf ../../bin/$(DOCKER_ENGINE_INIT_NAME) \
> +		$(TARGET_DIR)/usr/libexec/docker/docker-init
>   endef
>   DOCKER_ENGINE_POST_INSTALL_TARGET_HOOKS += DOCKER_ENGINE_INIT
>   endif

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
