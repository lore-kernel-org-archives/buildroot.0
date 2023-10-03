Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01671E8FDB7
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 20:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 913D860C13;
	Tue,  3 Oct 2023 20:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 913D860C13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5YqC5evJgagC; Tue,  3 Oct 2023 20:47:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C87E36101A;
	Tue,  3 Oct 2023 20:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C87E36101A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A32A1BF574
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 20:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3274241F60
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 20:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3274241F60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RL9mF-gVgYk2 for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 20:46:59 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D654341D76
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 20:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D654341D76
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c4b3:c81e:8436:9d13])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id DD019780371;
 Tue,  3 Oct 2023 22:46:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Oct 2023 22:46:54 +0200
Date: Tue, 3 Oct 2023 22:46:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231003204654.GH2957@scaer>
References: <20231003124336.2837869-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231003124336.2837869-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696366017;
 bh=gxYrkkxbP6zecYqwzv2sIB37XMh/fCr8CMVCRKZfAOY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i4yVgtbEnxwQf5GgxWZrUe4W6eVJbRZJYDGQJVW/cMXOqoW257kRj+Ss0giSSweiN
 +3LHVjHiThDOs/wWISo5pS8UjCZFS+wW5LpBydZ3PFA+Ge6VeHgRdTKUlth4zDaBrz
 6z3EbmMQU5QqiIGFkTRgJhsfy32hgeufP7bXrq3BB4s4UO0jeKwbLD9IPV/3+mNGEY
 rLh20Sj1YNdBfhEBkV/uZMJf4XVy6PZn1fH4NJTNjtEQ2w8oZHGSLHbGDokhNj4/pV
 ePQriaBJYArA/kS9ZTLXnh9buiYm49qf0e0daju3hiKwhrH1kvHFLDU5I9jse7G+YP
 xaOUAPqRBXv2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i4yVgtbE
Subject: Re: [Buildroot] [PATCH 1/1] package/libcodec2: bump version to 1.2.0
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

Bernd, All,

On 2023-10-03 14:43 +0200, Bernd Kuhls spake thusly:
> Release notes: https://github.com/drowe67/codec2/releases/tag/1.2.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libcodec2/libcodec2.hash | 2 +-
>  package/libcodec2/libcodec2.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libcodec2/libcodec2.hash b/package/libcodec2/libcodec2.hash
> index edaa275bbc..828efa3e4d 100644
> --- a/package/libcodec2/libcodec2.hash
> +++ b/package/libcodec2/libcodec2.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  44015b071968d98ee326012c498db6a8308bed1a7a914ecb6d4d8e2a354a4611  libcodec2-1.1.1.tar.gz
> +sha256  cbccae52b2c2ecc5d2757e407da567eb681241ff8dadce39d779a7219dbcf449  libcodec2-1.2.0.tar.gz
>  sha256  9ebb6f82b7380a62ac74c5f0322c88e6744dedf2ebe1f54d6f088282b39844bf  COPYING
> diff --git a/package/libcodec2/libcodec2.mk b/package/libcodec2/libcodec2.mk
> index 295dd8983f..5fc190aefd 100644
> --- a/package/libcodec2/libcodec2.mk
> +++ b/package/libcodec2/libcodec2.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -LIBCODEC2_VERSION = 1.1.1
> -LIBCODEC2_SITE = $(call github,drowe67,codec2,v$(LIBCODEC2_VERSION))
> +LIBCODEC2_VERSION = 1.2.0
> +LIBCODEC2_SITE = $(call github,drowe67,codec2,$(LIBCODEC2_VERSION))

I was curious to see that they dopped the leading 'v' in front of tags,
so I had a look at the repository, and indeed the 1.2.0 tag has no
leading 'v'.

But surprisingly, *there is no other tag*! Even the v1.1.1 tag that we
were using so far is missing!

So I had a look, and stumbled on:
    https://github.com/drowe67/codec2/issues/5

Basically, the full history was rewritten for some reason, the old
repository has been moved to;
    https://github.com/drowe67/codec2-dev/

So, this is an important bit of information: we need to fix the existing
maintenance branches to refer to the old repository (or backport this
commit).

I have added a blurb about that in the commit log, and applied to
master.

Regards,
Yann E. MORIN.

>  LIBCODEC2_LICENSE = LGPL-2.1
>  LIBCODEC2_LICENSE_FILES = COPYING
>  LIBCODEC2_INSTALL_STAGING = YES
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
