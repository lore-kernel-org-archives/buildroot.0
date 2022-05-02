Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30088C433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECC6660F95;
	Mon,  2 May 2022 21:57:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J9eiS-GpSajH; Mon,  2 May 2022 21:57:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DBBA60F08;
	Mon,  2 May 2022 21:57:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD3301BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A58CB4035B
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ngwv0NuX3xX0 for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:57:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 890EE40343
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:57:19 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-deb9295679so15584342fac.6
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZS5l0PF2Q/Nh9wh4gsSo3iR74e5B6XA+mfGH5UpPu4o=;
 b=HVgrkxqJ3PNhR8aVe/IQRm/c4aDTfUQL7JXbpSwTBeXIDli4VUEYkuiytj5YMe/kJn
 lA4fKekx3SYuLnk8iZyLWOzNI2isvOLTOnbUxILrG2Wi5xqngV9PP/gVUzVTVrIPShhR
 BCa8cUDU+UP4tCc0spBuywLZR/d+eN4Yu855gt/fIgJ1U4J+1xRNQBHye7nB4nZHmCqb
 2DM7EGJ4iXA28vxjUiwvPNUpAu6SaFssqGtc35x/2JWKJmNpkbFd9k/YQtSYir8D+sFO
 BzfgVOEk6CtvWw5kNg4Yzic8FnICVaPRLTpR6F233KRIwLMKNxSif09vEytb0nqvO6gd
 6sSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZS5l0PF2Q/Nh9wh4gsSo3iR74e5B6XA+mfGH5UpPu4o=;
 b=r/hkvAM0Xp/Q2EUY2JfgvzlmPvadq1PKLDLayLAme/L35yYYEAAVpJyz6TkKePeQnn
 ZKFLh0Kzukfd58wO8JdMMbSrNWY5yXPin0dVI0KNqparf6BQRHiJEMr+3NgtJmV/Rzsx
 /03TBB1i5tXolnyxC0OY8bmxYIT7TzZiHtoZwiXE6W+/Hd4uQpcPgzQDg6Rffp5iNSF+
 0fPGGS5rp/lgVq9mu7b68mWVzs0p76wl1e281ESrcyCBN7eoQylSRlp8g+3VlMVh4TmK
 sghvcsv8h2hHvZ4PVnp8XS5IOtszAWuWT/7by5Q35WDtkPTTzKKWfwRz92XBF4iCflFV
 SM3Q==
X-Gm-Message-State: AOAM530movQ3zXOkwxSns7HN6RTAtPLwx64POoe0OzNhJN8Pd58L/n+u
 oe4Gr3UxKMj0R5ZqljdrZ2tw1QWKj1lg7BeVNOl2cxKN+uw=
X-Google-Smtp-Source: ABdhPJxAlCmPf5I1iEmWQITXx4QHujoUxGQ4RjfbvZ3xT/pLpfDnevwvF0h8c7twJUJVi1iLITxT+BkLQ64B0pV0yy0=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr531937oaa.200.1651528638137; Mon, 02
 May 2022 14:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220502080002.1618828-1-james.hilliard1@gmail.com>
 <b4f79a8e-9ebd-4314-8554-64145fbd4ab4@mind.be>
In-Reply-To: <b4f79a8e-9ebd-4314-8554-64145fbd4ab4@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 2 May 2022 15:57:06 -0600
Message-ID: <CADvTj4oO8Vkip8arP2OQt8veaQ+zGxD684GSh4FP1ZK0R8-mFg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-headers: prevent invalid
 custom headers selection
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

