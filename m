Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4E4C433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 21:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F0DD60AD7;
	Thu,  5 May 2022 21:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1tJyZWaV7Wni; Thu,  5 May 2022 21:36:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E00B60AAD;
	Thu,  5 May 2022 21:36:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72F691BF308
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 21:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60ABB83FFB
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 21:35:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PU7CnpzVyrKB for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 21:35:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 826C483F21
 for <buildroot@buildroot.org>; Thu,  5 May 2022 21:35:57 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id m25so5696949oih.2
 for <buildroot@buildroot.org>; Thu, 05 May 2022 14:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=98k70XOrSXuE3O2v6bMumdrgpyjhkEvieBJDyXMqSUo=;
 b=NLSWsuO8t71EZcDlksj0UPl3NZ9JImi22MzNqW1gGFWEKeJoArO5KuyM+GqC0WHI9q
 nmoB8+kEY/FYFwx+qoXD2NlWkdxqtgmKnAFqgTVZnbBFrLv6m4wc6SDsXrtTrWAzh27d
 r/4pyfdXPBd+Uj2bauHKUo8WK67Um+yZR9XXeFkgAgmbesa5hh4l9Oeil2iQjMQQWp+Y
 WQBQaECjEAwc1kkbE5dgyoriD4fUY5Yc1nhshm/kZ7JFqcRgmRifYX/S6RyfBuzmNMSW
 IWGU+1kDo84UGc/onFcqyBfzXbb5WHzzQfp4wWapy3OCxX70itJ5u68Krasxotbhlr42
 9kXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=98k70XOrSXuE3O2v6bMumdrgpyjhkEvieBJDyXMqSUo=;
 b=AGWuGBp1zzPse2yGgJdvcTeoxM6FKjWVB+WdbQvZSvtvKBNe7TArPwrmKqGdwFY/0E
 aFzsHSGT9tniOmpKQAyjGPMtVG++aIIY7hoXKxTm2AmPO1lxKT/joBajDZDFfqqjjXe4
 sg5ThvdyAdtiAevQ8dFf9N4tueeTqG2aCMwAXWjUUVUQQznJZdskMQzq11eq6DbM49eO
 AfZWNTyJbJ7FjssZ2ATskgJXA+M9twgPouyEYMOa+jSA6PCzHvMDkc/6z3WLJbSEPdf6
 R+eRgVzMNlrDJym4L9PglSckF3Fzuvvh+Plg1V93IsNAe4wyfPDsVKXW8wyx7tU5b6WQ
 /KSQ==
X-Gm-Message-State: AOAM532KrKjg3SBc4Elw2GIzqL9q4OeNi9NlMApfEb6jc9zqbutUoBdK
 QEIzjvo8pkx8vMbXMNmQC2ZsG20qG2TWEuqNiU8=
X-Google-Smtp-Source: ABdhPJwhbgcjkYd2bpN9UuwC+o4zvXQ+9WmVCy3accqvHyfnOUnRgd7R64jnFsdffykeHQfmw0XBWvHh3uVfhV4+Q/Y=
X-Received: by 2002:a05:6808:1da:b0:325:bf8e:df25 with SMTP id
 x26-20020a05680801da00b00325bf8edf25mr123317oic.99.1651786556549; Thu, 05 May
 2022 14:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220112132618.2634250-1-aperez@igalia.com>
 <20220112160512.GC6032@falbala.internal.home.lespocky.de>
 <20220112184729.GB23006@momiji> <53b29654-5d59-26e6-4635-a1ecb87babe0@mind.be>
 <20220113164906.5db00b20@windsurf>
In-Reply-To: <20220113164906.5db00b20@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 5 May 2022 15:35:45 -0600
Message-ID: <CADvTj4pYst3nWE4aA_LAvrZYjhVP+XL3RwpdjBfGgHA9w7qEJw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH RFC 0/2] Use Ninja as build tool for
 CMake-based packages
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
 Samuel Martin <s.martin49@gmail.com>, Alexander Dahl <post@lespocky.de>,
 buildroot <buildroot@buildroot.org>,
 Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Jan 13, 2022 at 8:49 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed, 12 Jan 2022 19:55:03 +0100
> Arnout Vandecappelle <arnout@mind.be> wrote:
>
> >   There's one disadvantage to Ninja in Buildroot context: until [1] is fixed, it
> > doesn't collaborate well with top-level parallel build. This means that if you
> > run with a toplevel JLEVEL of e.g. 24, you can easil end up with 40-100 compiles
> > running in parallel. The problem already exists for meson packages, but these
> > are sufficiently rare that they don't pose a problem in practice. I don't know
> > if it's going to become a problem if cmake packages are added to the mix.
>
> meson-based packages are no longer rare: we now have 116 packages using
> the meson-package infrastructure, including very high profile packages
> such as systemd, mesa3d, libglib2, and more.
>
> It is still higher than the 328 cmake-based package we have of course,
> but I wouldn't say that meson is "sufficiently rare" :-)
>
> Annoying that this problem hasn't been resolved in upstream ninja :-/

We're now using kitware/cmake's fork with jobserver support FYI:
https://github.com/buildroot/buildroot/commit/227d7e0cbaaf093f509f5728f06fad5f53caed7b

>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
