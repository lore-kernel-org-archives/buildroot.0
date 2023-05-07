Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D2AC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 19:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2042821AB;
	Sun,  7 May 2023 19:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2042821AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ur-E1JRTfh4x; Sun,  7 May 2023 19:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07A31821A7;
	Sun,  7 May 2023 19:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07A31821A7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D1BB1BF2CD
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 19:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10489821A7
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 19:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10489821A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nMWE8G5yHe6C for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 19:13:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A900821A2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A900821A2
 for <buildroot@buildroot.org>; Sun,  7 May 2023 19:13:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1866419F732;
 Sun,  7 May 2023 21:12:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 21:12:59 +0200
Date: Sun, 7 May 2023 21:12:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20230507191259.GG252090@scaer>
References: <20230503043906.111554-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230503043906.111554-1-fido_max@inbox.ru>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683486782;
 bh=hJ4zYr8CjKchOYlF5cZZnU50nhuLvFzt6oaBwlL1+gw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jljYJZ3LpmJhFeWzgPvrS95RkpH951YIWdtlBI0yGMEQAo7RD7o3lxjTZ+n1BBrq+
 CUoYlbeiLwXJbNj+SBxF38kfck8ju7VT8e71nBtXYnXcmBJ1Eh9etKQ+fhIbw/5oqH
 8CtNvnxTjA5SuQV1yqIO9IYEpgAhJCRU7uWqPrw2A0/xhDKvgjF4tvLwcKnFE7N4T4
 rWb8VtUJUeDidaGDr7ecqhBYNzru9ZmhX/HUmJu/Mn3VdMrSDVK1li1Zm7PPvTuTQ3
 Z+AszJhchMllNQh6FH0jSLCWAu2S3/5Vw43uIePw5xAWNhB/F4zMrfjfn2wUFFCw7i
 vAPhkeHKhJ4Bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jljYJZ3L
Subject: Re: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.11.2
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Maxim, All,

On 2023-05-03 07:39 +0300, Maxim Kochetkov via buildroot spake thusly:
> Changelog: https://github.com/libgeos/geos/releases/tag/3.11.2
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libgeos/libgeos.hash | 2 +-
>  package/libgeos/libgeos.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
> index cd0a4e0330..54f53d19de 100644
> --- a/package/libgeos/libgeos.hash
> +++ b/package/libgeos/libgeos.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  6d0eb3cfa9f92d947731cc75f1750356b3bdfc07ea020553daf6af1c768e0be2  geos-3.11.1.tar.bz2
> +sha256  b1f077669481c5a3e62affc49e96eb06f281987a5d36fdab225217e5b825e4cc  geos-3.11.2.tar.bz2
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
> index c6d470dc97..5a7932bad2 100644
> --- a/package/libgeos/libgeos.mk
> +++ b/package/libgeos/libgeos.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBGEOS_VERSION = 3.11.1
> +LIBGEOS_VERSION = 3.11.2
>  LIBGEOS_SITE = http://download.osgeo.org/geos
>  LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
>  LIBGEOS_LICENSE = LGPL-2.1
> -- 
> 2.39.2
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
