Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E62C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 10:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B410A4058B;
	Sun,  9 Jan 2022 10:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ivVZcV9EPejD; Sun,  9 Jan 2022 10:29:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDBAE405AA;
	Sun,  9 Jan 2022 10:29:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C84E21BF4DD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA11660760
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hk5Eu3yGK8PA for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 10:29:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A588605E0
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 10:29:36 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r10so13359287wrc.3
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 02:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=b9kxrFXs23Huooi0SXDTpvwo7rBUZAZ3QcsJ0un3Auc=;
 b=foNZOOUZZ4B0aEJopr+Qx9P54jxLAu86cIxohOJ/DRxPdtWBMNuNxkwE5tEX5PNfb7
 0RLnK7Ivev4MshYlIVv3BtN2Xq9wagP/6LuHv82D3QpY9IWToxkr1Ckf89s/bMQGzEH5
 SX3eUwr+Y+8NtQxqINqM0AjAcXdl0vlmxUIHyX7XaNjFlCgRbKYq/F1aJzxV7qYcXGRw
 9HVNZo+YtEi1mZ4U+nAdl0vID97OZgbDJCN5wcSfl/svH7H8cOioa2kgM8QmdICBDbwi
 N9NyqMkfE/RGQDCSNvXyRAU+EG9gyn2aphTUWdwqeMmFTBGBXoN6gcImLE0sBdxhyC5m
 YPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=b9kxrFXs23Huooi0SXDTpvwo7rBUZAZ3QcsJ0un3Auc=;
 b=RMFxSzY3VuI1dXT0x5pVu8qYeoQJO90HbD0sYRSmXWvXPHKUv4ZZYeuIibOl53a7p/
 mPW0Ipk3MoXTuaioyCTZ5RXEFT2PWHCHKPE3f//JSTy4uZiMtB3uO4681apyBLk5Dw0q
 DV9ojPjwHzsolPEP61XvmvA3YNhaLxs9NJnte4Tibwng4l7khPlefozBAneiECyM8KT3
 ouDX3QZENV8IYqdLkuQhmevqhwpTQBsGx+DYH2v7mO2QzF5KLbvikS54bsim+JLIKDgE
 Vl4VYKhLMdTqDUhZ6UttbbB05BRexbMWYMTYFt/j5SUmZm4QiguiSHhiGMePadX1Zfcz
 kJWQ==
X-Gm-Message-State: AOAM533S3iHZmsvWrO6zDB//uiWelW3BUO0VIEd8Wq2zQGBLGnRdXy3U
 77q5zwQ36BRCpMJvmPASTyIUSQ==
X-Google-Smtp-Source: ABdhPJzNlKfYl5PJneie+bFL55ElgwZLY4XAJVyWtu1wGIaOtaCOCZMyceYM+1H+hzU0nLTwOXTULQ==
X-Received: by 2002:a05:6000:c8:: with SMTP id
 q8mr5475991wrx.157.1641724174429; 
 Sun, 09 Jan 2022 02:29:34 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id z6sm4135925wmp.9.2022.01.09.02.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 02:29:33 -0800 (PST)
Message-ID: <c6753632-97cc-df7e-fe34-fd4753723234@mind.be>
Date: Sun, 9 Jan 2022 11:29:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20201004224137.193808-1-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20201004224137.193808-1-nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH] skeleton + init: prepare /run/lock and
 adjust compat symlinks
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
Cc: joseph.kogut@gmail.com, Adam Duskett <aduskett@gmail.com>,
 =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/10/2020 00:41, Norbert Lange wrote:
