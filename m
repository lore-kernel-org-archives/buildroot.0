Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A37C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 08:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4FE760EA9;
	Sat, 14 May 2022 08:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WDeOLYGm57Nx; Sat, 14 May 2022 08:25:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2DB260DB7;
	Sat, 14 May 2022 08:25:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D27931BF4E2
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 08:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF622409F5
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 08:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H7N2A5r4jnGo for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 08:25:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B70BB409DE
 for <buildroot@buildroot.org>; Sat, 14 May 2022 08:25:20 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so13276955fac.7
 for <buildroot@buildroot.org>; Sat, 14 May 2022 01:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2blmuMDwMVo7KETErEvhLMYeWBOwwjVnyVUaDk7RjD8=;
 b=Hvlqpo3hYD8Xo7aVF6cjdPIWX7voMdbDnmfTcY6L1pcjQMFT2B3jspnifSa+BvXHnt
 ZyiWdgPtzDsMdwTFFle7NKwGb5jGa/tUtllfENuT1UIsBikqcZKX/I8ib2Ka+CB8Yof0
 cdDoXE0eUObDtNLHHYd5x5TRdD1yfvC/AtA0eaV2a6TL0JXN8j8De3V3lLhJ+F17iYTi
 PVBdTSQG11yXK5zyGtUIS9TaHgYtS5W+eHwLeyM8N6jT0f33g3PNrJATeT5j+t7wDa1V
 HY0C2P4QqGwsKQfljnnmGKZRf5is8rxObqpr6je71bnOy/YB8g0GLkuSuxudXhjkBbVm
 9wrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2blmuMDwMVo7KETErEvhLMYeWBOwwjVnyVUaDk7RjD8=;
 b=bELwRXFW0A2LblBIgD4/F+wKvPstSIK0crGnkFvJkJFGx5t0iilEhZEQhGgtYDkmCZ
 5Oz7esSUhTKoIHmWqX6rXN72MpndmFt5miXEN6yMt7ubx7JWiObJO/SVHmMunx1Yj3dF
 h49nfsK8tIa9xmPBEXgw+U8/+oTU1sXNYASk5QALGYDsK1uXFDT+vW+veglopxbFmW/F
 kTlmSGHIP4zzy/r5W0NeIcgP3bMMxDzqO8glBeqr0W+LEVTgdBGNC0WaZLHWTdXa33+K
 11MA43YNRjbiQapYXLxTdXf6Pm/1glC2baBkgQFSrkjpFsmMP6VXvheh2LaN7fy1ut3N
 duMw==
X-Gm-Message-State: AOAM532iTORP0OhwBoytjhSZeH6ZHeSh/Xvdh6vE4Qc4sQIv7JqcW3d8
 g8tGszRnc7AQ2GYfN1ReeQIJ+PXdDiScNxl8KMg=
X-Google-Smtp-Source: ABdhPJwBd217IxKpV74FM1tOedFjHmmsH1FEL7iohamKIkyE7E3gZN74Uy9TVPAqoFoiWX74i+5f9zw8mCMJSuoqJMM=
X-Received: by 2002:a05:6870:9729:b0:ec:6f64:1e5e with SMTP id
 n41-20020a056870972900b000ec6f641e5emr4349547oaq.99.1652516719629; Sat, 14
 May 2022 01:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220510044636.3061290-1-james.hilliard1@gmail.com>
 <499beaa9-aa4b-6582-8a48-45fc1ecb31cf@mind.be>
In-Reply-To: <499beaa9-aa4b-6582-8a48-45fc1ecb31cf@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 14 May 2022 02:25:08 -0600
Message-ID: <CADvTj4qDGU6mR2mwODxzDRmkkT_u8rhk=jNrw+scqnJKS42kfA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/git: fix build with iconv
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

On Fri, May 13, 2022 at 3:56 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 10/05/2022 06:46, James Hilliard wrote:
> > Our libiconv shouldn't need the ICONV_OMITS_BOM workaround.
> >
> > We also need to correctly set the iconv path so that we don't use the
> > host iconv path.
> >
> > Fixes:
> >   - http://autobuild.buildroot.net/results/027/027602a750fd0989f9861773a2c4672667590acc
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
>   Applied to master, thanks.
>
>   Weird that this only comes up now - the incorrect --with-iconv has been there
> since 9 years ago...

Well at least when it comes to the autobuilders it seems to have only started
getting hit when I started building with toolchain randomization.

There's been a whole bunch of issues that were not showing up in general
due to using mostly only prebuilt toolchains for autobuilders.

I'm guessing the prebuilt toolchains select BR2_ENABLE_LOCALE which
would cause this issue to never get hit:
depends on !BR2_ENABLE_LOCALE
https://github.com/buildroot/buildroot/blob/7fa88b8eb637f5ec4927ac1bd05309dea7d60bc9/package/libiconv/Config.in#L3

It seems that

>
>   Regards,
>   Arnout
>
> > ---
> >   package/git/git.mk | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/git/git.mk b/package/git/git.mk
> > index 0127ba5129..981a238acb 100644
> > --- a/package/git/git.mk
> > +++ b/package/git/git.mk
> > @@ -49,7 +49,8 @@ endif
> >   ifeq ($(BR2_PACKAGE_LIBICONV),y)
> >   GIT_DEPENDENCIES += libiconv
> >   GIT_CONF_ENV_LIBS += -liconv
> > -GIT_CONF_OPTS += --with-iconv=/usr/lib
> > +GIT_CONF_OPTS += --with-iconv=$(STAGING_DIR)/usr
> > +GIT_CONF_ENV += ac_cv_iconv_omits_bom=no
> >   else
> >   GIT_CONF_OPTS += --without-iconv
> >   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
