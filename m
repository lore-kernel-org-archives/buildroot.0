Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5C4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 07:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04F7F4047B;
	Sun, 21 Nov 2021 07:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jU8lIBg6BQdM; Sun, 21 Nov 2021 07:22:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44C9140439;
	Sun, 21 Nov 2021 07:22:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCA001BF2F8
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 07:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5F1E606DE
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 07:22:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yRmkVmuo1l5T for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 07:22:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83767605E2
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 07:22:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a1df:22c7:4448:7943])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C458813F85F;
 Sun, 21 Nov 2021 08:22:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1637479335;
 bh=8vhMQYlBFs/By9vCWRDGlpEk6aHeouCpKrDcRJELrQY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uMp3WrUcp1cGzE3E+t/7D4elHwVqVWY6BWr7irOOTr9dKPjA9r9b6vf1ZmYDEVGvo
 V/Iq7lXhkEGsddPgY5/VI4kJRp3jb8McG8YyxwbmbW+n9/Tmx6chNrJQT/xpGOQHQB
 hdk8sy+c1U6gEgRzl9ARrJCaXOfSO6EwCi4X/jMXBGdss82DZGv1dA16cmtQf2hpoo
 LXODMMPAltGWXU1rQyUwRbHmH9BPLt1JkrwnpKi6H76DSfahR4S/5+3N38PJ14StYT
 if7dfLany9XQJ1xamZbBAienCW01deihuIb5D2HBzRw4kQfV/FtkHEexBUNYUqCfw4
 frsG/8T0StxiA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Nov 2021 08:22:11 +0100
Date: Sun, 21 Nov 2021 08:22:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211121072211.GU247986@scaer>
References: <20211120222857.3110528-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211120222857.3110528-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: mount /sys
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

Fabrice, All,

On 2021-11-20 23:28 +0100, Fabrice Fontaine spake thusly:
> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=14351
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/busybox/inittab | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/busybox/inittab b/package/busybox/inittab
> index ff1725c775..22e63d1603 100644
> --- a/package/busybox/inittab
> +++ b/package/busybox/inittab

You missed package/sysvinit/inittab

But we already have /sys in package/skeleton-init-sysv/skeleton/etc/fstab
so how is going to play together?

Adn finalyl, the 1-cent question (I can't afford the one-million dollar
question): how does thing happen with systemd? With openrc?

Regards,
Yann E. MORIN.

> @@ -15,6 +15,7 @@
>  
>  # Startup the system
>  ::sysinit:/bin/mount -t proc proc /proc
> +::sysinit:/bin/mount -t sysfs sysfs /sys
>  ::sysinit:/bin/mount -o remount,rw /
>  ::sysinit:/bin/mkdir -p /dev/pts /dev/shm
>  ::sysinit:/bin/mount -a
> -- 
> 2.33.0
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