On Mon, May 2, 2022 at 10:30 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>   Hi James,
>
> On 02/05/2022 10:00, James Hilliard wrote:
> > If BR2_KERNEL_HEADERS_AS_KERNEL is selected and the kernel version
> > is known we should not allow mismatched headers to be selected.
>
>   I had noticed this issue as well and didn't know how to fix it. Your patch
> however gave me an idea of a nice way to do it.
>
> >
> > For BR2_LINUX_KERNEL_LATEST_CIP_VERSION and
> > BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION this means that we only can
> > allow BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10 and for
> > BR2_LINUX_KERNEL_LATEST_VERSION we can only allow the matching
> > BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15 selection.
> >
> > Fixes:
> >   - http://autobuild.buildroot.net/results/816/816d7a3ad77ba051fff7fba7f2a38fc31549c360
> >   - http://autobuild.buildroot.net/results/3c3/3c3a9fc1a1e0002ae8169fd47b3003ebb86935f6
> >   - http://autobuild.buildroot.net/results/188/18883459577dc0fdc01149110ffb81bf1a28c94a
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   package/linux-headers/Config.in.host | 176 ++++++++++++++++++++++++++-
> >   1 file changed, 174 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> > index decf02d175..715bc49deb 100644
> > --- a/package/linux-headers/Config.in.host
> > +++ b/package/linux-headers/Config.in.host
> > @@ -127,8 +127,6 @@ endif
> >
> >   choice
> >       bool "Custom kernel headers series"
> > -     default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15 if \
> > -             (BR2_KERNEL_HEADERS_AS_KERNEL && BR2_LINUX_KERNEL_LATEST_VERSION)
> >       depends on BR2_KERNEL_HEADERS_VERSION || BR2_KERNEL_HEADERS_AS_KERNEL || \
> >                  BR2_KERNEL_HEADERS_CUSTOM_TARBALL || BR2_KERNEL_HEADERS_CUSTOM_GIT
>
>   Really what we want is that there is no user choice if
> BR2_KERNEL_HEADERS_AS_KERNEL && (BR2_LINUX_KERNEL_LATEST_VERSION ||
> BR2_LINUX_KERNEL_LATEST_CIP_VERSION || BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION).
>
>   Of course, then we need another way to make sure the proper HEADERS_AT_LEAST
> is selected. But we can do that with blind symbols. E.g.
>
> config BR2_PACKAGE_HOST_LINUX_HEADERS_LATEST_AS_KERNEL
>         bool
>         default y
>         depends on BR2_KERNEL_HEADERS_AS_KERNEL
>         depends on BR2_LINUX_KERNEL_LATEST_VERSION
>         select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
>
>   Alternatively, and perhaps a bit more elegant, we can do the select directly
> in linux/Config.in:
>
> config BR2_LINUX_KERNEL_LATEST_VERSION
>          bool "Latest version (5.15)"
>         select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15 if BR2_KERNEL_HEADERS_AS_KERNEL

I like this option best as it keeps the version number specific selection in the
same place as the version number comment so that it shouldn't be missed
when bumping the latest kernel version.

Sent in v2:
https://patchwork.ozlabs.org/project/buildroot/patch/20220502215342.3485999-1-james.hilliard1@gmail.com/

>
>   Similarly, to simplify the big or above, we can define a blind symbol in
> linux/Config.in:
>
> config BR2_LINUX_KERNEL_FIXED_VERSION
>         bool
>
> config BR2_LINUX_KERNEL_LATEST_VERSION
>          bool "Latest version (5.15)"
>         select BR2_LINUX_KERNEL_FIXED_VERSION
>
> (but I don't know if that is really worth it).
>
>
>   Regards,
>   Arnout
>
>
> >       help
> > @@ -144,237 +142,411 @@ choice
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16
> >       bool "5.16.x or later"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15
> >       bool "5.15.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14
> >       bool "5.14.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13
> >       bool "5.13.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12
> >       bool "5.12.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11
> >       bool "5.11.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10
> >       bool "5.10.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_9
> >       bool "5.9.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8
> >       bool "5.8.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7
> >       bool "5.7.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6
> >       bool "5.6.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_5
> >       bool "5.5.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4
> >       bool "5.4.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3
> >       bool "5.3.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_2
> >       bool "5.2.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1
> >       bool "5.1.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0
> >       bool "5.0.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_20
> >       bool "4.20.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19
> >       bool "4.19.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18
> >       bool "4.18.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17
> >       bool "4.17.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16
> >       bool "4.16.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15
> >       bool "4.15.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14
> >       bool "4.14.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13
> >       bool "4.13.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12
> >       bool "4.12.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11
> >       bool "4.11.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10
> >       bool "4.10.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9
> >       bool "4.9.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8
> >       bool "4.8.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7
> >       bool "4.7.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6
> >       bool "4.6.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5
> >       bool "4.5.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4
> >       bool "4.4.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3
> >       bool "4.3.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2
> >       bool "4.2.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1
> >       bool "4.1.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0
> >       bool "4.0.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19
> >       bool "3.19.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18
> >       bool "3.18.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17
> >       bool "3.17.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16
> >       bool "3.16.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15
> >       bool "3.15.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14
> >       bool "3.14.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13
> >       bool "3.13.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12
> >       bool "3.12.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_11
> >       bool "3.11.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10
> >       bool "3.10.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9
> >       bool "3.9.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_8
> >       bool "3.8.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_7
> >       bool "3.7.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_6
> >       bool "3.6.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_5
> >       bool "3.5.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_4
> >       bool "3.4.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_3
> >       bool "3.3.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_2
> >       bool "3.2.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_1
> >       bool "3.1.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0
> >       bool "3.0.x"
> >       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD
> >       bool "2.6.x"
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> > +     depends on !BR2_KERNEL_HEADERS_AS_KERNEL || !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> >
> >   endchoice
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
