Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A20DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0524484E3E;
	Wed, 26 Jan 2022 22:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dyha_ak-63-C; Wed, 26 Jan 2022 22:50:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5209B84DD6;
	Wed, 26 Jan 2022 22:50:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB77B1BF48B
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D97B440ADB
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:50:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f-gbLUYSG_GN for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:50:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C071740AD7
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:50:06 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id i1so993968ils.5
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 14:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8LhCIhWmKJTHG7lsPkLj24H96k+7niFWEriKCaRBx7E=;
 b=WC/Kazn4fT/oPcMfi8xp9mDbtfneSvfRGIfahpeAVyepEk8gNg0Bz49qTAbRB/D2tY
 kzreEkwFd3rx7dMt5vaA9yRuERiNi3bTtiUKBQ+/WeIQw6eivz/pYI21zD8UFDP9sx+D
 oeeeiqvcfKhsGuEfxyggBd8lGqLDArrIHgvpSF5Hg6iAPhx34VaX9ziO4rQEAp7v8OJl
 zhw9VJ1+NzK3CMdaRQUgn/7/mM59pZ3OJvRXSgK+FW8EJCPuYEAXiThihL6dYS3w9GGn
 67odQSVxuSFJHhs40f3dQB4RQUjVhHYcxa1palptlbxUr2qWYD5AZfGWREvNJ/ai2DqE
 2Qdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8LhCIhWmKJTHG7lsPkLj24H96k+7niFWEriKCaRBx7E=;
 b=R+rqjWRj5p2ACKRMUDXMTOnxQSPknrznMH2nphFLbzUCh6QC+PVQBMDdtmZAhQ69D0
 1P4VCpeDYZIjVYVEM2YdUTjDXWoX5SA7bBKNgqP51tAYbx1iF1ZHwiqpGGgJJkJPjdhz
 i1kVPzrnr6GWjQ2BBXfw9ObDEyBQrEEXmRin3Hedsq3ZChEZdV2BT0CPUIDQcAMocP4o
 xaImE3b55Rx0gZmil5ri9JmV9rkB2tKYF2BArVRvPFk1hse9v0JYJQXFIC5wLkuRnPBG
 iCiCdvEaEWUofxVVELs0pNG6vujK/h+In3OJmgIku3YVnvbfp6Zxpc9zDFz1+xeiJFrg
 UuQA==
X-Gm-Message-State: AOAM533EfL5GSGurYlUNf02bFjyHit5URLMwsQ8VkapgA+FmxKH+VDMD
 xIfveG5ex3wq81VaZARjOLGRXneANxpVzw6RRCioyuZt8WtZYg==
X-Google-Smtp-Source: ABdhPJzUJ87GOdOLcIkxzq9QWV/Ctf6TWJgApkynMqcLPFP6Tt6gAvIe0ZB1EgANMKcswKOs127VyebBPyK+4I6zvtE=
X-Received: by 2002:a05:6e02:1ba7:: with SMTP id
 n7mr938567ili.290.1643237405839; 
 Wed, 26 Jan 2022 14:50:05 -0800 (PST)
MIME-Version: 1.0
References: <20220125190650.107677-1-fontaine.fabrice@gmail.com>
 <20220125190650.107677-2-fontaine.fabrice@gmail.com>
In-Reply-To: <20220125190650.107677-2-fontaine.fabrice@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 27 Jan 2022 08:49:39 +1000
Message-ID: <CAKmqyKPkQZZ0bJbjT+DPpkvny-7ZEBevJQ9QPmgZTdYh7DZU6Q@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/xvisor: add riscv support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jan 26, 2022 at 5:09 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> riscv is supported since version 0.3.0 and
> https://github.com/xvisor/xvisor/commit/d6feda4e80eefd372294b081111ce709d08ee4c0
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  package/xvisor/Config.in | 4 +++-
>  package/xvisor/xvisor.mk | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/package/xvisor/Config.in b/package/xvisor/Config.in
> index 55c43e6959..4e7a3e1b53 100644
> --- a/package/xvisor/Config.in
> +++ b/package/xvisor/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_XVISOR_ARCH_SUPPORTS
>         bool
>         default y
>         depends on BR2_USE_MMU
> -       depends on BR2_aarch64 || BR2_x86_64
> +       depends on BR2_aarch64 || BR2_riscv || BR2_x86_64
>
>  menuconfig BR2_PACKAGE_XVISOR
>         bool "xvisor"
> @@ -32,6 +32,8 @@ endchoice
>  config BR2_PACKAGE_XVISOR_DEFCONFIG
>         string "Defconfig name"
>         default "generic-v8" if BR2_aarch64
> +       default "generic-32b" if BR2_RISCV_32
> +       default "generic-64b" if BR2_RISCV_64
>         default "x86_64_generic" if BR2_x86_64
>         depends on BR2_PACKAGE_XVISOR_USE_DEFCONFIG
>         help
> diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
> index 4ceb5ed7cb..1a7b49e689 100644
> --- a/package/xvisor/xvisor.mk
> +++ b/package/xvisor/xvisor.mk
> @@ -32,6 +32,8 @@ ifeq ($(BR2_x86_64),y)
>  XVISOR_ARCH = x86
>  else ifeq ($(BR2_aarch64),y)
>  XVISOR_ARCH = arm
> +else ifeq ($(BR2_riscv),y)
> +XVISOR_ARCH = riscv
>  endif
>
>  ifeq ($(BR2_PACKAGE_XVISOR)$(BR_BUILDING),yy)
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
