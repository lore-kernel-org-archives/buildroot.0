Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98229C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 15:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B20A81FBD;
	Mon, 17 Feb 2025 15:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cv4ua8VaoRAp; Mon, 17 Feb 2025 15:19:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EBF981CA3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EBF981CA3;
	Mon, 17 Feb 2025 15:19:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA6F2C8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 888B54045A
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hUQDPZoh3BvT for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 15:19:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 033B840422
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 033B840422
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 033B840422
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:19:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.115.144]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiJV6-1t77aD45uI-00aIH9; Mon, 17
 Feb 2025 16:19:12 +0100
Message-ID: <26b0b587-f3df-4dc2-8fe6-0ca1e877c774@gmx.de>
Date: Mon, 17 Feb 2025 16:19:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
References: <cover.1739615626.git.yann.morin.1998@free.fr>
 <6f7da99f22b412afc8f202c8b8053e8fec0da9e7.1739615626.git.yann.morin.1998@free.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <6f7da99f22b412afc8f202c8b8053e8fec0da9e7.1739615626.git.yann.morin.1998@free.fr>
X-Provags-ID: V03:K1:TCwPrExpIWxBp9Mi/eTdCG6nBAzcX64bMBDe6YGoDndjtX4fGEl
 sgM0iNMZvBIal5U4oTDbjrrt3NtonUbCsi4X7xW9xPZjSsd7WdstFKZLWlRKbnkfyPjs2ex
 5lfYumNIykghIIEnIKHE2DJ6dfTuj4F/RJDPKzE7yw1TX1ARX0QYYSa70TtrO5+dLGBMrVW
 UG2vBWXIquWW4ThMB/Rvw==
UI-OutboundReport: notjunk:1;M01:P0:/MEPdiPRCdQ=;CsPg0KWsGWXCh0gehSTfeckh+uF
 yX/zi4/zGgEWLv/IemRFVaw9uvQUPj7rxwtolNDORNYAe15hQoHvIQ2FuTfOapLJ6fHPTGSIu
 S/Avt3HMqNCEcoKL8i3id6lLfr0MjEKQb5FIkOQu5kNLryC7cjxlgQ3DcKPbDs2RlDd8+dzpy
 c0b7y/5TTwAgXh2c+NsaxNjD/OP9h0CuJ5r6qYXcXCoYRE8PDyItx3XBtRm2GDlUQj9YElwaf
 OPMWJ1lMsNLlzzV7+0nF/tyl0/PSG9XtbEIO8DAhuC0d9/Joe6muvpFKNhzuGOPrqP2j6rhQn
 CECB9De9k+zFbHDRxZ4+mX9xZkSkwNgc8NKdEIgub9FKf+oS4XugldyloY/06fyV5PcL4JPMy
 IgS2yf76yKbF+CXm8bRtCg9v2NmKkS9sYn9gMxLUPAZqAeSnFIgKpZgQH22LIgsnXWxLaxUY9
 JH0tbvm8ab9VRdLcBvJqoaTztXQxxRnZh8STjnxJkagQ4lukcDMIf3NCeQg/eXQQ+lpB50ERN
 Hqxb3gY9dahBu6o7uwtMqpAjdtanIiEGgJbSj0q9NzkBqotuh1DQNpdp1pF7lP3tYZ4cLumXQ
 25QppO87EuyOLnVSUM30J1oAMY9e3Q0rilf5p8lpvQtphga1JNZ5mjvNxmusHw5DBEmpTr61/
 MlRJVYWXBFIXLPe5U9e4JcLG/L74K2Q2pgMhyLzSSMCowd0kjxaa3JoI3b+rr0orMuFywSsbr
 M8X3ZkWXxrGqE8OgjlhKVywV3HzScK02itCd5cdl07cMPztFzv+PiVkh4FkCSkDV6zbZ1jg4M
 QLgu9SQnkpAoOD/aN6rLruPA4dnb7aUsXPbqFrLbPEKl5GsbiAei0PBoUdWwicosENrs9wEQ6
 02YxccF+a8M49avhvAQwIIxOnQEPbElNAQMWBKlf6eN/I+OtkuSXpTkV0VX1df6ZcR8BYnpfA
 4FOjYDIHWK4BqXbtdu9v7NhInqYn2a52OF5dI361cKz9saK5U88U8gFXIee4K8Z7CGizA2wVl
 fZbzrQka0IhA2fqMdKhFs2pXUnQ+21jFiFtSg6V8gOH+q0rIdLgs7qaF1VzbAZkpOjhsz+HuN
 vTp9Zj+7Wg2o8+C/SHHqH3UVeMQDkK0a5/M3PM2qu+TUShtVvLhwIsTvcAAEfA0xJclddrr04
 wuMm5qkdWYeZlLpNGksCtR3SE8FdgovsqWqEcD0Eu8cna1iR/64jl4qlOktdwzS7P6RmDQn67
 Ac7kmiwFYwAPjjHplCPVndyR2UpD1rToHB0lk7A8kuA9zequKXGDkN+Y5UjwiX6tdpuBVs+k7
 2PJI0kdwAi7fWJ67gv2QKZ5taCvlXR8zRJjmKQa7ksg6PV76pUjrFIORcZBxl0FFHKxOsO0Y8
 IeIdY2UM6tqa3C6z7I49ELog1UXpNKyGj8W5ewmXoKtIyOXITgz4lGM2YL016ZBKEh7H/Zvse
 CagQYfw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739805552; x=1740410352; i=fiona.klute@gmx.de;
 bh=tLAe3ebmoA7pASg3BT7LnbyvLw19c59a5nhTZvAhRdE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=YaIrfalaRzvE2NJjJtnBWAEXJGs+CzW62ZD6h/9FNbtWZuKAVKbIp3Ym7bLK4BxR
 gIyQ1PtdPoMycB7C9q4tueWydTLdaQ0VO3JQQ6NTDADh5vptlaRW66oXXDC/qBNS3
 VRelth4zhV13HH5Bb+w2hpr/6AelnPkXVmYToAdA6ALMq9MiNAsyX8ct3EOmu2K7/
 UENCuX+KQ7THJmOQIDlX2jfxPBpcXa+7NmmDUFTcW/lzaZWZL51T9GW8Ts/38lwDJ
 C8yhgOdBuKEJc7iWUYNPuYMZzQLWlGBzHO0pdFYqUeKHPnZ4KdkG3HZ+6YvdBhs6f
 AJDrHkmmOQyjQYEmhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=YaIrfala
