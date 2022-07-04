Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCD2C43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 10:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22E4E82725;
	Mon,  4 Jul 2022 10:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22E4E82725
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d-nkmfQmABsO; Mon,  4 Jul 2022 10:22:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BE3381854;
	Mon,  4 Jul 2022 10:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BE3381854
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48DE31BF295
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 10:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 211CA826AA
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 10:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 211CA826AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3EVW_CY8aaYl for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 10:22:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30F3A81A5F
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30F3A81A5F
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 10:22:21 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-3137316bb69so77246647b3.10
 for <buildroot@buildroot.org>; Mon, 04 Jul 2022 03:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yKlaFpdPdBM7xvKl9vomGnYnjJeYNb3vxhg9ClZc7bY=;
 b=E5/yrka+GLhfmdKeOrVoARNJftkSKongiFl4Q8fS5lJyEpBNgTmJZBe7QGXjCQ8Zf0
 xdYrRgrNvM7fzOdPz4nucRY9M9UBL2gtQavYMR9PuB+T6JA/O5UsQoBPNwf3E8IHxwnT
 VA/iET0yxRNhin0nfP4KDbyYVWkiSgMc7AfZxYQOuZnKGxIxDoa6BKo6q7OZIw8XvVHx
 7xDuu3St2lciAiK1ztwS3PXUXKoYQ+GS7Ku4bEEGi9ePk+SL0vS0FWsZH0PP2mfCP26o
 b1Ep3LnoCH1cTnnb9jmwHu2LoduPby9rUyzBHnYuaLZct+xQNAVjJq+CVcxQ3GYTNiE6
 fk2A==
X-Gm-Message-State: AJIora81vtcYNSiK2XUFxvJkc4TBB5Vm9iD1v519xx6XKUgncBRcPq4P
 8WHnnf+08Vs9s+tfJVcYc0GjQMITm1q8FYdGHx0=
X-Google-Smtp-Source: AGRyM1uV9nkoYWBc+qUhW+0pIHLZ7g+JV4jqu0pvnJ2Xj0LYO38Km5opzJIlCrueepCnZyNmQkl6MqQ1Okvf0CTi9J4=
X-Received: by 2002:a81:1148:0:b0:31c:ad1f:774f with SMTP id
 69-20020a811148000000b0031cad1f774fmr1610031ywr.13.1656930140081; Mon, 04 Jul
 2022 03:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220704100836.17277-1-yegorslists@googlemail.com>
 <CADvTj4oXLMUUQdCM=tSys8Q98dHa9mM0Pbw1Nd6s3j6R-Xt01w@mail.gmail.com>
In-Reply-To: <CADvTj4oXLMUUQdCM=tSys8Q98dHa9mM0Pbw1Nd6s3j6R-Xt01w@mail.gmail.com>
Date: Mon, 4 Jul 2022 12:22:09 +0200
Message-ID: <CAGm1_ksohgFBUrVnB4=nfwFPos31ph2BBDYy6-EKw4ouahu56g@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yKlaFpdPdBM7xvKl9vomGnYnjJeYNb3vxhg9ClZc7bY=;
 b=ZXOYqFWpoJQuJ7W01j1bMYCtp+9hWIMpxziSu4i7TJnQ/g2Lojup1PvfpylsQ6HnZp
 qtxwj+tTAU350wnt5VFFAe106SE7H9Mlk0QznPsqp6huW10/xL8EXdqF8Ff12zvWUqtE
 ONlPYOWN7twATJE+E7c9viNMiXaJytR+bFfTcxg2sQDSVwEdw17tfrTdE2083107syv+
 4yQefmtg2z+zwXWu6RRyNMuf5MsiZTF+0u4yuqmhLOBuGpJB2aAUrXR/NeseMlnn9GZa
 XBiOmV5DMIhdDGZMNtKr2xu6saeFBKDP/oQhsTLWwEH1UaJ8cFv4xnBO/GQz9Sls91cX
 ipnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZXOYqFWp
Subject: Re: [Buildroot] [PATCH] package/python-argon2-cffi-bindings: add
 missing build-time dependency
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jul 4, 2022 at 12:14 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Mon, Jul 4, 2022 at 4:08 AM <yegorslists@googlemail.com> wrote:
> >
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >
> > python-argon2-cffi-bindings needs host-python-typing-extensions.
>
> Actually this should go in host-python-setuptools-scm as it's only a
> transient build
> dependency for python-argon2-cffi-bindings.

You're right. I'll send a new patch.

Yegor

> >
> > Fixes: http://autobuild.buildroot.net/results/3e0b4ad4b1b0714ef0fc877ab61933f32c0d47a0/
> >
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > ---
> >  .../python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk   | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
> > index f0d71e803a..7d666584c8 100644
> > --- a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
> > +++ b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
> > @@ -13,6 +13,7 @@ PYTHON_ARGON2_CFFI_BINDINGS_LICENSE_FILES = LICENSE
> >  PYTHON_ARGON2_CFFI_BINDINGS_DEPENDENCIES = \
> >         host-python-cffi \
> >         host-python-setuptools-scm \
> > +       host-python-typing-extensions \
> >         libargon2
> >  PYTHON_ARGON2_CFFI_BINDINGS_ENV = ARGON2_CFFI_USE_SYSTEM=1
> >
> > --
> > 2.17.0
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
