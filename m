Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE433C0502C
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91BDC60BF7;
	Sat, 27 Aug 2022 07:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91BDC60BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZdrHRC5uOGK; Sat, 27 Aug 2022 07:55:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8771A60BDF;
	Sat, 27 Aug 2022 07:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8771A60BDF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED47B1BF853
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6BC1414C8
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6BC1414C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZthYTWn7nMv5 for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:55:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F977414C0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F977414C0
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:55:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c2f:c99e:ae80:bcc0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 14B7919F736;
 Sat, 27 Aug 2022 09:55:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 09:54:52 +0200
Date: Sat, 27 Aug 2022 09:54:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220827075452.GM37358@scaer>
References: <20220826211451.33719-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220826211451.33719-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661586905;
 bh=1X51XXwEH/TlX39qIVOUUJrhWKgsx6Ohq0PoMhm4HMQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dhmSyyvaIQipZ06Y7tPADyGiWe6IEiQc0dfL5L0/unr/Fp+jQ4I0HDUbwlKo1SQJ9
 f4vpM+AZuu0SZEGyOyBOGXzlXaqqbPiZQNTPXvk3PxbqvWfCgJqzyu01C1CtGMUyt1
 LKTBrNMMR7BEQDT/QE0RQO3Rvz6SCERuWX7wEiRL+LepdX6sfFu4SIXpUf6miCescG
 pnpWs6eGVljW13CVIyiVcXISgSwuRg5DxruBEEdUA4zflZgqFs/Bmf20ZIDMzJW47M
 xTDVXA75jbHHlMOHi5Rhf15K9XAfF+LOYIayinlAAV00hGM32s231YBHquHfnpxKcw
 jMC7ZIhNc4xyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dhmSyyva
Subject: Re: [Buildroot] [PATCH 1/1] package/libtirpc: security bump to
 version 1.3.3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-26 23:14 +0200, Fabrice Fontaine spake thusly:
> Fix CVE-2021-46828: In libtirpc before 1.3.3rc1, remote attackers could
> exhaust the file descriptors of a process that uses libtirpc because
> idle TCP connections are mishandled. This can, in turn, lead to an
> svc_run infinite loop without accepting new connections.
> 
> https://sourceforge.net/projects/libtirpc/files/libtirpc/1.3.3/Release-1.3.3.txt/download
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libtirpc/libtirpc.hash | 4 ++--
>  package/libtirpc/libtirpc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
> index 56c1d9de3f..1efc3e47e2 100644
> --- a/package/libtirpc/libtirpc.hash
> +++ b/package/libtirpc/libtirpc.hash
> @@ -1,5 +1,5 @@
>  # From sourceforge's info on download page:
> -sha1  51d75be0e5acc094a888f40042b23e128d163cb5  libtirpc-1.3.2.tar.bz2
> +sha1  6e52c39148494e4836e2d5d4f28b11ddfa65394b  libtirpc-1.3.3.tar.bz2
>  # Locally computed
> -sha256  e24eb88b8ce7db3b7ca6eb80115dd1284abc5ec32a8deccfed2224fc2532b9fd  libtirpc-1.3.2.tar.bz2
> +sha256  6474e98851d9f6f33871957ddee9714fdcd9d8a5ee9abb5a98d63ea2e60e12f3  libtirpc-1.3.3.tar.bz2
>  sha256  17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
> diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
> index 9d3c4b5a94..179adc97d0 100644
> --- a/package/libtirpc/libtirpc.mk
> +++ b/package/libtirpc/libtirpc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBTIRPC_VERSION = 1.3.2
> +LIBTIRPC_VERSION = 1.3.3
>  LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
>  LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
>  LIBTIRPC_LICENSE = BSD-3-Clause
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
