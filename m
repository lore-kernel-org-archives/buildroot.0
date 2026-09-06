Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D0AC79F8C
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 16:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF44880B03;
	Sun,  6 Sep 2026 16:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ke5bm7xcC8va; Sun,  6 Sep 2026 16:33:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 590F580AA2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788712435;
	b=TrKpgBxppZrpgzY8w4QUCyKw1mI06Ak6uKrAEjxDhBgSra0dSHyrMV2sycpC7O03zLg4
	 9+KMvaDTQ85KGHmQ098alEDrIHYnxjUdP4m4kTnJPwzWKDeBZuuemli2OppLT6p/LUQy3
	 2Ro6AbhEnftl5p1edUbAbyW5e3hVejxeW8P+f519+oR4UntXZ7fNP/1UB7bOALoLg0TCl
	 XZYLEueCDSpd5pie58eiOxIORBWtsmKtxzr+JL/B6nHNwaZnbAIXtnMOvCEVV+w3eW2mv
	 fOVIrnmbyvm2idmDKZiFV4pvkAnXkanF3EohyaeuQZqqDW6hX/XJTI95WnabGhJX2cQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788712435;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=JNh7fJpRl8ZNZoyx9Ne0OoOOawhTb6XiIP6D2RRDHYg=;
	b=Kkwu3dvQsYPuqz9Uv5x3Jh7Z8zDfXzQBtNc+bmin9asXgGgn3BwcFHeOsJIxdzBLvgFd
	 AkXTtr135pXuAFXsxQ5ajRxjAX/es5hU8Hc99ElVhO8KOmseYPcy5NB6z+aVzvZUp5avY
	 mmpC4KRqdKnq9aBe/qtPkHLpxP7m2Vl0FNIGAgcqNeocjw1ZRYpb6UT0EwpSwbzv+C94B
	 uffllbVG0gi1bPt6A9qgwwJ32a9BzUgXEbHUWu1JmzQf0AKlWGZHaparZULJcdiHPusw8
	 qxERVNQ4Om8maDXdSoYA6cHOXSHAO4sqbHDI9RPQ5l5vjj9yTxspnlqT5NeFBm192Yg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788712435;
	bh=JNh7fJpRl8ZNZoyx9Ne0OoOOawhTb6XiIP6D2RRDHYg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nfk8y4PxBUPQz6aWu+nAfgRsxVcXgq24y2iSCPF8KkyYBrwBW4AQrPlBETsS1SJNn
	 C3Fm+8dNtmZc1IoVb2k6LXIE0qMvkPgx98Je+WjEiSNqh3ppfcKjLE0MCj+9T1pPXA
	 t48ILLWvgCSZIG361cZC1xqxIgFSUprFqgvuDQIZLKcUSUoU/iIUxaZHtyO6yzI5Bu
	 y/y0ANoupwlymX9WfAI73VbozGiB34codyhdBqbwGuIjW20enqkxURjtaPrmPfZqby
	 5mKjA2CYfUm6JGWM/RBoSXn2Djq908nWZBf6x6f7ILW8F7wPBv8yIifKC7UV6+ofvn
	 Oj1o/OMfPiSyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 590F580AA2;
	Sun,  6 Sep 2026 16:33:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3643B118
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2822D40067
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8f_SOkj65J4 for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 16:33:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 84DA04000B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788712432;
 b=q8VUUU69Y789xDN8vANANUF4Sfpg3APOAy/RAthUQ3CnzVamho9rfWgIcOgTd1U0NOSN
 rnTzb2ewTUkTq3UlElNFyOor1UKM7NCRtxg/oPn8SNztwA37qJJhN29KVCz9TgKVR0XB9
 I1FtZ/HYDsIa+24RuaSEDDY5Z8BMubIyI5/oLXJTCQnhnq6Oll7ixhpbuF2uVE8Qb6pnn
 rY66hMKookwwprJTUwgZhmdJwLTQqD4fSwNkP0lmpwChJZ8HEObp6RPDm8Yp/T1SnxiJ7
 U8n/8SUf2NgdIMrmFj9nJiWIByhTg2ZHUAerkVDVKZ6q7PRFs6FufVpukwPJ+lhv8Hw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788712432;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=w01PHx/quC+IQelCHIjtgDDVxQitD9v5SRAafv65czw=;
 b=p3pV3lNPAvJvPlzm1ug3xXvOQvE41yX8LvwvT36H9c+wcL9EvSbxU+chM4oVQagEXUbg
 ftwBzNyUINhmDOXMMNWH3HZYvoRuR9mZwLGcu7Vx9sdHd67TkLkav8IX+eIlY6jXbipHE
 zpAU5Lb08ap7nzNwYSTx2oV27w4lW4u5K05FHX1Ifxxp2AWdzzB5dt48QCLPJ8lKzSHdD
 09G0AWkKy4jfxfyn+mbHn/Ki0XEC89kanFidmkpocx9JNuEtxp19gi9nY0N3nt1pq21/u
 ZeBnyuwVkbKVqOiTRWXc8owe+0/d49vmbHeqeRJoHasI/6Sq4mbv5QX6s+rom53miDg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="NGoH/idn"; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84DA04000B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:33:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id EBE8A13F8B8;
 Sun,  6 Sep 2026 18:33:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 18:33:46 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 18:33:46 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, Romain
 Naour <romain.naour@gmail.com>
