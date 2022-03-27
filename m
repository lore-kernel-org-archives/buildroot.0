Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D05C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 17:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8CD7818C4;
	Sun, 27 Mar 2022 17:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPhT7VAhhw2O; Sun, 27 Mar 2022 17:38:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C68458187F;
	Sun, 27 Mar 2022 17:38:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D3641BF3F6
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 17:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AF1E400F5
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 17:38:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oPp5C0YhrmVQ for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 17:38:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54B01400C3
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 17:38:00 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 a17-20020a9d3e11000000b005cb483c500dso9237951otd.6
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 10:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ilh9Hev5aIOIWnDT5pvjuG/8xHzQwhiaU44O45EUCg=;
 b=T5nRFeNzGXB+HkSKzpKdxpQd4leJOSgL+MXv4U0HFWVgMW9UBkQXtUPM+H7nhd0wy5
 ljz+sjgabp+Gd7usrDm86Bpw9UN5khJzP5BpqwfLGJh9uv1E33uyS5aBdu/Fm6KeFD+k
 mFKfl37Arlgfq1dAHTHH9GgGBKj15ZO9aGlvURDSr/KuKHQXSrEoLu5PotCz2NcsAhr2
 XETsGBYUWY4kZiCotop6/5SNYzynDBJ8eqXUZUJruvFPuO7PwOg1u42n7v7KZ6E9hPVK
 RrKdNtMp9I/c8EzoceNr5C0f6ZQGTMY15ulcVQM5vjn9we756HXWDLNwHbRQmPvWjVj8
 Pijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ilh9Hev5aIOIWnDT5pvjuG/8xHzQwhiaU44O45EUCg=;
 b=geWMi1UMUER5dzxSMgiHoHEHYEMlCQhG+tvNR2CPGQpNX/2dwAOtIGiCs+/+JKtxmZ
 AyNfJYNoHrkr+WJgvMsAsznmevv30HPdTfoiA/onsW8IFdFGBn8mRrzaTmkyi56d8iht
 9haPavdA7vVDWLqf25p0H/YwuLr9gkaYuOesGIM+/3crGoygoBvSWRdu5axQDQNPdm0t
 zRHa1rtVxC/a1Ec5awvgRjDkv7acSSqmohZQr+TqC4GqCUZ0PYvZRWtgVysx3gDP9AoC
 67buuEktCCQ/dHrEiwjkbBT6fgGZY85U6eat/5DpRxQ+RpGx5/WlgcZ2HqrCLFk8oPgK
 QbHA==
X-Gm-Message-State: AOAM533bs9qE/W5/ygzlITaUQaXchHVqOIKry/wKUwhojkz15OFeoTAS
 9IBwv+RuLM9kqtGk5XDN+wCCBf1rib4JFr2RMSM=
X-Google-Smtp-Source: ABdhPJw7GDXRrueulQY7whd95aT7+uOV5C3J/eAJ1cVz9gF7AXtpE9ox20sijKDLx852gmq2XnjwjGSN8Ic/ocnnohY=
X-Received: by 2002:a05:6830:4d3:b0:5cb:73f0:2f1a with SMTP id
 s19-20020a05683004d300b005cb73f02f1amr8576337otd.30.1648402679320; Sun, 27
 Mar 2022 10:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220325212405.25243-1-james.hilliard1@gmail.com>
 <5e27550c-7c02-3f0d-54b4-4cc515efe970@mind.be>
In-Reply-To: <5e27550c-7c02-3f0d-54b4-4cc515efe970@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Mar 2022 11:37:48 -0600
Message-ID: <CADvTj4rY9k2P5wag9Y72g6CvEU_HtCZ7fJYc36a2ARJ6j0e_0Q@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.61.4
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

On Sun, Mar 27, 2022 at 10:23 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 25/03/2022 22:24, James Hilliard wrote:
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
>   Applied to master, thanks.
>
>   Although honestly, there's not much point updating a host-only package unless
> it actually fixes an issue.

There are usually minor fixes in each release with meson.

Mostly I like to keep this updated since doing so helps catch upstream
regressions.

>
>   Regards,
>   Arnout
>
> > ---
> >   package/meson/meson.hash | 4 ++--
> >   package/meson/meson.mk   | 2 +-
> >   2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/meson/meson.hash b/package/meson/meson.hash
> > index d909709b24..8389adb243 100644
> > --- a/package/meson/meson.hash
> > +++ b/package/meson/meson.hash
> > @@ -1,4 +1,4 @@
> >   # Locally calculated after checking pgp signature
> > -# https://github.com/mesonbuild/meson/releases/download/0.61.3/meson-0.61.3.tar.gz.asc
> > -sha256  9c884434469471f3fe0cbbceb9b9ea0c8047f19e792940e1df6595741aae251b  meson-0.61.3.tar.gz
> > +# https://github.com/mesonbuild/meson/releases/download/0.61.4/meson-0.61.4.tar.gz.asc
> > +sha256  4e3733ddc66bac38e38c63b739c9b8b8fc5a866de5333396b0c85c2b144ddee9  meson-0.61.4.tar.gz
> >   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
> > diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> > index 4615e839fe..e9c3145183 100644
> > --- a/package/meson/meson.mk
> > +++ b/package/meson/meson.mk
> > @@ -4,7 +4,7 @@
> >   #
> >   ################################################################################
> >
> > -MESON_VERSION = 0.61.3
> > +MESON_VERSION = 0.61.4
> >   MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
> >   MESON_LICENSE = Apache-2.0
> >   MESON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
