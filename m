Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBA3C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CC0C40378;
	Sun,  9 Jan 2022 15:09:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bQxnpcDKmQg0; Sun,  9 Jan 2022 15:09:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28D2040198;
	Sun,  9 Jan 2022 15:09:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 284A41BF4D5
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21DF780C40
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:09:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NXzT7ykyTLTn for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:09:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 653AD80BF7
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 15:09:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:884e:4989:9dec:67ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8977A5FF33;
 Sun,  9 Jan 2022 16:09:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641740956;
 bh=5he59n6jyedRvq7SmyGe9EPnaDSxGjoFvPV6fx/tem8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pcl4lzMNuUEf/oxS1ZqkW16m6/C1JSmcHf2DZEoQHZAGG07SSTszlU//mUqAqy8N7
 LbK2r/KsnEghhO4dVKheYC6J/ozilqmEZtfwYJ6xw94Gu1nPDbpKnIllzFrb0dbiuP
 +XQxEeqbUYprnWWuqIES8fDjoimjRwbeH0t/BO9GzHWSQh1hvCLtUB+XcftFAknXIA
 qSaZz5xkBhQEJ5d/BHZp0BLfj+9vNTPTEVinsTWZy3mhZRpF34eiG01QOI2f3YayG3
 mIaH7ahxE6KJJ4rYXG+D+4hGAaBbGZ9QFnbKZk5G2RoRQ9GTJFy7Kf8hwCHxLVO6W+
 hmXQW//as3T8A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jan 2022 16:09:14 +0100
Date: Sun, 9 Jan 2022 16:09:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20220109150914.GB1477939@scaer>
References: <20201017221743.160029-1-nolange79@gmail.com>
 <20201017221743.160029-3-nolange79@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201017221743.160029-3-nolange79@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 3/4] package/busybox: explicitly state
 binutil paths
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Norbet, All,

On 2020-10-18 00:17 +0200, Norbert Lange spake thusly:
> Pass paths to ar, nm, ranlib binaries. This allows linker-plugins
> to be used.

I have expanded/reworded the commit log to explain why this is needed
specifically for busybox.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/busybox/busybox.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 01f7331221..221b8adf59 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -94,6 +94,9 @@ BUSYBOX_MAKE_ENV += \
>  endif
>  
>  BUSYBOX_MAKE_OPTS = \
> +	AR="$(TARGET_AR)" \
> +	NM="$(TARGET_NM)" \
> +	RANLIB="$(TARGET_RANLIB)" \
>  	CC="$(TARGET_CC)" \
>  	ARCH=$(KERNEL_ARCH) \
>  	PREFIX="$(TARGET_DIR)" \
> -- 
> 2.28.0

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
