Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A200C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 12:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02FFC60BBC;
	Sat, 15 Jan 2022 12:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rbWvAYMJDB8A; Sat, 15 Jan 2022 12:10:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0312060AA9;
	Sat, 15 Jan 2022 12:10:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2C511BF4E2
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 12:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C05D4827A5
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 12:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I3WdxNS__REl for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 12:10:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8016382681
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 12:10:13 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id 15so11112946edx.9
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 04:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6hmIYRFbJHds3W56Bk/7bCtuZryLzqI61k3urFx+HrI=;
 b=WOx56myupdiaCV899d4SoTQiy4SpA3Bg07mSDq7ek7b4pkSPry/5o8EGEDVowdt/w5
 grRC9s6flMWUMt6i5votxYkIYmKX01yAq4wq2ig5Z4ffwp+jNr1mcwVhQ6cuCk0/udMH
 0BO2Deil8yzWaClfkN659KCT/fuaaqHhaPSQNt1EITsX71ejY1M4kOyu3Dx9ce57gDHI
 avgPRYk3NYsF4KRrPUbWeXF1xiDaM/nEJq+TWqahh6D8BkIFxu3AzyKlQpYIsETZ0pmd
 ZhbmuQQXo6gDMquKYaWcz+R3bUe33uud52eCYVw91Ccpc4O9/pqCceghfqgxn7pBtTXO
 h7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6hmIYRFbJHds3W56Bk/7bCtuZryLzqI61k3urFx+HrI=;
 b=HI8OtboHRxTNxam6AKUR+D1UnnjA3bgoNhKfw1ICt1ydfcQOw7pghlZz0+X4KGAmZ+
 6IiflIxJ5JU7bhctO7FZ9SrTWC/XYIOprx3Fsb0I0XxjPAyIOSsGscgJ/mhTG2SmmYXL
 WCz9ia6dxWU/Sft/jXvJZl/nSA0sYmq5n1cV/AYSVh/PqRhxn9kfhnfbAgpvVN09ZKCW
 UuLYUFjHCY02ligfChETv0GNL2MQ19pUOMYtoqTDYRqkHlgoEEWKfy/L5uRZftRbhoD9
 nJasz8BYjAvxmewJBGoUqg6tElX4ifuhCw7xQMBasHLvoubhZJ9CTGOuuPkYhHeVfw1Z
 FH3w==
X-Gm-Message-State: AOAM531BgojipvYBI3ERetrE42bGEwyRhZDZuSgCg5FEYzI8+kSTRPYa
 Mbm2DR3Yb7FO1n7e4eWLfHshXXqI81JxjajEPHMVTboB9UvNIg==
X-Google-Smtp-Source: ABdhPJyQqjy923MPjOc/tek1YYcrU7PDbDrwxzqtsPw15TgcgMv+TPBHLMFNFK4beu2LJEgEJCwmiHFBg2kZgOKtPCA=
X-Received: by 2002:a50:da48:: with SMTP id a8mr12658408edk.155.1642248611645; 
 Sat, 15 Jan 2022 04:10:11 -0800 (PST)
MIME-Version: 1.0
References: <20220114024555.319448-1-festevam@gmail.com>
 <CAEyMn7bX0YgDmvmmewcrhy0k+O53_1fdbP4KkCQm0ffKfyC2qA@mail.gmail.com>
In-Reply-To: <CAEyMn7bX0YgDmvmmewcrhy0k+O53_1fdbP4KkCQm0ffKfyC2qA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 15 Jan 2022 09:10:00 -0300
Message-ID: <CAOMZO5AT532fgTBG8Jte2N_DNmEqi654XRyxnbsrqZxvfqMDog@mail.gmail.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
Subject: Re: [Buildroot] [PATCH v2] configs/imx8mmevk: new defconfig
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
Cc: Schrempf Frieder <frieder.schrempf@kontron.de>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Heiko,

On Sat, Jan 15, 2022 at 3:56 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:

> > +       partition imx-boot {
> > +               in-partition-table = "no"
> > +               image = "flash.bin"
> > +               offset = 33k
>
> Giulio pointed out to me that the units should be described with
> capital letters.

Thanks for pointing this out. I will change it.

In the long term, we could probably use a common genimage.cfg too.

> I my respin I used:
>
> append root=PARTUUID=%PARTUUID% rootwait rw
>
> The UUID is created in a post-build.sh script and set it in
> extlinux.conf and genimage.cfg
>
> With that the image would not limited to be located on the SD card.

Good idea. Will change it.

> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"

On my tests, I noticed that if I build U-Boot 2022.01 + TF-A mainline,
then the kernel 5.16 does not boot.

Using TF-A from the NXP BSP allows me to boot 5.16 without issues.

I will try to investigate why this happens with imx8mm-evk, as your
board does not show issues.

Thanks
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
