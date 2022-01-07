Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E95CC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 22:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46CFF60B09;
	Fri,  7 Jan 2022 22:30:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SUAoq8wFZ1SX; Fri,  7 Jan 2022 22:30:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CC3460AFE;
	Fri,  7 Jan 2022 22:30:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 295091BF30A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12EDF424C3
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f6YedBsA1Ajb for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 22:30:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 061E7424BD
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 22:30:24 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id t23so10210599oiw.3
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 14:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+hCOXz471xdJM7QLkNrrjuuuaV+GjdPaD0cTM9A8DLM=;
 b=d7p1yGZKLVshM917ZzAPz0/nc9KM8Y9r62vxx58yMOlopUoqJd8KM+4KtW2wQ9eyEI
 YGazoHw5Yzavpp9VrhzCn0B1/GeEpnC3cpj+KGYKB0masKr0bEXcL4eRznHXq7hmPxoL
 cUw9FYmSUCPPvzLGEqC8KnswQQK7/E5EPcxCM9wiWmzXbsHC7njhPwzrXuBKeGsNIlyZ
 v+yivN/Pe1419VdTvTuEesUkxv3csuBgaM3lTQP8volT9Y7qQnNH4H0d8ukhyKh+sJXS
 gFpeHl6fx0+ubcX938KZpHV3jvoWOdZIcFAPaMsPS6ZtWx1nxVUn8Gv7PcHcL/HLF9AC
 kIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+hCOXz471xdJM7QLkNrrjuuuaV+GjdPaD0cTM9A8DLM=;
 b=b9G/sgzALDOFneS/XNJlAoocswxxZwKqfbTJjXoSHUywedyRQXctQseVyyTiyUZKKe
 mEv9eIifhdn6WQ9n8OSP1nnj3vHwP6YksNDtZglxCzlAO30OSiMcpgftlwraQZXHTWqR
 xEdFkraG0sARCuQ9PyB/OgAobPP75RqfNfDwF0dy/91qc5MEnm6YKTBJmwf6c8GXMkPw
 xRDvpN9RlF3adYyaYZAtyoT2ULXYTffANKmRor0/4jAWxipNF3WkRBxFWVrQZpGV+M3x
 7ByJaiKNQYtbeCMIbEGh57yrcJ1ssIx3gVxVOAI+mMA/mLtqrfG2zKeAdY/qn2F2+ZZq
 yqTg==
X-Gm-Message-State: AOAM532SsQfRMDlMab7901VBZIalYBkjpCpGVHjl6ta0jkRdNaM6nR2H
 K08tou706QNBTycj4DT7YTz/h5Er9BDGl8qDCeY=
X-Google-Smtp-Source: ABdhPJx/vP6+GzhmadA5BbJJ4SBaY4fvqdUYwPBRu412RJQPvE3UBk2Rv8zge04Wg18EMYrB4lmC0n55+jxk/QSl6KA=
X-Received: by 2002:a05:6808:df1:: with SMTP id
 g49mr8450239oic.39.1641594624034; 
 Fri, 07 Jan 2022 14:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-6-thomas.petazzoni@bootlin.com>
 <CADvTj4rf+NisSUL7=Ee_=3bpDFCaxpsXmUzcOF=oUD5imqXbSQ@mail.gmail.com>
 <20220107105223.01912574@windsurf>
In-Reply-To: <20220107105223.01912574@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 7 Jan 2022 16:30:12 -0600
Message-ID: <CADvTj4q+Ha1qvJ7t6YRRcmu9E8y-J_sU8=i0ZhdTzc1x_ZW+0A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3 05/11] package/pkg-cargo.mk: introduce
 the cargo package infrastructure
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
Cc: Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Jan 7, 2022 at 3:52 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Thu, 6 Jan 2022 19:12:51 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > > +$(2)_CARGO_ENV += \
> > > +       CARGO_HOME=$$(HOST_DIR)/share/cargo \
> > > +       __CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
> > > +       CARGO_TARGET_APPLIES_TO_HOST="false"
> >
> > Maybe want to set these additional options as well so that packages
> > using cargo can
> > build with only the env variables set(in some cases at least I think),
>
> Thanks for the suggestion. However, could you be more specific than
> "maybe" and "I think" ? The way you put it seems like we don't really
> know why those variables would be useful and what they do.
>
> > still probably
> > need to pass some command line args but this should reduce the amount at least:
> > RUSTC_TARGET_TRIPLE = $(subst -,_,$(call UPPERCASE,$(RUSTC_TARGET_NAME)))
>
> Which command line arguments would be replaced by those variables?
>
> > PKG_RUST_CARGO_ENV = \
> >     CARGO_HOME=$(HOST_DIR)/share/cargo \
>
> This one we already pass.
>
> >     CARGO_BUILD_TARGET=$(RUSTC_TARGET_NAME) \
>
> This one would replace the --target argument? Just to understand, what
> would be the advantage of the variable compared to the comand line
> argument?

Might be better for reusing this env for indirect cargo build
invocations like those
done by python-setuptools-rust.

>
> >     CARGO_INSTALL_ROOT=$(TARGET_DIR)/usr \
>
> This would replace --root $$(TARGET_DIR)/usr/ I suppose. Here as well,
> any benefit/drawback of arguments vs. variables?

Yeah, mostly for indict invocations as well.

>
> >     CARGO_TARGET_$(RUSTC_TARGET_TRIPLE)_LINKER=$(notdir $(TARGET_CROSS))gcc
>
> How come things are working today with this one?

I think this is currently set in the cargo config file.

>
> >
> > HOST_PKG_RUST_CARGO_ENV = \
> >     CARGO_HOME=$(HOST_DIR)/share/cargo \
>
> This one already passed.
>
> >     CARGO_INSTALL_ROOT=$(HOST_DIR) \
>
> This would replace --root $$(HOST_DIR) I suppose.

Yeah, sounds right.

>
> >     RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))"
>
> This is already passed, although replicated between the build and
> install steps of the host variant.
>
> So essentially the only questions is:
>
>  - Advantage of variables vs. command line options

Makes setting cargo variables when cargo is not directly invoked simpler.

>
>  - Relevance of CARGO_TARGET_$(RUSTC_TARGET_TRIPLE)_LINKER=$(notdir $(TARGET_CROSS))gcc

Set via CARGO_HOME currently, but I think may allow the cargo config to not
be required.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
