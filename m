Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E48C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 08:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F75660D6B;
	Tue, 18 Jan 2022 08:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KU786vD5DNEh; Tue, 18 Jan 2022 08:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BDA760D5C;
	Tue, 18 Jan 2022 08:54:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BC231BF319
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 08:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A16B817A7
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 08:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SG-pQziqCv29 for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 08:54:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B5458145F
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 08:54:14 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id 15so43114347edx.9
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 00:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1XS2ZULzYdmQwQijG4TgGJvUUBT8fvK3aWh2TdbooJg=;
 b=gcRTrDfXrGM5p/VfsVTeOW0nLNwsSCMnDrq76W3GAoO+4WpZnUElYtV/EjT+BlTdka
 YR/fxtlROZFVhPwUZKobj3Zb2omlrzoj6SEfqYGsl6ynO3cuaUY1gbzHlG0HPV/dw7Ks
 3Bu1D4QbdsYgl4LTZNbpL6UBb0kypPxEzabrjy3JScGEeGQdqkYs8hX0G9TiG1+PAtpX
 2dPsTAEf5oLx4Glwdx/7zDIzuHVJL7tYS8FO8A49CEk/UTfVQ+mOTInH2WZy3vNSZxwj
 AekGC3dADYnibgz1yhpwolVP1H5pgkGIOEwXrlHHAHpB/R4hEFcGKaBdEFriQZvztsyQ
 oDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1XS2ZULzYdmQwQijG4TgGJvUUBT8fvK3aWh2TdbooJg=;
 b=7qam1tSUrvffj6b/7wd7ue1JIqXR3EuRcFjGuxo1wfUoeQtbiRBvPVHXrH5WKSd8B7
 Dr6+Mpb9EpoM/4kpFYl7UntVXTG+Bk6RuPHx0uEABCKX8VYBf4h9F9yAjzdTvH08JMG1
 dCi1ELNX+UQVNY8wjG6frYFAzWQCJCSYYWaXhyiy46VNzU4YfRCEObBttuK0qLQvUVPI
 9Kfv0y19Cvsv3XHH4cUFYNAPihx1kOmvwNOJIH9XzwETQJspVU2fL/Tk0CAu98hCL6rn
 bTVdbAfQyqCaZunHp3cz4fRYyIFQJinctOOPzeAXH0umcb3ZvEbT/BjA3aQB7UbXS6HO
 8FTg==
X-Gm-Message-State: AOAM532Vzvs7LrRB5RrerXv9AzidqqqD7zp+q12t/Gmluw3yr04KdHZA
 J/eJax2JqScfHjDMSFESe3FVNpk01xId2BS6eVZPTQ==
X-Google-Smtp-Source: ABdhPJyEYGiyrpZov/rlCj5IobV1sSqcHXBC+/FLcmhyy4ebsjlbRzx05t9auawpoFXnYXBDOLwGvoTVNQgKV5Bagyc=
X-Received: by 2002:a05:6402:2885:: with SMTP id
 eg5mr24571139edb.375.1642496052267; 
 Tue, 18 Jan 2022 00:54:12 -0800 (PST)
MIME-Version: 1.0
References: <20220115143344.12319-1-romain.naour@gmail.com>
In-Reply-To: <20220115143344.12319-1-romain.naour@gmail.com>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 18 Jan 2022 09:54:00 +0100
Message-ID: <CAN5uoS_Gk6UR1LPAzux1=vgYxtULKV6n2xn28tq+M5JgFeMQTQ@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] board/qemu/arm-vexpress-tz: use
 enable=on
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

Hello Romain,

On Sat, 15 Jan 2022 at 15:33, Romain Naour <romain.naour@gmail.com> wrote:
>
> Since Qemu 6.0.0 [1], a warning appear in the log if a short-form
> boolean option is used.
>
> [1] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=ccd3b3b8112b670fdccf8a392b8419b173ffccb4
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Etienne Carriere <etienne.carriere@linaro.org>
> Cc: Dick Olsson <hi@senzilla.io>
> ---
>  board/qemu/arm-vexpress-tz/readme.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/board/qemu/arm-vexpress-tz/readme.txt b/board/qemu/arm-vexpress-tz/readme.txt
> index 7e62e943a6..3036dd54ca 100644
> --- a/board/qemu/arm-vexpress-tz/readme.txt
> +++ b/board/qemu/arm-vexpress-tz/readme.txt
> @@ -16,7 +16,7 @@ from the image directory:
>         -smp 1 -s -m 1024 -d unimp \
>         -serial stdio \
>         -netdev user,id=vmnic -device virtio-net-device,netdev=vmnic \
> -       -semihosting-config enable,target=native \
> +       -semihosting-config enable=on,target=native \
>         -bios flash.bin # qemu_arm_vexpress_tz_defconfig
>
>  The boot stage traces (if any) followed by the login prompt will appear
> --
> 2.31.1
>

Thanks for the fix.

Br,
Etienne
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
