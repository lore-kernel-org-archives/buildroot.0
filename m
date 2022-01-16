Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10DEC433F5
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 22:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EB5740302;
	Sun, 16 Jan 2022 22:51:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pd625k5pV1Mm; Sun, 16 Jan 2022 22:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F323B402EE;
	Sun, 16 Jan 2022 22:51:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 028681BF3CB
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 22:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E59CA81263
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 22:51:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSBRqDZ_6kau for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 22:51:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1930880F10
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 22:51:29 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id w188so20989702oiw.13
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 14:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=biiwrYKmkpsRleyzpD89BNPVD///6vOcbcbsqiPn/kM=;
 b=IF7zTPfr0CLnIUWSQYEHiqtMD6khKD8IPszANTwfuWypt1uPGv7FWwHKqD6tWLvL5r
 Wnv9aNvDkz5764Q4BUskOz8HTzi7vdq26bg/ZY9mNnY8lXMsYChv4nbWGntDpgvQlY9b
 vcKTFsB7DwLl3SpY7Prq7eSDnf+ilgF8/2i51fy1MqRi1L3uqgZLNmteSxikdrGIurjC
 scPpL77DM2LGA0sCyhPvFL8MtMmCBRgKy/ZclN+57H+ldFEA8ofOyET7Ft5ZPjwmi6tn
 sunHZhzJmO8L7wkvjcG06YHa0hXevOWx8KVi2wJ9wH9XzVmQh31JcHUJtxNEbDlhAY0a
 2Sqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=biiwrYKmkpsRleyzpD89BNPVD///6vOcbcbsqiPn/kM=;
 b=v9nRTzdostGwzfE85Da5CFt6EX27Pntqtb/1RdUsRbVb3Tch0c9oHG2Ey6oTlbbQAc
 TspBY2kARRieIB+m4mG3ecwOqBVGMmwZ8xQpUNj2tuAyXQsjaN22AVKmJ7zEOnJ6ZKUU
 0Ub3IrL/7WLdgfKb/O9ix+zXxsDM6H50kfvTGBGkUC2GHuPDtidjjUjSj4XbTqQPJK7Z
 Dwjj2GRrxBGQ4ggrrNKxX4bWMjuOqKg3ifQXUw/ZG1t1UekjEXzqiObxtX5ZDje7pj20
 w54tsYKInDs7g4/YwA2rvuHubEuFXoRJzzcd9GBfL/xN6p9L9jE+Bks3dg0gtHQ5EpVG
 G4/g==
X-Gm-Message-State: AOAM5324AkkVSdEdUvs/uUzPibVAI9DjxdDCn8xHSn3l/kLMWACvy39z
 PAxdDkMwRZJO3aYLUyhxg8jRCcoJHBqx8vsZg9jlsScvl6Y=
X-Google-Smtp-Source: ABdhPJzycOY/UFXr7+q6iLUB/BjC1EUL12BJ+5LxvoBHa40Er0P8G7tIkt4ln7xjY9+LvUfLTXeBGVr3oEr1JI+8tN0=
X-Received: by 2002:a54:4483:: with SMTP id v3mr17681516oiv.39.1642373487828; 
 Sun, 16 Jan 2022 14:51:27 -0800 (PST)
MIME-Version: 1.0
References: <20220116230404.71f68dbb@c3po>
 <CADvTj4qFSfOYQ+AkOsQyGgNbuRROEmgx1giiKGaJn2jRVyhsOw@mail.gmail.com>
 <20220116233758.59918490@c3po>
In-Reply-To: <20220116233758.59918490@c3po>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Jan 2022 15:51:16 -0700
Message-ID: <CADvTj4pjgwNt4ZnFB2ZmDeZP0nGaGPveqAapCTC+TOx3SEoBrw@mail.gmail.com>
To: Danilo Bargen <mail@dbrgn.ch>
Subject: Re: [Buildroot] Hash verification from GitHub
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Jan 16, 2022 at 3:38 PM Danilo Bargen <mail@dbrgn.ch> wrote:
>
> Hello James
>
> > Just use the hash buildroot generated for you, it should be correct.
> > (...)
> > Yeah, it's not going to match since buildroot is doing stuff like
> > vendoring the cargo deps before generating the tarball
>
> Ahh, that explains it. Does this mean that for Cargo based packages, it
> will always be TOFU and checksums provided by the project / maintainer
> cannot be used (because they will mismatch)?

A maintainer could sign the tarball generated by buildroot and upload it to
github releases if they want.

As you can see the script will bail out if the tarball already has
vendored deps:
https://github.com/buildroot/buildroot/blob/6e4791b751c0f8e0ba218da2c22e71d3e1436b5d/support/download/cargo-post-process#L16-L19

So as long as the upstream release tarball has vendored deps the hash should
not change AFAIU.

>
> Danilo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
