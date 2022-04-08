Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D880C433F5
	for <buildroot@archiver.kernel.org>; Fri,  8 Apr 2022 23:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20568842E7;
	Fri,  8 Apr 2022 23:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N-4LlEUg1tQL; Fri,  8 Apr 2022 23:56:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E1568448E;
	Fri,  8 Apr 2022 23:56:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 561B41BF5DD
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 23:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4493141E95
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 23:56:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zMIf9-QWcNTQ for <buildroot@lists.busybox.net>;
 Fri,  8 Apr 2022 23:56:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D7CE41E93
 for <buildroot@buildroot.org>; Fri,  8 Apr 2022 23:56:17 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-d6ca46da48so11325328fac.12
 for <buildroot@buildroot.org>; Fri, 08 Apr 2022 16:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I5gBdoJcnMq5RS7qAVxnD9OyQ2vw/W3sPE2xjhPtJ2o=;
 b=RKpXtQwsFFAiNmc67ewTzkj/IXuUbkcVehfSfEFlPUnfui1AyFTBH7V9QKIrXo3Umx
 Yz3RqgRiBlKB6pQCMj1rXS2oZQ4JoODSTxt7NxmX/jZn68FdGU4xi4+25gnR8Kd4lGW9
 X1YEEaurkVqo0Av5PQwSd5HfvgmmvtmvaKm0pXSK+8NM2dTxkFPbF2EUORLr37h0Jwb7
 n/cULTQjgb1DEzQjYu83nwsuZgATTLKS8lHK4XY3MXXdZoF410mSycAfDB4r42ZDP9k1
 /T2Wg0O09jQuvjibeYwo/Ha2BNIqnQHjTloQePFgfvMuXt70ngm4z8yjdEks2/BJjymW
 9wTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I5gBdoJcnMq5RS7qAVxnD9OyQ2vw/W3sPE2xjhPtJ2o=;
 b=m+aSsVkBa9o2jh1uUXFFXko94eIHI16sVTn7ajAEr1j2yvIsUvyozIvDOBuS5et98/
 w7TPXIrckEu+q3NMdvF/WK9pwwViPx63so3V2oThzhyfZk1DnYOjTX56rUksiCYEA+OO
 xLVIyCZ4X0r/y+4VcTm597VlMVQ4YmxEeEaJ/LXVNPKb3H4g4YJFKmhPD3pqrOd1G9B+
 bSJWnOtvEF3EcieCKRHBJ3EFcR7woJTrzy2IjKiWmgGh0o7UdRwtZ+HmmXDnZ5EfvO+m
 mGMc40vCFymbMLn2ufBulWSqrKJN5/9EKVwOrXRhnVW9hRMipqEqB7HXMKPAx6d+G/y1
 88Tg==
X-Gm-Message-State: AOAM532TxUEBUVhGgf9dx3HsdNYaTzyvPzJ/6egW8tb+vYJb2jATJH4n
 S5qgf+XxjQSsAyEGuHzpF2m8EKuuRjYExcNXSh0=
X-Google-Smtp-Source: ABdhPJy1Wd6D99sq+09PnVldFIw7xi7ZQONVtZLATsQrxYlJGLzzzI2S5WregB36/dtC0aSawMWgF3vz3REZAkFf7v4=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr9176977oaa.200.1649462176906; Fri, 08
 Apr 2022 16:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220405025054.966064-1-james.hilliard1@gmail.com>
 <0a44404b-c3f5-677f-cfbe-09a08f41adad@mind.be>
 <CADvTj4pJFiWHQszKZ=ULCtAiS1MbmDS6sdsoV81DTGbn9cBEnQ@mail.gmail.com>
 <20220405211250.GJ2354230@scaer>
In-Reply-To: <20220405211250.GJ2354230@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 8 Apr 2022 17:56:05 -0600
Message-ID: <CADvTj4pirGqnroqBBR3jvAqWcWbiTPmiA_VcSBh2nPLP8PVSdg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/aufs: don't set invalid
 AUFS_SITE if version is unset
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Apr 5, 2022 at 3:12 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-04-05 14:09 -0600, James Hilliard spake thusly:
> > On Tue, Apr 5, 2022 at 11:19 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> > > On 05/04/2022 04:50, James Hilliard wrote:
> > > > Fixes:
> > > > package/aufs/aufs.mk:24: *** AUFS_SITE (https://github.com/sfjro/aufs4-standalone/archive/) cannot have a trailing slash.  Stop.
> > > > make: *** [Makefile:84: _all] Error 2
> > >   How do you get this? I've tried a number of configurations, but I always get
> > > package/aufs/aufs.mk:21: *** No aufs version specified.  Stop.
> > > make: *** [Makefile:84: _all] Error 2
> > >   I could only reproduce with `make source`, but that's a bit a special case.
> >
> > Something like this seems to hit it:
> > BR2_LINUX_KERNEL_EXT_AUFS=y
> > # BR2_LINUX_KERNEL_EXT_AUFS_SERIES_3 is not set
> > BR2_LINUX_KERNEL_EXT_AUFS_SERIES_4=y
> > # BR2_LINUX_KERNEL_EXT_AUFS_SERIES_5 is not set
> > BR2_LINUX_KERNEL_EXT_AUFS_SERIES=4
> > BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""
> > BR2_PACKAGE_AUFS=y
> > BR2_PACKAGE_AUFS_SERIES=4
> > BR2_PACKAGE_AUFS_VERSION=""
> > # BR2_PACKAGE_AUFS_UTIL is not set
>
> This still produces the expected error that Arnout reported:
>
>     $ make qemu_m68k_q800_defconfig  # just for a config with a kernel
>
>     $ cat <<_EOF_ >>.config
>     BR2_LINUX_KERNEL_EXT_AUFS=y
>     # BR2_LINUX_KERNEL_EXT_AUFS_SERIES_3 is not set
>     BR2_LINUX_KERNEL_EXT_AUFS_SERIES_4=y
>     # BR2_LINUX_KERNEL_EXT_AUFS_SERIES_5 is not set
>     BR2_LINUX_KERNEL_EXT_AUFS_SERIES=4
>     BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""
>     BR2_PACKAGE_AUFS=y
>     BR2_PACKAGE_AUFS_SERIES=4
>     BR2_PACKAGE_AUFS_VERSION=""
>     # BR2_PACKAGE_AUFS_UTIL is not set
>     _EOF_
>
>     $ make olddefconfig
>
>     $ grep AUFS .config
>     BR2_LINUX_KERNEL_EXT_AUFS=y
>     # BR2_LINUX_KERNEL_EXT_AUFS_SERIES_3 is not set
>     BR2_LINUX_KERNEL_EXT_AUFS_SERIES_4=y
>     # BR2_LINUX_KERNEL_EXT_AUFS_SERIES_5 is not set
>     BR2_LINUX_KERNEL_EXT_AUFS_SERIES=4
>     BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""
>     BR2_PACKAGE_AUFS=y
>     BR2_PACKAGE_AUFS_SERIES=4
>     BR2_PACKAGE_AUFS_VERSION=""
>     # BR2_PACKAGE_AUFS_UTIL is not set
>
>     $ make

You need to do make savedefconfig here for it to reproduce:
$ make savedefconfig
package/aufs/aufs.mk:24: *** AUFS_SITE
(https://github.com/sfjro/aufs4-standalone/archive/) cannot have a
trailing slash.  Stop.
make: *** [Makefile:84: _all] Error 2

>     package/aufs/aufs.mk:21: *** No aufs version specified.  Stop.
>     make: *** [Makefile:23: _all] Error 2
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
