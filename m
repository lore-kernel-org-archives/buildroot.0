Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EECCC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 08:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E32FF410D5;
	Sun, 18 Sep 2022 08:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E32FF410D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y-bs9v9A5l0E; Sun, 18 Sep 2022 08:48:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 602F8400D6;
	Sun, 18 Sep 2022 08:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 602F8400D6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 435961BF282
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EA7660E14
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EA7660E14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X2qrV7Mn3Mt2 for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 08:48:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D93760E07
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D93760E07
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 08:48:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2a18:6673:cb9f:3864])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 204A713F87F;
 Sun, 18 Sep 2022 10:47:58 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Sep 2022 10:47:57 +0200
Date: Sun, 18 Sep 2022 10:47:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20220918084757.GD1419013@scaer>
References: <20220918080545.2889509-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220918080545.2889509-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663490882;
 bh=RnnSScBnnxXNgBfjbnbE9LwL7XfBemJ+bksDqmBQzhw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QPLVww/CjFMSflXWTrQmo2S175z8xn50yjzhlVra5/Q0GpjqzQw5iBDEJA52hHW3y
 KAF7s98kvl5vlz7UxAvzWEU63HcuLyS3R+74HNmdAtF+RzShJkqqrE0K+ZmdfIA19m
 EyKwTSJ6J9yzDWbbpS3jw4W0KBe/XoZd24T9CLLrY7uoH+H+5j31j4vodrUVMiyhwW
 d2f4dtv9/jazTvd4PSDCQ7qCnCkxOm2GrN5xD7iSkUV1J3xVyr1vt8HHFTqZ9SwHp3
 7MrXcXwbU9Rw6HEiLEZLRV7YmG5jlROeChl8Jk4KpBWTP3lwXf4BtGGyPaX9YzQgM2
 0PPRhW1vvc3KA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QPLVww/C
Subject: Re: [Buildroot] [PATCH] fs/cpio: add legacy entry for renamed option
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2022-09-18 10:05 +0200, Yann E. MORIN spake thusly:
> Commit 4fd5d80e9dc0 (fs/cpio: accept a list of dracut.conf files) was
> initially submitted before the first release wth dracut support was
> made, so it took the liberty of renaming the option without introducing
> the corresponding legacy entry.
> 
> But the patch was eventually applied after a release was made with
> dracut support. In that case, renaming an option requires that the old
> option be added to legacy, but that was understandably missed.

As Arnout pointed out, it was applied on next, not master, so is not in
a relase, soo all is good.

Patch rejected.

Regards,
Yann E. MORIN.

> Fix that now.
> 
> We had two potions: revert to the previous name and add no legacy entry,
> or keep the new name and add a legacy entry.
> 
> We choose the latter, because the new name with the plural form really
> denotes that more than one file may be specified, and because we do not
> expect too many people to be using that feature yet, so the burden of
> updating should not impact too many (and it is very easy to update
> anyway).
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thierry Bultel <thierry.bultel@linatsea.fr>
> Cc: Adam Duskett <aduskett@gmail.com>
> ---
>  Config.in.legacy  | 13 +++++++++++++
>  fs/cpio/Config.in |  1 +
>  2 files changed, 14 insertions(+)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 631b31689b..b0aa8dff90 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,19 @@ endif
>  
>  comment "Legacy options removed in 2022.11"
>  
> +# Note: BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE is still referenced
> +# from fs/cpio/Config.in
> +config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE
> +	string "dracut configuration file option renamed"
> +	help
> +	  The option was renamed to make it clear it accepts more
> +	  than one file.
> +
> +config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE_WRAP
> +	bool
> +	default y if BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE != ""
> +	select BR2_LEGACY
> +
>  config BR2_PACKAGE_GPSD_OLDSTYLE
>  	bool "gpsd oldstyle removed"
>  	select BR2_LEGACY
> diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
> index 94a826f9e4..6368dcccb5 100644
> --- a/fs/cpio/Config.in
> +++ b/fs/cpio/Config.in
> @@ -31,6 +31,7 @@ if BR2_TARGET_ROOTFS_CPIO_DRACUT
>  
>  config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES
>  	string "dracut configuration files"
> +	default BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE if BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE != ""  # legacy
>  	default "fs/cpio/dracut.conf"
>  	help
>  	  Space-separated list of Dracut configuration files. They
> -- 
> 2.25.1
> 

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
