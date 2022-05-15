Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F958C433F5
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 05:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA83D60EFD;
	Sun, 15 May 2022 05:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jzgkZXMtruae; Sun, 15 May 2022 05:43:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCD3860EE7;
	Sun, 15 May 2022 05:43:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25DB41BF59A
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 05:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B574405D4
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 05:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UgYFXKxFeLsP for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 05:42:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE356400D2
 for <buildroot@buildroot.org>; Sun, 15 May 2022 05:42:58 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id bg25so6961795wmb.4
 for <buildroot@buildroot.org>; Sat, 14 May 2022 22:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=R5K3F3c1UOCZjCK+S3v8njUpZQ0oudF64E4uZkbt1iw=;
 b=j5cItV7uKfHohaD7jowwQDYOBsF9/CcmpjzrhMbzr+a+Xyf8DzIIZ/cD55jJ0TR6Lj
 cuFvbKAcMn3bjeNJoxJ/kxGoegcV7gMtvAbPkCPV5sL8JxFauoEU1yETMSjxzx82nYnQ
 koGF/jGhEdt+G+8RZ3Jg9+B9LylbNJh6zcErsJG0CPZ7AnPmf112DwDO7egPpGRDiW61
 65rxO/tWYdbkc/7JHZy4UqGHuNlc+OFWGs+8HCoCRqzLZ1fAvAdTtgw8Jo+OtIGz8S4u
 XsV7y2dUs3b/bvOi/W3paS/PT7uxbtYMV2V6nF2rjC/lQOwnRSqrWjyRrhgDZt7LzHNM
 tHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=R5K3F3c1UOCZjCK+S3v8njUpZQ0oudF64E4uZkbt1iw=;
 b=ZMjFrA1t+pKuQoV1e7TlDcVn2HoKg/Z+x16MKa2iOaVNkAaGzn3eMcAbhS2Yah2Z7o
 3QIju05Ma5JkBg0UAKSqF7cq0il9nXDiv7NarJX38EqGm9X5RTyteEELhR3F70UaTm9f
 urA1bXTiNx8duS9VcGF0orWVp4at8hLuiVG2YKI/M1/GcuIbUH0jN2bwhaBfgbMa8j8y
 MTVc0HOvydyE/nC1nPBU2SMfF0A7ZxrgwbRpJ/Hu4SkPuM06VqWCWyNxI8QIntl1w4iz
 f8/1jhnD7XJQkP7sF31NOnodZz+q43O8RYutgOojrsKXjdM6yn0e5CZcb6ehqJrKx1cL
 O//Q==
X-Gm-Message-State: AOAM533jKyzSVfTJd9hVIOPNy6oD+qfNHuprRfR/I0iK483xFhXCu7hv
 0Slg6XsthwWvCifLlAk8J0U=
X-Google-Smtp-Source: ABdhPJyHR2B/5WW3sHpPlBVAtkmNsJxM7OB6HVtFs7N8fiNWu5xhrWNUNyUFuJ8GyAst8bgXz7RUsA==
X-Received: by 2002:a1c:5415:0:b0:394:2c89:4f2a with SMTP id
 i21-20020a1c5415000000b003942c894f2amr22004591wmb.144.1652593376427; 
 Sat, 14 May 2022 22:42:56 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 g4-20020adfbc84000000b0020c5253d8f3sm7365863wrh.63.2022.05.14.22.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 22:42:55 -0700 (PDT)
Date: Sun, 15 May 2022 07:42:53 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <YoCS3bhGjo3juytd@pevik>
References: <YnrH/mfbuJHRpYnw@pevik>
 <CAPi7W80OTx7DuKHba8Y3Zr4vUJ-SnLGTesHyYCf-Gjw2z2hnNg@mail.gmail.com>
 <891d79c1-531b-7a95-7739-a19e634a318d@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <891d79c1-531b-7a95-7739-a19e634a318d@mind.be>
Subject: Re: [Buildroot] [RFC] iputils (meson build system) has git version
 from buildroot instead of iputils
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Dagg Stompler <daggs@gmx.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice, Arnout,

thanks a lot for a valuable info.

...
> > > meson.build [1] uses git-version.h.meson [2] to produce BUILD_DIRECTORY/git-version.h.

> > > Building from sources (not in Buildroot) it works:
> > > $ head -1 builddir/git-version.h
> > > #define PACKAGE_VERSION "20211215-15-g309f285"

> > > But building in Buildroot it gets git version from Buildroot:
> > > $ head -1 output/build/iputils-20211215/build/git-version.h
> > > #define PACKAGE_VERSION "2022.02-876-g3ef096786a"

> > > Is it a bug in iputils or in Buildroot meson?

> > This issue is raised because, in the context of buildroot, iputils is
> > retrieved as a tarball, not a git clone.

>  This would be the case even if we take it from a it clone, because we first
> archive the tree in a tarball and then extract the tarball in the build
> directory (i.e. without the .git directory).

>  Note also that this only happens if your output directory is below the
> Buildroot tree. On the other hand, if you put your output directory, for
> example, under a BR2_EXTERNAL repository (which is what I usually do), then
> it will take the version from that repo.
Right, I'll usually keep the default BR2_EXTERNAL.

> > So meson's vcs_tag will retrieve the git information from buildroot
> > and will not use its fallback (i.e. meson.project_version()).

> > To fix it, there is three "simple" options:
> >   - allow buildroot to configure the version (as already done in
> > open62541 package)
> >   - don't use vcs_tag and always set package_version to
> > meson.project_version() outside of a "devel" mode as done for example
> > in gnome console [1]
> >   - override the default vcs command in vcs_tag call (e.g. command:
> > 'git --git-dir=.git describe --dirty=+')

>  This is a problem for all packages, not just iputils.

>  I think a solution could be to

> export GIT_CEILING_DIRECTORIES = $(OUTPUT_DIR)

> That way, git won't travel up to the buildroot directory. Should be tested
> with putting the output directory in various places, and also with putting
> DL_DIR below OUTPUT_DIR or equal to OUTPUT_DIR and downloading git packages.

I'll try to do some testing soon. Obviously I prefer general solution,
fixing by setting variable would be easier than trying to merge anything in
meson upstream (if needed I'd open PR in upstream, just for a record of the
problem).

Kind regards,
Petr

>  Regards,
>  Arnout


> > Another option would be to patch meson so vcs_tag is always run with
> > "--git-dir=.git".
> > This is probably the more correct option as this issue is probably
> > affecting other packages than iputils.
> > However, from my experience in meson, getting something merged
> > upstream can take a very very long time (e.g. more than two years for
> > a prefer_static option [2])
> > I don't know if this is completely related but this issue on vcs_tag
> > is opened for more than one year [3] ...

> > > Any idea how to fix it?

> > > Kind regards,
> > > Petr

> > > [1] https://github.com/iputils/iputils/blob/master/meson.build#L14
> > > [2] https://github.com/iputils/iputils/blob/master/git-version.h.meson

> > Best Regards,

> > Fabrice

> > [1] https://gitlab.gnome.org/GNOME/console/-/blob/main/meson.build#L35
> > [2] https://github.com/mesonbuild/meson/pull/6629
> > [3] https://github.com/mesonbuild/meson/issues/8567
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
