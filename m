Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEB0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 16:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 261E060ABD;
	Sat, 22 Jan 2022 16:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YOzCQm34CkMD; Sat, 22 Jan 2022 16:00:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6374060AA9;
	Sat, 22 Jan 2022 16:00:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 167EB1BF391
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 16:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 054D660AA9
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 16:00:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id egvEggG8GidL for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 16:00:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7146606CB
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 16:00:05 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id o12so40204899lfu.12
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 08:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e9w4nzqXZFpZBSvqtxLGi7gomELIWPUpfR4JZ2g6LFU=;
 b=djodswpGcy3aWFxik/Vx9uFD4bpHHYCqpmK5kg/MyB2l0ixDHjkJcJgltVhxSozgoi
 GQO4uEF0wzy9K/6HSkhtazA6fUgWKjCAaiOJcNCtETZofM0wdxMVgvZOjDiV7FcDnPJT
 1FhVmTMoOXNlsx/e6FXrs8ZV4zTJiVnK++OKvPsWpkpByCACZ9+K0LJ4AYYjPeTPt+9M
 WFzPWI7RNpBcyK2/px607My0kLfX8eJovU3+rEDgwPLAByu9QCPZ9QCEQ2EajUadyR1m
 F+EQi0UG6DtoTHGzm5V0JbJRlSttp3+jIrA4eSc2I4tbcDtrPYf9kj9ySLrNhTi1dfxe
 XMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e9w4nzqXZFpZBSvqtxLGi7gomELIWPUpfR4JZ2g6LFU=;
 b=rlDb0mnKJZHd86CsqKk+hHQSUcu28HLJznMSFqryFRf0dKnevKDtrslXbqFdTEs4tS
 +ffoMB3e9Qg490Tn2si4RaIOveHVQICrWYGa95EOFF93QT9XN7RBFvvacOT38gfV9/n8
 XFMFIB2pTxH4M8OdOPS850ELNVirnalzUSjzEgpjxDtNiVvuImbXniNqcnyn0apJx4TE
 vcBwmqqO2ySPdtAi0b/slVPMHSVNfHz7B5nj95WPiwg1vz+Qw5uAj8yw+L/HDKP4SeoK
 8A+z9PRucNiSxZGQk+2yDKrRz9JYJOT8wZ9OK9MiV2+MvMppIrI8FVETnxzgYUWa+HNc
 HMRQ==
X-Gm-Message-State: AOAM5301eThkPXPcMzo6F/6aJtRJ5mUKC+N5jD9PKVjCTkA/MJhmGkyg
 VwYY383tzqfpXzV8k5ZL4zMnlXyAeNCwfxhCx8k=
X-Google-Smtp-Source: ABdhPJwy4BEnauD42Gm9UxnRpD+xbNxGis9HKfBq8mDoiXDExxTRyZrtO8UjlJPXymzju93N9KPMKhfARxr4SvUMrHc=
X-Received: by 2002:a05:6512:3cb:: with SMTP id
 w11mr7410111lfp.621.1642867203744; 
 Sat, 22 Jan 2022 08:00:03 -0800 (PST)
MIME-Version: 1.0
References: <20220117080616.10563-1-heiko.thiery@gmail.com>
 <20220122151130.59ae7148@windsurf>
In-Reply-To: <20220122151130.59ae7148@windsurf>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 22 Jan 2022 16:59:52 +0100
Message-ID: <CAEyMn7bo68eGCoxZPjALUO38Q7JGy_BosvsLSr6YTvFeiP_sSQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/2] board/kontron/pitx-imx8m: use extlinux
 instead of U-Boot boot script
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Am Sa., 22. Jan. 2022 um 15:11 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Mon, 17 Jan 2022 09:06:16 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > ---
> >  board/kontron/pitx-imx8m/boot.cmd      | 8 --------
> >  board/kontron/pitx-imx8m/extlinux.conf | 4 ++++
> >  board/kontron/pitx-imx8m/genimage.cfg  | 5 +++--
> >  board/kontron/pitx-imx8m/post-build.sh | 7 +++++--
> >  board/kontron/pitx-imx8m/post-image.sh | 2 +-
> >  configs/kontron_pitx_imx8m_defconfig   | 3 +--
> >  6 files changed, 14 insertions(+), 15 deletions(-)
> >  delete mode 100644 board/kontron/pitx-imx8m/boot.cmd
> >  create mode 100644 board/kontron/pitx-imx8m/extlinux.conf
>
> I have applied, but I am a bit worried about things are going on with
> this switch to extlinux.conf.

I was not aware of the different approaches.

> Indeed, we have:
>
>  * Platforms where the UUID is hardcoded into genimage.cfg and
>    extlinux.conf, such as board/beaglev/
>
>  * We have platforms where a "uuid" variable in filled in U-Boot before
>    triggering the extlinux.conf logic, and therefore extlinux.conf uses
>    root=PARTUUID=${uuid}. For example
>    board/freescale/imx7dsdb/rootfs_overlay/boot/extlinux/extlinux.conf,
>    board/orangepi/orangepi-zero/boot.cmd,
>    board/solidrun/mx6cubox/rootfs_overlay/boot/extlinux/extlinux.conf,
>    board/technexion/imx6ulpico/rootfs_overlay/boot/extlinux/extlinux.conf,
>    and a few others.

For the technexion board there is some logic in u-boot to setp and
discover the uuid of the root partition.

https://source.denx.de/u-boot/u-boot/-/blob/master/include/configs/pico-imx6ul.h#L90

>  * We now have platforms (kontron/smarc-sal28 and kontron/pitx-imx8m)
>    where a random UUID is generated in the post-build script, and used
>    in genimage and extlinux.conf.

With this approach it is independent if the image is installed on the
SD card or the eMMC or what else. But here one pitfall is when the
image is installed on more devices.

> I'm not sure where we want to go, and how much we want to enforce "best
> practices" that are common on all platforms, or just let each platform
> do its little business.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