In-Reply-To: <20260816103037.1714478-2-bernd@kuhls.net>
References: <20260816103037.1714478-1-bernd@kuhls.net>
 <20260816103037.1714478-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <5376808d1b45676c1c56f403dae88d16@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 2/2] package/{mesa3d,
 mesa3d-headers}: bump version to 26.2.0
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

Hi Bernd,

Thanks for the patch.

On 16/08/2026 12:30, Bernd Kuhls wrote:
> https://lists.freedesktop.org/archives/mesa-announce/2026-August/000863.html
> "One important note for packagers is that there is now a Mesa community
> maintained libclc fork that is verified to pass the OpenCL CTS with
> Mesa/Rusticl, and will fix bugs after an upstream libclc major release
> branch goes EoL. The Mesa build system will pick it up when available,
> and fall back to upstream libclc if not. This libclc fork is not
> verified for any other usages or users of libclc outside of Mesa."
> 
> This bump includes the switch to the newly introduced mesa-libclc
> package.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[...]
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 99ef0f5edb..a77ac8930e 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -5,7 +5,7 @@
>  
> ################################################################################
> 
>  # When updating the version, please also update mesa3d-headers
> -MESA3D_VERSION = 26.1.7
> +MESA3D_VERSION = 26.2.0

With this new version, the patch introduced in
https://gitlab.com/buildroot.org/buildroot/-/commit/79554a4520f3d3c07c3ddf12e6c64669b5a9cc8a
needs to be rebased.

Even with this patch rebased, I also tried to run the mesa3d runtime 
test,
which run rusticl. Running the command:

utils/docker-run support/testing/run-tests \
     -k -d dl -o output_folder \
     tests.package.test_mesa3d

fails at configure time, with the error message:

output_folder/TestMesa3DRusticl/build/mesa3d-26.2.0/src/compiler/spirv/meson.build:83:23: 
ERROR: Tried to mix a host machine library ("vtn") with a build machine 
target "vtn_bindgen2" This is not possible in a cross build.

Could you have a look, please?

>  MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
>  MESA3D_SITE = https://archive.mesa3d.org
>  MESA3D_LICENSE = MIT, SGI, Khronos
> @@ -52,7 +52,7 @@ endif
> 
>  ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
>  MESA3D_PROVIDES += libopencl
> -MESA3D_DEPENDENCIES += clang libclc
> +MESA3D_DEPENDENCIES += clang mesa-libclc
>  endif
> 
>  ifeq ($(BR2_PACKAGE_MESA3D_RUSTICL),y)
> @@ -350,7 +350,7 @@ HOST_MESA3D_CONF_OPTS = \
>  	-Dvulkan-drivers=""
> 
>  HOST_MESA3D_DEPENDENCIES = \
> -	host-libclc \
> +	host-mesa-libclc \
>  	host-libdrm \
>  	host-llvm \
>  	host-python-mako \
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
