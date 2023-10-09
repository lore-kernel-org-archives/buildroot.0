Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54A2E95A95
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 15:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 809006129D;
	Mon,  9 Oct 2023 15:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 809006129D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g3J_gCrC2zny; Mon,  9 Oct 2023 15:12:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B87C361284;
	Mon,  9 Oct 2023 15:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B87C361284
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80D6E1BF364
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5ADED61284
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ADED61284
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XdKVP1KS-hkN for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 15:12:04 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52CA061274
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 15:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52CA061274
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d143:e10c:f714:dfc9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8F9EF5FFAF;
 Mon,  9 Oct 2023 17:12:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 09 Oct 2023 17:12:00 +0200
Date: Mon, 9 Oct 2023 17:12:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231009151200.GD14234@scaer>
References: <20231009080612.23347-1-adam.duskett@amarulasolutions.com>
 <20231009080612.23347-2-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231009080612.23347-2-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696864322;
 bh=K79gWSG9dd0+rMLEqGnBbwHG8mlrBXljOtI3rMfbFE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HRjQAbNjEeXJRszRXAsUaVEPtY+JUZZ0FufQmvxpDIjz3bcKW/DWZT5V9JmDAn/1O
 eYK1NqFBvbCkcnJTLsEQW4g/sLaNp0XazNif18XgQXS2yYtfRWPuQHR/19SeTJuOHE
 ASc6kKSOYp96zPJIeYJNb+O5DgX13HFmA+8hXBgbxtZpQTiIYSnUkiYuQJ/sOkzAou
 kGYmWZN9fQ8iumLS6nntDWqk/eJJI16Dvyj9tCwBuLCAzRIBcDTQxmdVXOI0hpotZd
 rotW0JnYno9J7Jwpo8jcvy3NNft1vvvXq4j4BHZWgX2TwUN7CPEYex5Sui1Ct8L290
 R6eAbTarpZ6BQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HRjQAbNj
Subject: Re: [Buildroot] [PATCH v3 2/2] package/refpolicy/Config.in: depend
 on merged usr when selecting upstream
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

Adam, All,

Thanks for the quick respin. :-)

On 2023-10-09 10:06 +0200, Adam Duskett spake thusly:
> Refpolicy contexts expect a merged /usr file system. In fact, there
> are no references to /bin, /sbin, /lib, or /lib64 at all. However, if a user
> wants to go through the trouble of creating a policy that works with a
> non-merged system, they should be free to do so. As such, only select
> BR2_ROOTFS_MERGED_USR if using BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION.

That last sentence is now incorrect. It could have been fixed when
applying, but...

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v2 -> v3: Depends on, do not select BR2_ROOTFS_MERGED_USR [Yann]
> 
>  ...ount-dbus-interface-must-be-optional.patch | 33 -------------------

... why is this patch removed? From the description of that patch, it
does not look to be related to merged-usr at all...

If that is due to the version bump, then it should have been part of the
patch bumpng the version...

Regards,
Yann E. MORIN.

>  package/refpolicy/Config.in                   |  4 +++
>  2 files changed, 4 insertions(+), 33 deletions(-)
>  delete mode 100644 package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
> 
> diff --git a/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch b/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
> deleted file mode 100644
> index adec7d98d0..0000000000
> --- a/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 6c6be65ccf0891391681d4662cc11f508c0f4aeb Mon Sep 17 00:00:00 2001
> -From: Adam Duskett <aduskett@gmail.com>
> -Date: Mon, 24 Apr 2023 14:24:49 -0700
> -Subject: [PATCH] mount: dbus interface must be optional
> -
> -If DBus isn't built, the build process fails due to mount.te always using a
> -dbus interface even if the dbus module. Fix this by setting the dbus interface
> -as optional.
> -
> -Signed-off-by: Adam Duskett <aduskett@gmail.com>
> -Upstream: https://github.com/SELinuxProject/refpolicy/commit/207b09a656c2c3ac5c286d3f7eef085325e35408
> ----
> - policy/modules/system/mount.te | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/policy/modules/system/mount.te b/policy/modules/system/mount.te
> -index d028723..af84af0 100644
> ---- a/policy/modules/system/mount.te
> -+++ b/policy/modules/system/mount.te
> -@@ -145,7 +145,9 @@ selinux_getattr_fs(mount_t)
> - 
> - userdom_use_all_users_fds(mount_t)
> - 
> --dbus_dontaudit_write_system_bus_runtime_named_sockets(mount_t)
> -+optional_policy(`
> -+	dbus_dontaudit_write_system_bus_runtime_named_sockets(mount_t)
> -+')
> - 
> - ifdef(`distro_redhat',`
> - 	optional_policy(`
> --- 
> -2.40.0
> -
> diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
> index 0e72b895df..d2fe391d8d 100644
> --- a/package/refpolicy/Config.in
> +++ b/package/refpolicy/Config.in
> @@ -36,9 +36,13 @@ choice
>  
>  config BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
>  	bool "Upstream version"
> +	depends on BR2_ROOTFS_MERGED_USR
>  	help
>  	  Use the refpolicy as provided by Buildroot.
>  
> +comment "Upstream refpolicy requires a merged /usr filesystem"
> +	depends on !BR2_ROOTFS_MERGED_USR
> +
>  config BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
>  	bool "Custom git repository"
>  	help
> -- 
> 2.41.0
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
