Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68692C4167B
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 08:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4453402E0;
	Sun,  1 Jan 2023 08:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4453402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wpnGosESKYbB; Sun,  1 Jan 2023 08:58:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F4125400E7;
	Sun,  1 Jan 2023 08:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F4125400E7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDD601BF282
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 08:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A449840743
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 08:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A449840743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zCf98PDweOmj for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 08:58:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFDD54071B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFDD54071B
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 08:58:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:80ae:a953:659b:4560])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6A8B8B0055A;
 Sun,  1 Jan 2023 09:57:54 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Jan 2023 09:57:54 +0100
Date: Sun, 1 Jan 2023 09:57:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: unixmania@gmail.com
Message-ID: <20230101085754.GW2498764@scaer>
References: <20221231201700.3105911-1-unixmania@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221231201700.3105911-1-unixmania@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672563477;
 bh=6g+AO72Tn/E+WGpJsbCJCysrDPkp5l0c3s9Su8btLQs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CkXRnkthpqMVu86x8Vaub6PiG1ceO/Ju3FI98WzlZLba4RRXCTC46b04oRyEPWulK
 KEi2qyYDLjKpFWJ0HyqzONWTeIukPoKrZ34lq/n6+7I3G4zU0G47bVHZYMsoTr9USZ
 0n9HLE/KBYqUkG6GCh4Attc9CJuJ/tdPLJpN6uXVDHTndPX0r5+hyxQxVIgx5AAKx0
 uRL8Qy0y/qAe6jUNUUmJwztr8N/Kab3fIPrFHl5nmrinPkT6kDn7frmteJyksvuW4z
 I7Y8NFOwdiac+roSk6wwHC56rdHCpmUY4/j/Wgb6xgegK+Y4Tt/zNMskctxCDFLtCf
 xlMMXgVELPt1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CkXRnkth
Subject: Re: [Buildroot] [PATCH] package/qemu: allow building only the tools
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-12-31 17:17 -0300, unixmania@gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> Commit 44be514b21fd94096702b80c62d46c31d72f15a5 mistakenly forced to
> always build at least user or system emulation but it must be possible
> to choose only the tools (e.g. for a guest VM image).
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/qemu/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index 0f9e353510..435e92781c 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -27,7 +27,6 @@ menuconfig BR2_PACKAGE_QEMU
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_PIXMAN
>  	select BR2_PACKAGE_ZLIB
> -	select BR2_PACKAGE_QEMU_SYSTEM if !BR2_PACKAGE_QEMU_LINUX_USER

But then, we're back to a situation where we can have qemu enabled, but
we're building neither the the system nor user emulation, nor the tools,
which does not make sense.

So, I've changed that to force the tools if neither system nor user
emulation is enabled.

Applied to master, thanks.

Note: in fact, even with all disabled, qemu still installs its binary
blobs, which does not make much sense, so that does not count. Also, I
was pretty sure we had an option for that, but it turns out that my
commit [0] did not make it when I initially worked on this, 10 years
ago [1]... Funny how memory can be flaky. :-) And of course, the option
has changed since then. Sigh... I guess I'll have to respin this...

[0] https://gitlab.com/ymorin/buildroot/-/commit/1b87393f67d7fad5dcd1e2390e4f65cd2d865cab
[1] https://lore.kernel.org/buildroot/?q=s%3A%22add+option+to+not+install+blobs%22

Regards,
Yann E. MORIN.

>  	help
>  	  QEMU is a generic and open source machine emulator and
>  	  virtualizer.
> -- 
> 2.31.1
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