Subject: Re: [Buildroot] [PATCH 1/4] package/docker-engine: carry the tini
 init symlink
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
> tini can be used standalone, not just as an init injected by docker.
> As such, creating the docker-engine's init symlink does not belong to
> tini itself, but to docker-engine.
>
> This will also help later, when we allow docker-engine to use another
> init alternative, catatonit (already paclkaged in Buildroot, but not
> integrated with docker).
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Christian Stewart <christian@aperture.us>
> Cc: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Thanks!

> ---
>   package/docker-engine/docker-engine.mk | 8 ++++++++
>   package/tini/tini.mk                   | 2 --
>   2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
> index ba4e7a4ae0..7467f13b39 100644
> --- a/package/docker-engine/docker-engine.mk
> +++ b/package/docker-engine/docker-engine.mk
> @@ -35,6 +35,14 @@ DOCKER_ENGINE_DEPENDENCIES += systemd
>   DOCKER_ENGINE_TAGS += systemd journald
>   endif
>
> +ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT),y)
> +define DOCKER_ENGINE_INIT
> +	mkdir -p $(TARGET_DIR)/usr/libexec/docker
> +	ln -sf ../../bin/tini $(TARGET_DIR)/usr/libexec/docker/docker-init
> +endef
> +DOCKER_ENGINE_POST_INSTALL_TARGET_HOOKS += DOCKER_ENGINE_INIT
> +endif
> +
>   ifneq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),y)
>   DOCKER_ENGINE_TAGS += exclude_graphdriver_btrfs
>   endif
> diff --git a/package/tini/tini.mk b/package/tini/tini.mk
> index 83e86237d4..c195c69023 100644
> --- a/package/tini/tini.mk
> +++ b/package/tini/tini.mk
> @@ -31,8 +31,6 @@ endef
>
>   define TINI_INSTALL_TARGET_CMDS
>   	$(INSTALL) -D -m 0755 $(@D)/bin/tini $(TARGET_DIR)/usr/bin/tini
> -	mkdir -p $(TARGET_DIR)/usr/libexec/docker
> -	ln -sf ../../bin/tini $(TARGET_DIR)/usr/libexec/docker/docker-init
>   endef
>
>   # Tini's CMakeLists.txt is not suitable for Buildroot.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
