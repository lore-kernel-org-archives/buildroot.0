Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6DBE77187
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 21:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 452D94246C;
	Wed, 18 Dec 2024 21:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cgpbDJKe3qlj; Wed, 18 Dec 2024 21:11:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 045FB4246D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 045FB4246D;
	Wed, 18 Dec 2024 21:11:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BD6DE3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 21:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A1E284FD3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 21:11:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ko0nHrHYzoL1 for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 21:11:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E10980DFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E10980DFB
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E10980DFB
 for <buildroot@busybox.net>; Wed, 18 Dec 2024 21:11:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 07C127803A2;
 Wed, 18 Dec 2024 22:11:50 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58414])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Dec 2024 22:11:50 +0100
MIME-Version: 1.0
Date: Wed, 18 Dec 2024 22:11:50 +0100
From: Julien Olivain <ju.o@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20241108173754.1642869-1-francois.perrad@gadz.org>
References: <20241108173754.1642869-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.9
Message-ID: <87eaff482aa360be1a3827c55ff2d58e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734556312;
 bh=dLncxMYdlHsY1sqwHoCuZjLYv7inbPz1Laxvxhidmm0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kwlqwOMTD3hCqn0z1lyXN/+WQrIrTnRdLpSYbWQjBeVMbje2GcQ+aLC7vANGw4/kq
 mtKAckCeNJaygo7kHoflJ0dE6XBN1YE5CWFVc6PyKeD6dt5R0Q1EhZxtJVMsh3jjtg
 MSBSSlwAtB4y29DoXMgdkToI02O3bTEylMbdFZrAyltVW1zkf5UyeSS6DgQXS+JgF+
 NA9wjFrAF5/FcP2U2WelDik6DWJY2kVR2col967189Dw+Zu6IJSbOPgJZIyyCg+cf6
 wG3Nf70g0bVn2r/NN0tTOz+PY6x1rosU09VVDuZvY+1VU4FuJBT+9FXSswKWekZtIE
 Go8eE956nUQEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kwlqwOMT
Subject: Re: [Buildroot] [PATCH] package/luaexpat: bump to version 1.5.2
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

On 08/11/2024 18:37, Francois Perrad wrote:
> diff LICENSE:
>     -Copyright (C) 2003-2007 The Kepler Project, 2013-2022 Matthew Wild
>     +Copyright (C) 2003-2007 The Kepler Project, 2013-2024 Matthew Wild
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.

> ---
>  package/luaexpat/luaexpat.hash | 4 ++--
>  package/luaexpat/luaexpat.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/luaexpat/luaexpat.hash 
> b/package/luaexpat/luaexpat.hash
> index 621293a0b..91fc9177c 100644
> --- a/package/luaexpat/luaexpat.hash
> +++ b/package/luaexpat/luaexpat.hash
> @@ -1,3 +1,3 @@
>  # computed by luarocks/buildroot
> -sha256  
> eb7abc4cc39dd50eecb30896686bac84e66fd3c0774d0749b391e7ac5d222f45  
> luaexpat-1.5.1-1.src.rock
> -sha256  
> 7e6a727e5b57cca713a2f2633f05d7e0cc1e261cc6a7613bbe266e625b2f14da  
> luaexpat/LICENSE
> +sha256  
> a88ac147d2ceaf168fddedd2245928f35d4c0218094142b054db7e9bae0b5b82  
> luaexpat-1.5.2-1.src.rock
> +sha256  
> 9a169eddcc5b1f05e85659a0ba5403a7e3804bc3b6e60b730251d963e1a9ac10  
> luaexpat/LICENSE
> diff --git a/package/luaexpat/luaexpat.mk 
> b/package/luaexpat/luaexpat.mk
> index 73675a8ee..86d800d69 100644
> --- a/package/luaexpat/luaexpat.mk
> +++ b/package/luaexpat/luaexpat.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LUAEXPAT_VERSION = 1.5.1-1
> +LUAEXPAT_VERSION = 1.5.2-1
>  LUAEXPAT_SUBDIR = luaexpat
>  LUAEXPAT_LICENSE = MIT
>  LUAEXPAT_LICENSE_FILES = $(LUAEXPAT_SUBDIR)/LICENSE
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
