Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9112DE748EE
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1025982012;
	Sun,  1 Oct 2023 16:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1025982012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qEKA1xfQ5mk5; Sun,  1 Oct 2023 16:06:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06D1782015;
	Sun,  1 Oct 2023 16:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06D1782015
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A17D1BF4D7
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 010A641929
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 010A641929
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mPtGK0rlyFvM for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:06:05 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B1C641904
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B1C641904
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb04:4ad:b00:7d3f:173d:28ec:8590])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F3C49B0054E;
 Sun,  1 Oct 2023 18:05:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Oct 2023 18:05:59 +0200
Date: Sun, 1 Oct 2023 18:05:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20231001160559.GM2579@scaer>
References: <20230505043002.1956-1-james.d.knight@live.com>
 <SN4P221MB06825C5F564A59CA4DE16C09A0729@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB06825C5F564A59CA4DE16C09A0729@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696176362;
 bh=Yl5lKpiHGEUsryUY8Iz+Bf7dEIb660vC9jJVl59yokk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L8wXhwWJ2zfFWQsL0jzD3X7b/oEaZYgAOTk+X2m/DPNnde1ZUcPL6D2KL2SifuIJ7
 NICKim5V0947WaSRcOI/FoMklq52LORSGed0zD7tmOQhPt397NFaJRG8LFl8ZdwNpb
 hLnwtQn8YPjMCDGxthmeWmn32KFioy9Um2yx/wn4MQlo53IXYNzG2xP69YC7cWKL/Q
 fdZgjpCcAKOTq3DwZBFzQNZqj7wne1VWvoZR32huq8a0uFYDQwWJgrUhN3qZHfV/j4
 l0+ZyE6RJeM6bLQcHkM7Gcr0rkNkf0mxUcPAfnxXKB7UtBsuK6lvPCTXg8ifjmoV7e
 aE7WlMlWBBxsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=L8wXhwWJ
Subject: Re: [Buildroot] [PATCH 2/2] package/skeleton-init-systemd: flexible
 reinstalls
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

James, All,

On 2023-05-05 00:30 -0400, James Knight spake thusly:
> The following commit tweaks the `skeleton-init-systemd` package to
> gracefully handle if a user invokes a reinstall for the package (e.g.
> when performing development tweaks to the initial skeleton).
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
> Only a suggestion; feel free to drop.

I've spent a bit of time on this, and was about to apply...

However, there are a few "issues" I noticed with it, mostly that
/etc/fstab should not be used with systemd, but mount units should be
used, and so /etc/fstab should only contain this one line, so it does
not make much sense to have it "reinstallable".

Also, with BR2_PER_PACKAGE_DIRECTORIES=y, when the "final" target is
aggregated there is no guarantee that the modified file gets used in
this case. Indeed, assuming the following dependency chain (simplified
for the sake of the explanation):

    S <-- A <-- target/
     `<-- Z <--'

I.e. A depends on S (the skeleton), Z also depends on S, and the target
is aggreagated from A and Z, and S. When you first build, Z inherits the
fstab from S, and because it sorts after S, that the one that gets used.

If you rebuild S, Z will not get rebuild, so will not get the new fstab.
And thus when you assemble target after the rebuild, you still get the
old file from Z, not the new one from S.

(there are more complex cases, the above is just a trivial example).

Finally, the only guarantee Buildroot really offers is fof a full build
from scratch.

And last, reinstalling a skeleton package is very rare, so fixing it is
not worth the effort, considering all the above.

So I just decided to drop it.

Regards,
Yann E. MORIN.

> ---
>  .../skeleton-init-systemd.mk                   | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> index 4076821c0c0429cf90681f4b16be114c44bde282..18ae91f2eea30277805ee82791c62d53f24dca1e 100644
> --- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
> +++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> @@ -18,13 +18,23 @@ SKELETON_INIT_SYSTEMD_PROVIDES = skeleton
>  ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
>  
>  define SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW
> -	echo "/dev/root / auto rw 0 1" >$(TARGET_DIR)/etc/fstab
> +	if ! grep -q "/dev/root" $(TARGET_DIR)/etc/fstab; then \
> +		echo "/dev/root / auto rw 0 1" >$(TARGET_DIR)/etc/fstab; \
> +	else \
> +		sed -i "s|/dev/root.*|/dev/root / auto rw 0 1|g" \
> +			$(TARGET_DIR)/etc/fstab; \
> +	fi
>  endef
>  
>  else
>  
>  define SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW
> -	echo "/dev/root / auto ro 0 1" >$(TARGET_DIR)/etc/fstab
> +	if ! grep -q "/dev/root" $(TARGET_DIR)/etc/fstab; then \
> +		echo "/dev/root / auto ro 0 1" >$(TARGET_DIR)/etc/fstab; \
> +	else \
> +		sed -i "s|/dev/root.*|/dev/root / auto ro 0 1|g" \
> +			$(TARGET_DIR)/etc/fstab; \
> +	fi
>  endef
>  
>  # On a R/O rootfs, /var is a tmpfs filesystem. So, at build time, we
> @@ -78,9 +88,9 @@ define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
>  	mkdir -p $(TARGET_DIR)/home
>  	mkdir -p $(TARGET_DIR)/srv
>  	mkdir -p $(TARGET_DIR)/var
> -	ln -s ../run $(TARGET_DIR)/var/run
> +	ln -sf ../run $(TARGET_DIR)/var/run
>  	# prevent install scripts to create var/lock as directory
> -	ln -s ../run/lock $(TARGET_DIR)/var/lock
> +	ln -sf ../run/lock $(TARGET_DIR)/var/lock
>  	install -D -m644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/legacy.conf $(TARGET_DIR)/usr/lib/tmpfiles.d/legacy.conf
>  	$(SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW)
>  endef
> -- 
> 2.40.1.windows.1
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