> Linux distros changed /var/run and /var/lock to reside on an tmpfs in
> /run a long time ago, and buildroot seems to agree by providing this
> tmpfs on all supported init systems.
> 
> Packages on the other hand are currently free to either use /var/run
> or /run, and similarly using /var/lock should be identical to the
> replacement /run/lock.
> 
> This series aims to ensure that *if* /var/lock is needed, then
> it will be a symlink to /run/lock. Allowing packages to continue
> working and allowing them to migrate to using /run/lock.
> 
> If all relevant packages are fixed,
> the compatibility symlinks in /var can be dropped.
> 
> Status before this patch:
> 
> *   Systemd
> 
>      /run will be mounted by PID1, /var/run will be recreated by
>      /usr/lib/tmpfiles.d/var.conf.
> 
>      Creating /run/lock/subsys and the compatibility symlink is handled
>      in /usr/lib/tmpfiles.d/legacy.conf.
>      But this is *currently not installed* by Buildroot, see [1].
> 
> *   OpenRC
> 
>      Seems to check for existence of a /run directory and does all
>      necessary setup.
> 
> *   SysV
> 
>      /var/lock is currently a symlink to /tmp.
> 
> *   Busybox
> 
>      Same as sysv (Buildroot uses the sysv skeleton)
> 
> Note that we create /run/lock/subsys, so sysv scrips could expect this
> directory to exist. Apart from simplifying scripts, creating the dir
> early as root adds some security.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/busybox/inittab                        |  1 +
>   package/skeleton-init-openrc/skeleton/var/lock |  2 +-
>   package/skeleton-init-sysv/skeleton/var/lock   |  2 +-
>   package/sysvinit/inittab                       | 13 +++++++------
>   4 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/package/busybox/inittab b/package/busybox/inittab
> index ff1725c775..f2b4df801b 100644
> --- a/package/busybox/inittab
> +++ b/package/busybox/inittab
> @@ -18,6 +18,7 @@
>   ::sysinit:/bin/mount -o remount,rw /
>   ::sysinit:/bin/mkdir -p /dev/pts /dev/shm
>   ::sysinit:/bin/mount -a
> +::sysinit:/bin/mkdir -p /run/lock/subsys
>   ::sysinit:/sbin/swapon -a
>   null::sysinit:/bin/ln -sf /proc/self/fd /dev/fd
>   null::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin
> diff --git a/package/skeleton-init-openrc/skeleton/var/lock b/package/skeleton-init-openrc/skeleton/var/lock
> index 1431b0e432..386c09e727 120000
> --- a/package/skeleton-init-openrc/skeleton/var/lock
> +++ b/package/skeleton-init-openrc/skeleton/var/lock
> @@ -1 +1 @@
> -../tmp
> \ No newline at end of file
> +../run/lock
> \ No newline at end of file
> diff --git a/package/skeleton-init-sysv/skeleton/var/lock b/package/skeleton-init-sysv/skeleton/var/lock
> index 1431b0e432..386c09e727 120000
> --- a/package/skeleton-init-sysv/skeleton/var/lock
> +++ b/package/skeleton-init-sysv/skeleton/var/lock
> @@ -1 +1 @@
> -../tmp
> \ No newline at end of file
> +../run/lock
> \ No newline at end of file
> diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
> index a31471031f..afc28e6c03 100644
> --- a/package/sysvinit/inittab
> +++ b/package/sysvinit/inittab
> @@ -8,12 +8,13 @@ si0::sysinit:/bin/mount -t proc proc /proc
>   si1::sysinit:/bin/mount -o remount,rw /
>   si2::sysinit:/bin/mkdir -p /dev/pts /dev/shm
>   si3::sysinit:/bin/mount -a
> -si4::sysinit:/sbin/swapon -a
> -si5::sysinit:/bin/ln -sf /proc/self/fd /dev/fd 2>/dev/null
> -si6::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin 2>/dev/null
> -si7::sysinit:/bin/ln -sf /proc/self/fd/1 /dev/stdout 2>/dev/null
> -si8::sysinit:/bin/ln -sf /proc/self/fd/2 /dev/stderr 2>/dev/null
> -si9::sysinit:/bin/hostname -F /etc/hostname
> +si4::sysinit:/bin/mkdir -p /run/lock/subsys
> +si5::sysinit:/sbin/swapon -a
> +si6::sysinit:/bin/ln -sf /proc/self/fd /dev/fd 2>/dev/null
> +si7::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin 2>/dev/null
> +si8::sysinit:/bin/ln -sf /proc/self/fd/1 /dev/stdout 2>/dev/null
> +si9::sysinit:/bin/ln -sf /proc/self/fd/2 /dev/stderr 2>/dev/null
> +si10::sysinit:/bin/hostname -F /etc/hostname
>   rcS:12345:wait:/etc/init.d/rcS
>   
>   # S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
